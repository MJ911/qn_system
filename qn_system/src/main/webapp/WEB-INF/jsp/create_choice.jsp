<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>create_choice</title>
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
	}function Tocreate(index) {
		location.href = "/qn_system/create_questionnaire/"+index;
	}function Toquit() {
		location.href = "/qn_system/quit";
	}
</script>
<!-- //for-mobile-apps -->
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pignose css -->
<link href="../css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />


<!-- //pignose css -->
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
<link href="../css/css1.css" rel="stylesheet" />
<!-- <link id="ctl01_cssdefault" rel="stylesheet" type="text/css" href="../css/css2.css" /> -->
<link id="ctl01_cssmaster" rel="stylesheet" type="text/css"
	href="../css/css3.css" />
<link rel="stylesheet" type="text/css" href="../css/css4.css" />
<script type="text/javascript" src="../js/jquer-1.8.3.min.js" ></script>
<!-- //js -->
<!-- cart -->
	<script src="../js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
	<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<script src="../js/jquery.easing.min.js"></script>
<style type="text/css">
        #top{background-color:#213d90;background-color: rgba(255,255,255,0.05);}
        #main{left:0;top:0;margin-top=0px;width:100%;height:980px;background:white;background-image:url(./images/ssss.jpg);background-size:100%,100%;background-repeat:none;background:rgba(255,255,255,0.1);position:fixed;}
		#left{margin-left:100px;margin-right:30px;width:50%;height:100%;float:left;}
		#right{margin-left:30px;margin-right:100px;margin-top:50px;width:25%;height:100%;float:left;}
		#foot{margin-top:750px;width:100%;height:150px;background-color: rgba(0,0,0,0.15);}
		#list{list-style:none;margin-left:80px;margin-top:10px;font-size:20pt;}
		#div_left{width:33%;height:750px;float:left;}
        #div_middle{text-align:center;width:47%;height:750px;float:left;background-color:rgba(255,255,255,0.00);border-radius:30px;}
		#div_right{width:20%;height:750px;float:left;}
		#footer{margin-top:0px;text-align:center;weight:100%;height:20px;}
		#footer ul{list-style-type:none;overflow: hidden;}
		#footer ul li{display:inline;list-style:none;font-size:10pt;margin-left:30px;font-color:orange;}
		#div_label1{margin-top:250px;}
		#div_label2{margin-top:25px;}

.btn-blue-frame {
	color: #1ea0fa;
	border: 1px solid #1ea0fa;
	background-color: #fff;
}

.btn, .btnnew {
	display: inline-block;
	padding: 0 10px;
	margin-bottom: 0;
	font-size: 12px;
	font-weight: normal;
	line-height: 1;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 6px;
}

.btn:focus, .btn:active:focus, .btn.active:focus, .btn.focus, .btn:active.focus,
	.btn.active.focus, .btnnew:focus, .btnnew:active:focus, .btnnew.active:focus,
	.btnnew.focus, .btnnew:active.focus, .btnnew.active.focus {
	outline: none;
	outline-offset: -2px;
}

.btn:hover, .btn:focus, .btn.focus, .btnnew:hover, .btnnew:focus,
	.btnnew.focus {
	/*color: #333;*/
	text-decoration: none;
}

.btn:active, .btn.active, .btnnew:active, .btnnew.active {
	background-image: none;
	outline: 0; /*-webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
  box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);*/
}
</style>
    <link href="../loginSpecial/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../loginSpecial/css/loaders.css" rel="stylesheet" type="text/css" />
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
	   <form name="aspnetForm" method="post" action="choosetype.aspx?tttt=636960410375897968" id="aspnetForm">     
      <div class="section main-wrapper">
        <div class="module-box clearfix" id="divModule">
			<div  class="figure" style="background-color:rgba(255,255,255,0.65);margin-top:200px ">
                <div class="pic-box icon survey-icon pull-left"></div>
                <div class="details-wrapper pull-left">
                    <div class="details-title">
                        <span class="pull-left">问卷</span>
                        <a class="btn btn-blue-frame details__more pull-left">了解更多</a>
                    </div>
                    <div class="details-info">丰富题型，强大逻辑</div>
                    <div class="details-info">问卷密码，红包抽奖</div>
                </div>
                <div class="clear dotted-line--solid"></div>
               
                    <a class="btn btn-blue-frame main__btn--new" onclick="Tocreate(0)">创建</a>
               
                <input type="checkbox" style="position:absolute;right:20px;bottom:25px;width:18px;height:18px;display:none;" />
            </div>

            <div  class="figure" style="background-color:rgba(255,255,255,0.65);margin-top:200px">
                <div class="pic-box icon vote-icon pull-left"></div>
                <div class="details-wrapper pull-left">
                    <div class="details-title">
                        <span class="pull-left">投票</span>
                        <a href="javascript:void(0)" class="btn btn-blue-frame details__more pull-left">了解更多</a>
                    </div>
                    <div class="details-info">图文视频，选项随机</div>
                    <div class="details-info">实时排行，微信投票</div>
                </div>
                <div class=" clear dotted-line--solid"></div>
               
                    <a class="btn btn-blue-frame main__btn--new" onclick="Tocreate(1)">创建</a>
               
                 <input type="checkbox" style="position:absolute;right:20px;bottom:25px;width:18px;height:18px;display:none;" />
            </div>
                  
        </div>
    </div>
     </form>
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
<script src="../loginSpecial/js/Particleground.js" type="text/javascript"></script>
<script src="../loginSpecial/js/Treatment.js" type="text/javascript"></script>
<script src="../loginSpecial/js/controlLogin.js" type="text/javascript"></script>
<script  type="text/javascript">
                 var currentApps="";
                 var qType=1;
                 var setCustom=false;
                 var isOpenUser=0;
                 // 判断浏览器是否为IE8 改变鼠标hover效果上
                 $create_figure = $(".main-wrapper .create-box .figure");
                 var $module_figure = $(".main-wrapper .module-box .figure");
                 $module_figure.first().addClass("clicked"); //进入选择问卷默认选中创建空白问卷
                 $module_figure.click(function() {
                         if(setCustom)
                             return;
                     $(this).addClass("clicked").siblings(".figure").removeClass("clicked");
                 });
                 $module_figure.mouseover(function(){
                     if(setCustom)
                         return;
                     $(this).addClass("clicked").siblings(".figure").removeClass("clicked");
                 })
                 $module_figure.eq(qType-1).click();
                 $("#hrefCustom").click(function(){
                     if(this.isConfirm){
                         var selCount=0;
                         var newApp="";
                         $("#divModule input").each(function(index){
                             if(index>0)
                                 newApp+=",";
                             if(this.checked){
                                 newApp+="1";
                                 selCount++;
                             }
                             else
                                 newApp+="0";
                         });
                         if(selCount==0){
                             alert("请至少选择一种问卷类型！");
                             return;
                         }
                         var that = this;
                         lconfirm("确认操作吗？", function () {
                             that.isConfirm=false;
                             if(newApp==currentApps){
                                 setSuc(newApp);
                                 return;
                             }
                             var url="/handler/setuserapp.ashx?apps="+encodeURIComponent(newApp);
                             $.get(url,function(data){
                                 if(data=="1"){
                                     setSuc(newApp);
                                 }
                                 else
                                     alert("未设置成功！");
                             });
                         })
                         
                     }
                     else{
                         $(this).removeClass("custom__btn").addClass("confirm__btn").html("<i class='confirm__icon'></i>确定");
                         $("#divModule input").show();
                         setCustom=true;
                         $module_figure.removeClass("clicked");
                         $module_figure.each(function(index){
                             $(this).show();
                         });
                         var apps=currentApps.split(",");
                         $("#divModule input").each(function(index){
                             if(apps[index]=="1")
                                 this.checked=true;
                         });
                         this.isConfirm=true;
                     }
                     
                 });
                 function setSuc(newApp){
                     $("#hrefCustom").removeClass("confirm__btn").addClass("custom__btn").html("<i class='custom__icon'></i>自定义问卷类型");
                     initApps(newApp);
                     setCustom=false;
                     $("#divModule input").hide();
                 }
                 $("#divCustom").click(function(){
                     $(this).hide();
                     $("#hrefCustom").show();
                     $("#hrefCustom").trigger("click");
                 });
                 function initApps(capps){
                     currentApps=capps;
                     var apps=capps.split(",");var hasHideApp=false;
                     $module_figure.each(function(index){
                         if(apps[index]=="0"){
                             $(this).hide();
                             hasHideApp=true;
                         }
                     });
                     if(hasHideApp){
                         if(!isOpenUser)
                             $("#divCustom").show();
                         $("#hrefCustom").hide();
                     }
                     else
                         $("#hrefCustom").show();
                 }
                 initApps(currentApps);
</script>
</body>

</html>