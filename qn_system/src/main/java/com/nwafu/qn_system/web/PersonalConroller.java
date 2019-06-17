package com.nwafu.qn_system.web;

import java.util.Date;
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
import com.nwafu.qn_system.entity.Options;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.entity.User;
import com.nwafu.qn_system.service.QnService;

@Controller
@RequestMapping("qn_system")
public class PersonalConroller {

	@Autowired
	private QnService qnService;

	@PostMapping("create_questionnaire")
	public String create_questionnaire(Questionnaire questionnaire, HttpSession session) {
		/*
		 * @PathVariable Questionnaire questionnaire 用户在create_questionnaire.jsp
		 * 新建问卷表单提交 questionnaire 包括question的list（前端封装） 插入数据库 返回到主页index.jsp
		 */
		System.out.print("xdx!!!");
		questionnaire.setQuestionnaire_cdate(new Date());
		System.out.println(questionnaire);
		for (int i = 0; i < questionnaire.getQuestion_list().size(); i++) {
			Question que = questionnaire.getQuestion_list().get(i);
			System.out.println(que.getQuestion_number() + " " + que.getQuestion_name() + " " + que.getQuestion_type());
			if (que.getOptions_list() != null)
				for (int j = 0; j < que.getOptions_list().size(); j++) {
					System.out.print("   ");
					Options option = que.getOptions_list().get(j);
					System.out.println(option.getOption_name() + " " + option.getOption_number());
				}
		}
		User user = (User) session.getAttribute("user");
		// System.out.println(user.getUser_name()+user.getUser_id());
		questionnaire.setUser(user);
		qnService.createQn(questionnaire);
		return "index";
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
		int pages = (int) session.getAttribute("pages");
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
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Questionnaire> joinquestionnaires = qnService.getAnsweredQns(user);
		model.addAttribute("joinquestionnaires", joinquestionnaires);
		return "join_list";
	}

	@GetMapping("/questionnaire_view/{questionnaire_id}")
	public String questionnaire_view(@PathVariable int questionnaire_id, Model model) {
		/**
		 * 用户在myquestionnaire_list.jsp点击查看该行 questionnaire_id问卷数据统计 数据存储在session中
		 * 返回到用户的该问卷详细信息questionnaire_view.jsp可视化界面显示数据 暂时搁置
		 */
		return "questionnaire_view";
	}

	@GetMapping("export_questionnaire_view")
	public void export_questionnaire_view() {
		/*
		 * 暂时搁置 统计结果导出
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
		System.out.println(questionnaire.getQuestion_list().get(0).getAnswer().getAnswer_info());
		String str = null;
		List<Question> options=new ArrayList<>();
		for (Question question : questionnaire.getQuestion_list()) {
			if(question.getQuestion_type() == '2'){
				str=Integer.toBinaryString(Integer.parseInt(question.getAnswer().getAnswer_info()));
				question.getAnswer().setAnswer_info(str);	
			}
			options.add(question);
		}
		questionnaire.setQuestion_list(options);
		model.addAttribute("questionnaire", questionnaire);
		return "join";
	}
}
