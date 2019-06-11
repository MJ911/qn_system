package com.nwafu.qn_system.entity;

/**
 * 问题类.
 * @author xdx
 *
 */
public class Question {
	private int question_id;
	private int question_type;
	private String question_name;
	private int question_number;
	
	private Questionnaire questionnaire;
	
	public int getQuestion_id() {
		return question_id;
	}


	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}


	public int getQuestion_type() {
		return question_type;
	}


	public void setQuestion_type(int question_type) {
		this.question_type = question_type;
	}


	public String getQuestion_name() {
		return question_name;
	}


	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}


	public int getQuestion_number() {
		return question_number;
	}


	public void setQuestion_number(int question_number) {
		this.question_number = question_number;
	}


	public Questionnaire getQuestionnaire() {
		return questionnaire;
	}


	public void setQuestionnaire(Questionnaire questionnaire) {
		this.questionnaire = questionnaire;
	}


	@Override
	public String toString() {
		return "Question [question_id=" + question_id + ", question_type=" + question_type + ", question_name="
				+ question_name + ", question_number=" + question_number + ", questionnaire=" + questionnaire + "]";
	}
	
	
	
}
