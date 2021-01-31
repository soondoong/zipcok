<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/comm/commDailyWriteLayout.css">
</head>
<body>
<%@include file="../header2.jsp"%>
<%@include file="./commSideMenu.jsp"%>
<div class="content">
<h1>식단 일지 게시판 글쓰기</h1>
<form name="dailyWrite" action="commDailyWrite.do" method="post">
	<table class="content">
		<tr>
			<th>제목</th>
			<td colspan="2"><input type="text" name="ex_subject"></td>
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
			<th>오늘의 식단 :</th>
			<td colspan="2"><input type="text" name="ex_name"></td>
		</tr>
		<tr>
			<th>오늘의 섭취 칼로리 :</th>
			<td colspan="2"><input type="text" name="ex_cal"><input type="button" value="수정"></td>
		</tr>
		<tr>
			<td colspan="3"><textarea cols="120" rows="10" name="ex_content"></textarea></td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: right"><input type="reset" value="처음부터 쓰기"><input type="submit" value="글쓰기"></td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>