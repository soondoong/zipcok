<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<style>
	.homegym_info_view {}
	.homegym_info_view h1 {text-align: center;}
	.homegym_info_view h3 {text-align: center; margin-bottom: 100px;}
	.homegym_info_view ul {}
	.homegym_info_view ul li {display: flex; align-items: center;}
	.homegym_info_view ul li:not(:first-child) {margin-top: 100px;}
	.homegym_info_view ul li .visual {width: 500px; height: 364px; margin: 0 30px; background: #f7f7f7; text-align: center;}
	.homegym_info_view ul li .visual img {width: 500px;; height: 364px;}
	.homegym_info_view ul li .desc {}
	.homegym_info_view ul li .desc h3 {margin: 0;}
	.homegym_info_view ul li .desc p {margin: 24px 0 0;}
	.homegym_enter_bt {text-align: center;}
	</style>

<div id="container">
	<!-- 등장 이벤트 주고싶은 element에 class : _motion
		_left, _right, _top, _bottom, _spin
	 -->
	<article class="homegym_info_view">
		<h1>홈짐 이용 안내</h1>
		<h3>홈짐 이용 수칙</h3>
		<ul>
			<li>
				<div class="visual _motion _right">
					<img src="img/homegym/homegym_usenotice_pic_01.jpg" >
				</div>
				<div class="desc _motion _right _delay300">
					<h4>서로 존중해주세요.</h4>
					<p>홈짐 공유자도<br>
					대여자와 같은 사람입니다.</p>
				</div>
			</li>
			<li>
			    <div class="desc _motion _left _delay300">
					<h4>내 집처럼 관리해주세요.</h4>
					<p>남의 집이라고 생각하지말고<br>
					내 집처럼 아껴주세요.</p>
				</div>
				<div class="visual _motion _left">
					<img src="img/homegym/homegym_usenotice_pic_02.jpg" >
				</div>
			</li>
			<li>
				<div class="visual _motion _right">
					<img src="img/homegym/homegym_usenotice_pic_03.jpg" >
				</div>
				<div class="desc _motion _right _delay300">
					<h4>시간을 정확히 지켜주세요.</h4>
					<p>예약 시간 외의<br>
					공유자의 사생활을 지켜주세요.</p>
				</div>
			</li>
		</ul>
	</article>
</div>

<%@include file="../_include/footer.jsp" %>