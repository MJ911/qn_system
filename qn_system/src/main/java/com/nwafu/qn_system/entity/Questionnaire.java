package com.nwafu.qn_system.entity;

import java.util.Date;

/**
 * 问卷类，其中的user代表创建问卷者.
 * @author xdx
 *
 */
public class Questionnaire {
	private int questionnaire_id;
	private String questionnaire_name;
	private Date questionnaire_cdate;
	private Date questionnaire_fdate;
	private boolean questionnaire_state;
	private User user;
	
	public int getQuestionnaire_id() {
		return questionnaire_id;
	}
	public void setQuestionnaire_id(int questionnaire_id) {
		this.questionnaire_id = questionnaire_id;
	}
	public String getQuestionnaire_name() {
		return questionnaire_name;
	}
	public void setQuestionnaire_name(String questionnaire_name) {
		this.questionnaire_name = questionnaire_name;
	}
	public Date getQuestionnaire_cdate() {
		return questionnaire_cdate;
	}
	public void setQuestionnaire_cdate(Date questionnaire_cdate) {
		this.questionnaire_cdate = questionnaire_cdate;
	}
	public Date getQuestionnaire_fdate() {
		return questionnaire_fdate;
	}
	public void setQuestionnaire_fdate(Date questionnaire_fdate) {
		this.questionnaire_fdate = questionnaire_fdate;
	}
	public boolean isQuestionnaire_state() {
		return questionnaire_state;
	}
	public void setQuestionnaire_state(boolean questionnaire_state) {
		this.questionnaire_state = questionnaire_state;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
