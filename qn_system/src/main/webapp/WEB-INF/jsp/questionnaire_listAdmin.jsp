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

<script>
function windowHeight() {
	var de = document.documentElement;
	return self.innerHeight||(de && de.clientHeight)||document.body.clientHeight;
}
window.onload=window.onresize=function(){
	var wh=windowHeight();
	document.getElementById("xt-left").style.height = document.getElementById("xt-right").style.height = (wh-document.getElementById("xt-top").offsetHeight)+"px";
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
            <li><a href="/qn_system/questionnaire_list/2"><em class="two"></em>问卷管理</a></li>
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
            <th>问卷ID</th>
            <th>问卷名</th>
            <th>问卷创建日期</th>
            <th>问卷截止日期</th>
            <th>问卷类型</th>
            <th>问卷状态</th>
            <th>操作</th>
            </tr>
            <tr>
            	<c:forEach items = "${questionnairelist}" var="qn">
  					<tr>
  						<td>${qn.questionnaire_id}</td>
  						<td>${qn.questionnaire_name}</td>
  						<td>${qn.questionnaire_cdate}</td>
  						<td>${qn.questionnaire_fdate}</td>
  						<td>${qn.questionnaire_state}</td>
  						<td>${qn.questionnaire_type}</td>
  						<td><a href="" class="yellow-xt">删除</a></td>
  					</tr> 
				</c:forEach>
            </tr>
        </table>
    </div>
    <div class="xt-fenye">
        <div class="xt-fenye-left">当前第 1 / 270 页,每页10条，共 2696条记录</div>
        <div class="xt-fenye-right">
            <a href="index">首页</a>
            <a href="#">上一页</a>
            <a href="#">下一页</a>
            <a href="#">尾页</a>
            <input type="text" name="text" />
            <a href="#" class="xt-link">跳转</a>
        </div>
    </div>
</div>
</div>

</body>
</html>