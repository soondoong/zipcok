<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="memplus_wrap">
	<div class="memplus_title">
		<h1>수강생 추가</h1>
	</div>
	<form action="coachMyPageMemPlus.do">
	<input type="hidden" name="uc_comm_idx" value="${uc_comm_idx }">
	<div class="memplus_table">
		<table>
			<tr>
				<td>수강생 아이디</td>
				<td>
				<select name="uc_mem_id">
				<c:forEach var="dto" items="${paymentlist}" varStatus="i">
				<c:if test="${dto.pr_status eq '결제완료' }">
				<option value="${dto.pr_sender}">${dto.pr_sender}</option>
				</c:if>
				</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="수강생 추가"></td>
			</tr>
		</table>
	</div>
	</form>
</div>
</body>
</html>