package com.yc.goods.mapper;

import com.yc.common.entity.GoodsInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface IGoodsInfoMapper {
	/**
	 * 添加商品信息
	 * @param gf
	 * @return
	 */
	public int add(GoodsInfo gf);
	
	/**
	 * 首页显示的数据
	 * @return
	 */
	public List<GoodsInfo> finds();
	
	/**
	 * 根据商品类型分页查询
	 * @param map
	 * @return
	 */
	public List<GoodsInfo> findByType(Map<String, Integer> map);
	
	/**
	 * 根据商品编号，查询商品信息
	 * @param gno
	 * @return
	 */
	public GoodsInfo findByGno(int gno);
	
	/**
	 * 获取总记录数的方法
	 * @param tno
	 * @return
	 */
	public int getTotal(Integer tno);
	
	/**
	 * 根据购物车编号修改商品库存的方法
	 * @param cno
	 * @return
	 */
	public int updateStore(String[] cno);
	
}
