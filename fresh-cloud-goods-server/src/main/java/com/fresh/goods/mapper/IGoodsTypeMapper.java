package com.fresh.goods.mapper;

import com.fresh.common.entity.GoodsType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface IGoodsTypeMapper {

	public int add(GoodsType gt);
	
	public List<GoodsType> finds();
}
