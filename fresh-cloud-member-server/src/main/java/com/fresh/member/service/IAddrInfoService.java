package com.fresh.member.service;

import com.fresh.common.entity.AddrInfo;

import java.util.List;

/**
 * @program: yc-fresh-cloud
 * @description: 收货地址
 * @author: 作者 huchaojie
 * @create: 2021-10-08 20:47
 */
public interface IAddrInfoService {

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
    public int update(String[] anos);

    /**
     * 查询指定会员的地址信息
     * @param mno
     * @return
     */
    public List<AddrInfo> findByMno(int mno);

}
