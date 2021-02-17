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
		<h1>홈짐 등록 안내</h1>
		<h3>집에 운동 기구를 가지고있나요? <br>집에서 혼자 운동하는게 지루한가요?<br>그렇다면 홈짐 등록을 해보세요.</h3>
		<ul>
			<li>
				<div class="visual _motion _right">
					<img src="img/homegym/homegym_addnotice_pic_01.jpg" >
				</div>
				<div class="desc _motion _right _delay300">
					<h4>혼자 운동하는게 지루하신가요?</h4>
					<p>홈짐 대여를 통해<br>
					사람들과 어울려보세요.</p>
				</div>
			</li>
			<li>
			    <div class="desc _motion _left _delay300">
					<h4>원하는 날짜에<br>원하는 시간동안 대여하세요.</h4>
					<p>대여하고 싶은 기간을 정하고<br>
					대여하고 싶은 시간대를 정할 수 있습니다.</p>
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
					<h4>홈짐 대여를 통해 돈을 모을 수 있습니다.</h4>
					<p>일정 시간동안 자신의 홈짐을 공유하며<br>
					</p>대여 비용을 통해 차근차근 돈을 모아가세요.
				</div>
			</li>
		</ul>
	</article>
	<div class = "homegym_enter_bt">
		<input type = "button" class = "btn btn-primary btn-lg sbtn" value = "홈짐 등록하러 가기" onclick = "javascript:homegymAddEnter();">
	</div>
</div>

<%@include file="../_include/footer.jsp" %>
