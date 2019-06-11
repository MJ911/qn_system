package com.nwafu.qn_system.entity;

/**
 * 权限类.
 * @author sgf
 *
 */
public class Authority {

	private int authority_id;
	private String authority_name;
	private boolean is_menu;
	private String menu_name;
	
	public int getAuthority_id() {
		return authority_id;
	}
	public void setAuthority_id(int authority_id) {
		this.authority_id = authority_id;
	}
	public String getAuthority_name() {
		return authority_name;
	}
	public void setAuthority_name(String authority_name) {
		this.authority_name = authority_name;
	}
	public boolean isIs_menu() {
		return is_menu;
	}
	public void setIs_menu(boolean is_menu) {
		this.is_menu = is_menu;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

}
