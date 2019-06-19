package com.nwafu.qn_system.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nwafu.qn_system.dao.AuthorityDAO;
import com.nwafu.qn_system.dao.QuestionnaireDAO;
import com.nwafu.qn_system.dao.RoleDAO;
import com.nwafu.qn_system.dao.UserDAO;
import com.nwafu.qn_system.dao.User_authorityDAO;
import com.nwafu.qn_system.entity.Authority;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.Role;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.entity.User_authority;
import com.nwafu.qn_system.service.AuthorityService;
import com.nwafu.qn_system.service.QnService;

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
	@Autowired
	private QnService qnservice;
	
	@GetMapping("/delete_questionnaire/{qn_id}")
	public String delete_questionnaire(@PathVariable int qn_id, Model model,HttpSession session) {
		/*
		 * 管理员删除问卷 从questionnaire.jsp跳转 或questionnaire_list.jsp跳转过来
		 * 跳转到啊questionnaire_list.jsp
		 * 
		 * @auhtor sgf，修改xdx
		 */
		qnservice.deleteQn(qn_id);
//		questionnairedao.delete(qn_id);
		int indexPage = (int)session.getAttribute("indexPage");
		PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
		model.addAttribute("questionnairelist", questionnairedao.getAll());

		return "questionnaire_listAdmin";
	}
	
	@GetMapping("admin")
	public String admin(Model model, HttpSession session) {
		List<Authority> list_at = (List<Authority>) session.getAttribute("list_at");
		boolean flag1 = false;
		boolean flag2 = false;
		for(int i = 0;i<list_at.size();i++) {
			System.out.println("xdx:"+list_at.get(i).getAuthority_id());
			if(list_at.get(i).getAuthority_id()==7) {
				flag1 = true;
			}
			if(list_at.get(i).getAuthority_id()==8) {
				flag2 = true;
			}
		}
		
		if((flag1&&flag2)==true) {
			PageHelper.startPage(1,10);// 设置分页，参数1=页数，参数2=每页显示条数
			List<User> user_list = userdao.getAll(); 
			PageInfo<User> pageInfo = new PageInfo<User>(user_list);
			
			session.setAttribute("lines",pageInfo.getTotal());//总记录数
			session.setAttribute("pages",pageInfo.getPages());//总页数
			session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
			model.addAttribute("userlist", user_list);
			return "user_list";
		}else if(flag1==true) {
			//分页查询设置
			PageHelper.startPage(1,10);// 设置分页，参数1=页数，参数2=每页显示条数

			List<Questionnaire>questionnairelist = questionnairedao.getAll();
			PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(questionnairelist);
			
			session.setAttribute("lines",pageInfo.getTotal());//总记录数
			session.setAttribute("pages",pageInfo.getPages());//总页数
			session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
			model.addAttribute("questionnairelist", questionnairelist);
			return "questionnaire_listAdmin";
		}else if(flag2==true) {
			PageHelper.startPage(1,10);// 设置分页，参数1=页数，参数2=每页显示条数
			List<User> user_list = userdao.getAll(); 
			PageInfo<User> pageInfo = new PageInfo<User>(user_list);
			
			session.setAttribute("lines",pageInfo.getTotal());//总记录数
			session.setAttribute("pages",pageInfo.getPages());//总页数
			session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
			model.addAttribute("userlist", user_list);
			return "user_list";
		}else {
			session.setAttribute("error", "您没有该权限！");
			return "index";
		}
	}
	
	@GetMapping("user_list")
	public String user_list(Model model,HttpSession session) {
		/*
		 * 从管理员界面 管理员点击用户集 跳转到user_list.jsp
		 * 
		 * @author sgf
		 */
		
		/**判断是否有权限**/
		List<Authority> list_at = (List<Authority>) session.getAttribute("list_at");
		boolean flag2 = false;
		for(int i = 0;i<list_at.size();i++) {
			if(list_at.get(i).getAuthority_id()==8) {
				flag2 = true;
			}
		}
		if(flag2==false) {
			
		}
		
		
		PageHelper.startPage(1,10);// 设置分页，参数1=页数，参数2=每页显示条数
		List<User> user_list = userdao.getAll(); 
		PageInfo<User> pageInfo = new PageInfo<User>(user_list);
		
		session.setAttribute("lines",pageInfo.getTotal());//总记录数
		session.setAttribute("pages",pageInfo.getPages());//总页数
		session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
		model.addAttribute("userlist", user_list);
		return "user_list";
	}
	
	//user_list下一页分页
	@GetMapping("userNextPage")
	public String userNextPage(Model model,HttpSession session) {
		int indexPage = (int)session.getAttribute("indexPage");
		int pages = (int)session.getAttribute("pages");
		indexPage++;
		indexPage = indexPage>pages?pages:indexPage;
		PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
		List<User> user_list = userdao.getAll(); 
		PageInfo<User> pageInfo = new PageInfo<User>(user_list);
		model.addAttribute("userlist", user_list);
		session.setAttribute("lines",pageInfo.getTotal());//总记录数
		session.setAttribute("pages",pageInfo.getPages());//总页数
		session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
		return "user_list";
	}
	//user_list上一页分页
		@GetMapping("userPrePage")
		public String userPrePage(Model model,HttpSession session) {
			int indexPage = (int)session.getAttribute("indexPage");
			indexPage--;
			indexPage = indexPage<1?1:indexPage;
			PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
			List<User> user_list = userdao.getAll(); 
			PageInfo<User> pageInfo = new PageInfo<User>(user_list);
			model.addAttribute("userlist", user_list);
			session.setAttribute("lines",pageInfo.getTotal());//总记录数
			session.setAttribute("pages",pageInfo.getPages());//总页数
			session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
			return "user_list";
		}
		//user_list首页分页
		@GetMapping("TouserPageFirst")
		public String TouserPageFirst(Model model,HttpSession session) {
			int indexPage = (int)session.getAttribute("indexPage");
			indexPage=1;
			PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
			List<User> user_list = userdao.getAll(); 
			PageInfo<User> pageInfo = new PageInfo<User>(user_list);
			model.addAttribute("userlist", user_list);
			session.setAttribute("lines",pageInfo.getTotal());//总记录数
			session.setAttribute("pages",pageInfo.getPages());//总页数
			session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
			return "user_list";
		}
		//user_list尾页分页
				@GetMapping("TouserPageEnd")
				public String TouserPageEnd(Model model,HttpSession session) {
					int indexPage = (int)session.getAttribute("indexPage");
					int pages = (int)session.getAttribute("pages");
					indexPage=pages;
					PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
					List<User> user_list = userdao.getAll(); 
					PageInfo<User> pageInfo = new PageInfo<User>(user_list);
					model.addAttribute("userlist", user_list);
					session.setAttribute("lines",pageInfo.getTotal());//总记录数
					session.setAttribute("pages",pageInfo.getPages());//总页数
					session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
					return "user_list";
				}
				
				//user_list指定页分页
				@GetMapping("/TouserPageIndex/{index}")
				public String TouserPageEnd(@PathVariable String index,Model model,HttpSession session) {
					int indexPage = (int)session.getAttribute("indexPage");
					indexPage=new Integer(index);
					int pages = (int)session.getAttribute("pages");
					indexPage = indexPage<1?1:indexPage;
					indexPage = indexPage>pages?pages:indexPage;
					PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
					List<User> user_list = userdao.getAll(); 
					PageInfo<User> pageInfo = new PageInfo<User>(user_list);
					model.addAttribute("userlist", user_list);
					session.setAttribute("lines",pageInfo.getTotal());//总记录数
					session.setAttribute("pages",pageInfo.getPages());//总页数
					session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
					return "user_list";
				}
				
	@PostMapping("user_list")
	public String user_list(Model model, HttpServletRequest request) {
		/*
		 * 从管理员界面 管理员点击用户集 跳转到user_list.jsp
		 * 
		 * @author sgf
		 */
		String[] authoritylist = request.getParameterValues("checkbox");
		String role = request.getParameter("radio");
		String userId = request.getParameter("userId");

		User user = userdao.getByUser_id(Integer.parseInt(userId));
		List<Authority> list = new ArrayList();
		Authority authority = new Authority();
		user_authoritydao.deleteById(user.getUser_id());
		if (authoritylist != null) {
			for (int i = 0; i < authoritylist.length; i++) {
				authority = authoritydao.getByAuthority_id(Integer.parseInt(authoritylist[i]));
				list.add(authority);
			}
			user.setAuthorityList(list);
			authorityService.setRoleForUser(user, roledao.getAllByRole_id(Integer.parseInt(role)));
			authorityService.setAtForUser(user);
			model.addAttribute("userlist", userdao.getAll());
		}

		return "redirect:user_list";
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
	public String create_role(Model model, HttpServletRequest request) {
		/*
		 * 从user_authority.jsp跳转到create_role.jsp
		 * 
		 * @author sgf
		 */

		String userId = request.getParameter("userId");
		authoritydao.getAll();
		model.addAttribute("authoritylist", authoritydao.getAll());
		// System.out.println(authoritydao.getAll().get(0).getAuthority_name());
		return "create_role";
	}

	@PostMapping("create_role")
	public String create_role(Model model,HttpSession session,HttpServletRequest request) {
		/*
		 * 从create_role.jsp跳转到user_authority.jsp
		 * 
		 */
		String userId = request.getParameter("userId");
		System.out.println(userId);
		Role role = new Role();
		String[] authoritylist = request.getParameterValues("checkbox1");
		// System.out.println("nihoa"+authoritylist[0].toString());
		Role role1=roledao.getRoleByName(request.getParameter("role_name"));
		if (request.getParameter("role_name") != ""&&role1==null) {
			role.setRole_name(request.getParameter("role_name"));
			Authority authority = new Authority();
			if (authoritylist != null) {

				List<Authority> list = new ArrayList();
				for (int i = 0; i < authoritylist.length; i++) {
					authority = authoritydao.getByAuthority_id(Integer.parseInt(authoritylist[i]));
					list.add(authority);
				}
				role.setAuthorityList(list);
			}

			role.setRole_name(request.getParameter("role_name"));
			authorityService.createRole(role);
			session.setAttribute("error", "");
			return "redirect:user_authority/" + Integer.parseInt(userId);
		}
		else{
			session.setAttribute("error", "角色名为空或角色已存在！");
			session.setAttribute("rolename", request.getParameter("role_name"));
			authoritydao.getAll();
			model.addAttribute("authoritylist", authoritydao.getAll());
			return "redirect:create_role";
		}
	
	}

}
