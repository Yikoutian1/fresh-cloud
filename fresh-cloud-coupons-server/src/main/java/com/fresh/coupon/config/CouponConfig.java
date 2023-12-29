package com.fresh.coupon.config;

import org.springframework.context.annotation.Configuration;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-28 19:07
 **/
@Configuration
public class CouponConfig {
    public String COUPON_CID_="COUPON_CID_"; //最外面的key
    public String COUPON_GRAB_UID_="COUPON_GRAB_UID_"; //抢到卷的用户id 作为内层key
    public  String COUPON_CID_NUM_="COUPON_CID_NUM_"; //该编号优惠卷的数量
}
