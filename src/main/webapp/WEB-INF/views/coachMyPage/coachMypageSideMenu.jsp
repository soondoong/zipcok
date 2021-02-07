<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="mypage_sidebar">
	<ul>

		<li><a href="coachMyPage.do?id=${sessionScope.coachId }">내 프로필</a></li>
		<li><a href="#">내 홈짐보기</a></li>
		<li><a href="checkRequest.do?id=${sessionScope.coachId}">받은 요청 보기</a></li>
		<li><a href="chatRoomList.do?mem_id=${sessionScope.coachId}">채팅방</a></li>
		<li><a href="#">운동 커뮤니티 관리</a></li>
		<li><a href="coachMypageHomeGymLikeList.do?mem_id=${sessionScope.coachId}">좋아요 목록</a></li>
		<li><a href="coachMypageWriteList.do?mem_id=${sessionScope.coachId}">작성글관리</a></li>
		<li><a href="#">결제내역</a></li>
	</ul>
</div>