package com.yc.txlcn;

import com.codingapi.txlcn.tm.config.EnableTransactionManagerServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.ComponentScan;

/**
 * @program: yc-fresh-cloud
 * @description: 分布式事务管理器
 */
@EnableTransactionManagerServer
@SpringBootApplication
public class TxMangerApplication {
    public static void main(String[] args) {
        SpringApplication.run(TxMangerApplication.class, args);
    }
}
