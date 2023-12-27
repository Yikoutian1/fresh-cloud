package com.fresh.system.service;

import com.fresh.system.domain.Orderiteminfo;

import java.util.List;

/**
 * 订单对象信息Service接口
 * 
 * @author calyee
 * @date 2023-12-26
 */
public interface IOrderiteminfoService 
{
    /**
     * 查询订单对象信息
     * 
     * @param ino 订单对象信息主键
     * @return 订单对象信息
     */
    public Orderiteminfo selectOrderiteminfoByIno(Long ino);

    /**
     * 查询订单对象信息列表
     * 
     * @param orderiteminfo 订单对象信息
     * @return 订单对象信息集合
     */
    public List<Orderiteminfo> selectOrderiteminfoList(Orderiteminfo orderiteminfo);

    /**
     * 新增订单对象信息
     * 
     * @param orderiteminfo 订单对象信息
     * @return 结果
     */
    public int insertOrderiteminfo(Orderiteminfo orderiteminfo);

    /**
     * 修改订单对象信息
     * 
     * @param orderiteminfo 订单对象信息
     * @return 结果
     */
    public int updateOrderiteminfo(Orderiteminfo orderiteminfo);

    /**
     * 批量删除订单对象信息
     * 
     * @param inos 需要删除的订单对象信息主键集合
     * @return 结果
     */
    public int deleteOrderiteminfoByInos(Long[] inos);

    /**
     * 删除订单对象信息信息
     * 
     * @param ino 订单对象信息主键
     * @return 结果
     */
    public int deleteOrderiteminfoByIno(Long ino);
}
