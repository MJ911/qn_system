package com.nwafu.qn_system.entity;

/**
 * 选项类.
 * @author xdx
 *
 */
public class Options {
	private int option_id;
	private int option_number;
	private String option_name;
	private Question question;
	private double option_rate;//表示某一问题的各个选项出现的频率
	
	public double getOption_rate() {
		return option_rate;
	}
	public void setOption_rate(double option_rate) {
		this.option_rate = option_rate;
	}
	public int getOption_id() {
		return option_id;
	}
	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}
	public int getOption_number() {
		return option_number;
	}
	public void setOption_number(int option_number) {
		this.option_number = option_number;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	
	
}
