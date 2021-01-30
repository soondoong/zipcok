<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
<div id="wrap">
	<header id="newHeader">
		<div class="header_inner">
			<h1 class="logo"><a href="index.do">ZIPCOK</a></h1>
	
			<nav id="gnb" class="gnb">
				<ul>
					<li>
						<a href="zipcokView.do">소개</a>
						<ul>
							<li><a href="zipcokView.do">집콕헬스 소개</a></li>
							<li><a href="noticeList.do">공지사항</a></li>
							<li><a href="csList.do">F&A/고객센터</a></li>
						</ul>
					</li>
					<li>
						<a href="HomeGymList.do">홈짐찾기</a>
						<ul>
							<li><a href="HomeGymList.do">홈짐검색</a></li>
							<li><a href="HomeGymUseNotice.do">홈짐이용안내</a></li>
							<li><a href="HomeGymAddNotice.do">홈짐등록안내</a></li>
						</ul>
					</li>
					<li>
						<a href="">코치찾기</a>
						<ul>
							<li><a href="findCoachList.do">코치검색</a></li>
							<li><a href="coachMatchingInfo.do">코치매칭이용안내</a></li>
							<li><a href="coachRegistInfoView.do">코치로 등록하기</a></li>
						</ul>
					</li>
					<li>
						<a href="">커뮤니티</a>
						<ul>
							<li><a href="commMain.do">내 커뮤니티보기</a></li>
						</ul>
					</li>
					<li><a href="#">관리자페이지</a></li>
				</ul>
			</nav>
			<nav class="util_menu">
				<ul>
					<c:if test="${empty sessionScope.sid }">
						<li class="loginLi"><a href="loginForm.do">로그인</a></li>
						<li class="signLi"><a href="memberJoinForm.do">회원가입</a></li>
					</c:if>
					
					<c:if test="${!empty sessionScope.sid }">
						<li>${sessionScope.sname }님 환영합니다!</li>
						<li><a href="memberProfileForm.do?mem_id=${sessionScope.sid }">마이페이지</a></li>
						<li><a href="logout.do">로그아웃</a></li>	
					</c:if>
					
					<c:if test="${!empty sessionScope.coachId }">
						<li>${sessionScope.sname }님 환영합니다!</li>
						<li><a href="coachProfileForm.do?mem_id=${sessionScope.coachid }">코치마이페이지</a></li>
						<li><a href="logout.do">로그아웃</a></li>	
					</c:if>
				</ul>
			</nav>
		</div>
	</header>
