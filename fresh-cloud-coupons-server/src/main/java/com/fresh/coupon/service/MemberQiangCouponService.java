package com.fresh.coupon.service;

import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-28 15:02
 **/
@Service
public interface MemberQiangCouponService {
    void addMemberQiangCoupon(Map<String,Object> msg);

}
