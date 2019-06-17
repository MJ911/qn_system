package com.nwafu.qn_system.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nwafu.qn_system.entity.Answer;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.service.QnService;
@Controller
@RequestMapping("qn_system")
public class QuestionnaireController {
    /*
     * 用户提交问卷后返回文件列表界面
     * @param questionnaire
     * @return list.jsp
     */
	@Autowired
	private QnService qnService;
	
	@PostMapping("questionnaire_list")
	public String questionnaire(Questionnaire questionnaire) {
//		System.out.println(questionnaire);
		List<Question> questionList = questionnaire.getQuestion_list();
		for(Question q:questionList) {
			if(q.getQuestion_type() == 2) {
				String str = q.getAnswer().getAnswer_info();
				int OptionsLen = q.getOptions_list().size();
				String[] strArr = str.split(","); 
				Integer[] intArr = new Integer[strArr.length];
				for(int a=0;a<strArr.length;a++){
					intArr[a] = Integer.valueOf(strArr[a]); //然后遍历字符串数组，使用包装类Integer的valueOf方法将字符串转为整型
				}
				int ar[] = new int[OptionsLen];
				for(int i:intArr) {
					ar[i-1] = 1;
				}
				int answer = 0;
				for(int i=OptionsLen-1,j=0;i>=0;i--,j++) {
					answer += ar[i] * Math.pow(2,j);
				}
//				System.out.println("answer = "+answer);
				q.getAnswer().setAnswer_info(answer+"");
			}
		}
		System.out.println(questionnaire); 
		qnService.answerQn(questionnaire);
		return "questionnaire_list";
	}
}
