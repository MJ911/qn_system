<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>personal</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
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
		#div_left{width:30%;height:850px;float:left;}
        #div_middle{margin-top:10px;text-align:center;width:50%;height:870px;float:left;background-color:rgba(255,255,255,0);border-radius:30px;}
		#div_right{width:20%;height:850px;float:left;}
        .div_middle_top{margin:20px;width=100%;height:20%;background-color: rgba(255,255,255,0.0);border-radius:30px;}
		.div_middle_down{margin:10px;width=100%;height:70%;background-color: rgba(255,255,255,0.0);border-radius:30px;}
		.div_middle_down_left{margin:20px;width:20%;height:100%;background-color: rgba(255,255,255,0.0);border-radius:30px;float:left;}
		.div_middle_down_right{margin:20px;width:62%;height:100%;background-color: rgba(255,255,255,0.0);border-radius:30px;float:left;}
		.div_icon{margin:10px;width:15%;height:90%;background-image:url(./images/icon.png);background-size:90%;90%;background-repeat:no-repeat;float:left}
		.div_intro{margin:10px;width:60%;height:80%;background-color: rgba(255,255,255,0);float:left;border-radius:30px;}
        .ui{width:700px;height:40px;list-style: none;margin:5px;padding:0;}
        .ui li{ width:60px;margin:0px;float: left;font-size:16px;font-color:#000;}
		.ui_left{margin:10;}
		.ui_left li{margin-top:20px;}
</style>
    <link href="/loginSpecial/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/loginSpecial/css/loaders.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/css/questionnaire.css">
    <script src="/js/createquestionnaire.js"></script>
	<script src="/js/jquery.min.js"></script>
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
	}function TomyquestionnaireLis() {
		location.href = "/qn_system/myquestionnaire_list";
	}function ToJoinquestionnaireLis() {
		location.href = "/qn_system/join_list";
	}
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
									<li style="color: white" class=" menu__item"><a
										class="menu__link" onclick="Toindex()">帮助</a></li>

								</ul>
							</div>
					<div style="float:left; height:1px;width:390px">
						<div class='validation' style="opacity: 1; right: -5px;top: -3px;">
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
    <div id="div_left">
    </div>
    <div id="div_middle">
	    <div class="div_middle_top">
		    <div class="div_icon">
			</div>
			<div class="div_intro">
			    <ul class="ui">
				    <li style="width:200px;text-align:left;font-size:20px;">用户名:</li>    
				</ul>
				<ul class="ui">
				    <li style="width:200px;text-align:left;font-size:20px;">个性签名：</li>    
				</ul>
			    <ul class="ui">
				    <li>主页</li>
                    <li>日志</li>
                    <li>相册</li>
                    <li>留言板</li>
                    <li>说说</li>
					<li>个人档</li>
					<li>音乐</li>
					<li>更多</li>
				</ul>
			</div>
			
		</div>

		<div class="div_middle_down">
		    <div class="div_middle_down_left">
			    <ul class="ui_left">
				    <li><input onclick="TomyquestionnaireLis()" type="button" value="我创建的"style="border:none;width:200px;height:50px;border-radius:30px;background:orange;color:white;size:16px;background-color: rgba(250,128,114,0.5);" ></li>
					<li><input onclick="ToJoinquestionnaireLis()" type="button" value="我参与的"style="border:none;width:200px;height:50px;border-radius:30px;background:orange;color:white;size:16px;background-color: rgba(250,128,114,0.5);" ></li>
					<li><input type="button" value="修改信息"style="border:none;width:200px;height:50px;border-radius:30px;background:orange;color:white;size:16px;background-color: rgba(250,128,114,0.5);" ></li>
					<li><input type="button" value="更多设置"style="border:none;width:200px;height:50px;border-radius:30px;background:orange;color:white;size:16px;background-color: rgba(250,128,114,0.5);" ></li>
					<li><input type="button" value="修改密码"style="border:none;width:200px;height:50px;border-radius:30px;background:orange;color:white;size:16px;background-color: rgba(250,128,114,0.5);" ></li>
				</ul>
			</div>

			<div class="div_middle_down_right">

			</div>
		</div>
        
	</div>
    <div id="div_right">
    </div>
    
</div>
<script src="/loginSpecial/js/Particleground.js" type="text/javascript"></script>
<script src="/loginSpecial/js/Treatment.js" type="text/javascript"></script>
<script src="/loginSpecial/js/controlLogin.js" type="text/javascript"></script>

</body>

</html>
