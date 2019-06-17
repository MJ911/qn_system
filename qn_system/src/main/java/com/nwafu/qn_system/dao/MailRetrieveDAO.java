package com.nwafu.qn_system.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.nwafu.qn_system.entity.MailRetrieve;

/**
 * @author 宋明桂
 *
 */
public interface MailRetrieveDAO {
	
	@Insert("insert into mailretrieve(user_name, sid, out_time) values(#{user_name}, #{sid}, #{out_time})")
	public void save(MailRetrieve mailRetrieve);
	
	@Delete("delete from mailretrieve where user_name=#{user_name}")
	public void delete(MailRetrieve maileRetrieve);
	
	@Select("select * from mailretrieve where user_name=#{user_name}")
	public MailRetrieve getByUser_name(String user_name);
}
