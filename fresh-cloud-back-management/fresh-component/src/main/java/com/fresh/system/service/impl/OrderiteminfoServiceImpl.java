package com.fresh.system.service.impl;

import com.fresh.system.domain.Orderiteminfo;
import com.fresh.system.mapper.OrderiteminfoMapper;
import com.fresh.system.service.IOrderiteminfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单对象信息Service业务层处理
 *
 * @author calyee
 * @date 2023-12-26
 */
@Service
public class OrderiteminfoServiceImpl implements IOrderiteminfoService {
    @Autowired
    private OrderiteminfoMapper orderiteminfoMapper;

    /**
     * 查询订单对象信息
     *
     * @param ino 订单对象信息主键
     * @return 订单对象信息
     */
    @Override
    public Orderiteminfo selectOrderiteminfoByIno(Long ino) {
        return orderiteminfoMapper.selectOrderiteminfoByIno(ino);
    }

    /**
     * 查询订单对象信息列表
     *
     * @param orderiteminfo 订单对象信息
     * @return 订单对象信息
     */
    @Override
    public List<Orderiteminfo> selectOrderiteminfoList(Orderiteminfo orderiteminfo) {
        return orderiteminfoMapper.selectOrderiteminfoList(orderiteminfo);
    }

    /**
     * 新增订单对象信息
     *
     * @param orderiteminfo 订单对象信息
     * @return 结果
     */
    @Override
    public int insertOrderiteminfo(Orderiteminfo orderiteminfo) {
        return orderiteminfoMapper.insertOrderiteminfo(orderiteminfo);
    }

    /**
     * 修改订单对象信息
     *
     * @param orderiteminfo 订单对象信息
     * @return 结果
     */
    @Override
    public int updateOrderiteminfo(Orderiteminfo orderiteminfo) {
        return orderiteminfoMapper.updateOrderiteminfo(orderiteminfo);
    }

    /**
     * 批量删除订单对象信息
     *
     * @param inos 需要删除的订单对象信息主键
     * @return 结果
     */
    @Override
    public int deleteOrderiteminfoByInos(Long[] inos) {
        return orderiteminfoMapper.deleteOrderiteminfoByInos(inos);
    }

    /**
     * 删除订单对象信息信息
     *
     * @param ino 订单对象信息主键
     * @return 结果
     */
    @Override
    public int deleteOrderiteminfoByIno(Long ino) {
        return orderiteminfoMapper.deleteOrderiteminfoByIno(ino);
    }
}
