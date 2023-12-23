package com.fresh.index.controller.order;


import com.fresh.common.entity.OrderInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: yc-fresh-cloud
 * @description: 订单控制器
 * @author: 作者 huchaojie
 * @create: 2021-10-09 11:01
 */
@RequestMapping("/order")
public interface IOrderInfoControllerApi {

    @PostMapping("/add")
    public int add(OrderInfo of);
}
