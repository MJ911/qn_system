package com.nwafu.qn_system.dao;

import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.Questionnaire;

public interface QuestionnaireDAO {
	/*
	 * 根据questionnaire_id返回记录（Questionnaire）；
	 * @author MJJ
	 * @return Questionnaire
	 */
	@Select("select * from Questionnaire where questionnaire_id = #{questionnaire_id}")
	public Questionnaire getQuestionnaireByQuestionnaire_id(int questionnaire_id);
}
