package com.nwafu.qn_system.dao;

import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.User_questionnaire;

public interface User_questionnaireDAO {
	/**
	 * 根据user_questionnaire_id返回记录.
	 * @author 宋明桂
	 */
	@Select("select * from user_questionnaire where user_questionnaire_id = #{user_questionnaire_id}")
	public User_questionnaire getQuestionnaireByUser_questionnaire_id(int user_questionnaire_id);
}
