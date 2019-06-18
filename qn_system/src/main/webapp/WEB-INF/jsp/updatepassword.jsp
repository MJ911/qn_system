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
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 




</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- pignose css -->
<link href="css/pignose.layerslider.css" rel="stylesheet"
	type="text/css" media="all" />


<!-- //pignose css -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>
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
	height: 350px;
	float: left;
	background-color: rgba(255, 255, 255, 0.9);
	border-radius: 30px;
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

.tbl-txt {
	font-size: 14px;
}

.tbl-txt input {
	padding: 0 5px;
	height: 22px;
	line-height: 22px;
	margin-bottom: 6px;
}

.pw-strength {
	clear: both;
	position: relative;
	top: 8px;
	width: 180px;
}

.pw-bar {
	background: url(images/1.png) no-repeat;
	position: relative;
	top: 1px;
	height: 14px;
	overflow: hidden;
	width: 179px;
}

.pw-bar-on {
	background: url(images/2.png) no-repeat;
	width: 0px;
	height: 14px;
	position: absolute;
	top: 1px;
	left: 2px;
	transition: width .5s ease-in;
	-moz-transition: width .5s ease-in;
	-webkit-transition: width .5s ease-in;
	-o-transition: width .5s ease-in;
}

.pw-weak .pw-defule {
	width: 0px;
}

.pw-weak .pw-bar-on {
	width: 60px;
}

.pw-medium .pw-bar-on {
	width: 120px;
}

.pw-strong .pw-bar-on {
	width: 179px;
}

.pw-txt {
	padding-top: 2px;
	width: 180px;
	overflow: hidden;
}

.pw-txt span {
	color: #707070;
	float: left;
	font-size: 12px;
	text-align: center;
	width: 58px;
}
</style>
<link href="loginSpecial/css/demo.css" rel="stylesheet" type="text/css" />
<link href="loginSpecial/css/loaders.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	     
$(function(){ 
    $('#pass').keyup(function () { 
	var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
	var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
	var enoughRegex = new RegExp("(?=.{6,}).*", "g"); 
   
	if (false == enoughRegex.test($(this).val())) { 
	$('#level').removeClass('pw-weak'); 
	$('#level').removeClass('pw-medium'); 
	$('#level').removeClass('pw-strong'); 
	$('#level').addClass(' pw-defule'); 
		 //密码小于六位的时候，密码强度图片都为灰色 
	} 
	else if (strongRegex.test($(this).val())) { 
		$('#level').removeClass('pw-weak'); 
		$('#level').removeClass('pw-medium'); 
		$('#level').removeClass('pw-strong'); 
		$('#level').addClass(' pw-strong'); 
		//密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
	} 
	else if (mediumRegex.test($(this).val())) { 
		$('#level').removeClass('pw-weak'); 
		$('#level').removeClass('pw-medium'); 
		$('#level').removeClass('pw-strong'); 
		$('#level').addClass(' pw-medium'); 
		//密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
	} 
	else { 
		$('#level').removeClass('pw-weak'); 
		$('#level').removeClass('pw-medium'); 
		$('#level').removeClass('pw-strong'); 
		$('#level').addClass('pw-weak'); 
		//如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
	} 
	return true; 
	}); 
    $("#warn2").hide();
    $("#pass1").focus(function(){
        $("#warn2").show();
        var passwd1=$("#pass").val();
        var passwd2=$("#pass1").val();
        if(passwd1==passwd2){
            $("#warn2").hide();
        }
    });
	$("#pass1").blur(function(){
        var passwd1=$("#pass").val();
		var passwd2=$("#pass1").val();
	    if(passwd1==passwd2){
		    $("#warn2").hide();
		}else{
			$("#warn2").show();
		}
	});
	$("#pass").blur(function(){
	    $("#tab").hide();
        var passwd1=$("#pass").val();
		var passwd2=$("#pass1").val();
	    if(passwd1==passwd2){
		    $("#warn2").hide();
		}else{
			$("#warn2").show();
		}
	});
})
			

    });
		

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
						<!-- 导航-->
						<div class="collapse navbar-collapse menu--shylock"
							id="bs-example-navbar-collapse-1">


							<div width="60%" style="float: left">
								<ul class="nav navbar-nav menu__list">
									<li style="color: white"
										class="active menu__item menu__item--current"><a
										class="menu__link" href="home.html">首页<span
											class="sr-only">(current)</span></a></li>
									<li id="qn" style="color: white" class=" menu__item"><a
										class="menu__link" href="#">投票集</a></li>
									<li style="color: white" class=" menu__item"><a
										class="menu__link">问卷集</a></li>
									<li style="color: white" class=" menu__item"><a
										class="menu__link" href="#">问卷模板</a></li>
									<li style="color: white" class=" menu__item"><a
										class="menu__link" href="#">帮助</a></li>

								</ul>
							</div>
							<div style="float: left; height: 1px; width: 390px">
								<div class='validation'
									style="opacity: 1; right: -5px; top: -3px;">
									<canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
								</div>

							</div>

							<div width="10%" style="float: left">
								<ul class="nav navbar-nav menu__list">
									<li class=" menu__item"><a class="menu__link"
										href="login1.html">登录</a></li>
									<li class=" menu__item"><a class="menu__link"
										href="register.html">注册</a></li>
								</ul>
							</div>
						</div>
					</div>
					</nav>
				</div>

			</div>
		</div>
		<div id="div_left"></div>
		<form action="/qn_system/findpassword" method="post">
			<div id="div_middle">
				<table style="width: 320px; margin: 40px auto;">
					<tr>
						<th>密码</th>
						<td><span class="tbl-txt"><input id="pass"
								class="input-style" size="30" maxlength="30" name="pass"
								type="text" /></span></td>
					</tr>
					<tr>
						<th></th>
						<td id="level" class="pw-strength">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span> <span>中</span> <span>强</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>确认密码</th>
						<td><span class="tbl-txt"><input id="pass1"
								class="input-style" size="30" maxlength="30" name="pass"
								type="text" /></span></td>
						<label><font size="5" color="red" id="warn2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;两次密码输入不一致</font></label>
					</tr>
					<tr>
				</table>
				<div id="div_label2">
					<li align="center"><input type="submit" id="button_rig"
						value="立即提交"
						style="border: none; width: 200px; height: 50px; border-radius: 30px; background: orange; color: white;size=6px" />
					</li>
				</div>
			</div>
		</form>


		<div id="div_right"></div>

	</div>
	<script src="loginSpecial/js/Particleground.js" type="text/javascript"></script>
	<script src="loginSpecial/js/Treatment.js" type="text/javascript"></script>
	<script src="loginSpecial/js/controlLogin.js" type="text/javascript"></script>

</body>

</html>