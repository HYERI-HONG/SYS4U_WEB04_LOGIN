<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><% 
	String userid = (String)request.getSession().getAttribute("userid");%>
<script type="text/javascript" src="${context}/resources/js/common/header.js"></script>
<h1 style="display: inline; margin-right: 200px;margin-left: 50px;">EMP</h1>

<div id="loginHeader" style="display: <%=(userid==null)? "inline" : "none" %>;">
	<form style="display: inline;" name="loginForm" id="loginForm">
		<label for="id">ID : </label> 
		<input type="text" name="id" id="id"> 
		<label for="password">PW : </label> 
		<input type="password" name="password" id="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
		<input type="button" id="loginBtn" value="로그인" style="background-color: beige;"> 
	</form>
</div>

<div id="logoutHeader" style="display: <%=(userid==null)? "none" : "inline" %>;">
	<h3 style="display: inline;"><%=userid%>님 환영합니다.</h3>
	<input type="button" id="logoutBtn" value="로그아웃" style="background-color: beige;"> 
</div>


<script>
	empManager.logManager('${context}');
</script>

