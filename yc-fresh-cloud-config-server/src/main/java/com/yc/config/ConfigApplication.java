package com.yc.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

/**
 * @program: yc-res-cloud
 * @description:  config 配置中心
 */
@EnableConfigServer
@SpringBootApplication
public class ConfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(com.yc.config.ConfigApplication.class,args);
    }
}
