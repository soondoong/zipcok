<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/comm/commDailyListLayout.css">
</head>
<body>
	<%@include file="../header2.jsp" %>
	
	<style>
			.community_wrap {display: flex; min-height: calc(100vh - 92px);}
			.community_wrap .community_sidebar {flex: 0 0 250px; background-color: #ccc;}
			.community_wrap .community_sidebar ul {padding: 0; margin:  0;}
			.community_wrap .community_sidebar ul li.sidemenuli a {display: block; color: #000; padding: 8px 15px 8px 15px; font-weight: bold;}
			.community_wrap .community_sidebar ul li.sidemenuli a.comm {background-color: tomato; color: #fff;}
			.community_wrap .community_sidebar ul li.sidemenuli a:hover:not(.comm) {background-color: #333; color: #fff;}
			
			.community_wrap .community_list {display: block; flex: 1 1 auto;}	
			.community_wrap .community_list .com_top {background-color: #46a4da; height: 170px; padding: 15px;}
			.community_wrap .community_list .com_top h1{color: white;}
			.community_wrap .community_list .com_top h3{color: white;}
			.community_wrap .community_list .com_top .comm_menu{float: right;}
			.community_wrap .community_list .com_top .comm_menu span{display: -webkit-inline-box;}
			
			.community_wrap .community_list .bbs .exrecontent {text-indent: 20px;}
			.community_wrap .community_list .bbs .coachCnt {background-color: #E5E5FF;}
	</style>
	
	<div class="community_wrap">
	
		<div class="community_list">
			<div class="com_top">
				<h1>일일 운동 게시판</h1>
				<h3>코치 : ${coach_name} 코치</h3>
				<div class="comm_menu"><span><h3><a href="commMain.do?com_idx=${com_idx }">커뮤니티 메인</a></h3>&nbsp;<h3>|</h3>&nbsp;<h3><a href="commDailyList.do">일일 운동 게시판</a></h3></span></div>
			</div>
			<table class="bbs">
				<thead>
						<tr>
							<th>글 번호</th>
							<th>작성일</th>
							<th>제목</th>
							<th>운동명</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="5" align="center">${pageStr}</td>
							<td><input id="button" type="button" onclick="location.href='commDailyWrite.do'" value="글쓰기" style="display:none;"></td>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="6" align="center">
									등록된 게시글이 없습니다.
								</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${list}" begin="0" end="0">
							<c:if test="${dto.ex_id eq com_coach_id}">
								<tr class="coachCnt">
									<td>오늘의 운동</td>
										<c:url var="contentUrl" value="commDailyList.do">
											<c:param name="idx">${dto.ex_idx}</c:param>
										</c:url>
										<td>${dto.ex_writedate}</td>
										<c:set var="recnt" value="(${dto.ex_recnt})" />	
										<c:choose>
											<c:when test="${recnt=='(0)'}">${recnt=""} </c:when>
										</c:choose>
									<td class="coach"><a href="commDailyContent.do?ex_idx=${dto.ex_idx}">[${dto.ex_head}] ${dto.ex_subject}${recnt}</a></td>
									<td>${dto.ex_name}/${dto.ex_cal}cal</td>
									<td class="coachid">${dto.ex_id}</td>
									<td>${dto.ex_readnum}</td>
									
								</tr>
							</c:if>
						</c:forEach>
						<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.ex_idx}</td>
										<c:url var="contentUrl" value="commDailyList.do">
											<c:param name="idx">${dto.ex_idx}</c:param>
										</c:url>
										<td>${dto.ex_writedate}</td>
										<c:set var="recnt" value="(${dto.ex_recnt})" />
										<c:choose>
											<c:when test="${recnt=='(0)'}">${recnt=""} </c:when>
										</c:choose>
									<c:choose>
										<c:when test="${dto.ex_lev eq 1 }">
											<td class="coach"><a href="commDailyContent.do?ex_idx=${dto.ex_idx}">[${dto.ex_head}] ${dto.ex_subject}${recnt}</a></td>
										</c:when>
										<c:when test="${dto.ex_lev eq 2 }">
											<td class="exrecontent"><a href="commDailyContent.do?ex_idx=${dto.ex_idx}">[${dto.ex_head}] ${dto.ex_subject}${recnt}</a></td>
										</c:when>
									</c:choose>
									
									<td>${dto.ex_name}/${dto.ex_cal}cal</td>
									<td>${dto.ex_id}</td>
									<td>${dto.ex_readnum}</td>
								</tr>
						</c:forEach>	
						
					</tbody>
			</table>
		</div>
	</div>
	
	<script>
	
	$(function(){
		
		writebtn('${sid}');
		
	});
	
	function writebtn(sid){
		if(sid==""){
			$("#button").show();
		}else{
			$("#button").hide();
		}
		
		coachbold();
	}
	
	
	
	function coachbold(){
		$('.coach').css('font-weight','bold');
	}
	</script>
	
</body>
 <%@include file="../_include/footer.jsp" %>
</html>