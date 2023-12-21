package com.fresh.order.controller;

import com.fresh.common.entity.OrderInfo;
import com.fresh.index.controller.cart.ICartInfoControllerApi;
import com.fresh.index.controller.goods.IGoodsInfoControllerApi;
import com.fresh.index.controller.order.IOrderInfoControllerApi;
import com.fresh.order.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: fresh-cloud
 * @description: 订单控制器
 */
@RestController
public class OrderInfoController implements IOrderInfoControllerApi {

    @Autowired
    private IOrderService service;

    @Autowired
    private ICartInfoControllerApi iCartInfoControllerApi;

    @Autowired
    private IGoodsInfoControllerApi iGoodsInfoControllerApi;

    @Override
    public int add(OrderInfo of) {
        return service.add(of);
    }
}
