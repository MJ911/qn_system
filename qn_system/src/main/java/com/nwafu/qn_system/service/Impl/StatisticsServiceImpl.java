package com.nwafu.qn_system.service.Impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nwafu.qn_system.dao.AnswerDAO;
import com.nwafu.qn_system.dao.OptionsDao;
import com.nwafu.qn_system.entity.Answer;
import com.nwafu.qn_system.entity.Options;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.service.QnService;
import com.nwafu.qn_system.service.StatisticsService;

@Service
public class StatisticsServiceImpl implements StatisticsService{
	@Autowired
	private OptionsDao optionsDAO;
	@Autowired
	private AnswerDAO answerDAO;
	@Autowired
	private QnService qnService;
	/*
	 * @author 李文雅
	*/
	
	@Override
	public List<Double> getOptionRate(Question question) {
		List<Double> optionRate = new ArrayList<Double>();
		List<Options> options= optionsDAO.getByQuestionId(question.getQuestion_id());//得到某个问题的全部选项
		List<Answer> answers = answerDAO.getByQuestionId(question.getQuestion_id());//该问题的所有回答  size:3
		int optionsNum = options.size();//每一个问题的选项数
		int[] everyOptionSum = new int[optionsNum];//option[0]代表第一个选项的总数
		for(int i=0;i<everyOptionSum.length;i++) {
			everyOptionSum[i] = 0;
		}
//		System.out.println("******everyOptionSum_size:"+everyOptionSum.length);
		if(question.getQuestion_type() == 1) {//单选
//			System.out.println("*****qu_id:"+question.getQuestion_id());
//			System.out.println("******answer_size:"+answers.size());
			//判断问卷有无答案
			if(answers!=null)
			for(int i=0;i<answers.size();i++) {
				Answer answer = answers.get(i);
				//判断该回答是否为空
				if(answer.getAnswer_info()!=null) {
					int index = Integer.parseInt(answer.getAnswer_info())-1;
//					System.out.println("********index:"+index);
					everyOptionSum[index]++;
				}
			}
			
			
		}
		else if(question.getQuestion_type() == 2) {//多选
			//判断问卷有无答案
			if(answers!=null)
			for(int i=0;i<answers.size();i++) {
				Answer answer = answers.get(i);
				//判断该回答是否为空
				if(answer.getAnswer_info()!=null) {
					int answer_info =  Integer.parseInt(answer.getAnswer_info());
					String binary = Integer.toBinaryString(answer_info);
					System.out.println("二进制："+binary);
				
//					for(int j=0;j<binary.length();j++) {//eg :101(2) = 5(10)
//
//						char c = binary.charAt(j);
//
//						if(49 == c) {
//
//							everyOptionSum[j]++;
//
//						}
//					}
					int k = binary.length()-1;
					for(int j = optionsNum-1;j>=0;j--) {
						char c = binary.charAt(k);
						if(c==49) {
							everyOptionSum[j]++;
						}
						k--;
						if(k<0) {
							break;
						}
					}
				}
//				System.out.println(everyOptionSum[0]);
			}	
		}
		int sum = 0;
		for(int i=0;i<everyOptionSum.length;i++) {
//			System.out.println(everyOptionSum[i]);
			sum+=everyOptionSum[i];
		}
		
		for(int i=0;i<optionsNum;i++) {
			//optionRate.add(i,(double)everyOptionSum[i]/sum);
			//该题有回答
			if(answers.size()>0) {
				BigDecimal orignal = new BigDecimal((double)everyOptionSum[i]/answers.size());
				double rate = orignal.setScale(3,BigDecimal.ROUND_HALF_UP).doubleValue();
				optionRate.add(i,rate);
			} else {
				optionRate.add(i,0.0);
			}
		}
		return optionRate;
	}

	@Override
	public Question getAsFromQuestion(Question question) {
//		System.out.println("*******进入getAsFromQuestion");
		List<Answer> answers = new ArrayList<Answer>();
		answers = answerDAO.getByQuestionId(question.getQuestion_id());
		question.setQuestion_answer(answers);
//		System.out.println("*****answer_size:"+answers.size());///???size为0

		return question;
	}

	@Override
	public File exportFile(Questionnaire qn) throws IOException {//参数qn只需包含问卷，题目，选项
		String fileName = "./statistics/statistics"+qn.getQuestionnaire_id()+".txt";
	//	File file = new File("statistics.txt");
		File file = new File(fileName);
		if(!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				System.out.println("创建文件失败！");
				e.printStackTrace();
			}
		}
		
		FileWriter fw = null;
		try {
			fw = new FileWriter(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BufferedWriter bw = new BufferedWriter(fw);
	
		String qn_name = qn.getQuestionnaire_name();
//		System.out.println("*********************问卷名："+qn_name);
		try {
			bw.write(qn_name+"\n");
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<Question> questions = qn.getQuestion_list();
		//按照question_number从小到大给question排序,question_number是question在问卷中的第几个
		Collections.sort(questions, new Comparator<Question>(){
			@Override
			public int compare(Question q1, Question q2) {
				// TODO Auto-generated method stub
				if(q1.getQuestion_number()>q2.getQuestion_number()) {
					return 1;
				}
				if(q1.getQuestion_number()==q2.getQuestion_number()) {
					return 0;
				}
				return -1;
			}	
		});
		
		
		
		for(int i=0;i<questions.size();i++) {
//			System.out.println("***********************"+questions.get(i).getQuestion_number()+":"+questions.get(i).getQuestion_name());
		}
	
		int flag = 0;
		for(int i=0;i<questions.size();i++) {
			flag++;
//			System.out.println("++++++++++++++++++第"+flag+"次循环");
			Question question = questions.get(i);
			int question_number = question.getQuestion_number();//该题在问卷中的第几个
			int question_id = question.getQuestion_id();
			String question_name = question.getQuestion_name();
			if(question.getQuestion_type() == 2) {
				bw.write(question_number+"."+question_name+"（多选）"+"\n");
			}
			else {
				bw.write(question_number+"."+question_name+"\n");
			}
			
			//单选或是多选题
			if(question.getQuestion_type() == 1 || question.getQuestion_type() == 2) {
				List<Options> options = optionsDAO.getByQuestionId(question_id);//选择题的选项集
				
				//对选项在问题中出现的顺序，由低到高排序
				Collections.sort(options, new Comparator<Options>(){
					@Override
					public int compare(Options opt1, Options opt2) {
						// TODO Auto-generated method stub
						if(opt1.getOption_number()>opt2.getOption_number()) {
							return 1;
						}
						if(opt1.getOption_number()==opt2.getOption_number()) {
							return 0;
						}
						return -1;
					}	
				});
			
//				System.out.println("************************options_size:"+options.size());
				for(int j=0;j<options.size();j++) {
//					System.out.println("option"+j+":"+options.get(j).getOption_name());
				}
				
				List<Double> optionRate = getOptionRate(questions.get(i));
				
				for(int k=0;k<options.size();k++) {
					char ch = (char) ('A' + k);
					bw.write(ch+"."+options.get(k).getOption_name()+"("+optionRate.get(k)+")\n");
				}
				
			
			}

			else if(question.getQuestion_type() == 3) { //填空题
				System.out.println("*******进入填空题");
				question = getAsFromQuestion(question);
				List<Answer> answers = question.getQuestion_answer();//填空题的内容
				for(int j=0;j<answers.size();j++) {
					System.out.println("****************answer"+"("+j+")"+answers.get(j).getAnswer_info());
			//		bw.write("("+j+")"+answers.get(j-1));
				}
				
				
				for(int j=1;j<=answers.size();j++) {
			//		bw.write(question_id+"."+question_name);
					
					bw.write("("+j+")"+answers.get(j-1).getAnswer_info()+"\n");
				}
				
				for(int m = 0;m<answers.size();m++) {
//					System.out.println("************************answers"+answers.get(m).getAnswer_id()+":"+answers.get(m).getAnswer_info());
				}
			}	
		}
	
		bw.close();
		
		return file;
	}

	@Override
	public Questionnaire exportQn(int qn_id) {
		Questionnaire qn = qnService.getQn(qn_id);
		List<Question> question_list = qn.getQuestion_list();
		for(int i=0;i<question_list.size();i++) {
			Question question = question_list.get(i);
			
			//按照question_id从数据库中搜索出该问题的选项列表后，将其赋值给要返回的Questionnaire对象的options_list属性,并初始化每一个选项的统计概率。
			List<Options> options_list = optionsDAO.getByQuestionId(question.getQuestion_id());
			List<Double> optionRate = getOptionRate(question);
			for(int j=0;j<options_list.size();j++) {
				Options option = options_list.get(j);
				option.setOption_rate(optionRate.get(j));
			}
			question.setOptions_list(options_list);
			
			//初始化要返回的Questionnaire对象的question的question_answer
			List<Answer> answers = answerDAO.getByQuestionId(question.getQuestion_id());
			question.setQuestion_answer(answers);
		}
		return qn;
	}

}
