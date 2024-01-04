package com.fresh.chat.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

//@Slf4j
//@Controller
//@RequestMapping("/websocket")
//public class WebSocketController {
//    // 0管理员 1用户
//    //Model model 服务器端通过模板引擎动态传递给页面的变量 ${username}
//    @RequestMapping("/connectUser/{name}/1")
//    public String webSocket_user(@PathVariable String name, Model model) {
////        log.info("[user status],{}",1);
//        try {
//            log.info("跳转到websocket的页面上");
//            model.addAttribute("username", name);
//            //跳转到"websocket"的模板页面。
//            return "chat";
//        } catch (Exception e) {
//            log.info("跳转到websocket的页面上发生异常，异常信息是：" + e.getMessage());
//            return "error";
//        }
//    }
//
//    @RequestMapping("/connectManager/{name}/0")
//    public String webSocket_manager(@PathVariable String name, Model model) {
//        try {
//            log.info("跳转到websocket的页面上");
//            model.addAttribute("manager", name);
//            //跳转到"websocket"的模板页面。
//            return "chat";
//        } catch (Exception e) {
//            log.info("跳转到websocket的页面上发生异常，异常信息是：" + e.getMessage());
//            return "error";
//        }
//    }
//}

@Slf4j
@Controller
public class WebSocketController {

        @RequestMapping("/websocket/connectUser/{name}")
    public String connectUser(@PathVariable("name") String name,
                              Model model) {
        try {
            log.info("跳转到websocket的页面上");
            model.addAttribute("username", name);
            return "chat";
        } catch (Exception e) {
            log.info("跳转到websocket的页面上发生异常，异常信息是：" + e.getMessage());
            return "error";
        }
    }

    @RequestMapping("/websocket/connectManager/{name}")
    public String connectManager(@PathVariable String name,
                                 HttpSession session,
                                 Model model) {
        try {
            log.info("跳转到websocket的页面上");
            model.addAttribute("manager", name);
            return "chat";
        } catch (Exception e) {
            log.info("跳转到websocket的页面上发生异常，异常信息是：" + e.getMessage());
            return "error";
        }
    }
}