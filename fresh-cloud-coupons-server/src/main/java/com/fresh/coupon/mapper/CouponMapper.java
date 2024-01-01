package com.fresh.coupon.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fresh.common.entity.Coupon;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-26 19:11
 **/
@Mapper
public interface CouponMapper extends BaseMapper<Coupon> {
    Coupon getCouponInfoByCid(Integer cid);
}
