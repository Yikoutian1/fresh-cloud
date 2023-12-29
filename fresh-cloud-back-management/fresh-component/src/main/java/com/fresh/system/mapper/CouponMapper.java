package com.fresh.system.mapper;

import java.util.List;

import com.fresh.system.domain.Coupon;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 优惠券Mapper接口
 *
 * @author calyee
 * @date 2023-12-29
 */
@Mapper
public interface CouponMapper {
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
     * 删除优惠券
     *
     * @param id 优惠券主键
     * @return 结果
     */
    public int deleteCouponById(Long id);

    /**
     * 批量删除优惠券
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCouponByIds(Long[] ids);

    /**
     * 获取满足条件的优惠券信息
     * @return 结果
     */

    List<Coupon> getMatchConditionCouponList(@Param("time") Integer matchConditionTime);
}
