package com.fresh.system.service;

import com.fresh.system.domain.Addrinfo;

import java.util.List;

/**
 * 地址信息Service接口
 * 
 * @author calyee
 * @date 2023-12-26
 */
public interface IAddrinfoService 
{
    /**
     * 查询地址信息
     * 
     * @param ano 地址信息主键
     * @return 地址信息
     */
    public Addrinfo selectAddrinfoByAno(String ano);

    /**
     * 查询地址信息列表
     * 
     * @param addrinfo 地址信息
     * @return 地址信息集合
     */
    public List<Addrinfo> selectAddrinfoList(Addrinfo addrinfo);

    /**
     * 新增地址信息
     * 
     * @param addrinfo 地址信息
     * @return 结果
     */
    public int insertAddrinfo(Addrinfo addrinfo);

    /**
     * 修改地址信息
     * 
     * @param addrinfo 地址信息
     * @return 结果
     */
    public int updateAddrinfo(Addrinfo addrinfo);

    /**
     * 批量删除地址信息
     * 
     * @param anos 需要删除的地址信息主键集合
     * @return 结果
     */
    public int deleteAddrinfoByAnos(String[] anos);

    /**
     * 删除地址信息信息
     * 
     * @param ano 地址信息主键
     * @return 结果
     */
    public int deleteAddrinfoByAno(String ano);
}
