package com.fresh.order.mapper;


import com.fresh.common.entity.OrderItemInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface IOrderItemInfoMapper {

	/**
	 * 添加订单详细
	 * @param orderItemInfo
	 * @return
	 */
	public int add(OrderItemInfo orderItemInfo);
}
