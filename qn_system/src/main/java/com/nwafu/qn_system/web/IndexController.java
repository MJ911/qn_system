package com.nwafu.qn_system.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("qn_system")
public class IndexController {
	
	@GetMapping("index")
	public String index(){
		//返回主页 index.jsp
		return "index";
	}
	
	@GetMapping("/questionnaire_list/{questionnaire_type}")
	public String questionnaire_list(int questionnaire_type,Model model) {
		//返回问卷列表 questionnaire_list.jsp
		//往model里面加调查或者投票的List
		//model.addAttribute(attributeValue);
		return "questionnaire_list";
	}
	
	@GetMapping("/questionnaire/{questionnaire_id}")
	public String questionnaire(int questionnaire_id,Model model) {
		/*
		 * 从questionnaire_list或my_questionnaire_list跳转到questionnaire界面
		 */
		
		return "questionnaire";
		
	}
	
	
	
	@GetMapping("model_list")
	public String model_list() {
		//返回模板列表 model_list.jsp
		return "model_list";
	}
	@GetMapping("/model/{model_qn_id}")
	public String model(int model_qn_id,Model model) {
		/*
		 * 把model_qn_id的model问卷对象放入session里
		 */
		return "model";
	}
	
	@GetMapping("/create_questionnaire/{model_qn_id}")
	public String create_questionnaire(int model_qn_id,Model model) {
		//进入创建问卷界面 create_questionnaire.jsp
		//把model_qn_id的model问卷对象放入session里
		//问卷对象的名字属性要清空
		return "create_questionnaire_many";
	}
	
	@GetMapping("login")
	public String login() {
		//主页上点击登录注册按钮 进入注册界面login.jsp
		return "login";
	}
	@GetMapping("personal")
	public String personal() {
		return "personal";
	}

}
