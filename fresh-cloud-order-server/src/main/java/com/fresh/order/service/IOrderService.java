package com.fresh.order.service;

import com.fresh.common.entity.OrderInfo;

/**
 * @program: yc-fresh-cloud
 * @description: 订单管理
 * @author: 作者 huchaojie
 * @create: 2021-10-08 20:46
 */
public interface IOrderService {
    /**
     * 下单的方法
     * @param of
     * @return
     */
    public int add(OrderInfo of);
}
