package com.nwafu.qn_system.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nwafu.qn_system.dao.AuthorityDAO;
import com.nwafu.qn_system.dao.QuestionnaireDAO;
import com.nwafu.qn_system.dao.RoleDAO;
import com.nwafu.qn_system.dao.UserDAO;
import com.nwafu.qn_system.dao.User_authorityDAO;
import com.nwafu.qn_system.entity.Authority;
import com.nwafu.qn_system.entity.Role;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.entity.User_authority;
import com.nwafu.qn_system.service.AuthorityService;

@Controller
@RequestMapping("qn_system")
public class AdministratorController {
	@Autowired
	private QuestionnaireDAO questionnairedao;
	@Autowired
	private UserDAO userdao;
	@Autowired
	private AuthorityDAO authoritydao;
	@Autowired
	private User_authorityDAO user_authoritydao;
	@Autowired
	private AuthorityService authorityService;
	@Autowired
	private RoleDAO roledao;

	@GetMapping("/delete_questionnaire/{qn_id}")
	public String delete_questionnaire(@PathVariable int qn_id, Model model) {
		/*
		 * 管理员删除问卷 从questionnaire.jsp跳转 或questionnaire_list.jsp跳转过来
		 * 跳转到啊questionnaire_list.jsp
		 * 
		 * @auhtor sgf
		 */
		questionnairedao.delete(qn_id);
		model.addAttribute("questionnairelist", questionnairedao.getAll());

		return "questionnaire_list";
	}

	@GetMapping("user_list")
	public String user_list(Model model) {
		/*
		 * 从管理员界面 管理员点击用户集 跳转到user_list.jsp
		 * 
		 * @author sgf
		 */
		model.addAttribute("userlist", userdao.getAll());
		return "user_list";
	}

	@GetMapping("/user_authority/{user_id}")
	public String user_authority(@PathVariable int user_id, HttpSession session, Model model) {
		/*
		 * 从user_list.jsp跳转到user_authority.jsp 查看用户详细信息及权限,角色信息
		 * session放user对象（包括其权限和角色信息）和所有的权限和角色信息
		 * 
		 * @author sgf
		 */
		User user = userdao.getByUser_id(user_id);
		user = userdao.getAllByNamePassword(user);
		List<Authority> authoritylist = new ArrayList();
		user_authoritydao.getByUserId(user.getUser_id())
				.forEach(user_authority -> authoritylist.add(user_authority.getAuthority()));
		user.setAuthorityList(authoritylist);

		model.addAttribute("authoritylist", authoritydao.getAll());
		model.addAttribute("rolelist", roledao.getAll());
		session.setAttribute("user_list_user", user);

		// System.out.println(user.getUser_name()+"
		// "+user.getRole().getRole_name()+"
		// "+user.getAuthorityList().get(0).getAuthority_name());

		return "user_authority";

	}

	@PostMapping("add_authority")
	public String add_authority(User user) {
		/*
		 * @author sgf 从user_authority.jsp跳转到user_authority.jsp 完成对用户权限的添加
		 * user具有Authority和Role
		 */
		User_authority user_authority = new User_authority();
		user_authority.setUser(user);
		user_authoritydao.insertUserAuthority(user_authority);
		return "user_authority";
	}

	@GetMapping("create_role")
	public String create_role(Model model) {
		/*
		 * 从user_authority.jsp跳转到create_role.jsp
		 * 
		 * @author sgf
		 */
		authoritydao.getAll();
		model.addAttribute("authoritylist", authoritydao.getAll());
		// System.out.println(authoritydao.getAll().get(0).getAuthority_name());
		return "create_role";
	}

	@PostMapping("create_role")
	public String create_role(Role role) {
		/*
		 * 从create_role.jsp跳转到user_authority.jsp
		 * 
		 */
		authorityService.createRole(role);

		return "user_authority";
	}

}
