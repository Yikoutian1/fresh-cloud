package com.fresh.system.service.impl;

import com.fresh.system.domain.Coupon;
import com.fresh.system.mapper.CouponMapper;
import com.fresh.system.service.ICouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 优惠券Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-12-26
 */
@Service
public class CouponServiceImpl implements ICouponService 
{
    @Autowired
    private CouponMapper couponMapper;

    /**
     * 查询优惠券
     * 
     * @param id 优惠券主键
     * @return 优惠券
     */
    @Override
    public Coupon selectCouponById(Long id)
    {
        return couponMapper.selectCouponById(id);
    }

    /**
     * 查询优惠券列表
     * 
     * @param coupon 优惠券
     * @return 优惠券
     */
    @Override
    public List<Coupon> selectCouponList(Coupon coupon)
    {
        return couponMapper.selectCouponList(coupon);
    }

    /**
     * 新增优惠券
     * 
     * @param coupon 优惠券
     * @return 结果
     */
    @Override
    public int insertCoupon(Coupon coupon)
    {
        return couponMapper.insertCoupon(coupon);
    }

    /**
     * 修改优惠券
     * 
     * @param coupon 优惠券
     * @return 结果
     */
    @Override
    public int updateCoupon(Coupon coupon)
    {
        return couponMapper.updateCoupon(coupon);
    }

    /**
     * 批量删除优惠券
     * 
     * @param ids 需要删除的优惠券主键
     * @return 结果
     */
    @Override
    public int deleteCouponByIds(Long[] ids)
    {
        return couponMapper.deleteCouponByIds(ids);
    }

    /**
     * 删除优惠券信息
     * 
     * @param id 优惠券主键
     * @return 结果
     */
    @Override
    public int deleteCouponById(Long id)
    {
        return couponMapper.deleteCouponById(id);
    }
}
