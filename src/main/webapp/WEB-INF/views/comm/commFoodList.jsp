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
<%@include file="./commSideMenu.jsp" %>
<div class="content">
<h1>식단 일지 게시판</h1>
<table class="bbs">
	<tfoot>
		<tr>
			<td colspan="5" align="center">${pageStr}</td>
			<td><input id="button" type="button" onclick="location.href='commFoodWrite.do'" value="글쓰기"></td>
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
			<table>
				<tr>
					<c:url var="contentUrl" value="commFoodList.do">
						<c:param name="idx">${dto.food_idx}</c:param>
					</c:url>
					<c:set var="recnt" value="(${dto.food_recnt})" />
					<c:choose>
					<c:when test="${recnt=='(0)'}">${recnt=""} </c:when>
					</c:choose>
					<td>${dto.ex_id}</td>
					<td>${dto.ex_writedate}</td>
					<td>${dto.ex_readnum}</td>
				<tr>
					<td>이미지</td>
				</tr>
					<td><a href="commDailyContent.do?ex_idx=${dto.ex_idx}">${dto.ex_subject}${recnt}</a></td>
					<td>${dto.ex_cal}cal</td>
				</tr>
			</table>
		</c:forEach>
	</tbody>
</table>
</div>
</body>
</html>