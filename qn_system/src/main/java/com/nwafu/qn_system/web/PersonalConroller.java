package com.nwafu.qn_system.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nwafu.qn_system.entity.Questionnaire;

@Controller
@RequestMapping("qn_system")
public class PersonalConroller {
	@GetMapping("/create_questionnaire/{questionnaire_type}")
	public String create_questionnaire(int questionnaire_type) {
		/*
		 * 用户从personal.jsp/index.jsp点击创建跳转到create_questionnaire.jsp
		 * questionnaire_type判断01生成问卷类型
		 */
		//if判断返回不同的创建页面 调查&投票创建页面
		if(questionnaire_type==0) {
			return "create_questionnaire_many";
		}
		return "create_questionnaire_one";
	}
	@GetMapping("myquestionnaire_list")
	public String myquestionnaire_list() {
		/**
		 * 用户从personal.jsp点击参与问卷创建跳转到myquestionnaire_list.jsp
		 */
		return "myquestionnaire_list";
	}
	@GetMapping("join_list")
	public String join_list() {
		/**
		 * 用户从personal.jsp点击参与问卷创建跳转到join_list.jsp
		 */
		return "join_list";
	}
	
	@PostMapping("create_questionnaire")
	public String create_questionnaire(Questionnaire questionnaire) {
		/*
		 * 用户在create_questionnaire.jsp 新建问卷表单提交
		 * 插入数据库
		 * 返回到主页index.jsp
		 */
		return "index";
	}
	
	@GetMapping("/questionnaire_view/{questionnaire_id}")
	public String questionnaire_view(int questionnaire_id,Model model) {
		/**
		 * 用户在myquestionnaire_list.jsp点击查看该行 questionnaire_id问卷数据统计
		 * 数据存储在session中
		 * 返回到用户的该问卷详细信息questionnaire_view.jsp可视化界面显示数据
		 */
		return "questionnaire_view";
	}
	
	@GetMapping("export_questionnaire_view")
	public void export_questionnaire_view() {
		/*
		 * 暂时搁置
		 * 统计结果导出
		 */
	}
	
	
	@GetMapping("/join/{questionnaire_id}")
	public String join(int questionnaire_id,Model model) {
		/*
		 * 用户从join_list.jsp点击查看所参与的该问卷的信息
		 * 返回到用户的该问卷详细信息 问卷题目+答案
		 */
		return "join";
	}
}
