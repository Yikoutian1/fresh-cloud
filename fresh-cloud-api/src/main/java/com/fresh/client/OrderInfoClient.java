package com.fresh.client;


import com.fresh.common.entity.OrderInfo;
import com.fresh.config.ClientConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;

@FeignClient(name = "order-server", configuration = ClientConfiguration.class)
public interface OrderInfoClient {

    @PostMapping("/order/add")
    public int add(OrderInfo of);
}
