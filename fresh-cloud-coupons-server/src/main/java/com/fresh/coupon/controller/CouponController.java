package com.fresh.coupon.controller;

import com.fresh.coupon.config.CouponConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
    @RequestMapping(value = "/qiangCoupon",method = RequestMethod.POST)
    public Map<String,Object> CouponService( String uid, String cid) {
        Map<String, Object> map = new HashMap<>();;


        if (!redisTemplate.hasKey(this.couponConfig.COUPON_CID_+cid)){
            redisTemplate.opsForHash().put(this.couponConfig.COUPON_CID_+cid, this.couponConfig.COUPON_CID_NUM_, 100);
            // 将内层键设置在外层键的集合中
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
                //Todo 向redis里加用户id
                redisTemplate.opsForHash().put(this.couponConfig.COUPON_CID_+cid, this.couponConfig.COUPON_GRAB_UID_+uid, uid);
            }
                map.put("msg", "恭喜你抢到一张优惠卷");

//            Map<String, Object> msg = new HashMap<>();
//            msg.put("uid", uid);
//            msg.put("cid", cid);
//            String exchange = "fresh.direct";
//            try {
//                this.rabbitTemplate.convertAndSend(exchange, "addMAndC", msg);
//            } catch (Exception e) {
//                log.info("遇到错误，错误为：" + e.getMessage());
//            }
        }else{
            map.put("msg","你已经领过了不要太贪心哟");
        }
        return map;
    }
}
