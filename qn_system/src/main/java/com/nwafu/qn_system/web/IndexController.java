package com.nwafu.qn_system.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nwafu.qn_system.dao.QuestionnaireDAO;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.service.QnService;

@Controller
@RequestMapping("qn_system")
public class IndexController {
	@Autowired
	private QuestionnaireDAO questionnaireDAO;
	
	@Autowired
	private QnService qnService;
	
	@GetMapping("/index")
	public String index(){
		//返回主页 index.jsp
		return "index";
	}
	
	@GetMapping("/questionnaire_list/{questionnaire_type}")
	public String questionnaire_list(@PathVariable int questionnaire_type,Model model,HttpSession session) {
		/*
		 * 返回问卷列表 questionnaire_list.jsp
		 * 往model里面加调查或者投票的List
		 * questionnaire_type为0视为调查
		 * questionnaire_type为1视为投票
		 * questionnaire_type为2为管理问卷列表
		 */
		session.setAttribute("questionnaire_type", questionnaire_type);
		List<Questionnaire> questionnairelist = null;
		//分页查询设置
		PageHelper.startPage(1,10);// 设置分页，参数1=页数，参数2=每页显示条数
		
		if(questionnaire_type==2) {
			questionnairelist = questionnaireDAO.getAll();
			PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(questionnairelist);
			
			session.setAttribute("lines",pageInfo.getTotal());//总记录数
			session.setAttribute("pages",pageInfo.getPages());//总页数
			session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
			model.addAttribute("questionnairelist", questionnairelist);
			return "questionnaire_listAdmin";
		}
		else {
			questionnairelist = questionnaireDAO.getAllByquestionnaire_type(questionnaire_type);
			PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(questionnairelist);

			session.setAttribute("lines",pageInfo.getTotal());//总记录数
			session.setAttribute("pages",pageInfo.getPages());//总页数
			session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
		}
		
		model.addAttribute("questionnairelist", questionnairelist);
		return "questionnaire_list";
	}
	
	@GetMapping("/questionnaire/{questionnaire_id}")
	public String questionnaire(@PathVariable int questionnaire_id,Model model) {
		/*
		 * 从questionnaire_list或my_questionnaire_list跳转到questionnaire界面
		 */
		Questionnaire questionnaire = qnService.getQn(questionnaire_id);
		model.addAttribute("questionnaire", questionnaire);
		return "questionnaire";
		
	}
	
	@GetMapping("create_choice")
	public String create_choice(){
		//跳转到create_choice.jsp
		return "create_choice";
	}
	
	@GetMapping("/model_list")
	public String model_list() {
		//返回模板列表 model_list.jsp
		return "model_list";
	}
	@GetMapping("/model/{model_qn_id}")
	public String model(@PathVariable int model_qn_id,HttpSession session) {
		/*
		 * 把model_qn_id的model问卷对象放入session里
		 */
		Questionnaire questionnairemodel = qnService.getQn(model_qn_id);
		session.setAttribute("questionnairemodel", questionnairemodel);
		return "model";
	}
	
	@GetMapping("/create_questionnaireFrommodel/{model_qn_id}")
	public String create_questionnaireFrommodel(@PathVariable int model_qn_id,Model model,HttpSession session) {
		//进入创建问卷界面 create_model_many.jsp
		//把model_qn_id的model问卷对象放入session里
		//问卷对象的名字属性要清空
		model.addAttribute("model_qn_id", model_qn_id);
		
		return "create_model_many";
	}
	
	@GetMapping("/create_voteFrommodel/{model_qn_id}")
	public String create_voteFrommodel(@PathVariable int model_qn_id,Model model,HttpSession session) {
		//进入创建问卷界面 create_model_one.jsp
		//把model_qn_id的model问卷对象放入session里
		//问卷对象的名字属性要清空
		model.addAttribute("model_qn_id", model_qn_id);
		
		return "create_model_one";
	}
	
	@GetMapping("/modelSerch/{model_qn_id}")
	public String create_modelSerch(@PathVariable int model_qn_id,Model model) {
		Questionnaire questionnaire = qnService.getQn(model_qn_id);
		model.addAttribute("questionnaire", questionnaire);
		return "modelSerch";
	}
	
	@GetMapping("/modelVote/{model_qn_id}")
	public String create_modelVote(@PathVariable int model_qn_id,Model model) {
		Questionnaire questionnaire = qnService.getQn(model_qn_id);
		model.addAttribute("questionnaire", questionnaire);
		return "modelVote";
	}
	
	@GetMapping("/login")
	public String login() {
		//主页上点击登录注册按钮 进入注册界面login.jsp
		return "login";
	}
	@GetMapping("/personal")
	public String personal(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user.getUser_name().equals("admin")) {
			return "user_list";
		}
		return "personal";
	}

}
