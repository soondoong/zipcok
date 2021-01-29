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
	<br>
	<br>
	<div>
		<div>
			<a href="memberProfileForm.do?mem_id=${sessionScope.sid}">내 프로필</a>
		</div>
		<div>
			<a href="mypageLikeList.do?mem_id=${sessionScope.sid}">좋아요 목록</a>
		</div>
		<div>
			<a href="#">결제내역</a>
		</div>
		<div>
			<a href="#">채팅방</a>
		</div>
		<div>
			<a href="#">내 홈짐보기</a>
		</div>
		<div>
			<a href="#">작성글관리</a>
		</div>
	</div>
	<hr>
	<h3>${sessionScope.sname }님의 좋아요 목록</h3>
</body>
</html>