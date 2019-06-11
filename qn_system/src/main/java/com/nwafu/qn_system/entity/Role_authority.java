package com.nwafu.qn_system.entity;

/**
 * 角色-权限类
 * @author sgf
 *
 */
public class Role_authority {

	private int role_authority_id;
	private Role role;
	private Authority authority;
	
	public int getRole_authority_id() {
		return role_authority_id;
	}
	public void setRole_authority_id(int role_authority_id) {
		this.role_authority_id = role_authority_id;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Authority getAuthority() {
		return authority;
	}
	public void setAuthority(Authority authority) {
		this.authority = authority;
	}
	

}
