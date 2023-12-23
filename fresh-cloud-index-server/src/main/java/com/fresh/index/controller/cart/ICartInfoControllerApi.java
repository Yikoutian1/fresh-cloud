package com.fresh.index.controller.cart;


import com.fresh.common.entity.CartInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @program: yc-fresh-cloud
 * @description: 购物车控制器
 */
//全局降级
@FeignClient(value = "cart-server")
@RequestMapping("/cart")
public interface ICartInfoControllerApi {

    @PostMapping("/getInfo")
    List<Map<String, Object>> getInfo(HttpSession session);

    @PostMapping("/update")
    int update(CartInfo cf);

    @PostMapping("/updates")
    int updates(CartInfo cf);

    @PostMapping("/add")
    Map<String, Object> add(HttpServletRequest request);

    @PostMapping("/finds")
    List<CartInfo> finds(HttpSession session);

    @PostMapping("/decrease")
    int decrease(@RequestParam String[] cno);

    @PostMapping("/findByCnos")
    List<CartInfo> findByCnos(@RequestParam String cno);

    @ResponseBody
    @PostMapping("/findMnoByCnos")
    List<CartInfo> findMnoByCnos(@RequestParam String mno);

    @GetMapping("/cartHello")
    public String cartHello();

}
