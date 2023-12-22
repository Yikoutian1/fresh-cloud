package com.yc.index.controller.member;

import com.yc.common.entity.AddrInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @program: yc-fresh-cloud
 * @description: 收货地址
 * @author: 作者 huchaojie
 * @create: 2021-10-09 10:22
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
