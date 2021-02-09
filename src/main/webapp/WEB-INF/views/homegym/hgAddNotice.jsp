<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<script>
function login_check(){
	if('${sessionScope.sid}'=='' && '${sessionScope.coachId}'==''){
		window.alert('로그인이 필요한 페이지 입니다.');
		location.href='loginForm.do';
		return;
	}
	location.href = 'HomeGymAdd.do';
}
</script>
<h1>홈짐 등록 안내</h1>
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
</div>
<c:if test = "${!check_result }">
<input type = "button" value = "내 홈짐 보러가기" onclick = "#">
</c:if>
<c:if test = "${check_result }">
<input type = "button" value = "홈짐 등록하러 가기" onclick = "javascript:login_check();">
</c:if>
<%@include file="../_include/footer.jsp" %>
