package com.fresh.chat.controller;

import com.fresh.chat.bean.Memberinfo;
import com.fresh.chat.bean.Sys_User;
import com.fresh.chat.service.MemberInfoService;
import com.fresh.chat.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/chat")
public class UserInfoController {
    @Autowired
    private MemberInfoService memberInfoService;

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping("/findAllManagers")
    public Map<String,Object> findAllManagers(){
        Map<String,Object> map = new HashMap<>();
        List<String> list = new ArrayList<>();
        list = sysUserService.findAllManagers();
        map.put("data",list);
        return map;
    }

    @RequestMapping("/findAllUsers")
    public Map<String,Object> findAllUsers(){
        Map<String,Object> map = new HashMap<>();
        List<String> list = new ArrayList<>();
        list = memberInfoService.findAllUsers();
        map.put("data",list);
        return map;
    }
}
