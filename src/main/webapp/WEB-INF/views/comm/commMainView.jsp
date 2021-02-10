<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/comm/commDailyMainLayout.css">
</head>
<body>
<c:set var="coach_name" value="${coach_name}"></c:set>
<%@include file="../header2.jsp" %>

	<style>
			.community_wrap {display: flex; min-height: calc(100vh - 92px);}
			.community_wrap .community_sidebar {flex: 0 0 250px; background-color: #ccc;}
			.community_wrap .community_sidebar ul {padding: 0; margin:  0;}
			.community_wrap .community_sidebar ul li.sidemenuli a {display: block; color: #000; padding: 8px 15px 8px 15px; font-weight: bold;}
			.community_wrap .community_sidebar ul li.sidemenuli a.comm {background-color: tomato; color: #fff;}
			.community_wrap .community_sidebar ul li.sidemenuli a:hover:not(.comm) {background-color: #333; color: #fff;}
	</style>	

	<div class="community_wrap">
	<%@include file="./commSideMenu.jsp" %>
		<h1>커뮤니티 메인</h1>
		<h3>코치 : ${coach_name} 코치</h3>
		달력
		<h3>함께 운동을 하는 운동 메이트들입니다!!</h3>
	</div>
</body>
</html>