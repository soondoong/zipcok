<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header2.jsp" %>
</head>
<body>

<form action="noticeWrite.do">
<table>
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
		<th>제목</th>
		<td><input type="text" name="subject"></td>
	</tr>
	<hr>
	<tr>
		<td>사진</td>
	</tr>
	<tr>
		<td colspan="6" align="center">
			<textarea rows="6" cols="100" name="content">
			내용을 입력해주세요
			</textarea>
		</td>
	</tr>
	<tr>
		<td><input type="button" value="파일첨부"></td>
		<td>
		<input type="submit" value="글쓰기">
		<input type="reset" value="다시작성">
		<input type="button" value="목록보기">
		</td>
	</tr>
</table>
</form>
</body>
</html>