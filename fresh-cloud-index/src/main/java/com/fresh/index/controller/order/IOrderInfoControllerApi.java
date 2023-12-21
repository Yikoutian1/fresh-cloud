package com.fresh.index.controller.order;

import com.fresh.common.entity.OrderInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: fresh-cloud
 * @description: 订单控制器
 */
@RequestMapping("/order")
public interface IOrderInfoControllerApi {

    @PostMapping("/add")
    public int add(OrderInfo of);
}
