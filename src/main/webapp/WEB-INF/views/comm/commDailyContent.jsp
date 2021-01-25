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
			<th>제목</th>
			<td>${dto.ex_subject}</td>
			<th>조회수</th>
			<td>${dto.ex_readnum}</td>
			<th>작성날짜</th>
			<td>${dto.ex_writedate}</td>
			<th>작성자</th>
			<td>${dto.ex_id}</td>
		</tr>
		<tr>
			<th>오늘의 운동</th>
			<td colspan="7">${dto.ex_name}</td>
		</tr>
		<tr>
			<th>오늘의 소비 칼로리</th>
			<td colspan="7">${dto.ex_cal}</td>
		</tr>
		<tr height="250">
			<td colspan="8" align="left" valign="top">${dto.ex_content }</td>
		</tr>
		<tr>
			<td>댓글작성자</td>
			<td colspan="6" align="center">댓글내용</td>
			<td><input type="button" value="삭제"></td>
		</tr>
		<tr>
			<td>댓글작성자</td>
			<td colspan="6"><input type="text"></td>
			<td><input type="button" value="댓글달기"></td>
		</tr>
		<tr>
			<td>이전글</td>
			<td>위화살표</td>
			<td colspan="6"><a href="#">이전글</a></td>
		</tr>
		<tr>
			<td>다음글</td>
			<td>아래화살표</td>
			<td colspan="6"><a href="#">다음글</a></td>
		</tr>
		<tr>
			<td><input type="button" value="삭제"></td>
			<td><input type="button" value="수정" onclick="location.href='commDailyUpdate.do?ex_idx=${dto.ex_idx}'"></td>
			<td><input type="button" value="목록보기"></td>
		</tr>
	</table>
</body>
</html>