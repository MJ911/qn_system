package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
/**
 * 
 * @author jyq
 * echarts实现数据可视化
 */
public interface BigDataDao {
	//所有的回答的数量
    @Select("SELECT COUNT(*) FROM answer WHERE question_id=#{question_id} ")
    public Integer getNumber(int question_id);
    @Select("SELECT option_name from options WHERE question_id=#{question_id}")
    public List<String> getName(int question_id);
}
