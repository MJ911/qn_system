package com.nwafu.qn_system.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;

public interface StatisticsService {
	/*
	   *   获取选择题目各个选项的百分比；
	 * @author 李文雅
	 * @param Question 
	 * @return List<Double>
	 */
	public List<Double> getOptionRate(Question qustion);
	
	/*
	 * @author 李文雅
	 * 2.获取填空题目的所有回答，回答装在返回的Question对象中的List<Answer>中
	 * @param Question
	 * @return Question
	 */
	public Question getAsFromQuestion(Question question);
	
	/*
	 * 根据问卷结果导出文件，返回参数待定，形参qn是修改后的Questionnaire对象（Questionnaire模块负责人修改）。
	 * @author 李文雅
	 * @param Questionnaire
	 * @return File
	 */
	public File exportFile(Questionnaire qn) throws IOException;
	
	/*
	 * 把用户答案的统计信息封装在一个问卷对象中返回
	 * @author 李文雅
	 * @param Questionnaire_id
	 * @return Questionnaire对象
	 */
	public Questionnaire exportQn(int qn_id);
}
