package com.nwafu.qn_system.entity;

/**
 * 回答类.
 * @author xdx
 *
 */
public class Answer {
	private int answer_id;
	private String answer_info;
	private Question question;
	private User_questionnaire user_questionnaire;
	
	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public String getAnswer_info() {
		return answer_info;
	}
	public void setAnswer_info(String answer_info) {
		this.answer_info = answer_info;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public User_questionnaire getUser_questionnaire() {
		return user_questionnaire;
	}
	public void setUser_questionnaire(User_questionnaire user_questionnaire) {
		this.user_questionnaire = user_questionnaire;
	}
	@Override
	public String toString() {
		return "Answer [answer_id=" + answer_id + ", answer_info=" + answer_info + ", question=" + question
				+ ", user_questionnaire=" + user_questionnaire + "]";
	}
	
	
}
