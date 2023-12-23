package com.fresh.client;

import com.fresh.config.ClientConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@FeignClient(name = "member-server", configuration = ClientConfiguration.class)
public interface CreateCodeClient {
    // loadCode controller
    @GetMapping("/loadCode/getCode")
    void createCode(HttpSession session, HttpServletResponse response) throws IOException;
}
