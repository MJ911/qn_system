package com.nwafu.qn_system.service;

import com.nwafu.qn_system.entity.User;

public interface UserService {

	/**
	 * 登录方法，传参时user设置user_name、user_password，登陆成功返回User对象，登录失败返回null
	 * @author sgf
	 * @return User
	 * @param User
	 */
	public User login(User user);
	
	/*
	 * 注册方法，传参时user设置user_name、user_password、user_mail
	 * int(0是注册成功，1使用户名必须是以字母开头且长度在1到16之间，
	 * 2是用户名已被注册，3是密码必须是字母和数字组合长度1~16，4是邮箱必须是@和.之间要有字母隔开),5是邮箱未激活
	 * 6是用户的状态默认是0，7是用户的激活码
	 * @author sgf
	 * @param User
	 */
	public int register(User user);
	
	/**
	 * 获取用户详情，参数user设置了user_id、user_name属性,返回一个完整的User对象
	 * @author sgf
	 * @return 
	 * @param User
	 */
	public User getUser(User user);
	
	/**
	 * 通过active_code获取用户的所有信息
	 * @author 宋明桂
	 */
	public User getUserByActivecode(String active_code);
	/**
	 * 更新用户的状态和激活码
	 */
	public void upadteUser(User user);
	
	/**
	 * 通过用户名获取用户对象
	 * @author 宋明桂
	 */
    public User getByUserName(String name);
    /**
           * 更新用户头像
     * @author 宋明桂
     */
    public void updateUserheadurl(User user);
    
    /**
     * 激活用户.
     * @author xdx
     * @param user
     */
    public void activeUser(User user);
}