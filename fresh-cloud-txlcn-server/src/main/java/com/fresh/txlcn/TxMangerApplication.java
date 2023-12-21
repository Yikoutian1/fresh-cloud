package com.fresh.txlcn;

import com.codingapi.txlcn.tm.config.EnableTransactionManagerServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @program: yc-fresh-cloud
 * @description: 分布式事务管理器
 * @author: 作者 huchaojie
 * @create: 2021-10-10 19:51
 */
@EnableTransactionManagerServer
@SpringBootApplication
public class TxMangerApplication {
    public static void main(String[] args) {
        SpringApplication.run(TxMangerApplication.class, args);
    }
}
