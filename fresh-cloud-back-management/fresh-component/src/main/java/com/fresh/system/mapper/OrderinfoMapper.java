package com.fresh.system.mapper;

import com.fresh.system.domain.Orderinfo;

import java.util.List;

/**
 * 订单信息Mapper接口
 * 
 * @author calyee
 * @date 2023-12-26
 */
public interface OrderinfoMapper 
{
    /**
     * 查询订单信息
     * 
     * @param ono 订单信息主键
     * @return 订单信息
     */
    public Orderinfo selectOrderinfoByOno(String ono);

    /**
     * 查询订单信息列表
     * 
     * @param orderinfo 订单信息
     * @return 订单信息集合
     */
    public List<Orderinfo> selectOrderinfoList(Orderinfo orderinfo);

    /**
     * 新增订单信息
     * 
     * @param orderinfo 订单信息
     * @return 结果
     */
    public int insertOrderinfo(Orderinfo orderinfo);

    /**
     * 修改订单信息
     * 
     * @param orderinfo 订单信息
     * @return 结果
     */
    public int updateOrderinfo(Orderinfo orderinfo);

    /**
     * 删除订单信息
     * 
     * @param ono 订单信息主键
     * @return 结果
     */
    public int deleteOrderinfoByOno(String ono);

    /**
     * 批量删除订单信息
     * 
     * @param onos 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrderinfoByOnos(String[] onos);
}
