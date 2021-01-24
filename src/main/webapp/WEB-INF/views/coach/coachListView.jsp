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



.listWrap{
margin-top:40px;
padding:0px 30px;
}
.image-container img{
width:350px;
}
.image-container{
   overflow: hidden;
   display: flex;
   align-items: center;
   justify-content: center;
   width: 200px;
   height:300px;
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
	<article>
	<div class="listWrap">
		<h3>나도 몸짱! 고강도 전신운동</h3>

			<div class="image-container">
		        <img src="img/coach/324f.jpg" alt="">
		    </div>
		    
	</div>
	</article>
	
	
	<article>
	<div>
		<h3>나를 위한, 힐링의 시간</h3>
		
	</div>
	</article>
</section>

<!-- 리스트 영역  -->
</body>
</html>