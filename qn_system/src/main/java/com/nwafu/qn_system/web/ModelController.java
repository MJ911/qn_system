package com.nwafu.qn_system.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nwafu.qn_system.entity.Questionnaire;

@Controller
@RequestMapping("qn_system")
public class ModelController {
	/**
	 * 应用模板直接生成问卷
	 * @param questionnaire
	 * @return create_questionnaire.jsp
	 */
    @PostMapping("model")
    public String create_questionnaire(Questionnaire questionnaire) {
    	return "create_questionnaire";
    }
}
