package com.nwafu.qn_system.web;

import java.io.FileOutputStream;
import java.util.Base64;
import java.util.Base64.Decoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.service.UserService;

@Controller
@RequestMapping("qn_system")
public class ImageController {
	@Autowired
	private UserService userService;
	
	@Value("${headimages.uploaddir}")
	private String path;
	
	@PostMapping("uploadHead")
	public String uploadHead(@RequestParam("file") String file, HttpSession session) {
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		System.out.println("start uploading");
        Decoder decoder = Base64.getDecoder();  
        file = file.substring(22); 
        //System.out.println(file);
        //解码  
        String file_path= path+user.getUser_name()+".png";
        user.setUser_headurl(user.getUser_name()+".png");
        userService.updateUserheadurl(user);
        byte[] imgByte = decoder.decode(file); 
        try {  
            FileOutputStream out = new FileOutputStream(file_path); // 输出文件路径  
            out.write(imgByte);  
            out.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
          
        return "personal";  
	}
}
