<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>model_list</title>
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
<!-- <link href="/css/style_table.css" rel="stylesheet" type="text/css" media="all" /> -->
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
        #div_middle{margin-top:10px;text-align:center;width:60%;height:880px;float:left;background-color:rgba(255,255,255,0.40);border-radius:50px;text-color:black;}
		#div_right{width:20%;height:850px;float:left;}
		a.color1:link{color: black ; text-decoration:none;} /*����ʱ�����ʽ*/
        a.color1:visited{color: black; text-decoration:none;} /*���ָ��ȥ����ʽ*/
        a.color1:hover {color: black; text-decoration:underline;} /*���ʹ������ʽ*/
        table tr td{text-align:center; } 
        
        .xt-table{ margin-top: 20px;margin-left: 20px;margin-right: 20px;color:black}
		.xt-table td,.xt-table th{padding: 16px 8px;}
.xt-table th{  border-bottom:1px solid #dcdcdc; text-align: center;}
.xt-table tr.xt-bg td{ }
.xt-table tr td{text-align: center;}
.xt-table tr td a{ padding: 3px 5px; text-decoration: none; border-radius: 5px; display: inline-block; margin: 0 2px;}
.xt-table tr:hover td{ background: #73cfce; color: #fff;}
.xt-table tr:hover td a:hover{color: #baa01b; background: #f5e17a;}

.xt-fenye{margin-bottom: 20px;margin-left: 20px;margin-right: 20px; border: 1px solid #dcdcdc; overflow: hidden; padding: 10px 15px;color:black}
.xt-fenye-left{ float: left; padding: 5px 0;}
.xt-fenye-right{ float: right;}
.xt-fenye-right a,.xt-fenye-right input{ display: inline-block; vertical-align: middle;}
.xt-fenye-right a{ background: #f8f8f8; border: 1px solid #dcdcdc; padding: 5px 15px; color: #666; text-decoration: none;}
.xt-fenye-right a:hover{ background: #21b6b4; color: #fff; border: 1px solid #21b6b4;}
.xt-fenye-right a.xt-link{ background: #21b6b4; color: #fff; border: 1px solid #21b6b4;}
.xt-fenye-right a:hover.xt-link{ background: #30abaa; color: #fff; border: 1px solid #30abaa;}
.xt-fenye-right input{ width: 40px; text-align: center; padding: 4px;}
</style>
    <link href="/loginSpecial/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/loginSpecial/css/loaders.css" rel="stylesheet" type="text/css" />
	<script text="text/javascript">
	    
	</script>
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
	}function Toquestionnaire(index){
		location.href="/qn_system/questionnaire/"+index;
	}function Toquit() {
		location.href = "/qn_system/quit";
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
				<!-- ����-->
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
							<canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
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
	    <div class="xt-table">
        <table cellpadding="0" cellspacing="0" border="0"  width="100%" style="color:black;">
            <tr>
            <th>问卷/投票 名称</th>
            <th>问卷/投票 创建时间</th>
            <th>问卷/投票 失效时间</th>
            <th>问卷/投票 创建人</th>
            </tr>
            
            <c:forEach items="${modellist }" var="questionnaire">
            	<tr>
                	<td><a class="color1" href="/qn_system/model/${questionnaire.questionnaire_id}">${questionnaire.questionnaire_name}</a></td>
                	<td>${questionnaire.questionnaire_cdate}</td>
                	<td>${questionnaire.questionnaire_fdate}</td>
                	<td>
                		<c:if test="${questionnaire.questionnaire_type == '0'}">问卷</c:if>
                		<c:if test="${questionnaire.questionnaire_type == '1'}">投票</c:if>
                	</td>
            	</tr>
            </c:forEach>         
        </table>
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
