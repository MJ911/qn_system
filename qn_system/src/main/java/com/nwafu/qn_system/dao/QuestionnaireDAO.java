package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.User;

public interface QuestionnaireDAO {
	/*
	 * 实现返回qustionnaire所有记录；（包括user_id、user_name）
	 *
	 * @author sgf，修改xdx.
	 * @return Questionnaire对象
	 */
	@Results({
			@Result(column="user_id", property="user", one=@One(select="com.nwafu.qn_system.dao.UserDAO.getByUser_id"))
	})
	@Select("select * from questionnaire")
	public List<Questionnaire> getAll();

	/**
	 * 实现插入记录（user_id、questionnaire_cdate、questionnaire_fdate、
	 * questionnaire_state）
	 *
	 * @author sgf, xdx进行了修改
	 */
	@Insert("insert into questionnaire(user_id,questionnaire_name,questionnaire_cdate,questionnaire_fdate,questionnaire_state,questionnaire_type) values(#{user.user_id},#{questionnaire_name},#{questionnaire_cdate},#{questionnaire_fdate},#{questionnaire_state},#{questionnaire_type})")
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

	/**
	 * 根据questionnaire_id返回问卷表和用户表的联合查询结果
	 * @author xdx.
	 * @param questionnaire_id
	 * @return
	 */
	@Results({
		@Result(column="user_id", property="user", one=@One(select="com.nwafu.qn_system.dao.UserDAO.getByUser_id"))
	})
	@Select("select * from Questionnaire where questionnaire_id = #{questionnaire_id}")
	public Questionnaire getAssociatedQnByQn_id(int questionnaire_id);
	
	/**
	 * 根据user_id和questionnaire_ctime，查找questionnaire记录.
	 * @author xdx
	 * @param questionnaire
	 * @return
	 */
	@Select("select * from questionnaire where user_id=#{user.user_id} and questionnaire_cdate=#{questionnaire_cdate}")
	public Questionnaire getQuestionnaireByUser_idCdate(Questionnaire questionnaire);
	
	/**
	 * 根据user_id和questionnaire_name，查找questionnaire记录.
	 * @author xdx
	 * @param questionnaire
	 * @return
	 */
	@Select("select * from questionnaire where user_id=#{user.user_id} and questionnaire_name=#{questionnaire_name}")
	public Questionnaire getQuestionnaireByUser_idQ_name(Questionnaire questionnaire);
	/*
	 * 根据用户id查询所创建的问卷列表.
	 * @author xdx
	 * @param user
	 * @return
	 */
	@Results({
		@Result(column="user_id", property="user", one=@One(select="com.nwafu.qn_system.dao.UserDAO.getByUser_id"))
	})
	@Select("select * from questionnaire where user_id=#{user_id}")
	public List<Questionnaire> getQnsByUser_id(int user_id);
	
	/*
	 * 根据questionnaire_type返回qustionnaire对应所有记录；
	 * @author MJJ
	 * @param questionnaire_type
	 * @return List
	 */
	@Results({
		@Result(column = "user_id", property = "user", one = @One(select = "com.nwafu.qn_system.dao.UserDAO.getByUser_id")) })
	@Select("select * from questionnaire where questionnaire_type=#{questionnaire_type}")
	public List<Questionnaire> getAllByquestionnaire_type(int questionnaire_type);
}
