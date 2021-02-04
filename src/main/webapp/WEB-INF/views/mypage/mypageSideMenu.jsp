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
<li class="sidemenuli"><a href="memberProfileForm.do?mem_id=${sessionScope.sid}" id="sideFont">내 프로필</a></li>
<br>
<li class="sidemenuli" id="sideFont"><a href="#">내 홈짐보기</a></li>
<br>
<li class="sidemenuli" id="sideFont"><a href="checkPMRequest.do?id=${sessionScope.sid}">받은 견적 보기</a></li>
<br>
<li class="sidemenuli" id="sideFont"><a href="chatRoomList.do?mem_id=${sessionScope.sid}">채팅방</a></li>
<br>
<li class="sidemenuli"><a href="mypageHomeGymLikeList.do?mem_id=${sessionScope.sid}" id="sideFont">좋아요 목록</a></li>
<br>
<li class="sidemenuli"><a href="mypageWriteList.do?mem_id=${sessionScope.sid}" id="sideFont">작성글관리</a></li>
<br>
<li class="sidemenuli" id="sideFont"><a href="mypageHomeGymPayList.do?mem_id=${sessionScope.sid}" id="sideFont">결제내역</a></li>
<br>
</ul>
</div>