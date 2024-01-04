package com.fresh.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.fresh.common.utils.bean.BeanUtils;
import com.fresh.system.BeanCopyUtils;
import com.fresh.system.domain.CouponCard;
import com.fresh.system.domain.vo.CouponVo;
import com.fresh.system.mapper.MemberinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fresh.system.mapper.CouponMapper;
import com.fresh.system.domain.Coupon;
import com.fresh.system.service.ICouponService;

/**
 * 优惠券Service业务层处理
 *
 * @author calyee
 * @date 2024-01-03
 */
@Service
public class CouponServiceImpl implements ICouponService {
    @Autowired
    private CouponMapper couponMapper;

    /**
     * 查询优惠券
     *
     * @param id 优惠券主键
     * @return 优惠券
     */
    @Override
    public Coupon selectCouponById(Long id) {
        return couponMapper.selectCouponById(id);
    }

    /**
     * 查询优惠券列表
     *
     * @param coupon 优惠券
     * @return 优惠券
     */
    @Override
    public List<Coupon> selectCouponList(Coupon coupon) {
        return couponMapper.selectCouponList(coupon);
    }

    /**
     * 得到优惠券以及使用信息
     * @param coupon 优惠券
     * @return 优惠券
     */
    @Override
    public List<CouponVo> selectCouponCardList(Coupon coupon) {
        List<CouponCard> shouldGetSum = couponMapper.getCouponCards();
        List<CouponVo> couponVos = BeanCopyUtils.copyBeanList(couponMapper.selectCouponList(coupon), CouponVo.class);
        for (CouponVo couponVo : couponVos) {
            // 优惠券Id
            Long cid = couponVo.getId();
            for (CouponCard card : shouldGetSum) {
                if(card.getCid().equals(cid)){
                    couponVo.setUseNum(card.getSum());
                }
            }
        }
        return couponVos;
    }

    /**
     * 新增优惠券
     *
     * @param coupon 优惠券
     * @return 结果
     */
    @Override
    public int insertCoupon(Coupon coupon) {
        return couponMapper.insertCoupon(coupon);
    }

    /**
     * 修改优惠券
     *
     * @param coupon 优惠券
     * @return 结果
     */
    @Override
    public int updateCoupon(Coupon coupon) {
        return couponMapper.updateCoupon(coupon);
    }

    /**
     * 批量删除优惠券
     *
     * @param ids 需要删除的优惠券主键
     * @return 结果
     */
    @Override
    public int deleteCouponByIds(Long[] ids) {
        return couponMapper.deleteCouponByIds(ids);
    }

    /**
     * 删除优惠券信息
     *
     * @param id 优惠券主键
     * @return 结果
     */
    @Override
    public int deleteCouponById(Long id) {
        return couponMapper.deleteCouponById(id);
    }

    @Override
    public List<Coupon> selectAll(Integer time) {
        return couponMapper.selectAll(time);
    }

}
