package com.fresh.system.service.impl;

import com.fresh.system.domain.Orderinfo;
import com.fresh.system.mapper.OrderinfoMapper;
import com.fresh.system.service.IOrderinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单信息Service业务层处理
 * 
 * @author calyee
 * @date 2023-12-26
 */
@Service
public class OrderinfoServiceImpl implements IOrderinfoService 
{
    @Autowired
    private OrderinfoMapper orderinfoMapper;

    /**
     * 查询订单信息
     * 
     * @param ono 订单信息主键
     * @return 订单信息
     */
    @Override
    public Orderinfo selectOrderinfoByOno(String ono)
    {
        return orderinfoMapper.selectOrderinfoByOno(ono);
    }

    /**
     * 查询订单信息列表
     * 
     * @param orderinfo 订单信息
     * @return 订单信息
     */
    @Override
    public List<Orderinfo> selectOrderinfoList(Orderinfo orderinfo)
    {
        return orderinfoMapper.selectOrderinfoList(orderinfo);
    }

    /**
     * 新增订单信息
     * 
     * @param orderinfo 订单信息
     * @return 结果
     */
    @Override
    public int insertOrderinfo(Orderinfo orderinfo)
    {
        return orderinfoMapper.insertOrderinfo(orderinfo);
    }

    /**
     * 修改订单信息
     * 
     * @param orderinfo 订单信息
     * @return 结果
     */
    @Override
    public int updateOrderinfo(Orderinfo orderinfo)
    {
        return orderinfoMapper.updateOrderinfo(orderinfo);
    }

    /**
     * 批量删除订单信息
     * 
     * @param onos 需要删除的订单信息主键
     * @return 结果
     */
    @Override
    public int deleteOrderinfoByOnos(String[] onos)
    {
        return orderinfoMapper.deleteOrderinfoByOnos(onos);
    }

    /**
     * 删除订单信息信息
     * 
     * @param ono 订单信息主键
     * @return 结果
     */
    @Override
    public int deleteOrderinfoByOno(String ono)
    {
        return orderinfoMapper.deleteOrderinfoByOno(ono);
    }
}
