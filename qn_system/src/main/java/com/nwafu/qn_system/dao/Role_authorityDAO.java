package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.Authority;
import com.nwafu.qn_system.entity.Role;
import com.nwafu.qn_system.entity.Role_authority;

public interface Role_authorityDAO {
	/**
	 * 实现根据role_id查询记录（注意是List）
	 *
	 */
	@Results({
		@Result(column="role_authority_id", property="role_authority_id"),
		@Result(column="role_id", property="role", one=@One(select="com.nwafu.qn_system.dao.RoleDAO.getAllByRole_id")),
		@Result(column="authority_id", property="authority", one=@One(select="com.nwafu.qn_system.dao.AuthorityDAO.getAllByAuthority_id"))
	
	})
	@Select("select * from role_authority where role_id=#{role_id}")
	public List<Role_authority> getByRole_id(int role_id);
	
	/**
	 * 实现插入记录（role_id、authority_id）
	 */
	@Insert("insert into role_authority(role_id,authority_id) values(#{role.role_id},#{authority.authority_id})")
	public void add(Role role,Authority authority);
}

