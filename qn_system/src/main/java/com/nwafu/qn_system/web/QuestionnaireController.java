package com.nwafu.qn_system.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nwafu.qn_system.dao.QuestionnaireDAO;
import com.nwafu.qn_system.entity.Answer;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.service.QnService;
@Controller
@RequestMapping("qn_system")
public class QuestionnaireController {
    /*
     * 用户提交问卷后返回文件列表界面
     * @param questionnaire
     * @return list.jsp
     */
	@Autowired
	private QnService qnService;
	
	@Autowired
	private QuestionnaireDAO questionnaireDAO;
	
	@PostMapping("questionnaire_list")
	public String questionnaire(Questionnaire questionnaire) {
//		System.out.println(questionnaire);
		List<Question> questionList = questionnaire.getQuestion_list();
		for(Question q:questionList) {
			if(q.getQuestion_type() == 2) {
				String str = q.getAnswer().getAnswer_info();
				int OptionsLen = q.getOptions_list().size();
				String[] strArr = str.split(","); 
				Integer[] intArr = new Integer[strArr.length];
				for(int a=0;a<strArr.length;a++){
					intArr[a] = Integer.valueOf(strArr[a]); //然后遍历字符串数组，使用包装类Integer的valueOf方法将字符串转为整型
				}
				int ar[] = new int[OptionsLen];
				for(int i:intArr) {
					ar[i-1] = 1;
				}
				int answer = 0;
				for(int i=OptionsLen-1,j=0;i>=0;i--,j++) {
					answer += ar[i] * Math.pow(2,j);
				}
//				System.out.println("answer = "+answer);
				q.getAnswer().setAnswer_info(answer+"");
			}
		}
		System.out.println(questionnaire); 
		qnService.answerQn(questionnaire);
		return "questionnaire_list";
	}
	
	//分页操作下一页（questionnaire_list）
	@GetMapping("NextPage")
	public String NextPage(Model model,HttpSession session) {
		/*
		 * 返回问卷列表 questionnaire_list.jsp
		 * 往model里面加调查或者投票的List
		 * questionnaire_type为0视为调查
		 * questionnaire_type为1视为投票
		 * questionnaire_type为2为管理问卷列表
		 */
		//分页查询设置
		int indexPage = (int)session.getAttribute("indexPage");
		int pages = (int)session.getAttribute("pages");
		indexPage++;
		indexPage = indexPage>pages?pages:indexPage;
		PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
		List<Questionnaire> questionnairelist = null;
		int questionnaire_type = (int)session.getAttribute("questionnaire_type");
		if(questionnaire_type == 2) {
			questionnairelist = questionnaireDAO.getAll();
		}else {
			questionnairelist = questionnaireDAO.getAllByquestionnaire_type(questionnaire_type);
		}
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(questionnairelist);
		
		model.addAttribute("questionnairelist", questionnairelist);
		session.setAttribute("lines",pageInfo.getTotal());//总记录数
		session.setAttribute("pages",pageInfo.getPages());//总页数
		session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
		if(questionnaire_type == 2) {
			return "questionnaire_listAdmin";
		}else {
			return "questionnaire_list";
		}
	}
	
	//分页操作上一页（questionnaire_list）
	@GetMapping("PrePage")
	public String PrePage(Model model,HttpSession session) {
		/*
		 * 返回问卷列表 questionnaire_list.jsp
		 * 往model里面加调查或者投票的List
		 * questionnaire_type为0视为调查
		 * questionnaire_type为1视为投票
		 * questionnaire_type为2为管理问卷列表
		 */
		//分页查询设置
		int indexPage = (int)session.getAttribute("indexPage");
		indexPage--;
		indexPage = indexPage<1?1:indexPage;
		PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
		List<Questionnaire> questionnairelist = null;
		int questionnaire_type = (int)session.getAttribute("questionnaire_type");
		if(questionnaire_type == 2) {
			questionnairelist = questionnaireDAO.getAll();
		}else {
			questionnairelist = questionnaireDAO.getAllByquestionnaire_type(questionnaire_type);
		}
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(questionnairelist);
		
		model.addAttribute("questionnairelist", questionnairelist);
		session.setAttribute("lines",pageInfo.getTotal());//总记录数
		session.setAttribute("pages",pageInfo.getPages());//总页数
		session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
		if(questionnaire_type == 2) {
			return "questionnaire_listAdmin";
		}else {
			return "questionnaire_list";
		}
	}
	
	//分页操作首页（questionnaire_list）
	@GetMapping("ToPageFirst")
	public String ToPageFirst(Model model,HttpSession session) {
		/*
		 * 返回问卷列表 questionnaire_list.jsp
		 * 往model里面加调查或者投票的List
		 * questionnaire_type为0视为调查
		 * questionnaire_type为1视为投票
		 * questionnaire_type为2为管理问卷列表
		 */
		//分页查询设置
		int indexPage = (int)session.getAttribute("indexPage");
		indexPage=1;
		PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
		List<Questionnaire> questionnairelist = null;
		int questionnaire_type = (int)session.getAttribute("questionnaire_type");
		if(questionnaire_type == 2) {
			questionnairelist = questionnaireDAO.getAll();
		}else {
			questionnairelist = questionnaireDAO.getAllByquestionnaire_type(questionnaire_type);
		}
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(questionnairelist);
		
		model.addAttribute("questionnairelist", questionnairelist);
		session.setAttribute("lines",pageInfo.getTotal());//总记录数
		session.setAttribute("pages",pageInfo.getPages());//总页数
		session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
		if(questionnaire_type == 2) {
			return "questionnaire_listAdmin";
		}else {
			return "questionnaire_list";
		}
	}
	
	//分页操作尾页（questionnaire_list）
	@GetMapping("ToPageEnd")
	public String ToPageEnd(Model model,HttpSession session) {
		/*
		 * 返回问卷列表 questionnaire_list.jsp
		 * 往model里面加调查或者投票的List
		 * questionnaire_type为0视为调查
		 * questionnaire_type为1视为投票
		 * questionnaire_type为2为管理问卷列表
		 */
		//分页查询设置
		int indexPage = (int)session.getAttribute("indexPage");
		indexPage=(int)session.getAttribute("pages");
		PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
		List<Questionnaire> questionnairelist = null;
		int questionnaire_type = (int)session.getAttribute("questionnaire_type");
		if(questionnaire_type == 2) {
			questionnairelist = questionnaireDAO.getAll();
		}else {
			questionnairelist = questionnaireDAO.getAllByquestionnaire_type(questionnaire_type);
		}
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(questionnairelist);
		
		model.addAttribute("questionnairelist", questionnairelist);
		session.setAttribute("lines",pageInfo.getTotal());//总记录数
		session.setAttribute("pages",pageInfo.getPages());//总页数
		session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
		if(questionnaire_type == 2) {
			return "questionnaire_listAdmin";
		}else {
			return "questionnaire_list";
		}
	}
	
	//分页操作跳转页（questionnaire_list）
	@GetMapping("/ToPageIndex/{index}")
	public String ToPageIndex(@PathVariable String index,Model model,HttpSession session) {
		/*
		 * 返回问卷列表 questionnaire_list.jsp
		 * 往model里面加调查或者投票的List
		 * questionnaire_type为0视为调查
		 * questionnaire_type为1视为投票
		 * questionnaire_type为2为管理问卷列表
		 */
		//分页查询设置
		int indexPage = (int)session.getAttribute("indexPage");
		indexPage=new Integer(index);
		int pages = (int)session.getAttribute("pages");
		indexPage = indexPage<1?1:indexPage;
		indexPage = indexPage>pages?pages:indexPage;
		PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
		List<Questionnaire> questionnairelist = null;
		int questionnaire_type = (int)session.getAttribute("questionnaire_type");
		if(questionnaire_type == 2) {
			questionnairelist = questionnaireDAO.getAll();
		}else {
			questionnairelist = questionnaireDAO.getAllByquestionnaire_type(questionnaire_type);
		}
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(questionnairelist);
		
		model.addAttribute("questionnairelist", questionnairelist);
		session.setAttribute("lines",pageInfo.getTotal());//总记录数
		session.setAttribute("pages",pageInfo.getPages());//总页数
		session.setAttribute("indexPage",pageInfo.getPageNum());//当前界面
		if(questionnaire_type == 2) {
			return "questionnaire_listAdmin";
		}else {
			return "questionnaire_list";
		}
	}
}
