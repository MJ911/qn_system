<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>login</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}


</script>
<!-- //for-mobile-apps -->
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- pignose css -->
<link href="/css/pignose.layerslider.css" rel="stylesheet"
	type="text/css" media="all" />


<!-- //pignose css -->
<link href="/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
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
	background-image: url(./images/Starry.jpg);
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

#list {
	list-style: none;
	margin-left: 80px;
	margin-top: 10px;
	font-size: 20pt;
}

#div_left {
	width: 37%;
	height: 750px;
	float: left;
}

#div_middle {
	margin-top: 180px;
	text-align: center;
	width: 26%;
	height: 550px;
	float: left;
	background-color: rgba(255, 255, 255, 0.9);
	border-radius: 30px;
}

#div_middle_rig {
	margin-top: 180px;
	text-align: center;
	width: 26%;
	height: 550px;
	float: left;
	background-color: rgba(255, 255, 255, 0.9);
	border-radius: 30px;
	display: none;
}

#div_right {
	width: 37%;
	height: 750px;
	float: left;
}

#div_label1 {
	margin-top: 100px;
}

#div_label2 {
	margin-top: 30px;
}

#div_label3 {
	margin-top: 10px;
}
</style>
<link href="/loginSpecial/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="/loginSpecial/css/loaders.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	$(function() {
		// 		$("#div_middle_rig").hide();
		$("#button_log").click(function() {
			$("#div_middle").show();
			$("#div_middle_rig").hide();
		});
		$("#button_rigester").click(function() {
			$("#div_middle").hide();
			$("#div_middle_rig").show();
		});
	});
	function Toquestionnaire_list(index) {
		location.href = "/qn_system/questionnaire_list/" + index;
	}
	function Toindex() {
		location.href = "/qn_system/index";
	}
	function Tomodel_list() {
		location.href = "/qn_system/model_list";
	}
	function Tologin() {
		location.href = "/qn_system/login";
	}
	function Topersonal() {
		location.href = "/qn_system/personal";
	}
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
						<!-- ����-->
						<div class="collapse navbar-collapse menu--shylock"
							id="bs-example-navbar-collapse-1">


							<div width="60%" style="float: left">
								<ul class="nav navbar-nav menu__list">
									<li style="color: white"
										class="active menu__item menu__item--current"><a
										class="menu__link" onclick="Toindex()">主页<span
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
										onclick="Topersonal()">个人主页</a></li>
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

		<div id="div_middle_rig">
			<div id="div_label1">
				<ul style="list-style-type: none">

					<div id="div_label2">
						<li><font size="5px" color="orange">欢迎注册问卷强</font></li>
					</div>


					<form action="/qn_system/register"  method="post">
						<div id="div_label2">
							<li><font size="5px" color="black">用户名：</font> <input
								name="user_name" type="text" height="10" style="color: black" /></li>
						</div>
						<div id="div_label2">
							<li><font size="5px" color="black">密&nbsp;&nbsp;&nbsp;码：</font>
								<input name="user_password" type="password" height="10" style="color: black" /></li>
						</div>
						<div id="div_label2">
							<li><font size="5px" color="black">确认密码：</font> <input
								type="password" height="10" style="color: black" /></li>
						</div>
						<div id="div_label2">
							<li><font size="5px" color="black">邮&nbsp;&nbsp;&nbsp;箱：</font>
								<input name="user_mail" type="text" height="10" style="color: black" /></li>
						</div>
						<div id="div_label2">
							<li align="center"><input type="submit" id="button_rig"
								value="立即注册"
								style="border: none; width: 200px; height: 50px; border-radius: 30px; background: orange; color: white;size=6px" />
							</li>
						</div>
						<div id="div_label3">
							<li align="center"><input type="submit" id="button_log"
								value="已有账号"
								style="border: none; width: 200px; height: 50px; border-radius: 30px; background: white; color: orange;size=6px" />
							</li>
						</div>
					</form>
				</ul>

			</div>

		</div>

		<div id="div_middle">
			<div id="div_label1">
				<ul style="list-style-type: none">
					<div id="div_label2">
						<li><font size="5px" color="orange">欢迎登录问卷强</font></li>
					</div>

					<form action="/qn_system/login" method="post">

						<div id="div_label2">

							<li><font size="5px" color="black">用户名：</font> <input
								name="user_name" "type="text" height="10" style="color: black" />
							</li>
						</div>
						<div id="div_label2">
							<li><font size="5px" color="black">密&nbsp;&nbsp;&nbsp;码：</font>
								<input name="user_password" type="password" height="10"
								style="color: black" /></li>
						</div>
						<div id="div_label2">
							<li><input name="Fruit" type="checkbox" value="" /><font
								size="1px" color="black">下次自动登录</font></li>
						</div>
						<div id="div_label2">
							<li align="center"><input type="submit" id="button_login"
								value="立即登录"
								style="border:none;width:200px;height:50px;border-radius:30px;background:orange;color:white;size=6px" />
							</li>
						</div>
						<div id="div_label3">
							<li align="center"><input type="button" id="button_rigester"
								value="立即注册"
								style="border: none; width: 200px; height: 50px; border-radius: 30px; background: white; color: orange;size=6px" />
							</li>
						</div>

					</form>

					<div id="div_label2">
						<listyle"text-decoration:underline"> <font size="1px"
							color="black">忘记用户名/密码?</font>
						</li>
					</div>
				</ul>
			</div>
		</div>
		<div id="div_right"></div>

	</div>
	<script src="/loginSpecial/js/Particleground.js"
		type="text/javascript"></script>
	<script src="/loginSpecial/js/Treatment.js" type="text/javascript"></script>
	<script src="/loginSpecial/js/controlLogin.js" type="text/javascript"></script>

</body>

</html>
