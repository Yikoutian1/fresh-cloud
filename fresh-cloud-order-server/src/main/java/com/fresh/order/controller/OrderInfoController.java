package com.fresh.order.controller;


import com.fresh.common.entity.CartInfo;
import com.fresh.common.entity.OrderInfo;
import com.fresh.order.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, Object> add(OrderInfo of, HttpSession session) {
        return service.add(of,session);
    }

    @GetMapping("/as")
    public int as(){
        return 1;
    }

    @PostMapping("/queryIsOrder")
    public Map<String,Object> queryIsOrder(HttpSession session) {
        Map<String,Object> map=new HashMap<>();
        if (session.getAttribute("cartInfos")==null&&session.getAttribute("orderInfos")==null){
            map.put("code",0);
        }else{
            map.put("code",1);
        }

        return map;
    }
    @PostMapping("/queryEcharts")
    public Map<String,Object> queryEcharts(@RequestParam("date") String date) {
        return  service.queryEcharts(date);
    }
    @PostMapping("/queryGoodsNumAndName")
    public Map<String,Object> queryGoodsNumAndName(@RequestParam("date") String date) {
        return  service.queryGoodsNum(date);
    }
}

