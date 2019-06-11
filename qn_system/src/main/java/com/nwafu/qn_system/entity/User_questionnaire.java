package com.nwafu.qn_system.entity;

import java.util.Date;

/**
 * 用户-问卷类，注意，这里的 用户id,问卷id表示用户所参与的问卷，而不是创建.
 * @author xdx
 *
 */
public class User_questionnaire {
	private int user_questionnaire_id;
	private Date user_questionnaire_adate;
	private User user;
	private Questionnaire questionnaire;
	
	public int getUser_questionnaire_id() {
		return user_questionnaire_id;
	}
	public void setUser_questionnaire_id(int user_questionnaire_id) {
		this.user_questionnaire_id = user_questionnaire_id;
	}
	public Date getUser_questionnaire_adate() {
		return user_questionnaire_adate;
	}
	public void setUser_questionnaire_adate(Date user_questionnaire_adate) {
		this.user_questionnaire_adate = user_questionnaire_adate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Questionnaire getQuestionnaire() {
		return questionnaire;
	}
	public void setQuestionnaire(Questionnaire questionnaire) {
		this.questionnaire = questionnaire;
	}
	
	
}
