<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/comm/commDailyWriteLayout.css">
</head>
<body>
<%@include file="../header2.jsp"%>
<%@include file="./commSideMenu.jsp"%>
<div class="content">
<h1>식단 일지 게시판 글쓰기</h1>
<form name="foodWrite" action="commFoodWrite.do" method="post">
	<div id="foodSubject">
		제목 <input type="text" name="food_subject">
	</div>
		날짜 
			
		
			<input type="file">
			<input type="file">
			<input type="file">
		
			사진미리보기
		
			오늘의 식단 :
			<input type="text" name="food_name">
		
			오늘의 섭취 칼로리 :
			<input type="text" name="food_cal"><input type="button" value="수정">
		
			<textarea cols="120" rows="10" name="food_content"></textarea>
		
		<input type="reset" value="처음부터 쓰기"><input type="submit" value="글쓰기">
		
	
	</form>
	</div>
</body>
</html>