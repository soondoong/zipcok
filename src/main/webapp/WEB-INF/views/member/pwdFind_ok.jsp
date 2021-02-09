<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pwdFind-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}
.pwdFind-button-wrap button{
	width: 250px;
	height :48px;
	font-size: 18px;
	background: #257cda;
	color: white;
	border: solid 1px #257cda;
	border-radius: 5px;
	margin : 15px 0 15px 0;
}
</style>
<script>
function backPage(){
	location.href='pwdFindForm.do';
}
</script>
</head>
<body>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp"%>
<div class="pwdFind-container" style="height: 660px;">
<br><br><br><br><br><br><br><br>
<h2>${msg }</h2>
<div class="pwdFind-button-wrap">
<button type="button" onclick="backPage()">Back</button>
</div>
</div>
 <%@include file="../_include/footer.jsp" %>
</body>
</html>