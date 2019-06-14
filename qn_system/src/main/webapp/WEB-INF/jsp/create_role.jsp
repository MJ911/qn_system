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
	function getallcheckedvalue(name) {  
	    var boxvalues = "";  
	    var boxarray = document.getElementsByName(name);  
	    for(var i = 0; i < boxarray.length; i++) {  
	        if(boxarray[i].checked) {  
	            var boxvalue = boxarray[i].value;  
	            if(boxvalues == "") {  
	                boxvalues = boxvalue;  
	            }else {  
	                boxvalues = boxvalues + "," + boxvalue;  
	            }  
	        }  
	    }  
	    return boxvalues;  
	}  
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
			<div class="xt-bt">������Ϣ ></div>
			<div class="xt-input">
				<h1>��ɫ��ӣ�</h1>
			</div>
			<div id="xt-right">
			<div class="xt-bt">���</div>
			<div class="xt-input">
				��ɫ���ƣ�</span><input type="text" class="int-text" />  <input
					type="button" value="ȷ ��" class="yellow-int" Onclick="window.location.href='/qn_system/user_authority/5'" />
			</div>
			<div class="xt-table1" >
				<table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc"
					width="100%">
					<th>ȫ��Ȩ��</th><th>ѡ��</th>
					<c:forEach items="${authoritylist}" var="authority">
						<tr>
							<td>${authority.authority_name}</td>

							<td><input type="checkbox" name="checkbox1" value="ture" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
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
