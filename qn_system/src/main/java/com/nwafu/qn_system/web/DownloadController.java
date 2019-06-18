package com.nwafu.qn_system.web;

import java.io.File;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.service.QnService;
import com.nwafu.qn_system.service.StatisticsService;
import com.nwafu.qn_system.service.UserService;

@Controller
@RequestMapping("qn_system")
public class DownloadController {
//实现Spring Boot 的文件下载功能，映射网址为/download
	@Autowired
	private StatisticsService statisticsService;
	@Autowired
	private QnService qnService;
	
	@RequestMapping("/download/{questionnaire_id}")
	public ResponseEntity<byte[]> downloadFile(HttpServletRequest request, HttpServletResponse response,@PathVariable int questionnaire_id)
			throws IOException {
		Questionnaire qn = qnService.getQn(questionnaire_id);
		File file = statisticsService.exportFile(qn);
		String fileName = file.getName();
		System.out.println("***fileName"+fileName);
				System.out.println("***hi");
				 HttpHeaders headers = new HttpHeaders();//http头信息  	
				 headers.setContentDispositionFormData("attachment", URLEncoder.encode(fileName, "UTF-8"));
			     headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
				 return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
	}

}
