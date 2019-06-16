package com.nwafu.qn_system.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.util.ISO8601Utils;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.service.MailService;
import com.nwafu.qn_system.service.UserService;
import com.nwafu.qn_system.utils.UUIDGenerator;

@Controller
@RequestMapping("qn_system")
public class LoginController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private MailService mailService;
	
	@PostMapping("login")
	public String login(String user_name,String user_password,HttpSession session) {
		/*
		 * 登录页面from点击登录
		 * 成功返回到index 登录成功 往session里加入user属性
		 * 失败返回登录界面 附带错误信息
		 */
		System.out.println(user_name+user_password);
		
		User one = new User();
		one.setUser_name(user_name);
		one.setUser_password(user_password);
		System.out.println(one);
		User user = userService.login(one);
		session.setAttribute("user", user);
		if(user != null) {
			//成功
			System.out.println("登录成功！");
			return "index";
		}
		else
			return "login?message=登录错误";
	}
	
	@PostMapping("register")
	public String register(String user_name,String user_password,String user_mail,HttpSession session) {
		/*
		 * 登录页面from点击注册
		 * 注册方法，传参时user设置user_name、user_password、user_mail
		 * 返回int(0是注册成功，1是用户名必须是以字母开头且长度在1到16之间，
		 * 2是用户名已被注册，3是密码必须是字母和数字组合长度1~16，4是邮箱必须是@和.之间要有字母隔开,5是邮箱未激活)
		 * 成功返回到index 自动登录
		 * 失败返回登录界面 附带错误信息
		 */
		System.out.println("RegisterController");
		User user = new User();
		user.setUser_name(user_name);
		user.setUser_password(user_password);
		user.setUser_mail(user_mail);
		user.setUser_state(false);
	    String active_code = UUIDGenerator.getUUID();
	    user.setUser_activecode(active_code);
		int index = userService.register(user);
		switch(index){
			case 0:
				String subject = "来自问卷强网站的邮件";
				String context = "<a target=\"_blank\"href=\"http://localhost:8092/qn_system/checkcode/"+active_code+"\">激活请点击:"+active_code+"</a>";
				mailService.sendMimeMail (user.getUser_mail(),subject,context);
				//session.setAttribute("user", user);
				return "index";
			case 1:
				return "login?message=用户名必须是以字母开头且长度在1到16之间";
			case 2:
				return "login?message=用户名已被注册";
			case 3:
				return "login?message=密码必须是字母和数字组合长度1~16";
			case 4:
				return "login?message=邮箱格式错误";
			case 5:
				return "login?message=邮箱未激活";
			default:
				return "login?message=未知错误,请联系客服";
		}
	}
	@GetMapping("checkcode/{active_code}")
	public String checkcode(@PathVariable String active_code) {
		User user = userService.getUserByActivecode(active_code);
		 //如果用户不等于null，把用户状态修改status=1
        if (user !=null){
        	System.out.println(user.toString());
            user.setUser_state(true);
            //把code验证码清空，已经不需要了
            user.setUser_activecode("");
            userService.upadteUser(user);
        }
		return "login";
	}
	@GetMapping("quit")
	public String quit(HttpSession session) {
		session.removeAttribute("user");

		return "index";
	}
}
