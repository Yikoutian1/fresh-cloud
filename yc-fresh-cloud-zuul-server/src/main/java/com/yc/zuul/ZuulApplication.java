package com.yc.zuul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * @program: yc-res-cloud
 */

@EnableZuulProxy // zuul 网关
// redis 实现 session 共享 和 设置会话时间
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 60 * 60 * 8)
@SpringBootApplication
public class ZuulApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZuulApplication.class,args);
    }
}
