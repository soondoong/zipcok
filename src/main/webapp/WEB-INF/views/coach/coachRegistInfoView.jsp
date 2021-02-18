<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
<body>
<%@include file="../header2.jsp" %>
<style>
.sec{display: flex;min-height: 680px;}
.newcontainer{min-width: 800px; width:100%; height:700px; margin:0 auto;text-align: center;}
.main_title{width:100%; padding:50px; height:700px; display: flex;justify-content:center; align-items:center;}
.joinPicDIV{width:500px;  height: 500px; background-image: url("img/coach/pic_coach.png"); background-size: cover;}
.one1{border-radius: 50%; width:27px; height: 27px; background-color: #e1d4ff; position:relative; top:10; left:-80px;}
.one2{border-radius: 50%; width:47px; height: 47px; background-color: #eccc89; position:relative; top:33px;left:-41px;}
.one3{border-radius: 50%; width:20px; height: 20px; background-color: pink; position:relative; top:54px;left:-34px;}

.one4{border-radius: 50%; width:47px; height: 47px; background-color: #e1d4ff; position:relative; top:-500; left:80px;}
.one5{border-radius: 50%; width:27px; height: 27px; background-color: #eccc89; position:relative; top:-172px;left:39px;}
.one6{border-radius: 50%; width:25px; height: 25px; background-color: pink; position:relative; top:-136px;left:52px;}

.one7{border-radius: 50%; width:47px; height: 47px; background-color: #e1d4ff; position:relative; top:-95px; left:151px;}
.one8{border-radius: 50%; width:17px; height: 17px; background-color: #eccc89; position:relative; top:-242px;left:39px;}
.one9{border-radius: 50%; width:45px; height: 45px; background-color: pink; position:relative; top:-226px;left:52px;}


.subOneDiv{ width:100%;}
.subinfo{  width:100%;  background-color: #f4f3f6; padding:70px 50px 50px 50px;}

.textdiv{width:300px;}
.textdiv strong{font-size: 20px;}
.textdiv p{font-size: 16px; margin-top:20px;}
.textdiv strong::before {
    content: '“';
     font-family: 'Spoqa Han Sans Neo', 'sans-serif'; 
    font-size: 42px;
    line-height: 26px;
    transform: translateX(-50%);
}
</style>
<section class="sec">
	<article class="newcontainer">
	
		<form action="coachRegistView.do">
		<div class="main_title">
		    
			<div style="margin-right: 60px;">
				<h1 align="left" style=" font-family: 'Spoqa Han Sans Neo', 'sans-serif';">집콕헬스의 코치로 활동해보세요</h1>
				<p style="font-size: 18px;">더 많은 고객을 만나고 더 많은 수익을 창출 할 수 있습니다.</p>
				<input type="submit" value="코치로 등록하기" class="btn btn-lg btn-primary">
			</div>
			<div class="joinPicDIV">
				 <div class="one1"></div>
				<div class="one2"></div>
				<div class="one3"></div>
				
				
				 
			</div>
			
				<div class="one4"></div>
				<div class="one5"></div>
				<div class="one6"></div>
				
		</div>
		
		<div style="position: absolute;">
				<div class="one7"></div>
				<div class="one8"></div>
				<div class="one9"></div>
		</div>
					
				
		
		<div class="subinfo">
			
				<div>					
					<h3 style=" font-family: 'Spoqa Han Sans Neo', 'sans-serif'; ">집콕헬스 코치가 말하는 집콕헬스의 장점을<br>
					직접 확인하세요</h3>
				</div>
				
					<img src="img/coach/ico_point_circle.png" style="width:700px;height: auto; margin:30px 0;">
				
				<div style="display: flex; justify-content: space-around;margin-top:30px;">
					<div class="textdiv">
						<strong>내가 원하는 일정에 맞춰<br> 일 할 수 있어요</strong>
						<p>집콕헬스는 평일, 주말 시간 상관없이 나와 가까운 지역에서
								수업할 수 있어서 탄력적으로 일을 하고
								수입도 늘리게 되었죠.</p>
					</div>
					<div class="textdiv">
							<strong>제공해주는 커뮤니티 기능을<br> 이용할수있어요</strong>
						<p>커뮤니티 기능을 통해 회원님들과 더 쉽게 소통하고 운동 효율을
						끌어올릴 수 있었어요</p>
					</div>
					<div class="textdiv">
							<strong>전문가가 아니어도 돼서<br> 부담이 적어요</strong>
						<p>취미로 요가를 한지 10년차인데 취미로도 돈을 벌 수 있어서 
						너무 좋아요</p>
					</div>
				</div>
				
				
		</div>
		
		</form>
	</article>
</section>

</body>
</html>