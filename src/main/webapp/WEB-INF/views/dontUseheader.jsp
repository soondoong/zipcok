<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script>
    document.addEventListener("DOMContentLoaded", function(){

    const tb=document.querySelector('.navbar_toogleBtn');
    const menu=document.querySelector('.navbar_menu');
    const icons=document.querySelector('.navbar_icons');
    
        tb.addEventListener('click', ()=> {
    	menu.classList.toggle('active');
    	icons.classList.toggle('active'); 	
        });
    });
    </script>
    <header>
	<nav class="navbar">
 		<div class="navbar_logo">
 		 	<i class="fab fa-airbnb"></i>
 			<a href="#">집콕헬스</a> 
 		</div>
 		
 		<ul class="navbar_menu">
		<li class="menuli menuInfo"><a>소개</a></li>
			<ul class="submenu">
				<li><a class="submenuA">소개</a></li>
				<li><a class="submenuA">공지사항</a></li>
				<li><a class="submenuA">사이트이용안내</a></li>
				<li><a class="submenuA">F&A/고객센터</a></li>
			</ul>
		<li class="menuli menuHomeGym"><a>홈짐찾기</a></li>
			<ul class="submenu">
				<li><a class="submenuA">홈짐이용안내</a></li>
				<li><a class="submenuA">홈짐검색</a></li>
				<li><a class="submenuA">홈짐등록안내</a></li>
			</ul>
		<li class="menuli menuCoach"><a>코치찾기</a></li>
				<ul class="submenu">
				<li><a class="submenuA">코치매칭안내</a></li>
				<li><a class="submenuA">코치검색</a></li>
				<li><a class="submenuA">코치등록안내</a></li>
			</ul>
 		</ul>
 		
 		<ul class="navbar_icons">
 		<c:set var="sessionid"  value="${sessionScope.sid}"/>
		<c:if test="${!empty sessionid}">
		<li>${sessionScope.sname}님 로그인 중 &nbsp;|&nbsp;<a href="logOut.yong">로그아웃</a></li>
		</c:if>
		
 		<c:if test="${ empty sessionid }">
        <li><a href="javascript:loginOpen();">로그인</a></li>
         <li>|</li>
        <li><a href="member.yong">회원가입</a></li>
       </c:if>
 		
 		</ul>
 	<a href="javascript:seee();"  class="navbar_toogleBtn" ><i class="fas fa-bars"></i></a>
 	</nav>
 	</header>


