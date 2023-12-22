package com.fresh.order.service;

import com.fresh.common.entity.OrderInfo;

/**
 * @program: yc-fresh-cloud
 * @description: 订单管理
 */
public interface IOrderService {
    /**
     * 下单的方法
     * @param of
     * @return
     */
    public int add(OrderInfo of);
}
