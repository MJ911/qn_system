package com.nwafu.qn_system.utils;

import java.util.UUID;
/**
 * 随机生成验证码uuid
 * @author 宋明桂
 *
 */
public class UUIDGenerator {
	public UUIDGenerator() {
	}

	/**
	 * 获得一个唯一性UUID
	 * 
	 * @return String UUID
	 */
	public static String getUUID() {
		String s = UUID.randomUUID().toString();
		// 去掉“-”符号
		return s.substring(0, 8) + s.substring(9, 13) + s.substring(14, 18) + s.substring(19, 23) + s.substring(24);
	}

	/*public static void main(String[] args) {
		String ss = getUUID();
		System.out.println(ss);
	}*/
}
