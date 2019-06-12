package com.nwafu.qn_system.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nwafu.qn_system.dao.AuthorityDAO;
import com.nwafu.qn_system.dao.RoleDAO;
import com.nwafu.qn_system.dao.Role_authorityDAO;
import com.nwafu.qn_system.dao.UserDAO;
import com.nwafu.qn_system.dao.User_authorityDAO;
import com.nwafu.qn_system.entity.Authority;
import com.nwafu.qn_system.entity.Role;
import com.nwafu.qn_system.entity.Role_authority;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.entity.User_authority;
import com.nwafu.qn_system.service.AuthorityService;
/**
 * @author 宋明桂
 *
 */
@Service
public class AuthorityServiceImpl implements AuthorityService{

	@Autowired
	private RoleDAO roleDAO;
	@Autowired
	private Role_authorityDAO role_authorityDAO;
	@Autowired
	private User_authorityDAO user_authorityDAO;
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public boolean createRole(Role role) {
		// TODO Auto-generated method stub
		try {
			List<Authority> authority_list = role.getAuthorityList();
			roleDAO.add(role);
			role = roleDAO.getRoleByName(role.getRole_name());	
			System.out.println(role.getRole_id() + " "+ role.getRole_name());
			for(Authority authority : authority_list) {
				role_authorityDAO.add(role, authority);
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean setRoleForUser(User user, Role role) {
		// TODO Auto-generated method stub
		try {
			User up_user = new User();
			up_user.setUser_id(user.getUser_id());
			up_user.setRole(role);
			userDAO.updateRole_id(up_user);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean setAtForUser(User user) {
		// TODO Auto-generated method stub
		try {
			List<Authority> authority_list = user.getAuthorityList();
			for(Authority authority : authority_list) {
				User_authority user_authority = new User_authority();
				user_authority.setAuthority(authority);
				user_authority.setUser(user);
				user_authorityDAO.insertUserAuthority(user_authority);
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		
	}

	@Override
	public Role getAtFromRole(Role role) {
		// TODO Auto-generated method stub
		Role return_role = roleDAO.getAllByRole_id(role.getRole_id());
		List<Role_authority> role_authority_list = role_authorityDAO.getByRole_id(role.getRole_id());
		List<Authority> authority_list = new ArrayList<Authority>();
		for(Role_authority role_authority : role_authority_list) {
			authority_list.add(role_authority.getAuthority());
		}
		return_role.setAuthorityList(authority_list);
		return return_role;
	}

	@Override
	public User getAtFromUser(User user) {
		// TODO Auto-generated method stub
		List<User_authority> user_authority_list = user_authorityDAO.getByUserId(user.getUser_id());
		List<Authority> authority_list = new ArrayList<Authority>();
		for(User_authority user_authority : user_authority_list) {
			authority_list.add(user_authority.getAuthority());
		}
		user.setAuthorityList(authority_list);
		return user;
	}

	@Override
	public List<Authority> getAllAtFromUser(User user) {
		// TODO Auto-generated method stub
		List<Role_authority> role_authority_list = role_authorityDAO.getByRole_id(user.getRole().getRole_id());
		List<Authority> authority_list_by_role = new ArrayList<Authority>();
		for(Role_authority role_authority : role_authority_list) {
			authority_list_by_role.add(role_authority.getAuthority());
		}
		
		List<User_authority> user_authority_list = user_authorityDAO.getByUserId(user.getUser_id());
		List<Authority> authority_list_by_user = new ArrayList<Authority>();
		for(User_authority user_authority : user_authority_list) {
			authority_list_by_user.add(user_authority.getAuthority());
		}
		
		authority_list_by_role.removeAll(authority_list_by_user);
		authority_list_by_user.addAll(authority_list_by_role);
		return authority_list_by_user;
	}
	
}
