<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>CreateModelOne</title>
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
	int qn_id = (int)request.getAttribute("model_qn_id");
	int qn_type = (int)request.getAttribute("model_qn_type");
	request.getSession().setAttribute("model_qn_id", qn_id);
	request.getSession().setAttribute("model_qn_type", qn_type);
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
	}function Toquit() {
		location.href = "/qn_system/quit";
	}function ToAdmin(){
		location.href="/qn_system/admin/12";
	}
</script>
<!-- //for-mobile-apps -->
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


<!-- //pignose css -->
<link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
        #top{background-color:#213d90;background-color: rgba(255,255,255,0.05);}
        #main{left:0;top:0;margin-top=0px;width:100%;height:980px;background:white;background-image:url(./images/ssss.jpg);background-size:100%,100%;background-repeat:none;background:rgba(255,255,255,0.1);position:fixed;}
		
		#list{list-style:none;margin-left:80px;margin-top:10px;font-size:20pt;}
		#div_left{width:20%;height:850px;float:left;}
        #div_middle{width:60%;height:880px;float:left;background-color:rgba(255,255,255,0.40);border-radius:30px;}
		#div_right{width:20%;height:850px;float:left;}

</style>
    <link href="/loginSpecial/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/loginSpecial/css/loaders.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/css/questionnaire.css">
    <script src="/js/createquestionnaire.js"></script>
	<script src="/js/jquery.min.js"></script>

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
</style>
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
							<% } %>
				</div>				
			  </div>
			</nav>	
		</div>
		
	    </div>
    </div>
    <div id="div_left">
    </div>
    <div id="div_middle">
	    <iframe id="iframe1" frameboder="no" border="0" src="/qn_system/modelVote/${model_qn_id }" style="width:100%;height:100%;"> </iframe>   
        
	</div>
    <div id="div_right">
    </div>
    
</div>
<script src="/loginSpecial/js/Particleground.js" type="text/javascript"></script>
<script src="/loginSpecial/js/Treatment.js" type="text/javascript"></script>
<script src="/loginSpecial/js/controlLogin.js" type="text/javascript"></script>

</body>

</html>
