<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
width:100%;
margin:0;
padding:0;
}
.secondWrap{
padding:50px 100px 0px 100px;
width: 1200px;
margin:0 auto;
}
table{
width: 1000px;
margin:60px 0px;
}
.maintd img{
 max-width: 100%;
  width: 500px;
  height: 700px;
  object-fit: cover;

}

.smalltd img{
 max-width: 100%;
 width: 300px;
 height: 200px;
object-fit: cover;

}
.starIMG{
 width:40px;
padding:0 10px 0 10px;
}
</style>

</head>
<body>
<%@include file="../header2.jsp" %>
<c:set var="dto" value="${resultMap.coachDTO }"/>
<c:set var="file" value="${resultMap.coachFileList }"/>
<c:set var="curri" value="${resultMap.curriList }"/>
<c:set var="review" value="${resultMap.reviewList }"/>
<c:set var="oneList" value="${oneCurriList}"/>
<c:set var="twoList" value="${twoCurriList }"/>
<section>
	<article class="secondWrap">
				
		<!-- 코치사진영역 -->		
			<table  >
			<tr>
				<td rowspan="3" class="maintd"><img src="/zipcok/upload/member/${dto.mfile_upload }"></td>
				<td class="smalltd"><img src="/zipcok/upload/member/${dto.mfile_upload }"></td>	
				<td class="smalltd"><img src="/zipcok/upload/member/${dto.mfile_upload }"></td>				
			</tr>
			
			<tr>
			<td class="smalltd"><img src="/zipcok/upload/member/${dto.mfile_upload }"></td>
			<td class="smalltd"><img src="/zipcok/upload/member/${dto.mfile_upload }"></td>
			</tr>
			
			<tr>
			<td class="smalltd"><img src="/zipcok/upload/member/${dto.mfile_upload }"></td>
			<td class="smalltd"><img src="/zipcok/upload/member/${dto.mfile_upload }"></td>
			</tr>
			</table>
		<!-- 코치사진영역 -->
		
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
			
			
		<!-- 코치소개 영역 -->		
		
		
			<!-- 후기테이블 영역 -->
			<p style="font-size:1.8rem; font-weight: 600;">후기</p>
			
			<c:if test="${empty review}">
			<div>작성 된 후기가 없습니다.</div>
			</c:if>
			
			<c:if test="${!empty review}">
			<table border="1" width="800px" cellspacing="0">
				<c:forEach var="r" items="${ review }">
					
				<tr>
				<td>${r.rev_mem_id }</td>
				</tr>
				<tr>
				<td><span>${r.rev_star }</span><span>${r.rev_writedate}</span></td>
				</tr>
				<tr>
				<td>${r.rev_sub }</td>
				</tr>
				<tr>
				<td>${r.rev_cont }</td>
				</tr>
				
				</c:forEach>
			</table>
			</c:if>
		
			
			
			<!-- 후기테이블 영역 -->	
	</article>
</section>
</body>
</html>