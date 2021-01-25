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
			<td colspan="3" align="center">${pageStr}</td>
			<td><a href="commDailyWrite.do">글쓰기</a></td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.ex_idx}</td>
				<c:url var="contentUrl" value="commDailyList.do">
					<c:param name="idx">${dto.ex_idx}</c:param>
				</c:url>
				<td><a href="commDailyContent.do?ex_idx=${dto.ex_idx}">${dto.ex_subject}</a></td>
				<td>${dto.ex_cal}</td>
				<td>${dto.ex_id}</td>
				<td>${dto.ex_readnum}</td>
				<td>${dto.ex_writedate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>