package com.fresh.common.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单表
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderInfo implements Serializable {
	private static final long serialVersionUID = 3234667992435869278L;
	private String ono;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date odate; // 下单日期
	private String ano; // 收货地址
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date sdate; // 发货日期
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date rdate; // 收货日期
	private Integer status; // 订单状态
	private Double price; // 订单总额
	/**
	 * 优惠卷id
	 */
	private int iscoupon;
	/**
	 * 优惠卷价格
	 */
	private Double couponprice;

	private Double realprice;
	/**
	 * 0 没开 1开了
	 */
	private Integer invoice; //  是否已开发票
}