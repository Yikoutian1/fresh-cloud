package com.fresh.order.mapper;


import com.fresh.common.entity.OrderInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface IOrderInfoMapper {

	/**
	 * 添加订单的方法
	 * @param of
	 * @return
	 */
	public int add(OrderInfo of);

	public int addOrder(OrderInfo of);

	/**
	 * 查询订单的年月
	 * @return
	 */
	@Select(" select distinct(SUBSTR(odate FROM 1 FOR 7)) from orderinfo  ")
	public List<String> queryDateTime();
	@Select(" select distinct(SUBSTR(odate FROM 1 FOR 10)) from orderinfo where odate like CONCAT('%',#{odate},'%') ")
	public List<String> queryTime(@Param("odate") String odate);

	/**
	 * 该日期的收益和数量
	 * @param odate
	 * @return
	 */

	@Select(" select ono from orderinfo where odate like CONCAT('%',#{odate},'%') ")
	public List<String> queryOno(@Param("odate") String odate);
	/**
	 * 查询符合日期的订单号
	 * @param odate
	 * @return
	 */
	@Select(" select sum(realprice) from orderinfo where odate like CONCAT('%',#{odate},'%') ")
	public Long queryPrice(@Param("odate") String odate);



}
