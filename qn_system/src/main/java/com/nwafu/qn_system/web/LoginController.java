package com.nwafu.qn_system.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nwafu.qn_system.entity.User;

@Controller
@RequestMapping("qn_system")
public class LoginController {
	
	@SuppressWarnings("unused")
	@PostMapping("login")
	public String login(User user,HttpSession session) {
		/*
		 * 登录页面from点击登录
		 * 成功返回到index 登录成功 往session里加入user属性
		 * 失败返回登录界面 附带错误信息
		 */
		if(true) {
			//成功
			return "index";
		}
		return "login?message=错误信息";
	}
	
	@SuppressWarnings("unused")
	@PostMapping("register")
	public String register(User user) {
		/*
		 * 登录页面from点击注册
		 * 成功返回到index 自动登录
		 * 失败返回登录界面 附带错误信息
		 */
		
		if(true) {
			//成功
			return "index";
		}
		return "login?message=错误信息";
	}
	
	
}
