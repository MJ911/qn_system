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
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + authority_id;
		result = prime * result + ((authority_name == null) ? 0 : authority_name.hashCode());
		result = prime * result + (is_menu ? 1231 : 1237);
		result = prime * result + ((menu_name == null) ? 0 : menu_name.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Authority other = (Authority) obj;
		if (authority_id != other.authority_id)
			return false;
		if (authority_name == null) {
			if (other.authority_name != null)
				return false;
		} else if (!authority_name.equals(other.authority_name))
			return false;
		if (is_menu != other.is_menu)
			return false;
		if (menu_name == null) {
			if (other.menu_name != null)
				return false;
		} else if (!menu_name.equals(other.menu_name))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Authority [authority_id=" + authority_id + ", authority_name=" + authority_name + ", is_menu=" + is_menu
				+ ", menu_name=" + menu_name + "]";
	}
}
