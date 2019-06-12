package com.nwafu.qn_system.service;

import java.util.List;

import com.nwafu.qn_system.entity.Authority;
import com.nwafu.qn_system.entity.Role;
import com.nwafu.qn_system.entity.User;

public interface AuthorityService {

	/**
	 * 创建角色方法，要插入记录到role表和role_authority表，
	 * role对象中包括实例化的List<Authority>对象
	 * @author 宋明桂
	 * @param role
	 * @return
	 */
	public boolean createRole(Role role);
	
	/**
	 * 角色分配表，为用户设定角色，要修改user表中记录
	 * @author 宋明桂
	 * @param user
	 * @param role
	 * @return
	 */
	public boolean setRoleForUser(User user, Role role);
	
	/**
	 * 为用户设置权限方法，要插入记录到user_authority表中，
	 * user中包括实例化后的List<Authority>对象
	 * @author 宋明桂
	 * @param user
	 * @return
	 */
	public boolean setAtForUser(User user);
	
	/**
	 * 获取role的具体信息，包括其涵盖的权限；参数role只需实例化id属性，
	 * 返回的Role对象是包含List<Authority>对象的；
	 * @author 宋明桂
	 * @param role
	 * @return
	 */
	public Role getAtFromRole(Role role);
	
	/**
	 * 获取user的具体信息，包括其涵盖的权限，
	 * 注意这里的权限只是从user_authority表中查到的权限，不包括user的角色中的权限；
	 * @author 宋明桂
	 * @param user
	 * @return
	 */
	public User getAtFromUser(User user);
	
	/**
	 * 获取user所有权限，即user的role所拥有的权限与user本身有的权限的并集；
	 * @author 宋明桂
	 * @param user
	 * @return
	 */
	public List<Authority> getAllAtFromUser(User user);
}
