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
			
			.community_wrap .community_list {flex: 1 1 auto; padding: 30px;}
			
			
			
	</style>
	
	<div class="community_wrap">
	<%@include file="./commSideMenu.jsp" %>
	
		<div class="community_list">
			<h1>일일 운동 게시판</h1>
			<table class="bbs">
				<thead>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>소비칼로리</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="5" align="center">${pageStr}</td>
							<td><input id="button" type="button" onclick="location.href='commDailyWrite.do'" value="글쓰기"></td>
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
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.ex_idx}</td>
								<c:url var="contentUrl" value="commDailyList.do">
									<c:param name="idx">${dto.ex_idx}</c:param>
								</c:url>
								<c:set var="recnt" value="(${dto.ex_recnt})" />
								<c:choose>
								<c:when test="${recnt=='(0)'}">${recnt=""} </c:when>
								</c:choose>
								<td><a href="commDailyContent.do?ex_idx=${dto.ex_idx}">${dto.ex_subject}${recnt}</a></td>
								<td>${dto.ex_cal}cal</td>
								<td>${dto.ex_id}</td>
								<td>${dto.ex_readnum}</td>
								<td>${dto.ex_writedate}</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
		</div>
	</div>
</body>
</html>