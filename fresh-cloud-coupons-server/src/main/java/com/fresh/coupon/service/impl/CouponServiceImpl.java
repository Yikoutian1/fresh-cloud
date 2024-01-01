package com.fresh.coupon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fresh.common.entity.Coupon;
import com.fresh.common.entity.MemberQiangCoupon;
import com.fresh.coupon.mapper.CouponMapper;
import com.fresh.coupon.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: fresh-cloud
 * @description:
 **/
@Service
public class CouponServiceImpl  implements CouponService {
    @Autowired
    private CouponMapper couponMapper;
    public Coupon getCouponInfoByCid(Integer cid){
        Coupon couponInfoByCid = couponMapper.getCouponInfoByCid(cid);
        return couponInfoByCid;
    }
}
