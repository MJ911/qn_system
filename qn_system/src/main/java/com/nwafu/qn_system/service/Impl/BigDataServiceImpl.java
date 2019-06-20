package com.nwafu.qn_system.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nwafu.qn_system.dao.BigDataDao;
import com.nwafu.qn_system.service.BigDataService;
/**
 * 
 * @author jyq
 *
 */
@Service
public class BigDataServiceImpl implements BigDataService{

	@Autowired
	private BigDataDao bigdatadao;
	@Override
	public Integer getNumber(int question_id) {
		// TODO Auto-generated method stub
		return bigdatadao.getNumber(question_id);
	}

	@Override
	public List<String> getName(int question_id) {
		// TODO Auto-generated method stub
		return bigdatadao.getName(question_id);
	}

}
