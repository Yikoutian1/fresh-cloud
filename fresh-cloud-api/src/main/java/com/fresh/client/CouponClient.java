package com.fresh.client;

import com.fresh.config.ClientConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-29 14:06
 **/
@FeignClient(value = "coupon-server", configuration = ClientConfiguration.class)
public interface CouponClient {
    @RequestMapping("/coupon/qiangCoupon")
    Map<String,Object> CouponService( String uid, String cid);
}
