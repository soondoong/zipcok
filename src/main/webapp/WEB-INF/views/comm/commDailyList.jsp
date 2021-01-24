<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header2.jsp" %>
<%@include file="./commSideMenu.jsp" %>
<h1>일일 운동 게시판</h1>
<table>
<thead>
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>소비칼로리</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="3" align="center">page</td>
			<td><a href="#">글쓰기</a></td>
		</tr>
	</tfoot>
</table>
</body>
</html>