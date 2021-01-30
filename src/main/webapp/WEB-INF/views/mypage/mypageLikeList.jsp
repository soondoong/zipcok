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
<%@include file="./mypageSideMenu.jsp" %>
<div style="margin-left: 200px; padding: 1px 16px;">
	<br>
	<h3>${sessionScope.sname }님의 좋아요 목록</h3>
</div>
</body>
</html>