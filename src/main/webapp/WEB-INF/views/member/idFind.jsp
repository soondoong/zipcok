<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.idFind-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}
.idFind-button-wrap button{
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
<br><br>
<div class="idFind-container" style="height: 615px;">
<br><br><br><br>
<h2>아이디 찾기</h2>
<br>
<form action="idFind.do">
	<div>
		<label style="font-size : 20px;">가입하신 이메일</label>
		<input type="text" name="mem_email" required="required">
		<div class="idFind-button-wrap">
				<button type="submit">찾기</button>
				<button type="button" onclick="backPage()">돌아가기</button>
		</div>
		
	</div>
</form>
</div>
<%@include file="../_include/footer.jsp" %>
</body>
</html>