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
	location.href='loginForm.do';
}
</script>
</head>
<body>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp"%>
<div class="pwdFind-container" style="height: 655px;">
	<br><br><br><br>
	
	<h2>비밀번호 찾기</h2>
	<br>
<form action="pwdFind.do">
	<div><label style="font-size : 20px;">인증번호</label><input type="text" name="code1" value="1234" readonly="readonly"></div>
	<br>
	<div><label style="font-size : 20px;">아이디</label><input type="text" name="mem_id" placeholder="ID" required="required"></div>
	<div><label style="font-size : 20px;">인증번호위에꺼입력</label><input type="text" name="code2" placeholder="CODE" required="required"></div>
	<div class="pwdFind-button-wrap">
	<button type="submit">Find</button>
	<button type="button" onclick="backPage()">Back</button>
	</div>
</form>
</div>
 <%@include file="../_include/footer.jsp" %>
</body>
</html>