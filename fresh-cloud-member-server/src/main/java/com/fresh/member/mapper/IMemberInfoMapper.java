package com.fresh.member.mapper;


import com.fresh.common.entity.MemberInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberInfoMapper {

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
