package com.fresh.order.mapper;


import com.fresh.common.entity.OrderInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IOrderInfoMapper {

	/**
	 * 添加订单的方法
	 * @param of
	 * @return
	 */
	public int add(OrderInfo of);
}
