<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header2.jsp" %>
<script>
function login_check(){
	if('${sessionScope.sid}'=='' && '${sessionScope.coachId}'==''){
		window.alert('로그인이 필요한 페이지 입니다.');
		location.href='loginForm.do';
		return;
	}
	location.href = 'HomeGymAdd.do';
}
</script>
<h1>홈짐 등록 안내</h1>
<c:if test = "${!check_result }">
<input type = "button" value = "내 홈짐 보러가기" onclick = "#">
</c:if>
<c:if test = "${check_result }">
<input type = "button" value = "홈짐 등록하러 가기" onclick = "javascript:login_check();">
</c:if>
</body>
</html>