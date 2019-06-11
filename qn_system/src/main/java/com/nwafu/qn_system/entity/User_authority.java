package com.nwafu.qn_system.entity;

/**
 * 用户-权限类.
 * @author xdx
 *
 */
public class User_authority {
	private int user_authority_id;
	private Authority authority;
	private User user;
	
	public int getUser_authority_id() {
		return user_authority_id;
	}
	public void setUser_authority_id(int user_authority_id) {
		this.user_authority_id = user_authority_id;
	}
	public Authority getAuthority() {
		return authority;
	}
	public void setAuthority(Authority authority) {
		this.authority = authority;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
