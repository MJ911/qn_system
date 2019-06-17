package com.nwafu.qn_system.entity;
/**
 * 用户找回密码实体类
 * @author 宋明桂
 *
 */
public class MailRetrieve {
	private int id;
	private String user_name;
	private String sid;
	private long out_time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public long getOut_time() {
		return out_time;
	}
	public void setOut_time(long out_time) {
		this.out_time = out_time;
	}
}
