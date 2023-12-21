package com.fresh.index;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * @program: fresh-cloud
 * @description:
 * @author: 作者 huchaojie
 * @create: 2021-10-05 16:55
 */
// redis 实现 session 共享 和 设置会话时间
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 60 * 60 * 8)
@SpringBootApplication
@ComponentScan(basePackages = {"com.fresh"})
public class IndexApplication {
    public static void main(String[] args) {
        SpringApplication.run(IndexApplication.class,args);
    }
}
