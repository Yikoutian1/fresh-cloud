package com.fresh.order.controller;


import com.fresh.common.entity.OrderInfo;
import com.fresh.order.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: fresh-cloud
 * @description: 订单控制器
 */
@RestController
@RequestMapping("/order")
public class OrderInfoController{

    @Autowired
    private IOrderService service;

    @PostMapping("/add")
    public int add(OrderInfo of) {
        return service.add(of);
    }

    @GetMapping("/as")
    public int as(){
        return 1;
    }
}

