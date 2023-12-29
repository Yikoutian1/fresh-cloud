package com.fresh.common.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

/**
 * @program: fresh-cloud
 * @description:
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@TableName("memberqiangcoupon")  //   <- 指定你要对应的表
public class MemberQiangCoupon implements Serializable {
    public Integer uid;
    public Integer cid;
    public Integer num;
    /**
     *  0 未使用 1已使用 2已过期
     */
    public Integer status;
}
