package com.yc.member.service.impl;

import com.yc.common.entity.MemberInfo;
import com.yc.common.util.StringUtil;
import com.yc.member.mapper.IMemberInfoMapper;
import com.yc.member.service.IMemberInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;


@Service
@Primary
public class MemberInfoServiceImpl implements IMemberInfoService {

	@Autowired
	private IMemberInfoMapper mapper;

	@Override
	public MemberInfo login(MemberInfo mf) {
		if (StringUtil.checkNull(mf.getNickName(), mf.getPwd())) {
			return null;
		}
		return mapper.login(mf);
	}

	@Override
	public int add(MemberInfo mf) {
		if (StringUtil.checkNull(mf.getNickName(), mf.getEmail(), mf.getPwd())) {
			return -1;
		}
		return mapper.add(mf);
	}
}
