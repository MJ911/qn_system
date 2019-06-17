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
			<img src="/images/icon1.png" />
		</div>
		<div class="xt-geren">
			<div class="xt-exit">
				<span class="xt-span">�ʾ�ǿ��̨����<span class="xt-yanse">2350��</span>��¼��������
				</span><a href="#" class="help">����</a> <a href="#" class="exit">�˳�</a>
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
					<li><a href="/qn_system/questionnaire_list/2"><em
							class="two"></em>�ʾ�</a></li>
				</ul>
				<ul>
					<li><a href="/qn_system/user_list"><em class="three"></em>�û���</a></li>
				</ul>
			</div>
		</div>
		<!-- right -->
		<div id="xt-right">
			<div class="xt-bt">����Ա>�û�����>Ȩ�޺ͽ�ɫ����</div>
			
			<div class="xt-table1">
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc"
					width="100%">
					<th>�û���Ϣ</th>
					<th></th>
					<tr>
						<td>�� ��:</td>
						<td>${user_list_user.user_id}</td>
					</tr>
					<tr>
						<td>�û���:</td>
						<td>${user_list_user.user_name}</td>
					</tr>
					<tr>
						<td>�� ��:</td>
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
						<th>ȫ��Ȩ��</th>
						<th>�û�Ȩ��</th>
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
						<th>ȫ����ɫ</th>
						<th><input type="button" value="�½���ɫ" class="green-int"
							Onclick="window.location.href='/qn_system/create_role'" /></th>
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
							<td></td>
							<td><input type="submit" value="�ύ" class="yellow-int" /></td>
						</tr>
					</table>
				</div>
			</form>

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
