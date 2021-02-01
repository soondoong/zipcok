<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../header2.jsp"%>
	<%@include file="./mypageSideMenu.jsp" %>
	<div style="margin-left: 200px; padding: 1px 16px;">
	<br>
	<h3>${sessionScope.sname }님의 작성글</h3>
	<hr>
	<table border="1" cellspacing="0" width="550">
	<thead>
		<tr>
			<th>글번호</th>
			<th>게시판이름</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="5" align="center">페이지들어갈곳</td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5" align="center">
					등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
	</div>
</body>
</html>