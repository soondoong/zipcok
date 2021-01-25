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
<br><br><br>
	<h2>로그인</h2>
	<form action="login.do">
		<div>
			<div>
				<input type="text" name="mem_id" value="${cookie.saveid.value}" placeholder="ID">
			</div>
			<div>
				<input type="password" name="mem_pwd" placeholder="Password">
			</div>
			<div>
				<input type="checkbox" name="saveid" value="on" ${empty cookie.saveid.value?'':'checked' }>
				 ID Save &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="로그인">
			</div>
			<div>
				<a href="#">ID Find</a> / <a href="#">Pwd Find</a>
			</div>
			<br>
			<div>
				<input type="button" value="카카오 로그인">
			</div>
		</div>
	</form>
</body>
</html>