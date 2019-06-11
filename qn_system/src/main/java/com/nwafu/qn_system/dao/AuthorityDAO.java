package com.nwafu.qn_system.dao;

import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.Authority;
import com.nwafu.qn_system.entity.Role;

public interface AuthorityDAO {

	/**
	 * 根据role_id返回指定记录，被UserDAO中getAllByNamePassword的Results引用.
	 * @author sgf
	 * @param Authority_id
	 * @return
	 */
	@Select("select * from authority where authority_id=#{authority_id}")
	public Authority getAllByAuthority_id(int authority_id);
}
