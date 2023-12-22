package com.yc.index.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: yc-fresh-cloud
 * @description: 页面跳转控制器
 * @author: 作者 huchaojie
 * @create: 2021-10-06 16:35
 */
@Controller
public class HtmlController {

    /**
     * 登录
     * @return
     */
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    /**
     * 注册
     * @return
     */
    @RequestMapping("/register")
    public String register(){
        return "register";
    }


    /**
     * 商品详情
     * @return
     */
    @RequestMapping("/details")
    public String details(){
        return "details";
    }

    /**
     * 查看更多
     * @return
     */
    @RequestMapping("/goods")
    public String goods(){
        return "goods";
    }


    /**
     * 购物车
     * @return
     */
    @RequestMapping("/cart")
    public String cart(){
        return "cart";
    }


    /**
     * 订单
     * @return
     */
    @RequestMapping("/order")
    public String order(){
        return "order";
    }


}
