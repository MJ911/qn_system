package com.nwafu.qn_system.web;

import java.io.File;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.nwafu.qn_system.entity.Options;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.service.QnService;
import com.nwafu.qn_system.service.StatisticsService;

@Controller
@RequestMapping("qn_system")
public class PersonalConroller {

	@Autowired
	private QnService qnService;
	@Autowired
	private StatisticsService statisticsService;
	
	@PostMapping("create_questionnaire")
	public String create_questionnaire(Questionnaire questionnaire, HttpSession session, HttpServletRequest request) {
		/*
		 * @PathVariable Questionnaire questionnaire
		 * 用户在create_questionnaire.jsp 新建问卷表单提交
		 * questionnaire 包括question的list（前端封装）
		 * 插入数据库
		 * 返回到主页index.jsp
		 */
		String obj = (String)request.getParameter("questionnaire_xdx");
		System.out.println(obj);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		ParsePosition pos = new ParsePosition(0);
		Date f_date = formatter.parse(obj, pos);
		questionnaire.setQuestionnaire_fdate(f_date);
		questionnaire.setQuestionnaire_cdate(new Date());
		System.out.println(questionnaire);
//		for(int i = 0;i<questionnaire.getQuestion_list().size();i++) {
//			Question que = questionnaire.getQuestion_list().get(i);
//			System.out.println(que.getQuestion_number()+" "+que.getQuestion_name()+" "+que.getQuestion_type());
//			if(que.getOptions_list()!=null)
//			for(int j=0;j<que.getOptions_list().size();j++) {
//				System.out.print("   ");
//				Options option = que.getOptions_list().get(j);
//				System.out.println(option.getOption_name()+" "+option.getOption_number());
//			}
//		}
		User user = (User) session.getAttribute("user");
//		System.out.println(user.getUser_name()+user.getUser_id());
		questionnaire.setUser(user);
		qnService.createQn(questionnaire);
		if(questionnaire.getQuestionnaire_type()==0)
			return "createSerch";
		else {
			return "createVote";
		}
	}
	
	
	@GetMapping("/create_questionnaire/{questionnaire_type}")
	public String create_questionnaire(@PathVariable int questionnaire_type) {
		/*
		 * 用户从personal.jsp/index.jsp点击创建跳转到create_questionnaire.jsp
		 * questionnaire_type判断01生成问卷类型
		 */
		// if判断返回不同的创建页面 调查为0 & 投票为1 创建页面
		if (questionnaire_type == 0) {
			System.out.println("强哥!");
			return "create_questionnaire_many";
		}
		return "create_questionnaire_one";
	}

	@GetMapping("/createSerch")
	public String createSerch() {
		return "createSerch";
	}

	@GetMapping("/createVote")
	public String createVote() {
		return "createVote";
	}

	@GetMapping("myquestionnaire_list")
	public String myquestionnaire_list(HttpSession session, Model model) {
		/*
		 * 用户从personal.jsp点击参与问卷创建跳转到myquestionnaire_list.jsp
		 */
		// 分页查询设置
		PageHelper.startPage(1, 10);// 设置分页，参数1=页数，参数2=每页显示条数
		User user = (User) session.getAttribute("user");
		List<Questionnaire> myquestionnaires = qnService.getCreatedQns(user);
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(myquestionnaires);

		session.setAttribute("lines", pageInfo.getTotal());// 总记录数
		session.setAttribute("pages", pageInfo.getPages());// 总页数
		session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
		model.addAttribute("myquestionnaires", myquestionnaires);
		return "myquestionnaire_list";
	}

	// 分页操作下一页（myquestionnaire_list）
	@GetMapping("myNextPage")
	public String NextPage(Model model, HttpSession session) {
		/*
		 * 返回问卷列表 myquestionnaire_list.jsp 往model里面加调查或者投票的List
		 */
		// 分页查询设置
		int indexPage = (int) session.getAttribute("indexPage");
		int pages = (int) session.getAttribute("pages");
		indexPage++;
		indexPage = indexPage > pages ? pages : indexPage;
		PageHelper.startPage(indexPage, 10);// 设置分页，参数1=页数，参数2=每页显示条数
		User user = (User) session.getAttribute("user");
		List<Questionnaire> myquestionnaires = qnService.getCreatedQns(user);
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(myquestionnaires);

		model.addAttribute("myquestionnaires", myquestionnaires);
		session.setAttribute("lines", pageInfo.getTotal());// 总记录数
		session.setAttribute("pages", pageInfo.getPages());// 总页数
		session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
		return "myquestionnaire_list";
	}

	// 分页操作上一页（myquestionnaire_list）
	@GetMapping("myPrePage")
	public String myPrePage(Model model, HttpSession session) {
		/*
		 * 返回问卷列表 myquestionnaire_list.jsp 往model里面加调查或者投票的List
		 */
		// 分页查询设置
		int indexPage = (int) session.getAttribute("indexPage");
		indexPage--;
		indexPage = indexPage < 1 ? 1 : indexPage;
		PageHelper.startPage(indexPage, 10);// 设置分页，参数1=页数，参数2=每页显示条数
		User user = (User) session.getAttribute("user");
		List<Questionnaire> myquestionnaires = qnService.getCreatedQns(user);
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(myquestionnaires);

		model.addAttribute("myquestionnaires", myquestionnaires);
		session.setAttribute("lines", pageInfo.getTotal());// 总记录数
		session.setAttribute("pages", pageInfo.getPages());// 总页数
		session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
		return "myquestionnaire_list";
	}

	// 分页操作首页（myquestionnaire_list）
	@GetMapping("TomyPageFirst")
	public String TomyPageFirst(Model model, HttpSession session) {
		/*
		 * 返回问卷列表 myquestionnaire_list.jsp 往model里面加调查或者投票的List
		 */
		// 分页查询设置
		int indexPage = (int) session.getAttribute("indexPage");
		indexPage = 1;
		PageHelper.startPage(indexPage, 10);// 设置分页，参数1=页数，参数2=每页显示条数
		User user = (User) session.getAttribute("user");
		List<Questionnaire> myquestionnaires = qnService.getCreatedQns(user);
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(myquestionnaires);

		model.addAttribute("myquestionnaires", myquestionnaires);
		session.setAttribute("lines", pageInfo.getTotal());// 总记录数
		session.setAttribute("pages", pageInfo.getPages());// 总页数
		session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
		return "myquestionnaire_list";
	}

	// 分页操作尾页（myquestionnaire_list）
	@GetMapping("TomyPageEnd")
	public String TomyPageEnd(Model model, HttpSession session) {
		/*
		 * 返回问卷列表 myquestionnaire_list.jsp 往model里面加调查或者投票的List
		 */
		// 分页查询设置
		int indexPage = (int) session.getAttribute("indexPage");
		indexPage = (int) session.getAttribute("pages");
		PageHelper.startPage(indexPage, 10);// 设置分页，参数1=页数，参数2=每页显示条数
		User user = (User) session.getAttribute("user");
		List<Questionnaire> myquestionnaires = qnService.getCreatedQns(user);
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(myquestionnaires);

		model.addAttribute("myquestionnaires", myquestionnaires);
		session.setAttribute("lines", pageInfo.getTotal());// 总记录数
		session.setAttribute("pages", pageInfo.getPages());// 总页数
		session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
		return "myquestionnaire_list";
	}

	// 分页操作指定页（myquestionnaire_list）
	@GetMapping("/TomyPageIndex/{index}")
	public String TomyPageIndex(@PathVariable String index,Model model, HttpSession session) {
		/*
		 * 返回问卷列表 myquestionnaire_list.jsp 往model里面加调查或者投票的List
		 */
		// 分页查询设置
		int indexPage = (int) session.getAttribute("indexPage");
		indexPage=new Integer(index);
		int pages = (int)session.getAttribute("pages");
		indexPage = indexPage<1?1:indexPage;
		indexPage = indexPage>pages?pages:indexPage;
		PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
		User user = (User) session.getAttribute("user");
		List<Questionnaire> myquestionnaires = qnService.getCreatedQns(user);
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(myquestionnaires);

		model.addAttribute("myquestionnaires", myquestionnaires);
		session.setAttribute("lines", pageInfo.getTotal());// 总记录数
		session.setAttribute("pages", pageInfo.getPages());// 总页数
		session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
		return "myquestionnaire_list";
	}

	@GetMapping("join_list")
	public String join_list(HttpSession session, Model model) {
		/**
		 * 用户从personal.jsp点击参与问卷创建跳转到join_list.jsp
		 */
		PageHelper.startPage(1, 10);// 设置分页，参数1=页数，参数2=每页显示条数
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Questionnaire> joinquestionnaires = qnService.getAnsweredQns(user);
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(joinquestionnaires);

		session.setAttribute("lines", pageInfo.getTotal());// 总记录数
		session.setAttribute("pages", pageInfo.getPages());// 总页数
		session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
		model.addAttribute("joinquestionnaires", joinquestionnaires);
		return "join_list";
	}
	
	//join_list分页下一页请求
	@GetMapping("joinNextPage")
	public String joinNextPage(HttpSession session, Model model) {
		// 分页查询设置
		int indexPage = (int) session.getAttribute("indexPage");
		int pages = (int) session.getAttribute("pages");
		indexPage++;
		indexPage = indexPage > pages ? pages : indexPage;
		PageHelper.startPage(indexPage, 10);// 设置分页，参数1=页数，参数2=每页显示条数
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Questionnaire> joinquestionnaires = qnService.getAnsweredQns(user);
		PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(joinquestionnaires);

		session.setAttribute("lines", pageInfo.getTotal());// 总记录数
		session.setAttribute("pages", pageInfo.getPages());// 总页数
		session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
		model.addAttribute("joinquestionnaires", joinquestionnaires);
		return "join_list";
	}
	//join_list分页上一页请求
		@GetMapping("joinPrePage")
		public String joinPrePage(HttpSession session, Model model) {
			// 分页查询设置
			int indexPage = (int) session.getAttribute("indexPage");
			indexPage--;
			indexPage = indexPage < 1 ? 1 : indexPage;
			PageHelper.startPage(indexPage, 10);// 设置分页，参数1=页数，参数2=每页显示条数
			User user = (User) session.getAttribute("user");
			System.out.println(user);
			List<Questionnaire> joinquestionnaires = qnService.getAnsweredQns(user);
			PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(joinquestionnaires);

			session.setAttribute("lines", pageInfo.getTotal());// 总记录数
			session.setAttribute("pages", pageInfo.getPages());// 总页数
			session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
			model.addAttribute("joinquestionnaires", joinquestionnaires);
			return "join_list";
		}
		//join_list分页首页请求
		@GetMapping("TojoinPageFirst")
		public String TojoinPageFirst(HttpSession session, Model model) {
			// 分页查询设置
			int indexPage = (int) session.getAttribute("indexPage");
			indexPage=1;
			PageHelper.startPage(indexPage, 10);// 设置分页，参数1=页数，参数2=每页显示条数
			User user = (User) session.getAttribute("user");
			System.out.println(user);
			List<Questionnaire> joinquestionnaires = qnService.getAnsweredQns(user);
			PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(joinquestionnaires);

			session.setAttribute("lines", pageInfo.getTotal());// 总记录数
			session.setAttribute("pages", pageInfo.getPages());// 总页数
			session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
			model.addAttribute("joinquestionnaires", joinquestionnaires);
			return "join_list";
		}
		//join_list分页尾页请求
		@GetMapping("TojoinPageEnd")
		public String TojoinPageEnd(HttpSession session, Model model) {
			// 分页查询设置
			int indexPage = (int) session.getAttribute("pages");

			PageHelper.startPage(indexPage, 10);// 设置分页，参数1=页数，参数2=每页显示条数
			User user = (User) session.getAttribute("user");
			System.out.println(user);
			List<Questionnaire> joinquestionnaires = qnService.getAnsweredQns(user);
			PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(joinquestionnaires);

			session.setAttribute("lines", pageInfo.getTotal());// 总记录数
			session.setAttribute("pages", pageInfo.getPages());// 总页数
			session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
			model.addAttribute("joinquestionnaires", joinquestionnaires);
			return "join_list";
		}	
		
		// join_list分页操作指定页
		@GetMapping("/TojoinPageIndex/{index}")
		public String TojoinPageIndex(@PathVariable String index,Model model, HttpSession session) {
			/*
			 * 返回问卷列表 myquestionnaire_list.jsp 往model里面加调查或者投票的List
			 */
			// 分页查询设置
			int indexPage = (int) session.getAttribute("indexPage");
			indexPage=new Integer(index);
			int pages = (int)session.getAttribute("pages");
			indexPage = indexPage<1?1:indexPage;
			indexPage = indexPage>pages?pages:indexPage;
			PageHelper.startPage(indexPage,10);// 设置分页，参数1=页数，参数2=每页显示条数
			User user = (User) session.getAttribute("user");
			List<Questionnaire> joinquestionnaires = qnService.getAnsweredQns(user);
			PageInfo<Questionnaire> pageInfo = new PageInfo<Questionnaire>(joinquestionnaires);

			session.setAttribute("lines", pageInfo.getTotal());// 总记录数
			session.setAttribute("pages", pageInfo.getPages());// 总页数
			session.setAttribute("indexPage", pageInfo.getPageNum());// 当前界面
			model.addAttribute("joinquestionnaires", joinquestionnaires);
			return "join_list";
		}
		
	@GetMapping("/questionnaire_view/{questionnaire_id}")
	public String questionnaire_view(@PathVariable int questionnaire_id,Model model) {
		/**
		 * 用户在myquestionnaire_list.jsp点击查看该 questionnaire_id问卷数据统计
		 * 统计信息封装在Questionnaire对象中返回，在用户的该问卷详细信息questionnaire_view.jsp可视化界面显示数据
		 */
		Questionnaire questionnaire = statisticsService.exportQn(questionnaire_id);
		model.addAttribute("questionnaire", questionnaire);
		model.addAttribute("qn", questionnaire_id);
		
		
		return "questionnaire_view";
	}
	
	@GetMapping("export_questionnaire_view{questionnaire_id}")
	public void export_questionnaire_view(@PathVariable int questionnaire_id,Model model) {
		/*
		 * 尚未实现
		 * 统计结果导出
		 */
	}

	@GetMapping("/join/{questionnaire_id}")
	public String join(@PathVariable int questionnaire_id, Model model, HttpSession session) {
		/*
		 * 用户从join_list.jsp点击查看所参与的该问卷的信息
		 * 返回到用户的该问卷详细信息 问卷题目+答案
		 * 暂时搁置
		 */
		
		Questionnaire questionnaire = qnService.getAnseredQn((User)session.getAttribute("user"),questionnaire_id);
//		System.out.println(questionnaire.getQuestion_list().get(0).getAnswer().getAnswer_info());
		String str = null;
		List<Question> options=new ArrayList<>();
		
		for (Question question : questionnaire.getQuestion_list()) {
			if(question.getQuestion_type() == 2){
				//答案判空
				if(question.getAnswer().getAnswer_info()!=null) {
					str=Integer.toBinaryString(Integer.parseInt(question.getAnswer().getAnswer_info()));
					System.out.println("测试"+str);
					question.getAnswer().setAnswer_info(str);	
				}
			}
			options.add(question);
		}
		questionnaire.setQuestion_list(options);
		model.addAttribute("questionnaire", questionnaire);
		return "join";
	}
}
