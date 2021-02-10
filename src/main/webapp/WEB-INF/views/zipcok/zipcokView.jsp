<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>

	<div id="container">
	<style>
	.matching_info_view {}
	.matching_info_view h2 {text-align: center; margin-bottom: 100px;}
	.matching_info_view ul {}
	.matching_info_view ul li {display: flex; align-items: center;}
	.matching_info_view ul li:not(:first-child) {margin-top: 100px;}
	.matching_info_view ul li .visual {width: 500px; height: 364px; margin: 0 30px; background: #f7f7f7;}
	.matching_info_view ul li .visual img {width: 500px;}
	.matching_info_view ul li .desc {}
	.matching_info_view ul li .desc h3 {margin: 0;}
	.matching_info_view ul li .desc p {margin: 24px 0 0;}
	</style>
	
	<!-- 등장 이벤트 주고싶은 element에 class : _motion
		_left, _right, _top, _bottom, _spin
	 -->

	<article class="matching_info_view">
		<h2>집에서 받는 PT<br>
			언제나, 어디에서나, 누구나 <br>
			건강함을 누릴 수 있도록</h2>
		<ul>
			<li>
				<div class="visual _motion _right">
					<img src="img/notice/11.png" >
				</div>
				<div class="desc _motion _right _delay300">
					<h3>운동, 이제 안락하게 집에서 하세요</h3>
					<p>코치를 만나 트레이닝 프로그램에 참여할 수 있게 해주는<br>
						새로운 형태의 홈 헬스 웹사이트입니다.</p>
				</div>
			</li>
			<li>
			    <div class="desc _motion _left _delay300">
					<h3>회원님들은 운동에만 집중하실 수 있습니다</h3>
					<p>운동 할 수 있는 공간, 전문적 지식을 가진 트레이너 <br>
						집콕헬스는 회원님과  엄선된 홈짐,<br>
						엄선된 트레이너 간의 징검다리가 되어드립니다</p>
				</div>
				<div class="visual _motion _left">
					<img src="img/notice/12.png" >
				</div>
			</li>
			<li>
				<div class="visual _motion _right">
					<img src="img/notice/10.png" >
				</div>
				<div class="desc _motion _right _delay300">
					<h3>본격 홈 트레이닝 시스템 만들기</h3>
					<p>저희는 회원님들의 건강을 집에서도 편하게 관리할 수 있게 해주는<br>
						[본격 홈트레이닝 시스템] 만들기에 주력합니다.</p>
				</div>
			</li>
		</ul>
	</article>
</div>

<%@include file="../_include/footer.jsp" %>

