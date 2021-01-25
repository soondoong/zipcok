<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Cache-Control" content="no-cache">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">



<!-- ======= Header ======= -->
<header id="header">
	<div class="container d-flex align-items-center headerContainer">

		<h1 class="logo">
			<a href="index.do">집콕헬스</a>
		</h1>
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt=""></a>-->

		<nav class="nav-menu d-none d-lg-block">
			<ul>
				<li class="drop-down infoLi"><a href="zipcokView.do">소개</a>
					<ul>
						<li><a href="zipcokView.do">집콕헬스 소개</a></li>
						<li><a href="noticeList.do">공지사항</a></li>
						<li><a href="#">F&A/고객센터</a></li>
					</ul></li>

				<li class="drop-down"><a href="HomeGymList.do">홈짐찾기</a>
					<ul>
						<li><a href="HomeGymList.do">홈짐검색</a></li>
						<li><a href="HomeGymUseNotice.do">홈짐이용안내</a></li>
						<li><a href="HomeGymAddNotice.do">홈짐등록안내</a></li>
					</ul></li>

				<li class="drop-down"><a href="">코치찾기</a>
					<ul>
						<li><a href="findCoachList.do">코치검색</a></li>
						<li><a href="coachMatchingInfo.do">코치매칭이용안내</a></li>
						<li><a href="coachSignInfo.do">코치로 등록하기</a></li>
					</ul></li>

				<li class="drop-down"><a href="">커뮤니티</a>
					<ul>
						<li><a href="commMain.do">내 커뮤니티보기</a></li>
					</ul></li>

				<li class="masterLi"><a href="#">관리자페이지</a></li>

				<c:if test="${empty sessionScope.sid }">
				
						<li class="loginLi"><a href="loginForm.do">로그인</a></li>
						<li class="signLi"><a href="memberJoinForm.do">회원가입</a></li>
			
				</c:if>
				<c:if test="${!empty sessionScope.sid }">
					<div>
						${sessionScope.sname }님 로그인중... / <a href="logout.do">로그아웃</a>
					</div>
				</c:if>
			</ul>
			<!-- mainmenu -->
		</nav>
		<!-- .nav-menu -->

	</div>
</header>
<!-- End Header -->
<!-- Vendor JS Files -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="assets/vendor/counterup/counterup.min.js"></script>
<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/venobox/venobox.min.js"></script>
<script src="assets/vendor/aos/aos.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
