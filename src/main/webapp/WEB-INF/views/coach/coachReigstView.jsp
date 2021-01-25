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
<br><br><br>
<h2>회원가입</h2>
<hr>
<br>
<h6>기본 정보 입력</h6>
<hr>
<form action="memberJoin.do">
<ul>
	<h3>기본정보</h3>
	<li><input type="text" name="mem_name" readonly=" readonly" value=""></li>
	<li><input type="text" name="mem_id" readonly="readonly" value=""></li>
 	<li><input type="text" name="mem_faddr" placeholder="대주소"></li>
   	<li><input type="text" name="mem_saddr" placeholder="상세주소"></li>

<h2>코치정보 등록하기</h2>
   <li>
   <h3>활동지역</h3>
   <input type="text" name="mem_faddr" placeholder="대주소"><input type="button" value="주소찾기">
   <br>
   <input type="text" name="mem_saddr" placeholder="상세주소">
   </li>
</ul>

	
	<!-- 코치 정보 입력하기 -->
	
	
	
	
	
	
	
	
	
	
	
</ul>



<input type="submit" value="코치로 가입하기">
</form>
</body>
</html>