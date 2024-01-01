package com.fresh.client;

import com.fresh.common.entity.CartInfo;
import com.fresh.config.ClientConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@FeignClient(value = "cart-server", configuration = ClientConfiguration.class)
public interface CartInfoClient {
   @PostMapping(value = "/cart/updateCartNum")
    int updateCartNum( @RequestParam("cno") String cno ,@RequestParam("num") Integer num);

    @PostMapping(value = "/cart/addSessionCart")
   Map<String,Object> addSessionCart(@RequestParam("cnos") String cnos,HttpSession session );

    @PostMapping(value = "/cart/getSessionCart")
    List<CartInfo> getSessionCart(HttpSession session );

    @PostMapping(value = "/cart/deleteCartGoodsByCno")
     Map<String,Object> deleteCartGoodsByCno(@RequestParam("cno") String cno );

    @PostMapping("/cart/getInfo")
    List<Map<String, Object>> getInfo(HttpSession session);

    @PostMapping("/cart/update")
    int update(CartInfo cf);

    @PostMapping("/cart/updates")
    int updates(CartInfo cf);

    @PostMapping("/cart/add")
    Map<String, Object> add(HttpServletRequest request);

    @PostMapping("/cart/finds")
    List<CartInfo> finds(HttpSession session);

    @PostMapping("/cart/decrease")
    int decrease(@RequestParam String cno);

    @PostMapping("/cart/findByCnos")
    List<CartInfo> findByCnos(@RequestParam String cno);

    @ResponseBody
    @PostMapping("/cart/findMnoByCnos")
    List<CartInfo> findMnoByCnos(@RequestParam String mno);

    @GetMapping("/cart/cartHello")
    public String cartHello();

}
