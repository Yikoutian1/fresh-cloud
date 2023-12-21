package com.fresh.goods.service;

import com.fresh.common.entity.GoodsType;

import java.util.List;


public interface IGoodsTypeService {
	public int add(GoodsType gt);

	public List<GoodsType> finds();
}
