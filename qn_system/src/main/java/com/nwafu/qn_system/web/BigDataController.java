package com.nwafu.qn_system.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.nwafu.qn_system.assist.*;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.service.BigDataService;
import com.nwafu.qn_system.service.StatisticsService;
/**
 * echarts控制器
 * 实现json对象与后台的传值
 * @author jyq
 *
 */
@Controller
@RequestMapping("qn_system")
public class BigDataController {
	@Autowired
    private BigDataService bigdataservice;
	@Autowired
	private StatisticsService sta;//辅助service
	/**
	 * 
	 * @return 测试界面
	 */
    @GetMapping("test")
    public String getIndex() {
    	return "testjsp";
    }
    /**
     * 
     * @param question
     * @return
     */
    @PostMapping("option")
    @ResponseBody
    public String populationCount(Question question) {
    	//Question question1=new Question();
    	question.setQuestion_id(question.getQuestion_id());
    	question.setQuestion_type(question.getQuestion_type());
        List<Double> stalist=sta.getOptionRate(question);
        List<Pop_bigData> list = new ArrayList<Pop_bigData>();
        List<String> optionList = bigdataservice.getName(question.getQuestion_id());
        System.out.println(optionList.size());
        //System.out.println("optionList:"+optionList);
        for(int i=0;i<optionList.size();i++){
            //Integer count = bigdataservice.getNumber(50);
            //System.out.println(count);
            System.out.println("number:"+bigdataservice.getNumber(question.getQuestion_id()));
            System.out.println(stalist.get(i));
            Pop_bigData pop_bigData = new Pop_bigData((stalist.get(i)),optionList.get(i));
            list.add(pop_bigData);
        }
        String data = JSON.toJSONString(list);
        System.out.println("data:"+data);
        return data;
    }
}
