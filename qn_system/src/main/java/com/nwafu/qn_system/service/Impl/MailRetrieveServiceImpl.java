package com.nwafu.qn_system.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nwafu.qn_system.dao.MailRetrieveDAO;
import com.nwafu.qn_system.entity.MailRetrieve;
import com.nwafu.qn_system.service.MailRetrieveService;
import com.nwafu.qn_system.service.MailService;

@Service
public class MailRetrieveServiceImpl implements MailRetrieveService{
	@Autowired
	private MailRetrieveDAO mailRetrieveDAO;

	@Override
	public void save(MailRetrieve mailRetrieve) {
		// TODO Auto-generated method stub
		mailRetrieveDAO.save(mailRetrieve);
	}

	@Override
	public void delete(MailRetrieve mailRetrieve) {
		// TODO Auto-generated method stub
		mailRetrieveDAO.delete(mailRetrieve);
	}

	@Override
	public MailRetrieve findByAccount(String account) {
		// TODO Auto-generated method stub
		return mailRetrieveDAO.getByUser_name(account);
	}
	
}
