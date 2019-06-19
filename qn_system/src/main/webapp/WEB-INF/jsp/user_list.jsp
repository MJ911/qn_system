<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>user_list</title>
<link href="/css/styleuser.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript">
function windowHeight() {
	var de = document.documentElement;
	return self.innerHeight||(de && de.clientHeight)||document.body.clientHeight;
}
window.onload=window.onresize=function(){
	var wh=windowHeight();
	document.getElementById("xt-left").style.height = document.getElementById("xt-right").style.height = (wh-document.getElementById("xt-top").offsetHeight)+"px";
}
function TouserPageNext() {
	location.href = "/qn_system/userNextPage";
}function TouserPagePre() {
	location.href = "/qn_system/userPrePage";
}function TouserPageFirst() {
	location.href = "/qn_system/TouserPageFirst";
}function TouserPageEnd() {
	location.href = "/qn_system/TouserPageEnd";
}function TouserPageIndex() {
	var index = turnTo.turn.value;
	if(index != ""){
		location.href = "/qn_system/TouserPageIndex/"+index;
	}else{
		swal("请输入跳转页！");
	}
}
</script>

<body>
<!-- top -->
<div id="xt-top">
    <div class="xt-logo"><img style="width:100%;heighth:100%;" src="/images/icon1.png" /></div>
    <div class="xt-geren">
        <div class="xt-exit"><span class="xt-span">问卷强后台管理<span class="xt-yanse">2350次</span>登录管理中心</span><a href="#" class="help">帮助</a>
            <a href="#" class="exit">退出</a></div>
    </div>
</div>
<!-- left -->
<div class="xt-center">
<div id="xt-left">
    <div class="xt-logo"></div>
    <div class="xt-menu">
        <div class="xt-menu-list"></div>
        <ul>
        	<li><a href="/qn_system/user_list" class="hover"><em class="one"></em>用户管理</a></li>
            <li><a href="/qn_system/questionnaire_list/2"><em class="one"></em>问卷管理</a></li>
        </ul>
    </div>
</div>
<!-- right -->
<div id="xt-right">
    <div class="xt-bt">管理员>用户管理</div>
    <div class="xt-input">
        <span>账号类型</span>
        <select class="int-text" >
        <option>选项一</option>
        <option>选项二</option>
        <option>选项三</option>
        <option>选项四</option>
        <option>选项五</option>
    </select>
        <span>账号/邮箱</span><input type="text" class="int-text" />
        <span>审核/状态</span>
        <select class="int-text" >
            <option>选项一</option>
            <option>选项二</option>
            <option>选项三</option>
            <option>选项四</option>
            <option>选项五</option>
        </select>
        <span>来源</span><input type="text" class="int-text" />
        <input type="button" value="确 定" class="green-int" />
        <input type="button" value="确 定" class="yellow-int" />
    </div>
    <div class="xt-table">
        <table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc" width="100%">
            <tr>
            <th>用户ID</th>
            <th>用户姓名</th>
            <th>密码</th>
            <th>邮箱</th>
            <th>角色</th>
            <th>操作</th>
            </tr>
            <tr>
            	<c:forEach items = "${userlist}" var="user">
  					<tr>
  						<td>${user.user_id}</td>
  						<td>${user.user_name}</td>
  						<td>${user.user_password}</td>
  						<td>${user.user_mail}</td>
  						<td>${user.role.role_name}</td>
  						<td><a href="user_authority/${user.user_id}" class="yellow-xt">编辑</a></td>
  					</tr> 
				</c:forEach>
            </tr>
        
  


        </table>
    </div>
   	<div class="xt-fenye">
				<div class="xt-fenye-left">当前第 ${indexPage} / ${pages} 页,每页10条，共 ${lines}条记录</div>
				<div class="xt-fenye-right">
           	 		<a onclick="TouserPageFirst()">首页</a>
            		<a onclick="TouserPagePre()">上一页</a>
            		<a onclick="TouserPageNext()">下一页</a>
            		<a onclick="TouserPageEnd()">尾页</a>
            		<form name="turnTo" class="xt-fenye-right"><input type="text" id="turn" name="turn" />
            		<a href="#" class="xt-link" onclick="TouserPageIndex()">跳转</a></form>
        		</div>
			</div>
    </div>
    <div id="div_right">
    </div>
</div>


</body>
</html>
