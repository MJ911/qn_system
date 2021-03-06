package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.nwafu.qn_system.entity.Answer;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.User_questionnaire;

public interface AnswerDAO {
	/**
	 * 根据question_id返回记录。
	 * @author 宋明桂
	 */
	@Results({
		@Result(column="answer_id",property="answer_id"),
        @Result(column="answer_info",property="answer_info"),
        @Result(property="question",javaType=Question.class,column="question_id",
        	one=@One(select="com.nwafu.qn_system.dao.QuestionDAO.getQuestionByid")),
	})
	@Select("select answer.answer_id,answer.answer_info,question.question_id,question.questionnaire_id,question.question_name,\r\n" + 
			"question.question_type,question.question_number\r\n" + 
			"from answer,question\r\n" + 
			"where answer.question_id=question.question_id \r\n" + 
			"and question.question_id=#{question_id}")
	public List<Answer> getByQuestionId(int question_id);
	
	/**
	 * 根据user_questionnaire_id、question_id返回记录。
	 * @author 宋明桂
	 * test pass
	 */
	@Results({
		@Result(column="answer_id",property="answer_id"),
        @Result(column="answer_info",property="answer_info"),
        @Result(property="question",javaType=Question.class,column="question_id",
        	one=@One(select="com.nwafu.qn_system.dao.QuestionDAO.getQuestionByid")),
        @Result(property="user_questionnaire",javaType=User_questionnaire.class,column="user_questionnaire_id",
    		one=@One(select="com.nwafu.qn_system.dao.User_questionnaireDAO.getQuestionnaireByUser_questionnaire_id")),
	})
	@Select("select answer.answer_id,answer.answer_info,question.question_id,question.questionnaire_id,question.question_name,"+
			" question.question_type,question.question_number,user_questionnaire.user_questionnaire_id,"+
			" user_questionnaire.user_id,user_questionnaire.questionnaire_id,user_questionnaire.user_questionnaire_adate"+
			" from answer,question,user_questionnaire"+
			" where answer.question_id=question.question_id and question.questionnaire_id=user_questionnaire.questionnaire_id"+
			" and answer.user_questionnaire_id=#{user_questionnaire.user_questionnaire_id} and answer.question_id=#{question.question_id}")
	public List<Answer> getByUser_Questionnaire_Id_and_Question_Id(Answer answer);
	
	/**
	 * 插入记录（user_questionnaire_id、question_id、answer_info）。
	 * @author 宋明桂，xdx修改
	 * test pass
	 */
	@Insert("insert into answer(question_id,user_questionnaire_id,answer_info) values(#{question.question_id}, "
			+ "#{user_questionnaire.user_questionnaire_id}, #{answer_info})")
	public void insertIntoAnswer(Answer answer);
	
	/**
	 * 根据user_questionnaire_id查询所有answer表中的记录，联合查询.
	 * @author xdx
	 * @param user_qn_id
	 * @return
	 */
	@Results({
		@Result(column="user_questionnaire_id",property="user_questionnaire", one=@One(select="com.nwafu.qn_system.dao.User_questionnaireDAO.getQuestionnaireByUser_questionnaire_id")),
		@Result(column="question_id",property="question", one=@One(select="com.nwafu.qn_system.dao.QuestionDAO.getQuestionByid"))
	})
	@Select("select * from answer where user_questionnaire_id=#{user_qn_id}")
	public List<Answer> getAnswersByUser_qn_id(int user_qn_id);
	
	/**
	 * 根据user_qn_id删除answer表中的
	 * @author xdx
	 * @param user_qn_id
	 */
	@Delete("delete from answer where user_questionnaire_id=#{user_qn_id}")
	public void deleteAnswers(int user_qn_id);
	
	/*
	 * 用户修改问卷时，要修改数据库中的answer表
	 *  @author 李文雅
	 *  @param answer_id
	 *  @param answer_info
	 */
	@Update("update answer set answer_info=#{answer_info} where answer_id=#{answer_id}")
//	@Update("update answer set answer_info='000' where answer_id=#{answer_id}")
	public void updateAnswer(Answer answer);
}
