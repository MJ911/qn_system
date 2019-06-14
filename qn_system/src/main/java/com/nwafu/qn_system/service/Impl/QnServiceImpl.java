package com.nwafu.qn_system.service.Impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nwafu.qn_system.dao.AnswerDAO;
import com.nwafu.qn_system.dao.OptionsDao;
import com.nwafu.qn_system.dao.QuestionDAO;
import com.nwafu.qn_system.dao.QuestionnaireDAO;
import com.nwafu.qn_system.dao.User_questionnaireDAO;
import com.nwafu.qn_system.entity.Answer;
import com.nwafu.qn_system.entity.Options;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.entity.User_questionnaire;
import com.nwafu.qn_system.service.QnService;

@Service
public class QnServiceImpl implements QnService {
	@Autowired
	private QuestionnaireDAO qndao;
	@Autowired
	private QuestionDAO questiondao;
	@Autowired
	private OptionsDao optionsdao;
	@Autowired
	private User_questionnaireDAO user_qndao;
	@Autowired
	private AnswerDAO answerdao;
	
	/**
	 * 创建问卷实现方法.
	 * @author xdx
	 * @param qn
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public boolean createQn(Questionnaire qn) {
		if(qndao==null) {
			System.out.println("dao空!");
			return false;
		}
		
		try{
			qndao.add(qn);
		}catch(Exception e) {
			throw e;
		}
//		if(true) throw new RuntimeException();
		Questionnaire qn_inserted = qndao.getQuestionnaireByUser_idCdate(qn);
		
		for(int i = 0;i<qn.getQuestion_list().size();i++) {
			Question question = qn.getQuestion_list().get(i);
			question.setQuestionnaire(qn_inserted);
			try{
				questiondao.insertToQuestion(question);
			}catch(Exception e) {
				throw e;
			}
			
			Question q_inserted = questiondao.getQuestionByQn_idQ_number(question);
			
			if(question.getQuestion_type()==0||question.getQuestion_type()==1) {
				for(int j = 0;j<question.getOptions_list().size();j++) {
					Options options = question.getOptions_list().get(j);
					options.setQuestion(q_inserted);
					try{
						optionsdao.add(options);
					}catch(Exception e) {
						throw e;
					}
				}
			}
		}
		
		return true;
	}
	
	/**
	 * 获取问卷实现.
	 * @author xdx.
	 * @param questionnaire_id
	 * @return
	 */
	public Questionnaire getQn(int questionnaire_id) {
		Questionnaire questionnaire = qndao.getAssociatedQnByQn_id(questionnaire_id);
		List<Question> question_list = questiondao.getQuestionsByquestionnaire_id(questionnaire_id);
		for(int i = 0;i<question_list.size();i++) {
			List<Options> options_list = optionsdao.getByQuestionId(question_list.get(i).getQuestion_id());
			question_list.get(i).setOptions_list(options_list);
		}
		questionnaire.setQuestion_list(question_list);
		
		//对问卷中的问题按照题目顺序，由低到高排序
		Collections.sort(questionnaire.getQuestion_list(), new Comparator<Question>(){
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

		for(int i = 0;i<questionnaire.getQuestion_list().size();i++) {
			//对选项在问题中出现的顺序，由低到高排序
			Collections.sort(questionnaire.getQuestion_list().get(i).getOptions_list(), new Comparator<Options>(){
				@Override
				public int compare(Options op1, Options op2) {
					// TODO Auto-generated method stub
					if(op1.getOption_number()>op2.getOption_number()) {
						return 1;
					}
					if(op1.getOption_number()==op2.getOption_number()) {
						return 0;
					}
					return -1;
				}	
			});
		}
		
		return questionnaire;
	}
	
	/**
	 * 提交问卷方法实现 ，需要查询数据到user_questionnaire表和answer表，前端提交的问卷对象中的问题对象中的答案对象中要有question_id和answer_info。特别注意！！此处形参中questionnaire中的user是回答者.
	 * @author xdx
	 * @param questionnaire
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public boolean answerQn(Questionnaire questionnaire) {
		/**
		 * 插入记录到user_questionnaire表.
		 */
		
		User_questionnaire user_qn = new User_questionnaire();
		User user = new User();
		user.setUser_id(questionnaire.getUser().getUser_id());
		user_qn.setUser(user);
		
		Questionnaire qn = new Questionnaire();
		qn.setQuestionnaire_id(questionnaire.getQuestionnaire_id());
		user_qn.setQuestionnaire(qn);
		
		user_qn.setUser_questionnaire_adate(new Date());
		
		
		try{
			user_qndao.insertUserQuestionnaire(user_qn);
		}catch(Exception e) {
			throw e;
		}
		/**
		 * 查询 上一步插入记录的user_questionnaire_id.
		 */
		User_questionnaire user_qn_inserted = user_qndao.getUser_qnByUser_idQn_id(user_qn);
//		int user_qn_id = user_qn_inserted.getUser_questionnaire_id();
		/**
		 * 插入answer表
		 */
		List<Question> q_list = questionnaire.getQuestion_list();
		for(int i = 0;i<q_list.size();i++) {
			Question question = q_list.get(i);
			List<Answer> answer_list = question.getQuestion_answer();
			
			Answer answer = question.getAnswer();
			answer.setUser_questionnaire(user_qn_inserted);
			try{
				answerdao.insertIntoAnswer(answer);
			}catch(Exception e) {
				throw e;
			}
		}
		
		return true;
	}
	
	
	/**
	 * 获取用户创建的问卷列表.
	 * @author xdx
	 * @param user
	 * @return
	 */
	public List<Questionnaire> getCreatedQns(User user) {
		return qndao.getQnsByUser_id(user.getUser_id());
	}
	
	/**
	 * 获取用户参与的问卷列表，返回的questionnaire是单标查询的结果.
	 * @author xdx
	 * @param user
	 * @return
	 */
	public List<Questionnaire> getAnsweredQns(User user){
		List<User_questionnaire> user_qn_list = user_qndao.getAllByUserId(user.getUser_id());
		List<Questionnaire> qn_list = new ArrayList<Questionnaire>();
		
		for(int i = 0;i<user_qn_list.size();i++) {
			Questionnaire qn = qndao.getQuestionnaireByQuestionnaire_id(user_qn_list.get(i).getQuestionnaire().getQuestionnaire_id());
			qn_list.add(qn);
		}
		
		return qn_list;
	}
	
	/**
	 * 获取用户回答的指定问卷，其中包含用户提交的答案.
	 * @author xdx.
	 * @param user
	 * @param questionnaire_id
	 * @return
	 */
	public Questionnaire getAnseredQn(User user, int questionnaire_id) {
		Questionnaire qn_result = getQn(questionnaire_id);  //此处问卷的题目中不含答案.
		
		User_questionnaire user_qn = new User_questionnaire();
		Questionnaire qn = new Questionnaire();
		qn.setQuestionnaire_id(questionnaire_id);
		
		user_qn.setQuestionnaire(qn);
		user_qn.setUser(user);
		
		User_questionnaire user_qn_got = user_qndao.getUser_qnByUser_idQn_id(user_qn);
		
		/*****接下来获取user_qn_got在answer表中的查询answerList*/
		List<Answer> answer_list = answerdao.getAnswersByUser_qn_id(user_qn_got.getUser_questionnaire_id());
		
		/****接下来把答案依次放到qn_reuslt中的每个question中***************/
		for(int j = 0;j<answer_list.size();j++) {
			for(int i = 0;i<qn_result.getQuestion_list().size();i++) {
				//将answer加入对应题目
				if(qn_result.getQuestion_list().get(i).getQuestion_number()==answer_list.get(j).getQuestion().getQuestion_number())
				{
					qn_result.getQuestion_list().get(i).setAnswer(answer_list.get(j));
				}
			}
		}
		
		return qn_result;
	}
	
	/**
	 * 删除指定问卷，获取问卷的创建者、然后获得user_questionnaire_id的List，获得questionList，去answer表中删除对应的记录，options表中删除options，question表中删除,questionnaire表中删除.
	 * @author xdx
	 * @param questionnaire_id
	 */
	@Transactional(rollbackFor = Exception.class)
	public void deleteQn(int questionnaire_id) {
		Questionnaire questionnaire = getQn(questionnaire_id);
		List<User_questionnaire> qn_list = user_qndao.getAllByQnId(questionnaire_id);
		
		/****删除answer表中相应记录*****/
		for(int i = 0;i<qn_list.size();i++) {
			answerdao.deleteAnswers(qn_list.get(i).getUser_questionnaire_id());
		}
		
		/****删除options表*****/
		for(int i = 0;i<questionnaire.getQuestion_list().size();i++) {
			optionsdao.deleteByQuestionId(questionnaire.getQuestion_list().get(i).getQuestion_id());
		}
		
		/****删除question表中的相应记录*****/
		questiondao.deleteQuestionByQn_id(questionnaire.getQuestionnaire_id());
		
		/****删除questionnaire表中的相应记录*****/
		qndao.delete(questionnaire.getQuestionnaire_id());
		
		/****删除user_questionnaire表中的相应记录*****/
		user_qndao.delete(questionnaire.getQuestionnaire_id());
	}
}
