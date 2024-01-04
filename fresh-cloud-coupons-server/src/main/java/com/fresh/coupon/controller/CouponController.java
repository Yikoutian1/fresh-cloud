package com.fresh.coupon.controller;

import com.fresh.coupon.config.CouponConfig;
import com.fresh.coupon.mapper.MemberQiangCouponMapper;
import com.fresh.coupon.service.MemberQiangCouponService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @program: fresh-cloud
 * @description:
 **/
@RestController
@Slf4j
@RequestMapping("/coupon")
public class CouponController {
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    public RabbitTemplate rabbitTemplate;
    @Autowired
    public CouponConfig couponConfig;
    @Autowired
    public MemberQiangCouponService memberQiangCouponService;

    @RequestMapping(value = "/qiangCoupon",method ={RequestMethod.POST,RequestMethod.GET})
    public Map<String,Object> CouponService( Integer uid, String cid) {
        Map<String, Object> map = new HashMap<>();
        if (uid==null){
            map.put("msg","请登录后再参加抢卷活动");
            return map;
        }

        if (!redisTemplate.hasKey(this.couponConfig.COUPON_CID_+cid)){
            map.put("msg","暂未该优惠卷相关的活动");
            return map;
        }
        Long time = (Long) redisTemplate.opsForHash().get(this.couponConfig.COUPON_CID_ + cid, "time");

        long time1 = new Date().getTime();
        if (time1<time){
            map.put("msg","优惠卷活动并未开启,请在活动规定时间内参加");
            return map;
        }
        Integer num = (Integer) redisTemplate.opsForHash().get(this.couponConfig.COUPON_CID_ + cid, this.couponConfig.COUPON_CID_NUM_);
        if (num<=0){
            map.put("msg","手慢了，优惠卷已被抢光");
            return map;
        }
        if (redisTemplate.opsForHash().get(this.couponConfig.COUPON_CID_+cid,this.couponConfig.COUPON_GRAB_UID_+uid)==null) {
            String script = "local newTotalNumber=redis.call('HINCRBY',KEYS[1],KEYS[2], -ARGV[1]); " +
                    "if (newTotalNumber<0) then " +
                    "redis.call('HINCRBY',KEYS[1],KEYS[2],ARGV[1]); " +
                    "return -1; " +
                    "else return newTotalNumber end;"; //让指定值减一 如果小于0 说明数量不够，让他变成0，相当于执行回滚 ，否则返回剩余数量
            DefaultRedisScript<Long> redisScript = new DefaultRedisScript<>();
            redisScript.setScriptText(script);
            List<String> keys = new ArrayList<>();
            keys.add(this.couponConfig.COUPON_CID_+cid);
            keys.add(this.couponConfig.COUPON_CID_NUM_);
            redisScript.setResultType(Long.class);
            Long totalNumber = (Long) redisTemplate.execute(redisScript, keys, 1);
            if (totalNumber != null && totalNumber > -1) {
                redisTemplate.opsForHash().put(this.couponConfig.COUPON_CID_+cid, this.couponConfig.COUPON_GRAB_UID_+uid, uid);
                String exchange="fresh.direct"; //自己创建的fanout
                Map<String,Object> msg=new HashMap<>();
                msg.put("cid",cid);
                msg.put("uid",uid);
                this.rabbitTemplate.convertAndSend(exchange,"addMAndC",msg);
            }
                map.put("msg", "恭喜你抢到一张优惠卷,系统稍后会将优惠卷发送到你的账户上");
        }else{
            map.put("msg","你已经领过了不要太贪心哟");
        }
        return map;
    }

    /**
     * 通过uid查用户拥有的卷数量
     * @param session
     * @return
     */

    @RequestMapping(value = "/getCouponByUid",method ={RequestMethod.POST,RequestMethod.GET})
    public Map<String,Object> getCouponByUid(HttpSession session){
        return  this.memberQiangCouponService.getCouponByUid(session);
    }
    @RequestMapping(value = "/selectFirstCoupon",method ={RequestMethod.POST,RequestMethod.GET})
    public Map<String,Object> selectFirstCoupon(){
        return this.memberQiangCouponService.selectFirstCoupon();
    }
}
