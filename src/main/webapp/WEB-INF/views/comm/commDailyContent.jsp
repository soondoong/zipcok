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
<h1>일일 운동 게시판 글보기</h1>
<table border="1" cellspacing="0" width="550">
		<tr>
			<th>번호</th>
			<td>${dto.ex_idx}</td>
			<th>작성날짜</th>
			<td>${dto.ex_writedate}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.ex_writer}</td>
			<th>조회수</th>
			<td>${dto.ex_readnum}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.ex_subject}</td>
		</tr>
		<tr height="250">
			<td colspan="4" align="left" valign="top">${dto.ex_content }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">목록으로</td>
		</tr>
	</table>
</body>
</html>