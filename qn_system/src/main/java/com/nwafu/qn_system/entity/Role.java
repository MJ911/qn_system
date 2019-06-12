package com.nwafu.qn_system.entity;

import java.util.List;

/**
 * 角色类.
 * @author sgf
 *
 */
public class Role {
	
	private int role_id;
	private String role_name;
	/**
	 * 增加List<Authority>对象
	 * @author 宋明桂
	 * 2019-6-12
	 */
	private List<Authority> authorityList;
	
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public List<Authority> getAuthorityList() {
		return authorityList;
	}
	public void setAuthorityList(List<Authority> authorityList) {
		this.authorityList = authorityList;
	}	
}
