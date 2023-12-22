package com.yc.order.controller;

import com.codingapi.txlcn.tc.annotation.LcnTransaction;
import com.yc.common.entity.JsonModel;
import com.yc.common.entity.OrderInfo;
import com.yc.index.controller.cart.ICartInfoControllerApi;
import com.yc.index.controller.goods.IGoodsInfoControllerApi;
import com.yc.index.controller.order.IOrderInfoControllerApi;
import com.yc.order.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: yc-fresh-cloud
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
