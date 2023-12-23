package com.fresh.index.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: yc-fresh-cloud
 * @description: 页面跳转控制器
 */
@Controller
//@RequestMapping("/web")
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

    // ==========重名的三个======== //
    /**
     * 查看更多
     * @return
     */
    @RequestMapping("/igoods")
    public String goods(){
        return "goods";
    }


    /**
     * 购物车
     * @return
     */
    @RequestMapping("/icart")
    public String cart(){
        return "cart";
    }


    /**
     * 订单
     * @return
     */
    @RequestMapping("/iorder")
    public String order(){
        return "order";
    }


}
