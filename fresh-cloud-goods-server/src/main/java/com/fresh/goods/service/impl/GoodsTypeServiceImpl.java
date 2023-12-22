package com.fresh.goods.service.impl;

import com.fresh.common.entity.GoodsType;
import com.fresh.common.util.StringUtil;
import com.fresh.goods.mapper.IGoodsTypeMapper;
import com.fresh.goods.service.IGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;


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
