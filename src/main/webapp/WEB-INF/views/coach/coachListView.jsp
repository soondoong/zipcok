<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.blueBackground{
background-color:   #3978df;
width:100%;
height: 190px;
}
.searchDiv{
 position: relative;
 top: 40%;
text-align:center;
line-height: 1;
}
.contentsWrap{
magin:0 auto;
margin-top:40px;
padding:0px 30px;
}
.listWrap{
width:230px;
display: flex;
}
.oneperson{
margin:0 20px 0 20px;
float:left;
}

.image-container img{
width:250px;
height:270px;
object-fit: cover;

}
.image-container{
   overflow: hidden;
   display: flex;
   align-items: center;
   justify-content: center;
   width: 230px;
   height:270px;
   margin-bottom:15px;
}
.extype{
text-align:center;
display:inline-block;
width:50px;
background-color: gray;
color:white;
border-radius: 20%;
font-size: 0.8rem;
}
.category{
font-size: 0.8rem;
}
.h5search{
margin-bottom: 30px;
}
.paging{
position: relative;
left:50%;
}
.paging a{
font-size:1.6rem;
padding-right:20px;
}
.starIMG{
 width:29px;
padding:0 8px 0 4px;
 }
 .contentsWrap h3{
 margin-bottom:40px;
 font-weight: 600;
 }
</style>

<script>
function search(){
	
	var location=document.getElementById("location").value;
	var extype=document.getElementById("extype").value;
	var category=document.getElementById("category").value;
	var params="location="+location+"extype="+extype+"category="+category;
	sendRequest('searchCoachAjax.do',params,showResult,'GET');
	
}


</script>
</head>
<body>
<%@include file="../header2.jsp" %>
<!-- 상단 검색바 영역  -->
<form name="fm" action="searchCoach.do">
<div class="topSearchWrap">
	<div class="blueBackground">

	
		<div class="searchDiv">
		 	<select id="location" name="location">
		 		<option selected="selected">전체지역</option>
		 		<option>강서구</option>
		 		<option>마포구</option>
		 		<option>서대문구</option>
		 	</select>
		 	
		 	<select id="extype" name="extype">
		 		<option selected="selected">전체</option>
				<option>대면</option>
		 		<option>비대면</option>
		 		<option>둘다</option>
		 	</select>
		 	
		 		<select id="category" name="category">
		 		<option selected="selected">모든카테고리</option>
		 		<option>퍼스널트레이닝</option>
		 		<option>필라테스</option>
		 		<option>요가</option>
		 		<option>다이어트</option>
		 	</select>
		 	
		 	<input type="submit" value="검색하기">
		</div>
	
	</div>
</div>
</form>
<!-- 상단 검색바 영역  -->


<!-- 리스트 영역  -->

<section>
	<article class="contentsWrap">
		<h3 class=" mt-5">나도 몸짱! 고강도 전신운동</h3>
		
<div class="listWrap">

<c:forEach var="dto" items="${map.pt }">
		<div class="oneperson">
			<div class="image-container">
		        <img src="/zipcok/upload/member/${dto.mfile_upload}" alt="">
		       
		    </div>
		    
		    <div>
		    <span class="category">${dto.cate_name }</span>&nbsp; <span>${dto.mem_name }</span> 
		    </div>
		    
		     <div>
		    <span><a href="coachProfile.do?id=${ dto.coach_mem_id }">${dto.coach_intro_sub}</a></span>
		    </div>
		    
		    <div>
		    	<span class="extype">${dto.coach_ex_type }</span>&nbsp; 
		    	<span><img src="img/coach/star.png" class="starIMG">${dto.avg }</span>
		    	&nbsp; <span>(${dto.starcnt }명 참여)</span>
		    </div>
		  </div>  
		  

</c:forEach>
</div> 


	
	<h3 class="mt-5">나를 위한, 힐링의 시간</h3>

	<div class="listWrap2">
		<c:forEach var="dto2" items="${map.yoga }">

		<div class="oneperson">
		
			<div class="image-container">
		        <img src="/zipcok/upload/member/${dto2.mfile_upload}" alt="">
		    </div>
		    
		    <div>
		    <span class="category">${dto2.cate_name }</span>&nbsp; <span>${dto2.mem_name }</span> 
		    </div>
		    
		     <div>
		    <span><a href="coachProfile.do?id=${ dto2.coach_mem_id }">${dto2.coach_intro_sub}</a></span>
		    </div>
		    
		    <div>
		    	<span class="extype">${dto2.coach_ex_type }</span>&nbsp; 
		    	<span><img src="img/coach/star.png" class="starIMG">${dto2.avg }</span>&nbsp; <span>(${dto2.starcnt }명 참여)</span>
		    </div>
		  </div>  
		  

</c:forEach> 
		
	</div>
	</article>
</section>

<!-- 리스트 영역  -->
</body>
</html>