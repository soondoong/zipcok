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
			.community_wrap {display: flex;min-height: 680px;}
			.cummunitysmall{ min-width: 800px; margin:0 auto; padding:50px; text-align: center;}
			.cummunitysmall h2,h1{text-shadow: 1px 3px 4px #e4e4e4;   margin-top:130px; margin-bottom:30px; color:black; font-weight: 600;}
			.goinbtn{ display: block; float:right;padding:7px 10px; width:150px;}
			.cumselect{width:400px; height: 49px; font-size: 23px;}
			.searchDiv{display: flex; justify-content: center;}
			.exserIMG{ width:100%;
			 background-image: url("img/coach/2000w.jpg");
			background-size:cover; }

	</style>	

<div class="community_wrap">
	
	<div class="cummunitysmall exserIMG">
		
		<c:if test="${empty commInfo}">
			<h1>소속 커뮤니티가 없습니다!</h1>
			코치라면 커뮤니티를 생성하세요!
			일반 회원이라면 코치 매칭을 통해 알맞은 커뮤니티를 찾아보세요!
		</c:if>
			
		<c:if test="${!empty commInfo}">
			<h2>커뮤니티를 선택해주세요</h2>
			<form action="commMain.do">
			
			<div class="searchDiv">
				<select name="com_idx" class="cumselect">
					<c:forEach var="dto" items="${commInfo}" varStatus="i">
					<option value="${dto.com_idx}">${dto.com_name}</option>
					</c:forEach>
				</select>
				<input type="submit" class="btn btn-primary btn-lg goinbtn"   value="입장하기">
			
			</div>
			</form>
		</c:if>
		
	</div>
	
</div>
</body>
 <%@include file="../_include/footer.jsp" %>