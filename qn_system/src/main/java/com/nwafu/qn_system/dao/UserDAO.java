package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.nwafu.qn_system.entity.User;


public interface UserDAO {
	/**
	   *  实现根据user_name、user_password查询记录，返回的User对象包括role_id、role_name.
	 * @author xdx
	 * @param user
	 * @return
	 */
	@Results({
		@Result(column="user_id", property="user_id"),
		@Result(column="user_name", property="user_name"),
		@Result(column="user_password", property="user_password"),
		@Result(column="user_mail", property="user_mail"),
		@Result(column="role_id", property="role", one=@One(select="com.nwafu.qn_system.dao.RoleDAO.getAllByRole_id"))
	})
	@Select("select * from user where `user`.user_name=#{user_name} and `user`.user_password=#{user_password}")
	public User getAllByNamePassword(User user);
	
	/**
	 * 获得整张user表，包括联合role的结果
	 * @return
	 */
	@Results({
		@Result(column="role_id", property="role", one=@One(select="com.nwafu.qn_system.dao.RoleDAO.getAllByRole_id"))
	})
	@Select("select * from user")
	public List<User> getAll();
	
	/**
	 * 插入数据.
	 * @author xdx
	 * @param user
	 */
	@Insert("insert into user(user_name, user_password, user_mail) values(#{user_name}, #{user_password}, #{user_mail})")
	public void add(User user);
	
	/**
	 * 修改对应记录中的role_id.
	 * @author xdx
	 * @param user
	 */
	@Update("update user set role_id=#{role.role_id} where user_id=#{user_id}")
	public void updateRole_id(User user);
	
	/**
	 * 根据user_id单表查询user表
	 * @author xdx
	 * @param user_id
	 * @return
	 */
	@Select("select * from user where user_id=#{user_id}")
	public User getByUser_id(int user_id);
	
	/**
	 * 根据user_mail单表查询user表
	 * @author sgf
	 * @param user_id
	 * @return   
	 */
	@Select("select * from user where user_mail=#{user_mail}")
	public User getByUser_mail(String user_mail);
	
	/**
	 * 根据user_name单表查询user表
	 * @author sgf
	 * @param user_id
	 * @return 
	 */
	@Select("select * from user where user_name=#{user_name}")
	public User getByUser_name(String user_name);
}
