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
width:350px;
}
.image-container{
   overflow: hidden;
   display: flex;
   align-items: center;
   justify-content: center;
   width: 230px;
   height:300px;
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
</style>
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
		 		<option selected="selected">대면</option>
		 		<option>비대면</option>
		 		<option>모든유형</option>
		 	</select>
		 	
		 		<select id="category" name="category">
		 		<option selected="selected">모든카테고리</option>
		 		<option>퍼스널트레이닝</option>
		 		<option>필라테스</option>
		 		<option>요가</option>
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
		<h3 class=" mt-5">검색된 리스트</h3>

		<h5>${keyword.location}&nbsp;&gt;&nbsp;${keyword.extype }&nbsp;&gt;&nbsp;${keyword.category }</h5>
<div class="listWrap">

<c:forEach var="dto" items="${list}">

		<div class="oneperson">
		
			<div class="image-container">
		        <img src="img/coach/${dto.mfile_upload }" alt="">
		    </div>
		    
		    <div>
		    <span class="category">${dto.cate_name }</span>&nbsp; <span>${dto.mem_name }</span> 
		    </div>
		    
		     <div>
		    <span><a href="#">${dto.coach_intro_sub}</a></span>
		    </div>
		    
		    <div>
		    	<span class="extype">${dto.coach_ex_type }</span>&nbsp; <span>5.0</span>
		    </div>
		  </div>  
		  

</c:forEach>
</div> 

	<div>
	${pageStr}
	</div>

	</article>
</section>

<!-- 리스트 영역  -->

</body>
</html>