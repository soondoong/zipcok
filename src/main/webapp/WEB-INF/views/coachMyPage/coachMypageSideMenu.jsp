<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#sideFont {
font-size : 25px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/comm/mypageSideMenuLayout.css">
<div class="sidebar">
		<ul class="sidemenu">
			<li class="sidemenuli" id="sideFont"><a href="coachMyPage.do?id=${sessionScope.coachId }">내 프로필</a></li>
			<br>
			<li class="sidemenuli" id="sideFont"><a href="#">내 홈짐보기</a></li>
			<br>
			<li class="sidemenuli" id="sideFont"><a href="checkRequest.do?id=${sessionScope.coachId}">받은 요청 보기</a></li>
			<br>
			<li class="sidemenuli" id="sideFont"><a href="chatRoomList.do?mem_id=${sessionScope.coachId}">채팅방</a></li>
			<br>
			<li class="sidemenuli" id="sideFont"><a href="#">운동 커뮤니티 관리</a></li>
			<br>
			<li class="sidemenuli" id="sideFont"><a href="coachMypageHomeGymLikeList.do?mem_id=${sessionScope.coachId}">좋아요 목록</a></li>
			<br>
			<li class="sidemenuli" id="sideFont"><a href="coachMypageWriteList.do?mem_id=${sessionScope.coachId}">작성글관리</a></li>
			<br>
			<li class="sidemenuli" id="sideFont"><a href="#">결제내역</a></li>		
		</ul>
	</div>