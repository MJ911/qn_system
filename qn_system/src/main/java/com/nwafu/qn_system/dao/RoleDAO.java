package com.nwafu.qn_system.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.Role;

public interface RoleDAO {
	/**
	 * 根据role_id返回指定记录，被UserDAO中getAllByNamePassword的Results引用.
	 * @author xdx
	 * @param role_id
	 * @return
	 */
	@Select("select * from role where role_id=#{role_id}")
	public Role getAllByRole_id(int role_id);
	
	/**
	 * 插入role记录.
	 * @author xdx
	 * @param role
	 */
	@Insert("insert into role(role_name) values(#{role_name})")
	public void add(Role role);
	
	/**
	 * select role by name
	 * @author 宋明桂
	 */
	@Select("select * from role where role.role_name=#{role_name}")
	public Role getRoleByName(String rolename);
	
	/**
	 * select all
	 * @author sgf
	 */
	@Select("select * from role ")
	public Role getAll();
}
