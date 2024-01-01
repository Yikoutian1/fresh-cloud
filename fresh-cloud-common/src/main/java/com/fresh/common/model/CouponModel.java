package com.fresh.common.model;

import com.fresh.common.entity.Coupon;
import lombok.*;

import java.util.List;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-30 14:56
 **/
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CouponModel {
    /**
     * 用户id
     */
        public Integer uid;
    /**
     * 用户是否使用该卷 或者卷是否过期
     */
    public Integer status;
    /**
     * 卷信息
     */
    public Coupon coupon;
}
