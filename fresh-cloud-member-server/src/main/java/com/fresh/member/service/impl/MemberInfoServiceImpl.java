package com.fresh.member.service.impl;


import com.fresh.common.entity.MemberInfo;
import com.fresh.common.util.StringUtil;
import com.fresh.member.mapper.IMemberInfoMapper;
import com.fresh.member.service.IMemberInfoService;
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
