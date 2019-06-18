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
	 * 在User实体类中添加了两个属性
	 * user_state(0,1) user_activecode
	 * @author 宋明桂
	 */
	private String user_headurl;
	private boolean user_state;
	private String user_activecode;
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
	
	public String getUser_headurl() {
		return user_headurl;
	}
	public void setUser_headurl(String user_headurl) {
		this.user_headurl = user_headurl;
	}
	public boolean isUser_state() {
		return user_state;
	}
	public void setUser_state(boolean user_state) {
		this.user_state = user_state;
	}
	public String getUser_activecode() {
		return user_activecode;
	}
	public void setUser_activecode(String user_activecode) {
		this.user_activecode = user_activecode;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_mail=" + user_mail + ", role=" + role + ", user_headurl=" + user_headurl + ", user_state="
				+ user_state + ", user_activecode=" + user_activecode + ", authorityList=" + authorityList + "]";
	}	
}
