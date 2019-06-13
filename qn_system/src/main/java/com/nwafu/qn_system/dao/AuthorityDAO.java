package com.nwafu.qn_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.Authority;

public interface AuthorityDAO {

	/**
	 *实现authority单表查询.
	 * @author lwy
	 */
	@Select("select * from authority where authority_id=#{authority_id}")
	public Authority getByAuthority_id(int authority_id);
	/**
	 * 实现根据authority_id，查询记录。
	 * @author 宋明桂
	 * test pass
	 */
	@Select("select * from authority where authority_id=#{authority_id}")
	public Authority getByAuthority(int authority_id);
	
	/**
	 * 实现根据authority_id，查询is_menu为true的记录。
	 * @author 宋明桂
	 * test pass
	 */
	@Select("select * from authority where is_menu=1")
	public List<Authority> getByIs_Menu();
	
	/**
	 * @author sgf
	 * @param authority_id
	 * @return
	 */
	@Select("select * from authority where authority_id=#{authority_id}")
	public Authority getAllByAuthority_id(int authority_id);
	/**
	 * 获取全部权限
	 * @author sgf
	 * @param authority_id
	 * @return
	 */
	@Select("select * from authority" )
	public List<Authority> getAll();
	
}
