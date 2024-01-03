package com.fresh.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.fresh.common.entity.MemberQiangCoupon;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-28 15:02
 **/

public interface MemberQiangCouponService extends IService<MemberQiangCoupon> {
    void addMemberQiangCoupon(Map<String,Object> msg);
    Map<String,Object> getCouponByUid(HttpSession session);

}
