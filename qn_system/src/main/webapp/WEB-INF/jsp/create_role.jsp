<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link href="../../css/styleuser.css" rel="stylesheet" type="text/css">
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
		<div class="xt-logo">
			<img src="../../images/logo.png" />
		</div>
		<div class="xt-geren">
			<div class="xt-exit">
				<span class="xt-span">这是您第<span class="xt-yanse">2350ci</span>登陆本系统
				</span><a href="#" class="help">����</a> <a href="#" class="exit">�˳�</a>
			</div>
		</div>
	</div>
	<!-- left -->
	<div class="xt-center">
		<div id="xt-left">
			<div class="xt-logo"></div>
			<div class="xt-menu">
				<ul>
					<li><a href="#" class="hover"><em class="one"></em>������Ϣ</a></li>
				</ul>
				<div class="xt-menu-list"></div>
				<ul>
					<li><a href="/qn_system/questionnaire_list/0"><em class="two"></em>�ʾ�</a></li>
				</ul>
				<ul>
					<li><a href="/qn_system/user_list"><em class="three"></em>�û���</a></li>
				</ul>
			</div>
		</div>
		<!-- right -->
		<div id="xt-right">
			<div class="xt-bt">后台管理></div>
			<div class="xt-input">
				<h1>角色新建</h1>
			</div>
			<div id="xt-right">
				<div class="xt-bt">新建角色</div>
				<form action="/qn_system/create_role" method="post">
					<input type="hidden" value="${user_list_user.user_id}"
						name="userId">
					<div class="xt-input">
						用户名称</span><input type="text" class="int-text" name="role_name"
							value="${rolename}" /> <input type="submit" value="�½�"
							class="yellow-int" /> ${error}
					</div>

					<div class="xt-table1">

						<table cellpadding="0" cellspacing="0" border="0"
							bgcolor="#dcdcdc" width="100%">
							<th>全部权限</th>
							<th>用户权限</th>
							<c:forEach items="${authoritylist}" var="authority">
								<tr>
									<td>${authority.authority_name}</td>

									<td><input type="checkbox" name="checkbox1"
										value="${authority.authority_id}" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>

				</form>


			</div>
					
		
			
			
	
			<div class="xt-fenye">
				<div class="xt-fenye-left">��ǰ�� 1 / 270 ҳ,ÿҳ10������ 2696����¼</div>
				<div class="xt-fenye-right">
					<a href="#">��ҳ</a> <a href="#">��һ��</a> <a href="#">��һ��</a> <a
						href="#">βҳ</a> <input type="text" name="text" /> <a href="#"
						class="xt-link">��ת</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
