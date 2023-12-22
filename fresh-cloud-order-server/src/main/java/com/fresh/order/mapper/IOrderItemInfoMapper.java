package com.fresh.order.mapper;


import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface IOrderItemInfoMapper {

	/**
	 * 添加订单详细
	 * @param map
	 * @return
	 */
	public int add(Map<String, Object> map);
}
