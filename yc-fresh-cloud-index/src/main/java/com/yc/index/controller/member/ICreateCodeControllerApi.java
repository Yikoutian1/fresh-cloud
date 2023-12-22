package com.yc.index.controller.member;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @program: yc-fresh-cloud
 * @description: 验证码控制器
 * @author: 作者 huchaojie
 * @create: 2021-10-05 16:06
 */
@RequestMapping("/loadCode")
public interface ICreateCodeControllerApi {

    /**
     * 加载验证码
     * @param session
     * @param response
     * @throws IOException
     */
    @GetMapping("/getCode")
    void createCode(HttpSession session, HttpServletResponse response) throws IOException;
}
