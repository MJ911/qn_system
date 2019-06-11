package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.Questionnaire;

public interface QuestionnaireDAO {
	/**
	 * 实现返回qustionnaire所有记录；（包括user_id、user_name）
	 *
	 * @author sgf
	 * @return Questionnaire对象
	 */
	@Results({
			@Result(column="role_id", property="user", one=@One(select="com.nwafu.qn_system.dao.UserDAO.getByUser_id"))
	})
	@Select("select * from questionnaire")
	public List<Questionnaire> getAll();

	/**
	 * 实现插入记录（user_id、questionnaire_cdate、questionnaire_fdate、
	 * questionnaire_state）
	 *
	 * @author sgf
	 */
	@Insert("insert into questionnaire(user_id,questionnaire_name,questionnaire_cdate,questionnaire_fdate,questionnaire_state) values(#{user.user_id},#{questionnaire_name},#{questionnaire_cdate},#{questionnaire_fdate},#{questionnaire_state})")
	public void add(Questionnaire questionnaire);

	/**
	 * 实现返回questionnaire所有questionnaire_state为true的记录
	 * questionnaire_state）
	 *
	 * @author sgf
	 */
	@Select("select * from questionnaire where questionnaire_state=0")
	public List<Questionnaire> getByQuestionnaire_state();

	/**
	 * 根据questionaire_id删除记录；
	 *
	 * @author sgf
	 */
	@Delete("delete from questionnaire where questionnaire_id=#{questionnaire_id}")
	public void delete(int  questionnaire_id);

	/*
	 * 根据questionnaire_id返回记录（Questionnaire）；
	 * @author MJJ
	 * @return Questionnaire
	 */
	@Select("select * from Questionnaire where questionnaire_id = #{questionnaire_id}")
	public Questionnaire getQuestionnaireByQuestionnaire_id(int questionnaire_id);



}
