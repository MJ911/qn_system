package com.nwafu.qn_system.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.Role;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.entity.User_authority;

@Controller
@RequestMapping("qn_system")
public class AdministratorController {
    
	
	@GetMapping("/delete_questionnaire/{qn_id}")
	public String delete_questionnaire(int qn_id) {
		/*
		 * 管理员删除问卷
		 * 从questionnaire.jsp跳转 或questionnaire_list.jsp跳转过来
		 * 跳转到啊questionnaire_list.jsp
		 * 
		 */
		
		return "questionnaire_list";
	}
	
	@GetMapping("user_list")
	public String user_list() {
		/*
		 * 从管理员界面
		 * 管理员点击用户集
		 * 跳转到user_list.jsp
		 */
		return "user_list";
	}
	@GetMapping("/user_authority/{user_id}")
	public String user_authority(int user_id,HttpSession session) {
		/*
		 * 从user_list.jsp跳转到user_authority.jsp
		 * 查看用户详细信息及权限,角色信息
		 * session放user对象（包括其权限和角色信息）和所有的权限和角色信息
		 * 
		 */
		return "user_authority";
		
	}
	@PostMapping("add_authority")
	public String add_authority(User user) {
		/*
		 * 从user_authority.jsp跳转到user_authority.jsp
		 * 完成对用户权限的添加
		 */
		return "user_authority";
	}
	@GetMapping("create_role")
	public String create_role() {
		/*
		 * 从user_authority.jsp跳转到create_role.jsp
		 */
		return "create_role";
	}
	@PostMapping("create_role")
	public String create_role(Role role) {
		/*
		 * 从create_role.jsp跳转到user_authority.jsp
		 */
		return "user_authority";
	}

}
