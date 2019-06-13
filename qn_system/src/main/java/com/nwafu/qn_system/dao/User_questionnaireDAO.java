package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.One;

import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.entity.User_questionnaire;

/**
 * 封装user_questionnaire表的操作
 * @author 李文雅
 */
public interface User_questionnaireDAO {

	/*
	 * 按照用户id查询该用户参与过的所有问卷
	 * param；用户id
	 * return List<User_questionnaire>
	 */
	@Results({	//联合查询
		@Result(property = "user",javaType=User.class,column="user_id",
			one=@One(select="com.nwafu.qn_system.dao.UserDAO.getByUser_id")),
		@Result(property = "questionnaire",javaType=Questionnaire.class,column="questionnaire_id",
			one=@One(select="com.nwafu.qn_system.dao.QuestionnaireDAO.getQuestionnaireByQuestionnaire_id"))
	})
	@Select("select * from user_questionnaire where user_id = #{user_id}") 
	public List<User_questionnaire> getAllByUserId(int user_id);
	
	
	
	/*
	 * /根据questionnaire_id返回记录
	 * param:问卷id
	 * return List<User_questionnaire>
	 */
	@Results({	//联合查询
		@Result(property = "user",javaType=User.class,column="user_id",
			one=@One(select="com.nwafu.qn_system.dao.UserDAO.getByUser_id")),
		@Result(property = "questionnaire",javaType=Questionnaire.class,column="questionnaire_id",
			one=@One(select="com.nwafu.qn_system.dao.QuestionnaireDAO.getQuestionnaireByQuestionnaire_id"))
	})
	@Select("select * from user_questionnaire where questionnaire_id = #{questionnaire_id}")
	public List<User_questionnaire> getAllByQnId(int questionnaire_id);
	
	/*
	 * 实现插入记录（user_id、questionnaire_id、user_questionnaire_adate）
	 * param:User_questionnaire对象 
	 */
	@Insert("insert into user_questionnaire(user_id,questionnaire_id,user_questionnaire_adate) values(#{user.user_id},#{questionnaire.questionnaire_id},#{user_questionnaire_adate})")
	public void insertUserQuestionnaire(User_questionnaire user_questionnaire);
	
	/*
	 * 根据questionnaire_id删除记录
	 * param:问卷id
	 */
	@Delete("delete from user_questionnaire where questionnaire_id = #{questionnaire_id}")
	public void delete(int questionnaire_id);
	
	/**
	 * 根据user_questionnaire_id返回记录.
	 * @author 宋明桂
	 */
	@Select("select * from user_questionnaire where user_questionnaire_id = #{user_questionnaire_id}")
	public User_questionnaire getQuestionnaireByUser_questionnaire_id(int user_questionnaire_id);
	
	/**
	 * 根据user_id和questionnaire_id查询记录.
	 * @author xdx.
	 * @param user_qn
	 * @return
	 */
	@Select("select * from user_questionnaire where user_id=#{user.user_id} and questionnaire_id=#{questionnaire.questionnaire_id}")
	public User_questionnaire getUser_qnByUser_idQn_id(User_questionnaire user_qn);
}
