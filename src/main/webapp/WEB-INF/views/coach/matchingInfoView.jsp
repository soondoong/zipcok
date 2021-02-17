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
	</style>
	
	<!-- 등장 이벤트 주고싶은 element에 class : _motion
		_left, _right, _top, _bottom, _spin
	 -->

	<article class="matching_info_view">
		<h2>부담없이 편한 장소에서 <br>운동을 시작해보세요</h2>
		<ul>
			<li>
				<div class="visual _motion _right">
					<img src="img/coach/pic_start01.jpg" >
				</div>
				<div class="desc _motion _right _delay300">
					<h3>공간이 작아도<br> 시작 할 수 있어요</h3>
					<p>매트를 깔 수 있는 공간만 있으면<br>
					좁은 공간에서도 가능한 수업으로 진행됩니다.</p>
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
					<p>집뿐만 아니라 사무실, 근처 공원, 헬스장 등<br>
						회원님이 원하는 장소에서의 운동을 도와드립니다.</p>
				</div>
			</li>
		</ul>
	</article>
</div>

<%@include file="../_include/footer.jsp"%>



