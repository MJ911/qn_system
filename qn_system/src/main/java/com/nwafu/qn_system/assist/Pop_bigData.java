package com.nwafu.qn_system.assist;

/**
 * 
 * @author jyq
 *  使用 value-name的形式传递参数
 */
public class Pop_bigData {
	Double value;
	String name;
    public Pop_bigData(Double value,String sex) {
    	this.value=value;
    	this.name=sex;
    }
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
