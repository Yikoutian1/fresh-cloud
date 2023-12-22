package com.yc.goods.service;

import com.yc.common.entity.GoodsType;

import java.util.List;


public interface IGoodsTypeService {
	public int add(GoodsType gt);

	public List<GoodsType> finds();
}
