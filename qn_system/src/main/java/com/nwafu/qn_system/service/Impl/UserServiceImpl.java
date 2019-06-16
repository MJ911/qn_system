package com.nwafu.qn_system.service.Impl;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nwafu.qn_system.dao.UserDAO;
import com.nwafu.qn_system.dao.User_authorityDAO;
import com.nwafu.qn_system.entity.Authority;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.entity.User_authority;
import com.nwafu.qn_system.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userdao;
	@Autowired
	private User_authorityDAO user_authoritydao;

	/**
	 * @author 宋明桂
	 * 添加了用户登录的判断,用户是否激活
	 */
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		User user1 = userdao.getAllByNamePassword(user);
		if (user1 == null || user1.isUser_state() == false)
			return null;
		else
			return user1;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int register(User user) {
		// TODO Auto-generated method stub
		System.out.println("test");
		System.out.println(user.toString());
		Pattern pName = Pattern.compile("[a-zA-Z]\\S{5,14}");
		Pattern pPasswd = Pattern.compile("[a-zA-Z0-9]{6,16}");
		Pattern pMail = Pattern.compile("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$");
		Matcher m = pName.matcher(user.getUser_name());
		boolean flg = m.matches();
		System.out.println(flg);
		if (flg) {

			if (userdao.getByUser_name(user.getUser_name()) == null) {
				m = pPasswd.matcher(user.getUser_password());
				flg = m.matches();
				System.out.println(flg);
				if (flg) {

					m = pMail.matcher(user.getUser_mail());
					flg = m.matches();
					System.out.println(flg);
					if (flg) {
						if (userdao.getByUser_mail(user.getUser_mail()) == null) {
							System.out.println("UserServiceImpl->userdao.add->start");
							userdao.add(user);
							System.out.println("UserServiceImpl->userdao.add->finish");
							User_authority user_authority=new User_authority();
							user_authority.setUser(userdao.getByUser_name(user.getUser_name()));
							Authority authority =new Authority();
							for(int i=1;i<=5;i++){
								authority.setAuthority_id(i);
								user_authority.setAuthority(authority);;
								user_authoritydao.insertUserAuthority(user_authority);
							}
							return 0;
						} else {
							return 5;
						}
					} else {
						return 4;
					}
				} else {
					return 3;
				}

			} else {
				return 2;
			}

		} else {
			return 1;
		}

	}

	@Override
	public User getUser(User user) {
		// TODO Auto-generated method stub

		return userdao.getByUser_id(user.getUser_id());
	}

	@Override
	public User getUserByActivecode(String active_code) {
		// TODO Auto-generated method stub
		return userdao.getByActivecode(active_code);
	}

	@Override
	public void upadteUser(User user) {
		// TODO Auto-generated method stub
		userdao.updateUserstate_activecode(user);
	}

}
