<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집콕헬스 공지사항</title>
<%@include file="../header2.jsp" %>
</head>
<body>
<h1>공지사항</h1>
<form action="noticeWriteView.do">
<table>
	<thead>
	<tr>
		<th>카테고리 유형</th>
		<td> <select >
			<option selected="selected">전체</option>
			<option>홈짐</option>
			<option>코치 매칭</option>
			<option>결제</option>
		</select></td>
	</tr>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
	<tfoot>
		<tr>
			<td>페이징 들어갈 자리</td>
			<td><input type="submit" value="글쓰기"></td>
		</tr>
	</tfoot>
</table>
</form>
</body>
</html>