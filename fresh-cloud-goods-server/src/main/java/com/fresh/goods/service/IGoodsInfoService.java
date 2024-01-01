package com.fresh.goods.service;


import com.fresh.common.entity.GoodsInfo;

import java.util.List;
import java.util.Map;

public interface IGoodsInfoService {
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
	public Map<String, Object> finds();
	
	/**
	 * 根据商品类型分页查询
	 * @param tno
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<GoodsInfo> findByType(int tno, int page, int rows);
	
	/**
	 * 第一次根据商品类型分页查询
	 * @param tno
	 * @param page
	 * @param rows
	 * @return
	 */
	public Map<String, Object> findByFirst(int tno, int page, int rows);
	
	/**
	 * 根据商品编号，查询商品信息
	 * @param gno
	 * @return
	 */
	public GoodsInfo findByGno(int gno);

	/**
	 * 修改商品数量
	 * @param cno
	 * @return
	 */
	public int updateStore(String[] cno);

	public int updateGoodsNum(Integer gno,Integer num);
}
