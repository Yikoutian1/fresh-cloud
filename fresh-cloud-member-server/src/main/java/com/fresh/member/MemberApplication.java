package com.fresh.member;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * @program: yc-fresh-cloud
 * @description:
 * @author: 作者 huchaojie
 * @create: 2021-10-05 16:53
 */
//熔断和降级
@EnableHystrix
//feigin客户端和包扫描
@EnableFeignClients(basePackages = {"com.fresh"})
// redis 实现 session 共享 和 设置会话时间
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 60 * 60 * 8)
@SpringBootApplication
@ComponentScan(basePackages ={"com.fresh"})
@MapperScan(basePackages = {"com.yc.member"})
public class MemberApplication {

    public static void main(String[] args) {
        SpringApplication.run(MemberApplication.class,args);
    }
}
