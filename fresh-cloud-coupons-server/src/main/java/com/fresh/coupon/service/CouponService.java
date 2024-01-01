package com.fresh.coupon.service;


import com.fresh.common.entity.Coupon;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-27 20:21
 **/
public interface CouponService{
    Coupon getCouponInfoByCid(Integer cid);
}
