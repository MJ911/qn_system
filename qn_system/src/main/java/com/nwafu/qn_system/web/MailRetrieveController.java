package com.nwafu.qn_system.web;
/**
 * 用户找回密码向邮箱发送链接以及核对链接
 * @author 宋明桂
 */
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nwafu.qn_system.entity.MailRetrieve;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.service.MailRetrieveService;
import com.nwafu.qn_system.service.MailService;
import com.nwafu.qn_system.service.UserService;
import com.nwafu.qn_system.utils.EnctryUtils;
import com.nwafu.qn_system.utils.UUIDGenerator;

@Controller
@RequestMapping("qn_system")
public class MailRetrieveController {
	@Autowired
	private MailRetrieveService mailRetrieveService;
	@Autowired
	private MailService mailService;
	@Autowired
	private UserService userService;

	/**
	 * 生成密码找回的url地址，并将url地址发送到用户邮箱中
	 * 
	 * @author 宋明桂
	 */
	@GetMapping("finduser/{user_name}")
	public String produceURL(@PathVariable String user_name, HttpSession session) {
		// MailRetrieve mailRetieve = mailRetrieveService.findByAccount(user_name);
		User user = userService.getByUserName(user_name);
		if (user == null) {
			session.setAttribute("error", "用户名不存在");
		} else {
			Timestamp outDate = new Timestamp(System.currentTimeMillis() + (long) (30 * 60 * 1000));// 30分钟后过期 //忽略毫秒数
			long outtimes = outDate.getTime();
			String sid = user_name + "&" + UUIDGenerator.getUUID() + "&" + outtimes;
			MailRetrieve mailRetrieve = new MailRetrieve();
			mailRetrieve.setUser_name(user_name);
			mailRetrieve.setSid(EnctryUtils.stringMD5(sid));
			mailRetrieve.setOut_time(outtimes);
			MailRetrieve findRetrieve = mailRetrieveService.findByAccount(user_name);
			if (findRetrieve != null) {
				mailRetrieveService.delete(findRetrieve);
			}
			mailRetrieveService.save(mailRetrieve);
			String subject = "来自问卷强网站的邮件";
			String context = "<a target=\"_blank\"href=\"http://localhost:8092/qn_system/checklink/" + 
					EnctryUtils.stringMD5(sid)+ "/"+user_name+"\">激活请点击:" + EnctryUtils.stringMD5(sid)+ "</a>";
			mailService.sendMimeMail(user.getUser_mail(), subject, context);
			session.setAttribute("message", "找回密码链接已经发送到邮箱，注意查收");
		}
		return "login";
	}
	
	@GetMapping("checklink/{sid}/{user_name}")
	public String checkLink(@PathVariable String user_name,@PathVariable String  sid, HttpSession session) {
		//System.out.println(user_name+" "+sid);
		MailRetrieve mailRetrieve = mailRetrieveService.findByAccount(user_name);
		long outTime = mailRetrieve.getOut_time();
		Timestamp outDate = new Timestamp(System.currentTimeMillis());
        long nowTime=outDate.getTime();
        System.out.println("nowTime:"+nowTime);
        if(outTime<=nowTime){
            session.setAttribute("error","verifyMail time is overdue");           
        }else if("".equals(sid)){
            session.setAttribute("error","sid is incomplete content");          
        }else if(!sid.equals(mailRetrieve.getSid())){
            session.setAttribute("error","sid is error");           
        }else{
            session.setAttribute("message", "请输入新密码");   
            session.setAttribute("username", user_name);
        }	
        return "updatepassword";//更改用户更改密码的界面
	}
}
