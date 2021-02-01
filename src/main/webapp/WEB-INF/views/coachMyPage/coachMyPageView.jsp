<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mpUl{ 
 list-style-type: none;   width:16vw; height: 100%;margin-top:40px;
 background-color:lightgray;
 width: 200px;
padding: 0;
margin:  0;
position: absolute;
height: 100%;
overflow: auto;

 }
.mpUl li{  
box-sizing: border-box;
text-decoration: none;
display: block;
color: #000;
padding: 8px 15px 8px 15px;
}
.mpUl li a{  color: black; font-size: 1.2rem; }
.profileIMG { width:500px; height:500px;  border-radius: 50%; overflow: hidden; margin-bottom: 50px;}
.profileIMG img { width:500px; height:500px; object-fit: cover;}
</style>
</head>
<body>
<%@include file="../header2.jsp"%>
<c:set var="dto" value="${resultMap.coachDTO }"/>
<c:set var="file" value="${resultMap.coachFileList }"/>
<c:set var="curri" value="${resultMap.curriList }"/>
<c:set var="review" value="${resultMap.reviewList }"/>
<c:set var="oneList" value="${oneCurriList}"/>
<c:set var="twoList" value="${twoCurriList }"/>	
	
	
<!-- 좌측 메뉴 -->	
<div class="leftWall">
	<div>
		<ul class="mpUl">
			<li><a href="coachMyPage.do?id=${sessionScope.coachId }">내 프로필</a></li>
			
			<li><a href="#">내 홈짐보기</a></li>
			
			<li><a href="checkRequest.do?id=${sessionScope.coachId}">받은 요청 보기</a></li>
			
			<li><a href="chatRoomList.do?mem_id=${sessionScope.coachId}">채팅방</a></li>
			
			<li><a href="#">운동 커뮤니티 관리</a></li>
		
			<li><a href="CMPageLikeList.do?id=${sessionScope.coachId}">좋아요 목록</a></li>
		
			<li><a href="#">작성글관리</a></li>
		
			<li><a href="#">결제내역</a></li>		
		</ul>

	</div>
</div>

<!-- 좌측 메뉴 -->	

<!-- 프로필 본문-->
<div class="container mt-5">		
		
	<div class="profileIMG">
	<img src="/zipcok/upload/member/${dto.mfile_upload }" >
	</div>
	<!-- 코치소개 영역 -->		
			<div>
			<span style="font-size:2rem; font-weight: 600;">${dto.mem_name}코치</span>	 
			<span style="font-size:1.3rem; font-weight: 300;"><img src="img/coach/star.png" class="starIMG">${dto.avg }</span>	
			</div>
			
			<div>
			<h1>${dto.coach_intro_sub }</h1>
			<br><br>
			
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">활동지역</span>
			<span>${dto.coach_floc }</span>
			<br>
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">강의유형</span>
			<span>${dto.coach_ex_type}</span>
			<br>
			<br><br>
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">소개</span>
			<p>${dto.coach_intro_cont }</p>
			<br>
			
			<!-- 커리큘럼영역 -->
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">커리큘럼</span>
			
			<c:if test="${empty curri}">
			<div>등록 된 커리큘럼이 없습니다.</div>
			</c:if>
			
			 
			<table style="margin-top:20px;">
			<tr>
			<td style="width:360px; text-align: left;">
			<c:if test="${!empty oneList}">
				<div  style="width:360px; height:300px;" >
					<p style="font-size:1.1rem; font-weight: 400;margin:0 0 50px 0;">${oneList.get(0).curri_catename}</p>
				<ul>					
				<c:forEach var="one" items="${oneList }">
					<li><p>${one.curri_name }</p><p>${one.curri_content }</p></li>
				</c:forEach>
					</ul>
				</div>
			</c:if>
			</td>
			
			
			
			<td style="width:360px; text-align: left;">
			<c:if test="${!empty twoList}">
				<div style="width:360px; height:300px;" >
					<p style="font-size:1.1rem; font-weight: 400;margin:0 0 50px 0;">${twoList.get(0).curri_catename}</p>
				<ul>
				<c:forEach var="two" items="${twoList }">
					<li><p>${two.curri_name }</p><p>${two.curri_content }</p></li>		
				</c:forEach>
					</ul>
				</div>
			</c:if>
			</td>
			</tr>
			
			</table>
			<!-- 커리큘럼영역 -->
			
			
			<br>
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">준비물</span>
			<p>${dto.coach_mat }</p>
			<br>
			
			</div>
	
</div>	
	
<!-- 프로필 본문-->		
</body>
</html>