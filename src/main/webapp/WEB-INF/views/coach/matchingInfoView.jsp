<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"> 
</head>
<body>
<%@include file="../header2.jsp" %>
<div id="container">
	<style>
	.matching_info_view {color: #333131; }
	.matching_info_view h2 { text-align: center; margin-top:50px;margin-bottom: 90px; font-weight: 600;}
	.matching_info_view ul {}
	.matching_info_view ul li {display: flex; align-items: center;}
	.matching_info_view ul li:not(:first-child) {margin-top: 100px;}
	.matching_info_view ul li .visual {width: 540px; height: 364px; margin: 0 60px 0 30px; background: #f7f7f7;}
	.matching_info_view ul li .visual img {width: 540px;}
	.matching_info_view ul li .desc {}
	.matching_info_view ul li .desc h3 {margin: 0;font-weight: 550;}
	.matching_info_view ul li .desc p {margin: 24px 0 0; font-size: 18px;}
	
	.secondInfo_div{display:flex; flex:1; justify-content:center; padding:30px;width:100%; height: 400px; background-color: #3c6fd7;}
	.secondInfo_div h2{ color:white;  font-weight: 600; }
	.icons{font-size:150px; color:white; }
	.info_text{color:white;font-size:18px; margin-top:20px;}
	.iconWrap{width:260px;}
	</style>
	
	<!-- 등장 이벤트 주고싶은 element에 class : _motion
		_left, _right, _top, _bottom, _spin
	 -->

	<article class="matching_info_view">
		<h2>부담없이 편한 장소에서 코치님과 함께 <br>운동을 시작해보세요</h2>
		<ul>
			<li>
				<div class="visual _motion _right">
					<img src="img/coach/pic_start01.jpg" >
				</div>
				<div class="desc _motion _right _delay300">
					<h3>대면 수업,비대면 수업<br>모두 선택 할 수있어요</h3>
					<p>매칭된 코치와 상담을 통해 일정을 <br>
					조율하세요! 어디에서든 원하시는<br> 운동을 배우실 수 있습니다.</p>
				</div>
			</li>
			<li>
			    <div class="desc _motion _left _delay300">
					<h3>운동 기구가 없어도<br> 괜찮아요</h3>
					<p>수업에 필요한 소도구는 코치가 준비하며<br>
						회원님은 마음가짐만 준비해주세요.</p>
				</div>
				<div class="visual _motion _left">
					<img src="img/coach/pic_start02.jpg" >
				</div>
			</li>
			<li>
				<div class="visual _motion _right">
					<img src="img/coach/pic_start03.jpg" >
				</div>
				<div class="desc _motion _right _delay300">
					<h3>원하는 장소 어디든<br> 가능해요</h3>
					<p>집뿐만 아니라 사무실, 근처 공원,<br> 헬스장 등
						회원님이 원하는 장소에서의 운동을 도와드립니다.</p>
				</div>
			</li>
		</ul>
	
	</article>
</div>	
	<article>
		
		<div class="secondInfo_div">
		<h2>이용방법</h2>
			<div class="iconWrap">
				<i class="bi bi-binoculars lookingicon icons"></i>
				<p class="info_text">1. 원하는 조건의 코치를 찾아보세요!</p>
			</div>
			<div  class="iconWrap">
				<i  class="bi bi-arrow-right-short icons"></i>
			</div>
			<div  class="iconWrap">
				   <i class="bi bi-calendar-week calendericon icons"></i>
				<p class="info_text">2. 채팅을 통해 궁금한 점을 물어보고 일정을 조율하세요.</p>
			</div> 
			<div  class="iconWrap">
				<i class="bi bi-arrow-right-short icons"></i>
			</div>
			<div  class="iconWrap">
				<i class="bi bi-emoji-smile icons"></i>
				<p class="info_text">3. 결제 후 코치님과의 수업이 진행 됩니다!</p>
			</div>
		</div>
	</article>


<%@include file="../_include/footer.jsp"%>



