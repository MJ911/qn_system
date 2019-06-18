<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
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
	
	function Toindex(){
		location.href="/qn_system/index";
	}
              
</script>

<body>
	<!-- top -->
	<div id="xt-top">
		<div class="xt-logo">
			<img style="width: 100%; heighth: 100%;" src="/images/icon1.png" />
		</div>
		<div class="xt-geren">
			<div class="xt-exit">
				<span class="xt-span">问卷强后台管理<span class="xt-yanse">2350次</span>登录管理中心
				</span><a href="#" class="help">帮助</a> <a href="#" class="exit">退出</a>
			</div>
		</div>
	</div>
	<!-- left -->
	<div class="xt-center">
		<div id="xt-left">
			<div class="xt-logo"></div>
			<div class="xt-menu">
				
				<div class="xt-menu-list"></div>
				<ul>
					<li><a href="/qn_system/user_list" class="hover"><em
							class="one"></em>用户管理</a></li>
					<li><a href="/qn_system/questionnaire_list/2"><em
							class="two"></em>问卷管理</a></li>
				</ul>
			</div>
		</div>
		<!-- right -->
		<div id="xt-right">
			<div class="xt-bt">用户信息编辑</div>

			<div class="xt-table1">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc"
					width="100%">
					<th>用户信息</th>
					<th></th>
					<tr>
						<td>用户ID:</td>
						<td>${user_list_user.user_id}</td>
					</tr>
					<tr>
						<td>姓名:</td>
						<td>${user_list_user.user_name}</td>
					</tr>
					<tr>
						<td>邮箱:</td>
						<td>${user_list_user.user_mail}</td>
					</tr>

				</table>

			</div>
			<form action="/qn_system/user_list" method="post">
				<div class="xt-table1">
					<input type="hidden" value="${user_list_user.user_id}"
						name="userId">
					<table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc"
						width="100%">
						<th>全部权限</th>
						<th>拥有权限</th>
						<c:forEach items="${authoritylist}" var="authority">
							<tr>
								<td>${authority.authority_name}</td>
								<td><input type="checkbox" name="checkbox"
									value="${authority.authority_id}"
									<c:forEach items="${user_list_user.authorityList}" var="authorityuser">
							<c:if test="${authorityuser.authority_name eq authority.authority_name}">
										checked="checked"	
								</c:if>
								</c:forEach> />
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>


				<div class="xt-table1">
					<table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc"
						width="100%">
						<th>全部角色</th>
						<th>用户角色</th>
						<c:forEach items="${rolelist}" var="role">
							<tr>
								<td>${role.role_name}</td>

								<td><input type="radio" name="radio"
									value="${role.role_id}"
									<c:if test="${user_list_user.role.role_name eq role.role_name}">
										checked="checked"</c:if> />
								</td>
							</tr>

						</c:forEach>
						<tr>
							<td><input type="button" value="新建角色" class="green-int"
							Onclick="window.location.href='/qn_system/create_role'" /></td>
							<td><input type="submit" value="修改" class="yellow-int" /></td>
						</tr>
					</table>
				</div>
			</form>

			<div class="xt-fenye">
				<div class="xt-fenye-left">当前第 1 / 270 页,每页10条，共 2696条记录</div>
				<div class="xt-fenye-right">
					<a onclick="Toindex()">首页</a> <a href="#">上一步</a> <a href="#">下一步</a> <a
						href="#">尾页</a> <input type="text" name="text" /> <a href="#"
						class="xt-link">跳转</a>
				</div>
			</div>
		</div>
		<div id="div_right"></div>
	</div>


</body>
</html>