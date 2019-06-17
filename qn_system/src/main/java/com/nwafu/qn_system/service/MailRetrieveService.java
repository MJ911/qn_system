package com.nwafu.qn_system.service;

import com.nwafu.qn_system.entity.MailRetrieve;

public interface MailRetrieveService {

	public void save(MailRetrieve mailRetrieve);
	
	public void delete(MailRetrieve mailRetrieve);
	
	public MailRetrieve findByAccount(String account);
}
