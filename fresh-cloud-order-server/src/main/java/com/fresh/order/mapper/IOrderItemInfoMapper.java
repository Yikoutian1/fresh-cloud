package com.fresh.order.mapper;


import com.fresh.common.entity.OrderItemInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface IOrderItemInfoMapper {

	/**
	 * 添加订单详细
	 * @param orderItemInfo
	 * @return
	 */
	public int add(OrderItemInfo orderItemInfo);
	@Select("select sum(nums) from orderiteminfo where ono=#{ono} ")
	public Integer queryNum(@Param("ono") String ono);

	@Select(" select gno from orderiteminfo where ono =#{ono}")
	public List<Integer> queryGno(@Param("ono") String ono);
	@Select(" select nums from orderiteminfo where ono =#{ono} and gno=#{gno}")
	public Integer queryNumsByGnoAndOno(@Param("ono") String ono,@Param("gno") Integer gno );
}
