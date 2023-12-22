package com.yc.member.service;

import com.yc.common.entity.MemberInfo;

public interface IMemberInfoService {
	/**
	 * 会员登录
	 * @param mf
	 * @return
	 */
	public MemberInfo login(MemberInfo mf);
	
	/**
	 * 会员注册
	 * @param mf
	 * @return
	 */
	public int add(MemberInfo mf);
}
