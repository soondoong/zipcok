<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../header2.jsp"%>
	<br>
	<br>
	<br>
	<h2>로그인</h2>
	<form action="login.do">
		<div>
			<div>
				<input type="text" name="mem_id" value="${cookie.saveid.value}"
					placeholder="ID">
			</div>
			<div>
				<input type="password" name="mem_pwd" placeholder="Password">
			</div>
			<div>
				<input type="checkbox" name="saveid" value="on"
					${empty cookie.saveid.value?'':'checked' }> ID Save
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="submit" value="로그인" style="background-color: cornflowerblue; color: white; line-height: 1.80;">
			</div>
			<div>
				<a href="idFindForm.do">ID Find</a> / <a href="pwdFindForm.do">Pwd Find</a>
				<a href="kakaoLoginForm.do">카카오테스트</a>
			</div>
		</div>
	</form>
</body>
</html>