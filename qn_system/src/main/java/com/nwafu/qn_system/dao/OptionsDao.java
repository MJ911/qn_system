package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.nwafu.qn_system.entity.Options;
import com.nwafu.qn_system.entity.Question;

public interface OptionsDao {
	//联合查询
	/**
	 * @author jyq
	 * @param question_id
	 * @return List<Options>
	 * 功能 根据question_id查询Options
	 */
	@Results({
		@Result(property="option_id",column="option_id"),
		@Result(property="option_number",column="option_number"),
		@Result(property="option_name",column="option_name"),
		@Result(property="question",javaType=Question.class,column="question_id",
			one=@One(select="com.nwafu.qn_system.dao.QuestionDAO.getQuestionByid"))
	})
	@Select("select * from options where question_id=#{question_id}")
    public List<Options> getByQuestionId(int question_id);
	/**
	 * 
	 * @param option_id
	 * @return Options
	 * 根据Option_id查询Option
	 */
	@Select("select * from options where option_id=#{option_id}")
	public Options getByOptionsId(int option_id);
	/**
	 * 添加option
	 * @param option
	 */
	@Insert("insert into options(question_id,option_number,option_name) values(#{question.question_id},#{option_number},#{option_name})")	
	public void add(Options option);
	/**
	 * 根据question_id删除Option
	 * @param question_id
	 */
	@Delete("delete from options where question_id=#{question_id}")
	public void deleteByQuestionId(int question_id);
	/**
	 * 根据option_id删除Option
	 * @param option_id
	 */
	@Delete("delete from options where option_id=#{option_id}")
	public void deleteByOptionsId(int option_id);
	/**
	 * 更新Option_name
	 * @param option
	 */
	@Update("update options set option_name=#{option_name} where option_id=#{option_id}")
	public void updateOptionsName(Options option);
	/**
	 * 更新Option_number
	 * @param option
	 */
	@Update("update options set option_number=#{option_number} where option_id=#{option_id}")
	public void updateOptionsNumber(Options option);
}
