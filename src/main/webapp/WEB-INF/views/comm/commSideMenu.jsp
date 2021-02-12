<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/comm/commDailySideMenuLayout.css">
<%-- <c:set var="com_idx" value="${comminfo.com_idx}"></c:set>
<c:set var="com_coach_id" value="${comminfo.com_coach_id}"></c:set>
<c:set var="com_name" value="${comminfo.com_name}"></c:set>
<c:set var="com_mem_sum" value="${comminfo.com_mem_sum}"></c:set>
<c:set var="com_status" value="${comminfo.com_status}"></c:set>
<c:set var="com_opendate" value="${comminfo.com_opendate}"></c:set>
<c:set var="coach_name" value="${mem_name}"></c:set> --%>

<div class="community_sidebar">
	<ul class="sidemenu">
		<li class="sidemenuli"><a class="comm" href="commMain.do?com_idx=${com_idx }">${com_name}</a></li>
		<li class="sidemenuli"><a href="commDailyList.do">일일 운동 게시판</a></li>
		<!-- <li class="sidemenuli"><a href="commFoodList.do">식단 일지 게시판</a></li>
		<li class="sidemenuli"><a href="#">체중 공유 게시판</a></li>
		<li class="sidemenuli"><a href="#">운동 데이터</a></li> -->
	</ul>
</div>