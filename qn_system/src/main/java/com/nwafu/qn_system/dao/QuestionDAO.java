package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;

public interface QuestionDAO {
	/*
	 * 根据questionnaire_id返回记录（List）；
	 * @author MJJ
	 * @return List<Question>
	 */
	@Results({
		@Result(property="question_id",column="question_id"),
		@Result(property="question_type",column="question_type"),
		@Result(property="question_name",column="question_name"),
		@Result(property="question_number",column="question_number"),
		@Result(property="questionnaire",javaType=Questionnaire.class,column="questionnaire_id",
			one=@One(select="com.nwafu.qn_system.dao.QuestionnaireDAO.getQuestionnaireByQuestionnaire_id"))
	})
	@Select("select question.question_id,question.question_type,question.question_name,question.question_number,questionnaire.questionnaire_id,questionnaire.user_id,questionnaire.questionnaire_name,questionnaire.questionnaire_cdate,questionnaire.questionnaire_fdate,questionnaire.questionnaire_state from question,questionnaire where question.questionnaire_id=questionnaire.questionnaire_id and question.questionnaire_id = #{questionnaire_id}")
	public List<Question> getQuestionsByquestionnaire_id(int questionnaire_id);
	
	/*
	 * 插入Question记录；
	 * @author MJJ
	 * @return void
	 */
	@Insert("insert into question(questionnaire_id,question_type,question_number,question_name) values (#{questionnaire.questionnaire_id},#{question_type},#{question_number},#{question_name})")
	public void insertToQuestion(Question question);
	
	/*
	 * 根据question_id删除Question记录；
	 * @author MJJ
	 * @return void
	 */
	@Delete("delete from question where question_id=#{question_id}")
	public void deleteByquestion_id(int question_id);
	
	/*
	 * 修改指定question_id的记录question_name；
	 * @author MJJ
	 * @return void
	 */
	@Update("update question set question_name=#{question_name} where question_id=#{question_id}")
	public void updatequestion_nameByquestion_id(Question question);
	
	/**
	 * 修改指定question_id的记录question_number；
	 * @author MJJ
	 * @param void
	 */
	@Update("update question set question_number=#{question_number} where question_id=#{question_id}")
	public void updatequestion_numberByquestion_id(Question question);
	
	/*
	 * 查找指定question_id的记录；
	 * @author MJJ
	 * @return Question
	 */
	@Select("select * from question where question_id=#{question_id}")
	public Question getQuestionByid(int question_id);
	
	/**
	 * 根据questionnaire_id和question_number查询返回question记录.
	 * @author xdx
	 * @param question
	 * @return
	 */
	@Select("select * from question where questionnaire_id=#{questionnaire.questionnaire_id} and question_number=#{question_number}")
	public Question getQuestionByQn_idQ_number(Question question);
}
