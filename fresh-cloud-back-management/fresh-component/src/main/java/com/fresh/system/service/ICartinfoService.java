package com.fresh.system.service;

import com.fresh.system.domain.Cartinfo;

import java.util.List;

/**
 * 购物车信息Service接口
 * 
 * @author calyee
 * @date 2023-12-26
 */
public interface ICartinfoService 
{
    /**
     * 查询购物车信息
     * 
     * @param cno 购物车信息主键
     * @return 购物车信息
     */
    public Cartinfo selectCartinfoByCno(String cno);

    /**
     * 查询购物车信息列表
     * 
     * @param cartinfo 购物车信息
     * @return 购物车信息集合
     */
    public List<Cartinfo> selectCartinfoList(Cartinfo cartinfo);

    /**
     * 新增购物车信息
     * 
     * @param cartinfo 购物车信息
     * @return 结果
     */
    public int insertCartinfo(Cartinfo cartinfo);

    /**
     * 修改购物车信息
     * 
     * @param cartinfo 购物车信息
     * @return 结果
     */
    public int updateCartinfo(Cartinfo cartinfo);

    /**
     * 批量删除购物车信息
     * 
     * @param cnos 需要删除的购物车信息主键集合
     * @return 结果
     */
    public int deleteCartinfoByCnos(String[] cnos);

    /**
     * 删除购物车信息信息
     * 
     * @param cno 购物车信息主键
     * @return 结果
     */
    public int deleteCartinfoByCno(String cno);
}
