package com.yc.goods.service.impl;

import java.util.List;

import com.yc.common.entity.GoodsType;
import com.yc.common.util.StringUtil;
import com.yc.goods.mapper.IGoodsTypeMapper;
import com.yc.goods.service.IGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;


@Service
@Primary
public class GoodsTypeServiceImpl implements IGoodsTypeService {
	@Autowired
	private IGoodsTypeMapper mapper;

	@Override
	public int add(GoodsType gt) {
		if (StringUtil.checkNull(gt.getTname(), gt.getPic())) {
			return -1;
		}
		return mapper.add(gt);
	}

	@Override
	public List<GoodsType> finds() {
		return mapper.finds();
	}
}
