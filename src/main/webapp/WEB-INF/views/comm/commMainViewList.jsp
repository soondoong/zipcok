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
	
	
	<c:if test="${empty commInfo}">
		<h1>소속 커뮤니티가 없습니다!</h1>
		코치라면 커뮤니티를 생성하세요!
		일반 회원이라면 코치 매칭을 통해 알맞은 커뮤니티를 찾아보세요!
	</c:if>
		
	<c:if test="${!empty commInfo}">
		<h1>커뮤니티를 선택해주세요</h1>
		<form action="commMain.do">
			<select name="com_idx">
				<c:forEach var="dto" items="${commInfo}" varStatus="i">
				<option value="${dto.com_idx}">${dto.com_name}</option>
				</c:forEach>
			</select>
			<input type="submit" value="입장하기">
		</form>
	</c:if>
	</div>
</body>
</html>