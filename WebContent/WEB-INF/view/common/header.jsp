<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><% 
	String userid = (String)request.getSession().getAttribute("userid");%>
<head>

	<script type="text/javascript" src="${js}/common/header.js"></script>
	<script type="text/javascript" src="${js}/emp/empAddUpdate.js"></script>
	<script type="text/javascript" src="${js}/emp/empList.js"></script>
	<link rel="stylesheet" href="${css}/style.css"/>
	
</head>
<h1>EMP</h1>
<div id="loginBox" style="display: <%=(userid==null)? "inline" : "none" %>;">
	<form style="display: inline;" name="loginForm" id="loginForm">
		<label for="id">ID : </label> 
		<input type="text" name="id" id="id"> 
		<label for="password">PW : </label> 
		<input type="password" name="password" id="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
		<input type="button" id="loginBtn" value="로그인" class="header_input"> 
	</form>
</div>

<div id="logoutHeader" style="display: <%=(userid==null)? "none" : "inline" %>;">
	<h3 style="display: inline;"><%=userid%>님 환영합니다.</h3>
	<input type="button" id="logoutBtn" value="로그아웃" class="header_input"> 
</div>
<script>
	empManager.logManager('${context}');
</script>

