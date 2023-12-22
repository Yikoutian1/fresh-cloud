package com.yc.order;

import com.codingapi.txlcn.tc.config.EnableDistributedTransaction;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * @program: yc-fresh-cloud
 */
//熔断和降级
@EnableHystrix
//feigin客户端和包扫描
@EnableFeignClients(basePackages = {"com.yc"})
// redis 实现 session 共享 和 设置会话时间
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 60 * 60 * 8)
@SpringBootApplication
@ComponentScan(basePackages ={"com.yc"})
@MapperScan(basePackages = {"com.yc.member"})
public class OrderApplication {
    public static void main(String[] args) {
        SpringApplication.run(OrderApplication.class,args);
    }
}
