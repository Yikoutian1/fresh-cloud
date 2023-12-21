package com.fresh.cart.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fresh.cart.service.ICartInfoService;
import com.fresh.common.entity.CartInfo;
import com.fresh.common.entity.MemberInfo;
import com.fresh.index.controller.cart.ICartInfoControllerApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class CartInfoController implements ICartInfoControllerApi {

	@Autowired
	private ICartInfoService service;

	private MemberInfo getMemberInfo(HttpSession session) {
		Object obj = session.getAttribute("loginMember");
		if (obj == null) { // 说明没有登录
			return null;
		}
		return (MemberInfo) obj;
	}

	@Override
	public List<Map<String, Object>> getInfo(HttpSession session) {
		MemberInfo mf = this.getMemberInfo(session);
		if (mf == null) { // 说明没有登录
			return Collections.emptyList();
		}
		return service.findByMno(mf.getMno()); // 根据会员编号，查询购物车信息
	}
	
	@Override
	public int update(CartInfo cf) {
		cf.setNum(1);
		return service.update(cf);
	}
	
	@Override
	public int updates(CartInfo cf) {
		return service.update(cf);
	}
	
	@Override
	public Map<String, Object> add(HttpServletRequest request) {
		HttpSession session = request.getSession();

		CartInfo cf =new CartInfo();
		cf.setNum(Integer.valueOf(request.getParameter("num")));
		cf.setGno(Integer.valueOf(request.getParameter("gno")));
		cf.setMno(Integer.valueOf(request.getParameter("mno")));

		String cno = service.add(cf);
		if (!"0".equals(cno)) { // 说明加入购物车成功
			List<Map<String, Object>> mapList = (List<Map<String, Object>>) session.getAttribute("cartInfos");
			if (mapList != null && !mapList.isEmpty()  ) {
				//List<Map<String, Object>> list = (List<Map<String, Object>>) obj;
				Map<String, Object> map = new HashMap<>();
				map.put("cno", cno);
				map.put("gno", cf.getGno());
				mapList.add(map);
				session.setAttribute("cartInfos", mapList);
			}
		}
		Map<String, Object> map = new HashMap<>();
		map.put("code",1);
		map.put("obj",cno);
		return map;
	}
	
	@Override
	public List<CartInfo> finds(HttpSession session) {
		MemberInfo mf = this.getMemberInfo(session);
		if (mf == null) { // 说明没有登录
			return null;
		}
		List<CartInfo> list = service.finds(mf.getMno());
		session.setAttribute("cartInfos",list);
		return list;
	}
	
	@Override
	public int decrease(String[] cno) {
		return service.delete(cno);
	}
	
	@Override
	public List<CartInfo> findByCnos(String cno) {
		return service.findByCnos(cno.split(","));
	}

	@Override
	public List<CartInfo> findMnoByCnos(String mno) {
		return service.finds(Integer.valueOf(mno));
	}

	@Override
	public String cartHello() {
		return "cart port 8060";
	}
}
