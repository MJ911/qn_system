<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>join_list</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
	function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<script type="text/javascript" src="/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/sweetalert.css"/>
<script type="text/javascript" src="/js/jquery.min.js"></script>

<script> 
	$(function(){
		var message ='<%=request.getSession().getAttribute("message")%>';
		var error ='<%=request.getSession().getAttribute("error")%>';
		 if(message != "null"){
			 
			swal("Good!", message, "success");
			<%
			request.getSession().removeAttribute("message");
			%>
		 }	else if(error != "null"){
			 swal("OMG!", error, "error");
			 <%
			 request.getSession().removeAttribute("error");
			 %>
		 } 
	}); 	
</script>
<script type="text/javascript">
	function modifyQn() {
		var signal = document.getElementsByClassName("sigChoose");
		for (var i = 0; i < signal.length; i++) {
			signal[i].onclick = false;
		}
		var multi = document.getElementsByClassName("mulChoose");
		for (var i = 0; i < multi.length; i++) {
			multi[i].onclick = false;
		}
		var blank = document.getElementsByClassName("textarea");
		for (var i = 0; i < blank.length; i++) {
			blank[i].disabled = false;
		}
	}
		
	function Toquestionnaire_list(index) {
		location.href = "/qn_system/questionnaire_list/" + index;
	}
	function Toindex(){
		location.href="/qn_system/index";
	}
	function Tomodel_list(){
		location.href="/qn_system/model_list";
	}
	function Tologin(){
		location.href="/qn_system/login";
	}function Tocreate_choice(){
		location.href="/qn_system/create_choice";
	}function Topersonal() {
		location.href = "/qn_system/personal";
	}function Toquit() {
		location.href = "/qn_system/quit";
	}function ToAdmin(){
		location.href="/qn_system/admin/5";
	}
</script>
<!-- //for-mobile-apps -->
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- pignose css -->
<link href="/css/pignose.layerslider.css" rel="stylesheet"
	type="text/css" media="all" />


<!-- //pignose css -->
<link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="/js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="/js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="/js/jquery.easing.min.js"></script>
<style type="text/css">
.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 16px/100% 'Microsoft yahei', Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
}

.button:hover {
	text-decoration: none;
}

.button:active {
	position: relative;
	top: 1px;
}

.bigrounded {
	-webkit-border-radius: 2em;
	-moz-border-radius: 2em;
	border-radius: 2em;
}

.medium {
	font-size: 12px;
	padding: .4em 1.5em .42em;
}

.small {
	font-size: 11px;
	padding: .2em 1em .275em;
}
/* blue */
.blue {
	color: #d9eef7;
	border: solid 1px #0076a3;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee),
		to(#0078a5));
	background: -moz-linear-gradient(top, #00adee, #0078a5);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee',
		endColorstr='#0078a5');
}

.blue:hover {
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc),
		to(#00678e));
	background: -moz-linear-gradient(top, #0095cc, #00678e);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc',
		endColorstr='#00678e');
}

.blue:active {
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5),
		to(#00adee));
	background: -moz-linear-gradient(top, #0078a5, #00adee);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5',
		endColorstr='#00adee');
}

.inputtext {
	border: solid 1px #cdcdcd;
	padding: 3px;
	vertical-align: middle;
}
</style>
<style type="text/css">
#top {
	background-color: #213d90;
	background-color: rgba(255, 255, 255, 0.05);
}

#main {
	left: 0;
	top: 0; margin-top =0px;
	width: 100%;
	height: 980px;
	background: white;
	background-image: url(./images/ssss.jpg);
	background-size: 100%, 100%;
	background-repeat: none;
	background: rgba(255, 255, 255, 0.1);
	position: fixed;
}

#left {
	margin-left: 100px;
	margin-right: 30px;
	width: 50%;
	height: 100%;
	float: left;
}

#right {
	margin-left: 30px;
	margin-right: 100px;
	margin-top: 50px;
	width: 25%;
	height: 100%;
	float: left;
}

#foot {
	margin-top: 750px;
	width: 100%;
	height: 150px;
	background-color: rgba(0, 0, 0, 0.15);
}

#list {
	list-style: none;
	margin-left: 80px;
	margin-top: 10px;
	font-size: 20pt;
}

#div_left {
	width: 20%;
	height: 880px;
	float: left;
}

#div_middle {
	width: 60%;
	height: 880px;
	float: left;
	background-color: rgba(255, 255, 255, 0.40);
	border-radius: 30px;
}

#div_right {
	width: 20;
	height: 880px;
	float: left;
}

#footer {
	margin-top: 0px;
	text-align: center;
	weight: 100%;
	height: 20px;
}

#footer ul {
	list-style-type: none;
	overflow: hidden;
}

#footer ul li {
	display: inline;
	list-style: none;
	font-size: 10pt;
	margin-left: 30px;
	font-color: orange;
}

#div_label1 {
	margin-top: 250px;
}

#div_label2 {
	margin-top: 25px;
}

#div_blankLeft {
	width: 20%;
	height: 880px;
	float: left;
}

#div_middleofMiddle {
	width: 60%;
	height: 880px;
	float: left;
}

#div_blankRight {
	width: 20%;
	height: 880px;
	float: right;
	float: left;
}
</style>
<link href="/loginSpecial/css/demo.css" rel="stylesheet" type="text/css" />
<link href="/loginSpecial/css/loaders.css" rel="stylesheet"
	type="text/css" />
<script text="text/javascript">
	    
	</script>
</head>

<body>
	<div id="main">

		<div id="top">

			<div class="container">
				<div class="top_nav_left">
					<nav class="navbar navbar-default">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<!-- µ¼º½-->
						<div class="collapse navbar-collapse menu--shylock"
							id="bs-example-navbar-collapse-1">


							<div width="60%" style="float: left">
								<ul class="nav navbar-nav menu__list">
									<li style="color: white"
										class="active menu__item menu__item--current"><a
										class="menu__link" onclick="Toindex()">首页<span
											class="sr-only">(current)</span></a></li>
									<li id="qn" style="color: white" class=" menu__item"><a
										class="menu__link" onclick="Toquestionnaire_list(1)">投票集</a></li>
									<li style="color: white" class=" menu__item"><a
										class="menu__link" onclick="Toquestionnaire_list(0)">问卷集</a></li>
									<li style="color: white" class=" menu__item"><a
										class="menu__link" onclick="Tomodel_list()">问卷模板</a></li>
									<c:forEach items="${list_at }" var="at">
										<c:if test="${at.authority_id==6 }">
											<li style="color: white" class=" menu__item"><a
											class="menu__link" onclick="ToAdmin()">管理</a></li>
										</c:if>
									</c:forEach>

								</ul>
							</div>
							<div style="float: left; height: 1px; width: 390px">
								<div class='validation'
									style="opacity: 1; right: -5px; top: -3px;">
									<canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
								</div>

							</div>

							<%
								if (request.getSession().getAttribute("user") == null) {
							%>
							<div width="10%" style="float: left">
								<ul class="nav navbar-nav menu__list">
									<li class=" menu__item"><a class="menu__link"
										onclick="Tologin()">登录</a></li>
									<li class=" menu__item"><a class="menu__link"
										onclick="Tologin()">注册</a></li>
								</ul>
							</div>
							<%
								} else {
							%>
							<div width="10%" style="float: left">
								<ul class="nav navbar-nav menu__list">
									<li class=" menu__item"><a class="menu__link"
										onclick="Topersonal()">主页</a></li>
										<li class=" menu__item"><a class="menu__link"
										onclick="Toquit()">退出</a></li>
								</ul>
							</div>
							<%
								}
							%>
						</div>
					</div>
					</nav>
				</div>

			</div>
		</div>
		<div id="div_left"></div>

		<div id="div_middle"
			style="color: black; overflow: scroll; overflow-x: hidden;">
			<div id="div_blankLeft"></div>
			<div id="div_middleofMiddle">
				<h1
					style="text-align: center; margin-top: 40px; margin-bottom: 40px; font-weight: bold; font-size: 50px;">${questionnaire.questionnaire_name }</h1>
				<form action="/qn_system/modifyQn" method="post">

					<c:forEach items="${questionnaire.question_list}" var="question">
						<c:if test="${questionnaire.questionnaire_type==0 }">
							<h2 style="margin-top: 20px; margin-bottom: 20px;">题目${question.question_number }.&nbsp;${question.question_name}</h2>
						</c:if>
						<c:if test="${question.question_type == '1'}">
							<%--单选 --%>
							<c:forEach items="${question.options_list }" var="option">
								<h3>
									<input name="question_list[${question.question_number-1 }].answer.answer_info" class="sigChoose" type="radio" value="${option.option_number }"
										<c:if test="${option.option_number eq question.answer.answer_info}">checked='checked'</c:if>
										onclick="return false" />${option.option_number }.&nbsp;&nbsp;&nbsp;&nbsp;${option.option_name}
								</h3>
								<br>
								<input type="hidden" name="question_list[${question.question_number-1 }].question_type" value="${question.question_type }">
								<input type="hidden" name="question_list[${question.question_number-1 }].question_id" value="${question.question_id }">
							</c:forEach>
						</c:if>

						<c:if test="${question.question_type == '2'}">
							<%--多选--%>
							<c:set var="quest" value="${question.answer.answer_info}" />
							<c:set var="list" value="${question.options_list}" />
							<c:set var="size" value="${question.options_size}" />
							<%
								//String str=request.getParameter("question.answer.answer_info");
										String str = (String) pageContext.getAttribute("quest");
										int size = (int) pageContext.getAttribute("size");
										if (str != null) {
											// 										System.out.println("dafd" + str);
											List<Integer> ch = new ArrayList<Integer>();
											if(str.length()<size){
												for(int i = 0;i<size-str.length();i++){
													ch.add(0);
												}
											}
											
											for (int i = 0; i < str.length(); i++) {
												ch.add(str.charAt(i) - '0');
												// 											System.out.println("shuzo" + str.charAt(i));
											}
											pageContext.setAttribute("ch", ch);
										}
							%>

							<c:forEach items="${question.options_list}" var="option"
								varStatus="loop">
								<h3>
									<input name="question_list[${question.question_number-1 }].answer.answer_info" class="mulChoose" type="checkbox" value="${option.option_number }"
										<c:if test="${ch[loop.count-1] eq 1}">checked='checked'</c:if>
										onclick="return false" />${option.option_number }.&nbsp;&nbsp;&nbsp;${option.option_name}</h3>
								<br>
								<input type="hidden" name="question_list[${question.question_number-1 }].question_type" value="${question.question_type }">
								<input type="hidden" name="question_list[${question.question_number-1 }].question_id" value="${question.question_id }">
								<input type="hidden" name="question_list[${question.question_number-1 }].options_list[${option.option_number-1 }].option_number" value="${option.option_number }">
							</c:forEach>
						</c:if>
						<c:if test="${question.question_type == '3'}">
							<%--填空 --%>
							<textarea class="textarea" name="question_list[${question.question_number-1 }].answer.answer_info"
								style="overflow: auto; width: 95%; height: 50px; color: black; border: 2px; background-color: rgba(255, 255, 255, 0.40); font-size: 20px;"
								class="inputtext" disabled>${question.answer.answer_info}</textarea>
							<input
								name="question_list[${question.question_number-1 }].question_type"
								type="hidden" value="${question.question_type }">
							<input name="question_list[${question.question_number-1 }].question_id"
								type="hidden" value="${question.question_id }">
						</c:if>
					</c:forEach>
					<br> <input name="questionnaire_id" type="hidden"
						value="${questionnaire.questionnaire_id }"> <input
						name="user.user_id" type="hidden"
						value="${sessionScope.user.user_id}">

					<input type="button" class="button blue bigrounded" value="修改问卷" onclick="modifyQn()"/>
		 			<input type="submit" class="button blue bigrounded" value="重新提交"> 
				</form>

				

			</div>
		</div>
	</div>
	<!-- 		<div id="div_blankRight"></div> -->
	<!-- 		<div id="div_right"></div> -->
	<script src="/loginSpecial/js/Particleground.js" type="text/javascript"></script>
	<script src="/loginSpecial/js/Treatment.js" type="text/javascript"></script>
	<script src="/loginSpecial/js/controlLogin.js" type="text/javascript"></script>

</body>

</html>
