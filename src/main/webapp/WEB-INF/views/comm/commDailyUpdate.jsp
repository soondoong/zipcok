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
<h1>일일 운동 게시판 글수정</h1>
<form name="dailyWrite" action="commDailyWrite.do" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td colspan="2"><input type="text" name="ex_subject" value="${dto.ex_subject}"></td>
		</tr>
		<tr>
			<td><input type="file"></td>
			<td><input type="file"></td>
			<td><input type="file"></td>
		</tr>
		<tr>
			<td colspan="3">사진미리보기</td>
		</tr>
		<tr>
			<td>오늘의 운동 :</td>
			<td><input type="text" name="ex_name" value="${dto.ex_name}"></td>
		</tr>
		<tr>
			<td>오늘의 소비 칼로리 :</td>
			<td><input type="text" name="ex_cal" value="${dto.ex_cal}"></td>
			<td><input type="button" value="수정"></td>
		</tr>
		<tr>
			<td><textarea name="ex_content">${dto.ex_content}</textarea></td>
		</tr>
		<tr>
			<td><input type="reset" value="처음부터 쓰기"></td>
			<td><input type="submit" value="글쓰기"></td>
		</tr>
	</table>
	</form>
</body>
</html>