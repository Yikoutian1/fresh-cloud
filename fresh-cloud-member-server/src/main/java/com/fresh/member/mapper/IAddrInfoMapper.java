package com.fresh.member.mapper;

import java.util.List;

import com.fresh.common.entity.AddrInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 地址类
 * 源辰信息
 * @author navy
 * @2019年7月27日
 */
@Mapper
public interface IAddrInfoMapper {
	/**
	 * 添加地址信息
	 * @param af
	 * @return
	 */
	public int add(AddrInfo af);
	
	/**
	 * 修改默认地址
	 * @param af
	 * @return
	 */
	public int update(int mno);
	
	/**
	 * 修改默认地址
	 * @param af
	 * @return
	 */
	public int updates(String[] anos);

	/**
	 * 查询指定会员的地址信息
	 * @param mno
	 * @return
	 */
	public List<AddrInfo> findByMno(int mno);
}
