<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Home</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
		
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
	}
</script>
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
        #top{background-color:#213d90;background-color: rgba(255,255,255,0.05);}
        #main{left:0;top:0;margin-top=0px;width:100%;height:980px;background:white;background-image:url(./images/ssss.jpg);background-size:100%,100%;background-repeat:none;background:rgba(255,255,255,0.1);position:fixed;}
		#left{margin-left:100px;margin-right:30px;width:50%;height:100%;float:left;}
		#right{margin-left:30px;margin-right:100px;margin-top:50px;width:25%;height:100%;float:left;}
		#foot{margin-top:750px;width:100%;height:150px;background-color: rgba(0,0,0,0.15);}
		#list{list-style:none;margin-left:80px;margin-top:10px;font-size:20pt;}
		#div_left{width:30%;height:750px;float:left;}
        #div_middle{text-align:center;width:40%;height:750px;float:left;background-color:rgba(255,255,255,0.00);border-radius:30px;}
		#div_right{width:30%;height:750px;float:left;}
		#footer{margin-top:0px;text-align:center;weight:100%;height:20px;}
		#footer ul{list-style-type:none;overflow: hidden;}
		#footer ul li{display:inline;list-style:none;font-size:10pt;margin-left:30px;font-color:orange;}
		#div_label1{margin-top:250px;}
		#div_label2{margin-top:25px;}

</style>
    <link href="/loginSpecial/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/loginSpecial/css/loaders.css" rel="stylesheet" type="text/css" />
	<script text="text/javascript">
	    
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
					        <li style="color:white" class=" menu__item"><a class="menu__link" onclick="Toindex()">帮助</a></li>

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
							<div width="10%" style="float:left">
								<ul class="nav navbar-nav menu__list">
									<li class=" menu__item"><a class="menu__link"
										onclick="Topersonal()">个人主页</a></li>
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
	    <div id="div_label1">
	        <ul style="list-style-type:none">
			     <div id="div_label2">
					 <li>
					    <font size="10px" color="white">不止问卷调查 / 在线考试</font>
					 </li>			
			     <div id="div_label2">
				 <div id="div_label2">
					 <li>
					    <font size="5px" color="orange">4,125 28.35</font>
						<font size="5px" color="white"> 万用户已在问卷强上回收或作答</font>
						<font size="5px" color="orange">28.35</font>
						<font size="5px" color="white">亿份答卷</font>
					 </li>			
			     <div id="div_label2">
				     <li align="center">
				         <input type="submit" id="button" value="立即使用" style="border:none;width:200px;height:50px;border-radius:30px;background:orange;color:white;size=6px" onclick="Tocreate_choice()"/>
					</li>
				 </div>
			</ul>
	    </div>
    </div>
    <div id="div_right">
    </div>
    <div id="foot">  
	    <div id="footer">
	    <ul>
		    <li style="color:white">京网文[2018]6767-101号</li>
			<li style="color:white">中国互联网诚信联盟</li>
			<li style="color:white">出版物经营许可证</li>
			<li style="color:white">信息网络传播视听节目许可证088433号</li>
			<li style="color:white">广播电视节目制作经营许可(京)字第1763号</li>
			<li style="color:white">京ICP证12138号</li>
			<li style="color:white">经营性网站备案信息</li>
		
		</ul>
	    </div>

        <div id="footer">
	    <ul >
		    <li style="color:white">京公网备126487212号</li>
			<li style="color:white">增值电信业务经营许可证B2-212212138</li>
			<li style="color:white">互联网药品信息服务证书(京)2014-3-04</li>
			<li style="color:white">食品经营许可证JY1176668382008</li>
		</ul>
	    </div>
	    <div id="footer">
	    <ul >
		    <li style="color:white">中国互联网举报中心</li>
			<li style="color:white">网络举报app下载</li>
			<li style="color:white">反盗版和反盗链权利声明</li>
			<li style="color:white">违法和不良信息举报电话400-923-7171</li>
			<li style="color:white">举报邮箱jubao@qiyi.com</li>
				
		</ul>
	    </div>

	    <div id="footer">
	    <ul>
		    
			<li style="color:white">版权所有，盗版必究</li>
		
		</ul>
	    </div>

	    <div id="footer" style="opacity: 1; right: -5px;top: -3px;">
	    <ul>
			<li><font color="orange">Copyright©2019 第三组 All Rights Reserved</font></li>
		
		</ul>
	
	    </div>
    </div>
</div>
<script src="/loginSpecial/js/Particleground.js" type="text/javascript"></script>
<script src="/loginSpecial/js/Treatment.js" type="text/javascript"></script>
<script src="/loginSpecial/js/controlLogin.js" type="text/javascript"></script>

</body>

</html>
