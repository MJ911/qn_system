<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.URLEncoder" %>
<%-- <%@ page language="java" contentType="application/x-msdownload" pageEncoding="UTF-8" %> --%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>questionnaire</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
		
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/sweetalert.css"/>

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

<%
	int qn_id = (int)request.getAttribute("qn");
	request.getSession().setAttribute("qn_id", qn_id);
%>

<script type="text/javascript">
	function Toquestionnaire_list(index){
		location.href="/qn_system/questionnaire_list/"+index;
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
	}function ToAdmin(){
		location.href="/qn_system/admin/14";
	}function Toquit() {
		location.href = "/qn_system/quit";
	}
	
</script>
<script src='/js/echarts.js'></script>
<script src="/js/jquery.min.js"></script>
<!-- //for-mobile-apps -->
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


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
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="/js/jquery.easing.min.js"></script>
<style type="text/css">
.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 16px/100% 'Microsoft yahei',Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
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
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
	background: -moz-linear-gradient(top,  #00adee,  #0078a5);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
}
.blue:hover {
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
	background: -moz-linear-gradient(top,  #0095cc,  #00678e);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e');
}
.blue:active {
	color: #80bed6;
	background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee));
	background: -moz-linear-gradient(top,  #0078a5,  #00adee);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee');
}
.inputtext {
    border: solid 1px #cdcdcd;
    padding: 3px;
    vertical-align: middle;
}
ul.c {list-style-type:square;}
</style>
<style type="text/css">
        #top{background-color:#213d90;background-color: rgba(255,255,255,0.05);}
        #main{left:0;top:0;margin-top=0px;width:100%;height:980px;background:white;background-image:url(./images/ssss.jpg);background-size:100%,100%;background-repeat:none;background:rgba(255,255,255,0.1);position:fixed;}
		#left{margin-left:100px;margin-right:30px;width:50%;height:100%;float:left;}
		#right{margin-left:30px;margin-right:100px;margin-top:50px;width:25%;height:100%;float:left;}
		#foot{margin-top:750px;width:100%;height:150px;background-color: rgba(0,0,0,0.15);}
		#list{list-style:none;margin-left:80px;margin-top:10px;font-size:20pt;}
		#div_left{width:20%;height:880px;float:left;}
        #div_middle{width:60%;height:880px;float:left;background-color:rgba(255,255,255,0.40);border-radius:30px;}
		#div_right{width:20;height:880px;float:left;}
		#footer{margin-top:0px;text-align:center;weight:100%;height:20px;}
		#footer ul{list-style-type:none;overflow: hidden;}
		#footer ul li{display:inline;list-style:none;font-size:10pt;margin-left:30px;font-color:orange;}
		#div_label1{margin-top:250px;}
		#div_label2{margin-top:25px;}
		#div_blankLeft{width:20%;height:880px;float:left;}
		#div_middleofMiddle{width:60%;height:880px;float:left;}
		div ul{list-style-type:square;}
		#div_blankRight{width:20%;height:880px;float:right;float:left;}
		
</style>
    <link href="/loginSpecial/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/loginSpecial/css/loaders.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		$(function() {
		    for(i=1;i<=${questionnaire.question_size};i++){
				let pie_data = echarts.init(document.getElementById("pie_data_"+i));
				
				var question= {
                	"question_id":$("#xxx1"+i).val(),
                	"question_type":$("#xxx2"+i).val()
				};
				$.ajax({
					type : "post",
                	async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                	url : "/qn_system/option",    //请求发送到相应的servlet
                	data:question,
                	dataType : "json", 
                	success:function (result) { 
                    	pie_data.setOption({
                    	    title : {
                    	        text: '同名数量统计',
                    	        subtext: '纯属虚构',
                    	        x:'center'
                    	    },
                    	    tooltip : {
                    	        trigger: 'item',
                    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    	    },
                    	    legend: {
                    	        type: 'scroll',
                    	        orient: 'vertical',
                    	        right: 10,
                    	        top: 20,
                    	        bottom: 20,
                    	        data: result,
                    	    },
                    	    series : [
                    	        {
                    	            name: '姓名',
                    	            type: 'pie',
                    	            radius : '55%',
                    	            center: ['40%', '50%'],
                    	            data: result,
                    	            itemStyle: {
                    	                emphasis: {
                    	                    shadowBlur: 10,
                    	                    shadowOffsetX: 0,
                    	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                    	                }
                    	            }
                    	        }
                    	    ]
                    	});
                },
		});
		// 	;
        }
	});
	</script>
</head>

<body>
<div id="main" > 

    <div id="top">
	
	    <div class="container">
		<div class="top_nav_left">
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
				</div>
				<!-- 导航-->
				<div  class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
				  
					
					<div width="60%" style="float:left">
					    <ul class="nav navbar-nav menu__list">
					        <li style="color:white" class="active menu__item menu__item--current"><a class="menu__link" onclick="Toindex()">首页<span class="sr-only">(current)</span></a></li>				
							<li id="qn"style="color:white" class=" menu__item"><a class="menu__link" onclick="Toquestionnaire_list(1)">投票集</a></li>
							<li style="color:white" class=" menu__item"><a class="menu__link" onclick="Toquestionnaire_list(0)">问卷集</a></li>
					        <li style="color:white" class=" menu__item"><a class="menu__link" onclick="Tomodel_list()">问卷模板</a></li>
					        <c:forEach items="${list_at }" var="at">
										<c:if test="${at.authority_id==6 }">
											<li style="color: white" class=" menu__item"><a
											class="menu__link" onclick="ToAdmin()">管理</a></li>
										</c:if>
							</c:forEach>

					    </ul>
					</div>
					<div style="float:left; height:1px;width:390px">
						<div class='validation' style="opacity: 1; right: -5px;top: -3px;">
							<canvas  class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
						</div>

				    </div>
                    
					<%
								if(request.getSession().getAttribute("user")==null){
							 %>
							<div width="10%" style="float:left">
								<ul class="nav navbar-nav menu__list">
									<li class=" menu__item"><a class="menu__link"
										onclick="Tologin()">登录</a></li>
									<li class=" menu__item"><a class="menu__link"
										onclick="Tologin()">注册</a></li>
								</ul>
							</div>
							<%} else{%>
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
    <div id="div_left">
    </div>
    
    <div id="div_middle" style="color:black;overflow:scroll;overflow-x:hidden;">
       <div id="div_blankLeft"></div>
	   <div id="div_middleofMiddle">
	   <h1 style="text-align:center;margin-top:40px;margin-bottom:40px;font-weight:bold;font-size:50px;">${questionnaire.questionnaire_name }<br/>(统计结果)</h1>
	   <input type="hidden" id="qn_id" value="${questionnaire.questionnaire_id }"/>
	   <form action="/qn_system/questionnaire_list" method="post">
	   
	   <c:set var="num" scope="request" value="${questionnaire.question_size}" />
	   	<c:forEach items="${questionnaire.question_list}" var="question" varStatus="loop">
	   		<h2 style="margin-top:20px;margin-bottom:20px;">题目${question.question_number }&nbsp;.${question.question_name}</h2>
 	   		<c:if test="${question.question_type == '1'}"><%--当前为单选题 --%>
	   			<c:forEach items="${question.options_list }" var="option">
	   				<h3 style="color:pink">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${option.option_number }.&nbsp;&nbsp;&nbsp;&nbsp;${option.option_name} &nbsp;&nbsp;
	   				(${option.option_rate} %)<br></h3>
	   			</c:forEach>
	   		</c:if>
	   		
	   		<c:if test="${question.question_type == '2'}"><%--当前为多选题 --%>
	   			<c:forEach items="${question.options_list }" var="option" >
	   				<h3 style="color:pink">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${option.option_number }.&nbsp;&nbsp;&nbsp;&nbsp;${option.option_name} &nbsp;&nbsp;
	   				(${option.option_rate} %)<br></h3>
	   			</c:forEach>
	   		</c:if>
	   		<c:if test="${question.question_type != '3'}">
	   		     	
	   		        <div id="pie_data_${loop.count}"  style="width: 800px; height: 300px;"></div>
	            	<input id="xxx1${loop.count}" type="hidden" value="${question.question_id}"/ >
	            	<input id="xxx2${loop.count}" type="hidden" value="${question.question_type}" />

	   		</c:if>
	   		
	   		<c:if test="${question.question_type == '3'}"><%--当前为填空题 --%>
	   			<ul style="list-style-type:circle;list-style-position:inherit;">
	   				<c:forEach items = "${question.question_answer }" var = "answer">
	   					<li><h3 style="color:pink">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--&nbsp;&nbsp;${answer.answer_info }</h3></li>
					</c:forEach>
				</ul>
	   			
	   		</c:if>
	   	</c:forEach><br>
	   <font >	<a href = "/qn_system/download/${questionnaire.questionnaire_id}">导出到文件</a></font>
	   	
	   </form>
	  

	
	 
	   </div>
	   <div id="div_blankRight"></div>
    </div>
    <div id="div_right">
    </div>
    
</div>
<script src="/loginSpecial/js/Particleground.js" type="text/javascript"></script>
<script src="/loginSpecial/js/Treatment.js" type="text/javascript"></script>
<script src="/loginSpecial/js/controlLogin.js" type="text/javascript"></script>

</body>

</html>
