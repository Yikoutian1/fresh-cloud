package com.yc.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.yc.common.entity.AddrInfo;
import com.yc.common.entity.MemberInfo;
import com.yc.common.util.StringUtil;
import com.yc.index.controller.member.IAddrInfoControllerApi;
import com.yc.member.service.IAddrInfoService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RestController;

@RestController
public class AddrInfoController implements IAddrInfoControllerApi {

	@Autowired
	private IAddrInfoService service;

	@Override
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
	
	@Override
	public int update(String addrs) {
		if (StringUtil.checkNull(addrs)) {
			return -2;
		}
		return service.update(addrs.split(","));
	}
	
	@Override
	public List<AddrInfo> findByMno(HttpSession session) {
		Object obj = session.getAttribute("loginMember");
		if (obj == null) {
			return null;
		}

		MemberInfo mf = (MemberInfo)obj;
		return service.findByMno(mf.getMno());
	}
}
