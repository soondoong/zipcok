<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/comm/commDailySideMenuLayout.css">
<div class="sidebar">
<ul class="sidemenu">
<li class="sidemenuli"><a href="memberProfileForm.do?mem_id=${sessionScope.sid}">내 프로필</a></li>
<li class="sidemenuli"><a href="#">내 홈짐보기</a></li>
<li class="sidemenuli"><a href="#">받은 견적 보기</a></li>
<li class="sidemenuli"><a href="#">채팅방</a></li>
<li class="sidemenuli"><a href="mypageLikeList.do?mem_id=${sessionScope.sid}">좋아요 목록</a></li>
<li class="sidemenuli"><a href="#">작성글관리</a></li>
<li class="sidemenuli"><a href="#">결제내역</a></li>
</ul>
</div>