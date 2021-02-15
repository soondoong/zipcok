<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="mypage_sidebar">
	<ul>
		<li><a href="memberProfileForm.do?mem_id=${sessionScope.sid}">내 프로필</a></li>
		<li><a href="myHomeGymHavingCheck.do?mem_id=${sessionScope.sid}">내 홈짐보기</a></li>
		<li><a href="checkRequest.do?id=${sessionScope.sid}">보낸 요청서보기</a></li>
		<li><a href="chatRoomList.do?mem_id=${sessionScope.sid}">채팅방</a></li>
		<li><a href="mypageHomeGymLikeList.do?mem_id=${sessionScope.sid}">좋아요 목록</a></li>
		<li><a href="mypageWriteList.do?mem_id=${sessionScope.sid}">작성글관리</a></li>
		<li><a href="mypageHomeGymPayList.do?mem_id=${sessionScope.sid}">결제내역</a></li>
	</ul>
</div>