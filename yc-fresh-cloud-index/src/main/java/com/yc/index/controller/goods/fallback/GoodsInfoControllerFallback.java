package com.yc.index.controller.goods.fallback;

import com.yc.common.entity.GoodsInfo;
import com.yc.common.entity.JsonModel;
import com.yc.index.controller.goods.IGoodsInfoControllerApi;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @program: yc-fresh-cloud
 * @description: 商品
 * @author: 作者 huchaojie
 * @create: 2021-10-09 08:55
 */
@Component
public class GoodsInfoControllerFallback implements FallbackFactory<IGoodsInfoControllerApi> {
    @Override
    public IGoodsInfoControllerApi create(Throwable throwable) {
        return new IGoodsInfoControllerApi() {
            @Override
            public Map<String, Object> add(MultipartFile pic, HttpServletRequest request) {
                System.out.println("系统故障 熔断启动 add ");
                return Collections.emptyMap();
            }

            @Override
            public int addGood(MultipartFile[] pics, HttpServletRequest request) {
                System.out.println("系统故障 熔断启动 addGood ");
                return -1;
            }

            @Override
            public Map<String, Object> finds() {
                System.out.println("系统故障 熔断启动 finds ");
                return Collections.emptyMap();
            }

            @Override
            public Map<String, Object> findByFirst(Integer tno, Integer rows, Integer page) {
                System.out.println("系统故障 熔断启动 findByFirst ");
                return Collections.emptyMap();
            }

            @Override
            public List<GoodsInfo> findByPage(Integer tno, Integer rows, Integer page) {
                System.out.println("系统故障 熔断启动 findByPage ");
                return Collections.emptyList();
            }

            @Override
            public GoodsInfo detail(Integer gno) {
                System.out.println("系统故障 熔断启动 detail ");
                return new GoodsInfo();
            }

            @Override
            public int compileStore(String cno) {
                System.out.println("系统故障 熔断启动 updateStore ");
                return -1;
            }

            @Override
            public String goodsHello() {
                return "系统故障 熔断启动 ";
            }
        };
    }
}
