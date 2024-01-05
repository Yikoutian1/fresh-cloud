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
    @Scheduled(cron = StaticEnums.cron_test)
    public void addMatchConditionCouponToRedis() {
        log.info("[CouponSchedule Start]");
        List<Coupon> couponList = couponMapper.getMatchConditionCouponList(matchConditionTime);
        // 时间
        Long judgeAddRedisNowTime = new Date().getTime();
        // log.info("[CouponSchedule] fresh time: {}, couponList: {}", matchConditionTime, couponList);
        for (Coupon coupon : couponList) {
            Long judgeAddRedisEndTime = coupon.getEnd().getTime();
            // 如果优惠券超过时间则不需要添加到缓存
//            if (judgeAddRedisNowTime > judgeAddRedisEndTime) {
//                break;
//            } else {
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
                    // 存放数量
                    redisTemplate.opsForHash().put(unique,
                            StaticEnums.c_num, coupon.getNum());
                    // 开始时间
                    redisTemplate.opsForHash().put(unique,
                            StaticEnums.start_time, coupon.getStart().getTime());
                    // 结束时间
                    redisTemplate.opsForHash().put(unique,
                            StaticEnums.end_time, coupon.getEnd().getTime());
                    log.info("[CouponSchedule Success], put coupon id:{}, num:{}, start time:{}, end time:{}.",
                            coupon.getId(), coupon.getNum(), coupon.getStart().getTime(), coupon.getEnd().getTime());
                }
            }
//            }
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
        for (String couponKey : couponKeys) { // couponKey: 优惠券在Redis唯一标识
            Integer num = (Integer) redisTemplate.opsForHash().get(couponKey, StaticEnums.c_num);
            Long endTime = (Long) redisTemplate.opsForHash().get(couponKey, StaticEnums.end_time);
            long nowTime = new Date().getTime();
            // 1. 活动还未过期,数量还有 -> 什么都不需要处理
            // 2. 活动还未过期,数量0   -> 数量原用缓存的数量,缓存删除
            // 3. 活动已经过期, 有 -> 数量原用缓存的数量,缓存删除
            // 4. 活动已经过期,数量0   -> 数量原用缓存的数量,缓存删除
            Coupon coupon = new Coupon();
            String id = couponKey.substring(StaticEnums.c_cid.length());
            coupon.setId(Long.parseLong(id));
            coupon.setNum(num);
            // 活动未过期情况
            if (nowTime <= endTime) {
                // 没有优惠券了,缓存删除 (情况2)
                if (StaticEnums.zero == num) {
                    // 删除缓存, 更新数据库数据
                    couponMapper.updateCoupon(coupon);
                    redisTemplate.delete(couponKey);
                    log.info("[UpdateDatabasesForCoupon Success, Coupon num is zero], coupon_id = {}", id);
                    return; // 如果没有库存了, 直接返回
                }// (情况1) 什么都不需要处理
            } else { // 超过优惠券时间,删除缓存 (情况3和4)
                // 删除缓存, 更新数据库数据
                couponMapper.updateCoupon(coupon);
                redisTemplate.delete(couponKey);
                log.info("[UpdateDatabasesForCoupon Success, Coupon to exceed the time limit], coupon_id = {}", id);
                return;
            }
        }
    }
}