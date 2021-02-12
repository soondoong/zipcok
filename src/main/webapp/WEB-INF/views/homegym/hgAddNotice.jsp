<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>

<script>
function homegymAddEnter(){
	if('${sessionScope.sid}'=='' && '${sessionScope.coachId}' == ''){
		window.alert('로그인 정보가 필요한 페이지입니다.');
		location.href = 'loginForm.do';
		return;
	}
	location.href = 'HomeGymAdd.do';
}
</script>
<style>
	.homegym_info_view {}
	.homegym_info_view h2 {text-align: center; margin-bottom: 100px;}
	.homegym_info_view ul {}
	.homegym_info_view ul li {display: flex; align-items: center;}
	.homegym_info_view ul li:not(:first-child) {margin-top: 100px;}
	.homegym_info_view ul li .visual {width: 500px; height: 364px; margin: 0 30px; background: #f7f7f7;}
	.homegym_info_view ul li .visual img {width: 500; height: 364px;}
	.homegym_info_view ul li .desc {}
	.homegym_info_view ul li .desc h3 {margin: 0;}
	.homegym_info_view ul li .desc p {margin: 24px 0 0;}
	.homegym_enter_bt {text-align: center;}
	</style>
<h1>홈짐 등록 안내</h1>
<div id="container">
	<!-- 등장 이벤트 주고싶은 element에 class : _motion
		_left, _right, _top, _bottom, _spin
	 -->
	<article class="homegym_info_view">
		<h2>부담없이 편한 장소에서 <br>운동을 시작해보세요</h2>
		<ul>
			<li>
				<div class="visual _motion _right">
					<img src="img/homegym/homegym_addnotice_pic_01.jpg" >
				</div>
				<div class="desc _motion _right _delay300">
					<h3>공간이 작아도 시작 할 수 있어요</h3>
					<p>매트를 깔 수 있는 공간만 있으면<br>
					좁은 공간에서도 가능한 수업으로 진행됩니다.</p>
				</div>
			</li>
			<li>
			    <div class="desc _motion _left _delay300">
					<h3>공간이 작아도 시작 할 수 있어요</h3>
					<p>매트를 깔 수 있는 공간만 있으면<br>
					좁은 공간에서도 가능한 수업으로 진행됩니다.</p>
				</div>
				<div class="visual _motion _left">
					<img src="img/homegym/homegym_addnotice_pic_02.jpg" >
				</div>
			</li>
			<li>
				<div class="visual _motion _right">
					<img src="img/homegym/homegym_addnotice_pic_03.jpg" >
				</div>
				<div class="desc _motion _right _delay300">
					<h3>공간이 작아도 시작 할 수 있어요</h3>
					<p>매트를 깔 수 있는 공간만 있으면<br>
					좁은 공간에서도 가능한 수업으로 진행됩니다.</p>
				</div>
			</li>
		</ul>
	</article>
	<div class = "homegym_enter_bt">
		<input type = "button" class = "btn btn-primary btn-lg sbtn" value = "홈짐 등록하러 가기" onclick = "javascript:homegymAddEnter();">
	</div>
</div>

<%@include file="../_include/footer.jsp" %>
