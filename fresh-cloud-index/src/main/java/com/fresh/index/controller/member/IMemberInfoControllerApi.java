package com.fresh.index.controller.member;

import com.fresh.common.entity.MemberInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @program: fresh-cloud
 * @description: 用户控制器
 */
@Api(value = "用户相关Controller", tags = {"用户相关Controller"})
@RequestMapping("/member")
public interface IMemberInfoControllerApi {

    @PostMapping("/code")
    int code(String receive, String name, HttpSession session);

    /**
     * 会员注册
     * @param session
     * @param mf 我们将验证码暂存到 realName属性中
     * @return
     */
    @ApiOperation(value = "用户注册", notes = "用户注册", httpMethod = "POST")
    @PostMapping("/reg")
    int reg(HttpSession session, MemberInfo mf);

    /**
     * 会员登录
     * @param session
     * @param mf
     * @return
     */
    @ApiOperation(value = "用户登录", notes = "用户登录", httpMethod = "POST")
    @PostMapping("/login")
    int login(HttpSession session, MemberInfo mf);

    /**
     * 校验用户有没有登录
     * @param session
     * @return
     */
    @ApiOperation(value = "检查用户登录", notes = "检查用户登录", httpMethod = "POST")
    @GetMapping("/check")
    Map<String, Object> checkLogin(HttpSession session);
}
