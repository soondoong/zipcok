<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp"%>
	<br>
	<br>
	<h2>비밀번호 찾기</h2>
<form action="pwdFind.do">
	<div><label>인증번호</label><input type="text" name="code1" value="1234" readonly="readonly"></div>
	<br>
	<div><label>아이디</label><input type="text" name="mem_id" placeholder="ID"></div>
	<div><label>인증번호를 입력해주세요</label><input type="text" name="code2" ></div>
	<div><input type="submit" value="찾기"></div>
</form>
</body>
</html>