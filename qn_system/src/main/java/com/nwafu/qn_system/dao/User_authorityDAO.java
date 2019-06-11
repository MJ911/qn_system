package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.Authority;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.entity.User_authority;
import com.nwafu.qn_system.entity.User_questionnaire;

public interface User_authorityDAO {
	
	@Results({	//联合查询
		@Result(property = "user",javaType=User.class,column="user_id",
			one=@One(select="com.nwafu.qn_system.dao.UserDAO.getByUser_id")),
		@Result(property = "authority",javaType=Authority.class,column="authority_id",
			one=@One(select="com.nwafu.qn_system.dao.AuthorityDAO.getByAuthority_id"))
	})
	@Select("select * from user_authority where user_id=#{user_id}")
	public List<User_authority> getByUserId(int user_id);
	
	@Insert("insert into user_authority(authority_id,user_id) values(#{authority.authority_id},#{user.user_id})")
	public void insertUserAuthority(User_authority user_authority);
}
