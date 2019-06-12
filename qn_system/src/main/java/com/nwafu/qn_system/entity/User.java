package com.nwafu.qn_system.entity;

import java.util.List;

/**
 * 用户类.
 * @author xdx
 *
 */
public class User {
	private int user_id;
	private String user_name;
	private String user_password;
	private String user_mail;
	private Role role;
	/**
	 * 在User实体类中增加List<Authority>属性
	 * @author 宋明桂
	 * 2019-6-12
	 */
	private List<Authority> authorityList;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public List<Authority> getAuthorityList() {
		return authorityList;
	}
	public void setAuthorityList(List<Authority> authorityList) {
		this.authorityList = authorityList;
	}
}
