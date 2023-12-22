package com.yc.cart;

import com.codingapi.txlcn.tc.config.EnableDistributedTransaction;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * @program: yc-fresh-cloud
 */
//分布式事务管理
@EnableDistributedTransaction
//开启熔断降级
@EnableCircuitBreaker
// redis 实现 session 共享 和 设置会话时间
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 60 * 60 * 8)
@SpringBootApplication
@ComponentScan(basePackages ={"com.yc"})
@MapperScan(basePackages = {"com.yc.cart"})
public class CartApplication {
    public static void main(String[] args) {
        SpringApplication.run(CartApplication.class,args);
    }
}
