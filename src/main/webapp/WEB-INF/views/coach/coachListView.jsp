<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="topSearchWrap">
	<div class="blueBackground">
		<div class="searchDiv">
		 	<select>
		 		<option selected="selected">지역</option>
		 		<option>강서구</option>
		 		<option>마포구</option>
		 		<option>서대문구</option>
		 	</select>
		 	
		 		<select>
		 		<option selected="selected">운동카테고리</option>
		 		<option>퍼스널트레이닝</option>
		 		<option>필라테스</option>
		 		<option>요가</option>
		 	</select>
		 	
		 	<input type="button" value="검색하기">
		</div>
	
	</div>
</div>
<!-- 상단 검색바 영역  -->


<!-- 리스트 영역  -->

<section>
	<article class="contentsWrap">
		<h3 class=" mt-5">나도 몸짱! 고강도 전신운동</h3>
		
	<div class="listWrap">
		<div class="oneperson">
			<div class="image-container">
		        <img src="img/coach/324f.jpg" alt="">
		    </div>
		    
		    <div>
		    <span class="category">퍼스널트레이닝</span>&nbsp; <span>박병창</span> 
		    </div>
		    
		     <div>
		    <span><a href="#">한 달만에 핫바디만드는, 고강도 전신 근력 트레이닝</a></span>
		    </div>
		    
		    <div>
		    	<span class="extype">대면</span>&nbsp; <span>5.0</span>
		    </div>
		  </div>  
		  
		  	<div class="oneperson">
			<div class="image-container">
		        <img src="img/coach/324f.jpg" alt="">
		    </div>
		    
		    <div>
		    <span class="category">퍼스널트레이닝</span>&nbsp; <span>박병창</span> 
		    </div>
		    
		     <div>
		    <span>한 달만에 핫바디만드는, 고강도 전신 근력 트레이닝</span>
		    </div>
		    
		    <div>
		    	<span class="extype">대면</span>&nbsp; <span>5.0</span>
		    </div>
		  </div> 
	</div>

	
	<h3 class="mt-5">나를 위한, 힐링의 시간</h3>

	<div class="listWrap2">
		
		
	</div>
	</article>
</section>

<!-- 리스트 영역  -->
</body>
</html>