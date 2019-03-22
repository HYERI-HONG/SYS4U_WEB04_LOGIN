<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class = "header">
	<jsp:include page="/WEB-INF/view/common/header.jsp" />
</div>
<div class="content">
	<div id="content_detail">
		<h3>사원 정보 조회</h3>
		<table id="empInfo">
			<tr>
				<th>사원 번호</th>
				<td>${employee.empno}</td>
				<th>이 름</th>
				<td>${employee.ename}</td>
			</tr>

			<tr>
				<th>직 책</th>
				<td>${employee.job}</td>
				<th>부 서</th>
				<td>${employee.dname}</td>
			</tr>

			<tr>
				<th>직속 상관</th>
				<td>${employee.mgr}</td>
				<th>입사 날짜</th>
				<td>${employee.hiredate}</td>
			</tr>

			<tr>
				<th>연 봉</th>
				<td>${employee.sal}</td>
				<th>상 여 금</th>
				<td>${employee.comm}</td>
			</tr>
		</table>
		<input type="button" value="수정 하기" id="detail_modify" onclick="javascript:location.href='${context}/authority/move.do?pageName=empUpdate&empno=${employee.empno}';" />
		<input type="button" value="목록 보기" onclick="javascript:location.href='${context}/empList.do';" id="detail_golist">
	</div>
</div>
