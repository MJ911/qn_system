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
<link href="../css/styleuser.css" rel="stylesheet" type="text/css">
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
    <div class="xt-logo"><img src="../images/icon1.png" /></div>
    <div class="xt-geren">
        <div class="xt-exit"><span class="xt-span">�ʾ�ǿ��̨����<span class="xt-yanse">2350��</span>��¼��������</span><a href="#" class="help">����</a>
            <a href="#" class="exit">�˳�</a></div>
    </div>
</div>
<!-- left -->
<div class="xt-center">
<div id="xt-left">
    <div class="xt-logo"></div>
    <div class="xt-menu">
        
        <div class="xt-menu-list"></div>
        <ul>
        	<li><a href="/qn_system/user_list" class="hover"><em class="one"></em>�û�����</a></li>
            <li><a href="questionnaire_list/2"><em class="two"></em>�ʾ����</a></li>
        </ul>
    </div>
</div>
<!-- right -->
<div id="xt-right">
    <div class="xt-bt">����Ա>�û�����</div>
    <div class="xt-input">
        <span>�˺�����</span>
        <select class="int-text" >
        <option>ѡ��һ</option>
        <option>ѡ���</option>
        <option>ѡ����</option>
        <option>ѡ����</option>
        <option>ѡ����</option>
    </select>
        <span>�˺�/����</span><input type="text" class="int-text" />
        <span>���/״̬</span>
        <select class="int-text" >
            <option>ѡ��һ</option>
            <option>ѡ���</option>
            <option>ѡ����</option>
            <option>ѡ����</option>
            <option>ѡ����</option>
        </select>
        <span>��Դ</span><input type="text" class="int-text" />
        <input type="button" value="ȷ ��" class="green-int" />
        <input type="button" value="ȷ ��" class="yellow-int" />
    </div>
    <div class="xt-table">
        <table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc" width="100%">
            <tr>
            <th>�û�ID</th>
            <th>����</th>
            <th>����</th>
            <th>��������</th>
            <th>��ɫȨ��</th>
            <th>����</th>
            </tr>
            <tr>
            	<c:forEach items = "${userlist}" var="user">
  					<tr>
  						<td>${user.user_id}</td>
  						<td>${user.user_name}</td>
  						<td>${user.user_password}</td>
  						<td>${user.user_mail}</td>
  						<td>${user.role.role_name}</td>
  						<td><a href="user_authority/${user.user_id}" class="yellow-xt">�޸�Ȩ��</a></td>
  					</tr> 
				</c:forEach>
            </tr>
        
  


        </table>
    </div>
    <div class="xt-fenye">
        <div class="xt-fenye-left">��ǰ�� 1 / 270 ҳ,ÿҳ10������ 2696����¼</div>
        <div class="xt-fenye-right">
            <a href="index">��ҳ</a>
            <a href="#">��һҳ</a>
            <a href="#">��һҳ</a>
            <a href="#">βҳ</a>
            <input type="text" name="text" />
            <a href="#" class="xt-link">��ת</a>
        </div>
    </div>
</div>
</div>

</body>
</html>
