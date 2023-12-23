package com.fresh.config;

import feign.Logger;
import org.springframework.context.annotation.Bean;

/**
 * @ClassName FoodClientConfiguration
 * @Description TODO
 * @Author QiuLiHang
 * @DATE 2023/11/27 027 19:41
 * @Version 1.0
 */

public class ClientConfiguration {
    @Bean
    public Logger.Level feignLogLevel(){
        return Logger.Level.FULL;
    }
}
