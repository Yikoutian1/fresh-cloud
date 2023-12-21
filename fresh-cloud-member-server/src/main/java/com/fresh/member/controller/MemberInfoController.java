package com.fresh.member.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.fresh.common.entity.CartInfo;
import com.fresh.common.entity.MemberInfo;
import com.fresh.common.util.SendMailUtil;
import com.fresh.index.controller.cart.ICartInfoControllerApi;
import com.fresh.index.controller.member.IMemberInfoControllerApi;
import com.fresh.member.service.IMemberInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class MemberInfoController implements IMemberInfoControllerApi {

	@Autowired
	private SendMailUtil sendMailUtil; // 邮件发送的工具类

	@Autowired
	private IMemberInfoService service;
	@Autowired
	private ICartInfoControllerApi iCartInfoControllerApi;

	@Override
	public int code(String receive, String name, HttpSession session) {
		String code = "";
		Random rd = new Random();
		while( code.length() < 6) {
			code += rd.nextInt(10);
		}

		if (sendMailUtil.sendHtmlMail(receive, name, code)) { // 如果发送成功
			session.setAttribute("code", code);
			TimerTask task = new TimerTask() {
				@Override
				public void run() {
					session.removeAttribute("code"); // 清空验证码
				}
			};
			Timer timer = new Timer(); // 实例化一个定时器
			timer.schedule(task, 180000); // 3分钟后执行任务task一次
			return 1;
		}
		return 0;
	}

	/**
	 * 会员注册 
	 * @param session
	 * @param mf 我们将验证码暂存到 realName属性中
	 * @return
	 */
	@Override
	public int reg(HttpSession session, MemberInfo mf) {
		Object obj = session.getAttribute("code");
		if (obj == null) { // 说明验证码过期了
			return -2;
		}

		String code = (String) obj;
		if (!code.equals(mf.getRealName())) { // 验证码错误
			return -1;
		}

		return service.add(mf);
	}

	/**-
	 * 会员登录
	 * @param session
	 * @param mf
	 * @return
	 */
	@Override
	public int login(HttpSession session, MemberInfo mf) {
		String code = mf.getRealName();
		String vcode = (String) session.getAttribute("validateCode");
		
		if (!code.equalsIgnoreCase(vcode)) {
			return -1;
		}
		MemberInfo memberInfo = service.login(mf);
		
		if (memberInfo == null) {
			return 0;
		}
		System.out.println(memberInfo.getMno());
		List<CartInfo> cartInfoList = iCartInfoControllerApi.findMnoByCnos(String.valueOf(memberInfo.getMno()));
		System.out.println(cartInfoList.size());
		session.setAttribute("cartInfos", cartInfoList);
		session.setAttribute("loginMember", memberInfo);
		return 1;
	}
	
	/**
	 * 校验用户有没有登录
	 * @param session
	 * @return
	 */
	@Override
	public Map<String, Object> checkLogin(HttpSession session) {
		Object obj = session.getAttribute("loginMember");
		if (obj == null) {
			return Collections.emptyMap();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartInfo> cartInfoList = (List<CartInfo>) session.getAttribute("cartInfos");
		map.put("member", obj);
		map.put("carts", cartInfoList);
		return map;
	}
}
