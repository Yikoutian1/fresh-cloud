package com.yc.order.service;

import com.yc.common.entity.OrderInfo;

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
