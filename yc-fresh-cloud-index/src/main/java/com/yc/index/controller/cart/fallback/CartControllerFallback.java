package com.yc.index.controller.cart.fallback;

import com.yc.common.entity.CartInfo;
import com.yc.common.entity.JsonModel;
import com.yc.index.controller.cart.ICartInfoControllerApi;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @program: yc-fresh-cloud
 * @description:
 * @author: 作者 huchaojie
 * @create: 2021-10-06 20:31
 */
@Component
public class CartControllerFallback implements FallbackFactory<ICartInfoControllerApi> {
    @Override
    public ICartInfoControllerApi create(Throwable throwable) {
        return new ICartInfoControllerApi() {
            @Override
            public List<Map<String, Object>> getInfo(HttpSession session) {
                System.out.println("系统故障 熔断启动 getInfo ");
                return Collections.emptyList();
            }

            @Override
            public int update(CartInfo cf) {
                System.out.println("系统故障 熔断启动 update ");
                return -1;
            }

            @Override
            public int updates(CartInfo cf) {
                System.out.println("系统故障 熔断启动 updates ");
                return -1;
            }

            @Override
            public Map<String, Object> add(HttpServletRequest request) {
                System.out.println("系统故障 熔断启动 add ");
                return Collections.emptyMap();
            }

            @Override
            public List<CartInfo> finds(HttpSession session) {
                System.out.println("系统故障 熔断启动 finds ");
                return Collections.emptyList();
            }

            @Override
            public int decrease(String[] cno) {
                System.out.println("系统故障 熔断启动 del ");
                return -1;
            }

            @Override
            public List<CartInfo> findByCnos(String cnos) {
                System.out.println("系统故障 熔断启动 findByCnos ");
                return Collections.emptyList();
            }

            @Override
            public List<CartInfo> findMnoByCnos(String mno) {
                System.out.println("系统故障 熔断启动 findMnoByCnos ");
                return Collections.emptyList();
            }

            @Override
            public String cartHello() {
                return "系统故障 熔断启动";
            }
        };
    }
}
