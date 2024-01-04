package com.fresh.coupon.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fresh.common.entity.Coupon;
import com.fresh.common.entity.MemberQiangCoupon;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.Mapping;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-28 15:06
 **/
public interface MemberQiangCouponMapper extends BaseMapper<MemberQiangCoupon> {
    @Update("update memberqiangcoupon set status=#{status} where uid=#{uid} and cid=#{cid} ")
    int updateCouponStatus(@Param("uid") Integer uid ,@Param("cid") Integer cid ,
                           @Param("status") Integer status);
    @Select("select * from coupon where id = (select max(id) from coupon)")
    Coupon selectFirstCoupon();
    @Select("select status from memberqiangcoupon where uid=#{uid} and cid=#{cid}")
    int SelectCouponStatus(@Param("uid") Integer uid ,@Param("cid") Integer cid);
}
