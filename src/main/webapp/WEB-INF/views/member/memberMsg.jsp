<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.joinOK-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}
.joinOK-button-wrap button{
	width: 250px;
	height :48px;
	font-size: 18px;
	background: deepskyblue;
	color: white;
	border: solid 1px deepskyblue;
	border-radius: 5px;
	margin : 15px 0 15px 0;
}
</style>
<script>
function show(){
	location.href='loginForm.do';
}
function backPage(){
	location.href='index.do';
}
</script>
</head>
<body>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<br>

<div class="joinOK-container" style="height: 650px;">

<div><h2>${msg }</h2></div>

<div class="joinOK-button-wrap">
				<button type="button" onclick="show()">로그인</button>
				<button type="button" onclick="backPage()">메인으로</button>
</div>
</div>
 <%@include file="../_include/footer.jsp" %>
</body>
</html>