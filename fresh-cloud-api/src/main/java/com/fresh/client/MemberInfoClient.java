package com.fresh.client;


import com.fresh.common.entity.MemberInfo;
import com.fresh.config.ClientConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@FeignClient(name = "member-server", configuration = ClientConfiguration.class)
public interface MemberInfoClient {

    // member
    @PostMapping("/member/code")
    int code(String receive, String name, HttpSession session);

    @PostMapping("/member/reg")
    int reg(HttpSession session, MemberInfo mf);

    @PostMapping("/member/login")
    int login(HttpSession session, MemberInfo mf);

    @GetMapping("/member/check")
    Map<String, Object> checkLogin(HttpSession session);
}
