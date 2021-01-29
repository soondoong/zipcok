<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header2.jsp" %>
<style type="text/css">
.paging a{
	padding-right: 20px;
}
</style>
</head>
<body>
<h1>고객센터</h1>
<c:if test="${empty sessionScope.sid }">
	<form action="csPlzLogin.do">
</c:if>
<c:if test="${!empty sessionScope.sid}">
<form action="csWriteView.do">
</c:if>
<table border="1" >
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>id</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list}">
	<tr>
		<th colspan="5">등록된 문의가 없습니다.</th>
	</tr>
	</c:if>
	<c:if test="${!empty list }">
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.bbs_idx }</td>
			<c:url var="contentUrl" value="noticeContent.do">
            <c:param name="bbs_idx">${dto.bbs_idx}</c:param>
        	</c:url>
			<td><a href="${contentUrl}">[${dto.bbs_category}]${dto.bbs_subject}</a></td>
			<td>${dto.bbs_mem_id}</td>
			<td>${dto.bbs_readnum}</td>
			<td>${dto.bbs_writedate}</td>
		</tr>
	</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" align="center" class="paging">${pageStr}   </td>
		</tr>
		<tr>
			<td colspan="5" align="right"><input type="submit" value="1:1 문의하기"></td>
		</tr>
	</tfoot>
</table>
</form>
</body>
</html>