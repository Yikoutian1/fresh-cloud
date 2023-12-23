package com.fresh.member.controller;


import com.fresh.common.entity.AddrInfo;
import com.fresh.common.entity.MemberInfo;
import com.fresh.common.util.StringUtil;
import com.fresh.member.service.IAddrInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("member/addr")
//TODO 前端地址修改
public class AddrInfoController{

	@Autowired
	private IAddrInfoService service;

	@RequestMapping("/add")
	public int add(HttpSession session, AddrInfo af) {
		// 先校验用户是否登录
		Object obj = session.getAttribute("loginMember");
		if (obj == null) {
			return -2;
		}

		MemberInfo mf = (MemberInfo)obj;
		af.setMno(mf.getMno());
		return service.add(af);
	}

	@PostMapping("/update")
	public int update(String addrs) {
		if (StringUtil.checkNull(addrs)) {
			return -2;
		}
		return service.update(addrs.split(","));
	}

	@RequestMapping("/findByMno")
	public List<AddrInfo> findByMno(HttpSession session) {
		Object obj = session.getAttribute("loginMember");
		if (obj == null) {
			return null;
		}

		MemberInfo mf = (MemberInfo)obj;
		return service.findByMno(mf.getMno());
	}
}

