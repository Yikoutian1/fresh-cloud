package com.fresh.scheduled;

import com.fresh.enums.StaticEnums;
import com.fresh.system.domain.Coupon;
import com.fresh.system.mapper.CouponMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Collectors;


/**
 * @ClassName CouponSchedule
 * @Description 定时器轮询优惠券
 * @Author Calyee
 * @DATE 2023/12/29 029 15:52
 * @Version 1.0
 */
@Component
public class CouponSchedule {
    private Logger log = LoggerFactory.getLogger(CouponSchedule.class);


    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private CouponMapper couponMapper;

    @Value("${time.matchconditiontime}")
    private Integer matchConditionTime = 2; // 默认设置两个小时

    /**
     * 优惠券列表,如果有满足条件则添加到Redis预热
     */
    @Scheduled(cron = StaticEnums.cron_string)
    public void addMatchConditionCouponToRedis() {
        log.info("[CouponSchedule Start]");
        List<Coupon> couponList = couponMapper.getMatchConditionCouponList(matchConditionTime);
        // log.info("[CouponSchedule] fresh time: {}, couponList: {}", matchConditionTime, couponList);
        for (Coupon coupon : couponList) {
            // Redis中判断没有存在此优惠券
            if (!redisTemplate.hasKey(StaticEnums.c_cid + coupon.getId())) {
                // 空置零
                if (coupon.getNum() == null) {
                    coupon.setNum(0);
                }
                // 最外层唯一标识
                String unique = StaticEnums.c_cid + coupon.getId();
                // 如果数据库中此优惠券数量不为0
                if (coupon.getNum() != 0) {
                    redisTemplate.opsForHash().put(unique,
                            StaticEnums.c_num, coupon.getNum()); // 存放数量
                    redisTemplate.opsForHash().put(unique,
                            StaticEnums.start_time, coupon.getStart()); // 开始时间
                    log.info("[CouponSchedule Success], put coupon id:{},num:{}",
                            coupon.getId(), coupon.getNum());
                }
            }
        }
    }

    /**
     * Redis优惠券同步数据库
     */
    @Scheduled(cron = StaticEnums.cron_string)
    public void updateDatabasesForCoupon() {
        log.info("[UpdateDatabasesForCoupon Start]");
        // Keys
        LinkedHashSet<String> keys = (LinkedHashSet<String>) redisTemplate.keys("*");
        // 模糊匹配
        Predicate<String> getCouponKeys = item -> item.contains(StaticEnums.c_cid);
        List<String> couponKeys = keys.stream().filter(getCouponKeys).collect(Collectors.toList());
        for (String couponKey : couponKeys) {
            Integer num = (Integer) redisTemplate.opsForHash().get(couponKey, StaticEnums.c_num);
            // 判断优惠券是否还有数量, 如果没有数量了
            if (StaticEnums.zero == num) {
                // 删除缓存, 更新数据库数据
                Coupon coupon = new Coupon();
                String id = couponKey.substring(StaticEnums.c_cid.length());
                coupon.setId(Long.parseLong(id));
                coupon.setNum(0);
                couponMapper.updateCoupon(coupon);
                redisTemplate.delete(couponKey);
                log.info("[UpdateDatabasesForCoupon Success], coupon_id = {}", id);
            }
        }
    }
}
