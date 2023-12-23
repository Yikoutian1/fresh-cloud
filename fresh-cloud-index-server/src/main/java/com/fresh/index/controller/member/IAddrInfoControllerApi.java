package com.fresh.index.controller.member;


import com.fresh.common.entity.AddrInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @program: yc-fresh-cloud
 * @description: 收货地址
 */
@RequestMapping("/addr")
public interface IAddrInfoControllerApi {

    @RequestMapping("/add")
    public int add(HttpSession session, AddrInfo af);

    @PostMapping("/update")
    public int update(String addrs);

    @RequestMapping("/findByMno")
    public List<AddrInfo> findByMno(HttpSession session);
}
