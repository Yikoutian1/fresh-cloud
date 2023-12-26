package com.fresh.system.service;

import com.fresh.system.domain.Coupon;

import java.util.List;

/**
 * 优惠券Service接口
 * 
 * @author ruoyi
 * @date 2023-12-26
 */
public interface ICouponService 
{
    /**
     * 查询优惠券
     * 
     * @param id 优惠券主键
     * @return 优惠券
     */
    public Coupon selectCouponById(Long id);

    /**
     * 查询优惠券列表
     * 
     * @param coupon 优惠券
     * @return 优惠券集合
     */
    public List<Coupon> selectCouponList(Coupon coupon);

    /**
     * 新增优惠券
     * 
     * @param coupon 优惠券
     * @return 结果
     */
    public int insertCoupon(Coupon coupon);

    /**
     * 修改优惠券
     * 
     * @param coupon 优惠券
     * @return 结果
     */
    public int updateCoupon(Coupon coupon);

    /**
     * 批量删除优惠券
     * 
     * @param ids 需要删除的优惠券主键集合
     * @return 结果
     */
    public int deleteCouponByIds(Long[] ids);

    /**
     * 删除优惠券信息
     * 
     * @param id 优惠券主键
     * @return 结果
     */
    public int deleteCouponById(Long id);
}
