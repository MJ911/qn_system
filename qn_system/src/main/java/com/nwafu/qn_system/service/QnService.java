package com.nwafu.qn_system.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.User;


public interface QnService {
	/**
	 * 创建问卷，qn中包含了question_list, question_list中包含了options_list，因为涉及多张表的插入，采用事务回滚机制采用事务回滚机制.
	 * @author xdx
	 * @param qn
	 * @return
	 */
	public boolean createQn(Questionnaire qn);
	
	/**
	 * 获取问卷，根据问卷id获取整张问卷（包括题目、选项的List）.
	 * @author xdx.
	 * @param questionnaire_id
	 * @return
	 */
	public Questionnaire getQn(int questionnaire_id);
	
	/**
	 * 提交问卷方法，需要查询数据到user_questionnaire表和answer表，特别注意！！此处形参中questionnaire中的user是回答者.
	 * @author xdx
	 * @param questionnaire
	 * @return
	 */
	public boolean answerQn(Questionnaire questionnaire);
	
	/**
	 * 获取用户创建的问卷列表.
	 * @author xdx
	 * @param user
	 * @return
	 */
	public List<Questionnaire> getCreatedQns(User user);
	
	
	/**
	 * 获取用户参与的问卷列表.
	 * @author xdx
	 * @param user
	 * @return
	 */
	public List<Questionnaire> getAnsweredQns(User user);
	
	/**
	 * 获取用户回答的指定问卷，其中包含用户提交的答案.
	 * @author xdx.
	 * @param user
	 * @param questionnaire_id
	 * @return
	 */
	public Questionnaire getAnseredQn(User user, int questionnaire_id);
	
	/**
	 * 删除指定问卷，获取问卷的创建者、然后获得user_questionnaire_id的List，获得questionList，去answer表中删除对应的记录，options表中删除options，question表中删除,questionnaire表中删除.
	 *@author xdx
	 * @param questionnaire_id
	 */
	public void deleteQn(int questionnaire_id);
}
