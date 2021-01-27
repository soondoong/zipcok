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
<br><br>
<h2>아이디 찾기</h2>
<form action="idFind.do">
	<div>
		<label>가입하신 이메일</label>
		<input type="text" name="mem_email" size="30">
		<input type="submit" value="찾기">
	</div>
</form>
</body>
</html>