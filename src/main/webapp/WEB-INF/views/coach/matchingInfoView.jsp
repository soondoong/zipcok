<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.exWrap img{
width:500px;
}

.sunseo img{
float:left
}
.sdiv{
clear: both;
}
.sunseo2 div{
float:left
}
.sunseo3 img{
float:left
}
.sunseo2,.sunseo3{
clear:both
}
.sunseo,.sunseo2,.sunseo3{
text-align:left;
margin:0 auto;
margin-top:50px;
}
.allWrap{
width:65vw;
margin: 0 auto;
}
</style>
</head>
<body>
<%@include file="../header2.jsp" %>
<section>
	<article class="exWrap">
		<h2 class="text-center mt-4" style=" font-weight: 600;">부담없이 편한 장소에서 <br>운동을 시작해보세요</h1>
		<div class="allWrap"> 
		<div class="sunseo">
			<img src="img/coach/pic_start01.jpg" >
			<div class="divText">
				<h3>공간이 작아도 시작 할 수 있어요</h3>
				<p>매트를 깔 수 있는 공간만 있으면<br>
				좁은 공간에서도 가능한 수업으로 진행됩니다.</p>
			</div>
		</div>
		
		<div class="sdiv">
		</div>
		
		<div class="sunseo2">
		    <div class="divText">
				<h3>공간이 작아도 시작 할 수 있어요</h3>
				<p>매트를 깔 수 있는 공간만 있으면<br>
				좁은 공간에서도 가능한 수업으로 진행됩니다.</p>
			</div>
			<img src="img/coach/pic_start02.jpg" >
			</div>
			
			
		<div class="sdiv">
		</div> 
		
		<div class="sunseo3">
			<img src="img/coach/pic_start03.jpg" >
			<div class="divText">
				<h3>공간이 작아도 시작 할 수 있어요</h3>
				<p>매트를 깔 수 있는 공간만 있으면<br>
				좁은 공간에서도 가능한 수업으로 진행됩니다.</p>
			</div>
		</div>
		
		<div class="sdiv">
		</div>
		</div>
	</article>
</section>
</body>
</html>