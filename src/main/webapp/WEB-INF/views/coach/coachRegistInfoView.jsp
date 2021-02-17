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
<style>
.sec{display: flex;min-height: 680px;}
.newcontainer{min-width: 800px; width:100%; height:620px; margin:0 auto;text-align: center;}
.main_title{width:100%; padding:50px; height:620px; display: flex;justify-content:center; align-items:center;}
.joinPicDIV{width:500px;  height: 500px; background-image: url("img/coach/pic_coach.png"); background-size: cover;}
.one1{border-radius: 50%; width:27px; height: 27px; background-color: #e1d4ff; position:relative; top:10; left:-80px;}
.one2{border-radius: 50%; width:47px; height: 47px; background-color: #eccc89; position:relative; top:42px;left:-41px;}
.one3{border-radius: 50%; width:20px; height: 20px; background-color: pink; position:relative; top:54px;left:-34px;}

.one4{border-radius: 50%; width:47px; height: 47px; background-color: #e1d4ff; position:relative; top:-500; left:80px;}
.one5{border-radius: 50%; width:27px; height: 27px; background-color: #eccc89; position:relative; top:-172px;left:39px;}
.one6{border-radius: 50%; width:25px; height: 25px; background-color: pink; position:relative; top:-154px;left:20px;}
.subOneDiv{ width:100%;}
.subinfo{width:100%; height: 400px; background-color: #f4f3f6; display: flex; justify-content: center; padding:60px;}
</style>
<section class="sec">
	<article class="newcontainer">
	
		<form action="coachRegistView.do">
		<div class="main_title">
		    
			<div style="margin-right: 60px;">
				<h1 align="left">집콕헬스의 코치로 활동해보세요</h1>
				<p style="font-size: 18px;">더 많은 고객을 만나고 더 많은 수익을 창출 할 수 있습니다.</p>
				<input type="submit" value="코치로 등록하기" class="btn btn-lg btn-primary">
			</div>
			<div class="joinPicDIV">
				 <div class="one1"></div>
				<div class="one2"></div>
				<div class="one3"></div>
				
				 
			</div>
		</div>
		<div class="subOneDiv">
				<div class="one4"></div>
				<div class="one5"></div>
				<div class="one6"></div>
		</div>	
		
		<div class="subinfo">
				<img src="img/coach/ico_point_circle.png" style="width:700px;height: auto;">
		</div>
		
		</form>
	</article>
</section>

</body>
</html>