package com.nwafu.qn_system.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("qn_system")
public class DownloadController {
//实现Spring Boot 的文件下载功能，映射网址为/download
	@RequestMapping("/download/{questionnaire_id}")
//	@ResponseBody
	public ResponseEntity<byte[]> downloadFile(HttpServletRequest request, HttpServletResponse response,@PathVariable int questionnaire_id)
			throws IOException {
		File file = new File("./statistics/statistics"+questionnaire_id+".txt");
		String fileName = file.getName();
		//	if (file.exists()) {
				System.out.println("***hi");
				 HttpHeaders headers = new HttpHeaders();//http头信息  	
				 headers.setContentDispositionFormData("attachment", URLEncoder.encode(fileName, "UTF-8"));
			     headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
				 return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
				
		//	}
		
	//	return null;
	}

}
