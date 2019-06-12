package com.nwafu.qn_system.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nwafu.qn_system.entity.Questionnaire;
@Controller
@RequestMapping("qn_system")
public class QuestionnaireController {
    /**
     * 用户提交问卷后返回文件列表界面
     * @param questionnaire
     * @return list.jsp
     */
	@PostMapping("questionnaire_list")
	public String questionnaire(@PathVariable Questionnaire questionnaire) {
		
		return "questionnaire_list";
	}
}
