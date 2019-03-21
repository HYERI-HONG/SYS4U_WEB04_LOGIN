<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
	
	String searchOption = (String)request.getAttribute("searchOption");
	String searchWord = (String)request.getAttribute("searchWord");
	
%>
<script type="text/javascript" src="${context}/resources/js/emp/empList.js"></script>
<body>
<div class ="header">
	<jsp:include page="/WEB-INF/view/common/header.jsp" />
</div>
<div class="content"> 
	<h3>사원 목록</h3>
	<div id="content_search">
		<form name="searchForm" id = "searchForm">
			<select name="searchOption">
				<option value="empno" <%=(searchOption.equals("empno"))? "selected":"" %>>사원번호</option>
				<option value="ename" <%=(searchOption.equals("ename"))? "selected":"" %> >이름</option>
				<option value="dname" <%=(searchOption.equals("dname"))? "selected":"" %>>부서명</option>
			</select> 
			<input name="searchWord" type="text" placeholder="검색어 입력" value="<%=searchWord%>" /> 
			<input type="button" id="searchButton" value="검색" />
		</form>
		<input id="context" type="hidden" value="${context}" /> 
		<input id="addBtn" type="button" value="사원 등록"/>
	</div>
	<hr class="empList_hr"/>
	<br>
	<div id="content_list">	
		<table id="employee_list">
			<tr>
				<th>사원 번호</th>
				<th>이 름</th>
				<th>입사 날짜</th>
				<th>부서명</th>
			</tr>
			<c:forEach items='${list}' var='employee'>
				<tr>
					<td><a href="${context}/empDetail.do?empno=${employee.empno}" class="empnoClick">${employee.empno}</a></td>
					<td>${employee.ename}</td>
					<td>${employee.hiredate}</td>
					<td>${employee.dname}</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<br>
		<hr class="empList_hr"/>
		<br>
		<div id="content_pagination">
			<jsp:include page="/WEB-INF/view/common/pagination.jsp">
				<jsp:param value="emp" name="domain" />
			</jsp:include>
		</div>
</div>
</body>