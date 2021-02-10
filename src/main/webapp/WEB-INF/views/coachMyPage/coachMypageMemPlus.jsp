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
		<h1>검색 결과</h1>
	</div>
	<div class="memplus_table">
		<table>
			<tr>
				<td>수강생 아이디</td>
				<td>수강생 이름</td>
			</tr>
		<c:if test="${empty memlist}">
			<tr>
				<td colspan="4" align="center">
					검색된 수강생이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${memlist}" varStatus="i">
			<tr>
				<td>${dto.mem_name}</td>
				<td><a href="">${dto.mem_id}</a></td>
			</tr>
		</c:forEach>
		</table>
	</div>
</div>
</body>
</html>