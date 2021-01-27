<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집콕헬스 공지사항</title>
<%@include file="../header2.jsp" %>

<script>

function goCategory(){
	var bbs_category=document.getElementById("select").value;
	if(bbs_category=='전체'){
		location.href='noticeList.do';
	}
	if(bbs_category!='전체'){
	location.href='noticeSearchList.do?bbs_category='+bbs_category;
	document.getElementById('select').option.innerHTML=selected;
	}
	
}

</script>
<style type="text/css">
.paging a{
	padding-right: 20px;
}
</style>
</head>
<body>
<h1>공지사항</h1>
<form action="noticeWriteView.do">
<table>
	<thead>
	<tr>
		<th>카테고리 유형</th>
		<td> <select onchange="javascript:goCategory()" id="select">
			<option  <c:if test="${category=='전체'}">selected="selected"</c:if> >전체</option>
			<option <c:if test="${category=='홈짐'}">selected="selected"</c:if>  >홈짐</option>
			<option <c:if test="${category=='코치 매칭'}">selected="selected"</c:if> >코치 매칭</option>
			<option <c:if test="${category=='결제'}">selected="selected"</c:if>  >결제</option>
			<option  <c:if test="${category=='기타'}">selected="selected"</c:if>>기타</option>

		</select></td>
	</tr>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list}">
	<tr>
		<th colspan="5">등록된 공지사항이 없습니다.</th>
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
			<td>${dto.bbs_writer}</td>
			<td>${dto.bbs_readnum}</td>
			<td>${dto.bbs_writedate}</td>
		</tr>
	</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4" align="center" class="paging">${pageStr}   </td>
		</tr>
		<tr>
			<td colspan="4" align="right"><input type="submit" value="글쓰기"></td>
		</tr>
	</tfoot>
</table>
</form>
</body>
</html>