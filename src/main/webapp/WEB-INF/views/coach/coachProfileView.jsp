<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

#sidebox { 
 position:absolute; 
 width:280px; 
 height: 200px;
 top:100px;
 right:200px;
 padding: 3px 10px 
 }
.requestDiv{
 position:absolute; 
 margin:0 auto;
top:100px;
left:30%;
width:400px;
height:550px;
display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {

	// 기존 css에서 div 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#sidebox").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		
		 $("#sidebox").css('top', newPosition);
	

		 
			/* 애니메이션
		$("#sidebox").stop().animate({
			"top" : newPosition
		}, 500);	 */

	}).scroll();

});




/*상담요청서 글자수 제한*/
function lengthLimit(){
    var content = $('#requestText').val();

    if (content.length > 60){
        alert("최대 60자까지 입력 가능합니다.");
        $('#requestText').val(content.substring(0, 60));
    }
}
</script>
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
			
			
			<!-- 견적요청 div -->
			<div class="card" id="sidebox" >
			<div class="card-body"> 
		 	 <p class="card-text">${dto.mem_name} 코치님에게 상담을 요청하여 서비스를 이용해보세요!</p>
			<input type="button" class="btn btn-primary" value="상담요청하기" onclick="showForm()">
			</div>
			</div>

			<!-- 견적요청 div -->
			
			
			<!-- 상담요청서폼 -->
			<div class="requestDiv" id="requestDiv">
			<%@include file="./chat/requestForm.jsp" %>
			</div>
			<!-- 상담요청서폼 -->
			
<script>
function showForm(){
	
	$('.requestDiv').css('display','block');
}	

function close(){
	$('.requestDiv').css('display','none');
}



</script>
			
			
			
			
				
		<!-- 코치사진영역 -->		
			<table  >
			<tr>
				<td rowspan="3" class="maintd"><img src="/zipcok/upload/member/${dto.mfile_upload }"></td>
				<td class="smalltd img1"><img src="/zipcok/upload/coach/${empty file[0].mfile_upload?'noimage.png': file[0].mfile_upload }"></td>	
				<td class="smalltd img2"><img src="/zipcok/upload/coach/${empty file[1].mfile_upload?'noimage.png' : file[1].mfile_upload }"></td>		
			</tr>
			
			<tr>
			<td class="smalltd img1"><img src="/zipcok/upload/coach/${empty file[2].mfile_upload?'noimage.png' : file[2].mfile_upload }"></td>	
			<td class="smalltd img2"><img src="/zipcok/upload/coach/${empty file[3].mfile_upload?'noimage.png' : file[3].mfile_upload }"></td>		
			</tr>
			
			<tr>
			<td class="smalltd img1"><img src="/zipcok/upload/coach/${empty file[4].mfile_upload?'noimage.png' : file[4].mfile_upload }"></td>	
			<td class="smalltd img2"><img src="/zipcok/upload/coach/${empty file[5].mfile_upload?'noimage.png' : file[5].mfile_upload }"></td>		
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
			<%@include file="./reviewView.jsp" %>
						
			<!-- 후기테이블 영역 -->	
			
		
	</article>
</section>
</body>
</html>