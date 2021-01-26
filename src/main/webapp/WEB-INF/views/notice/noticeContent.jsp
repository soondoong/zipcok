<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="dto" value="${dto}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function goDelete(){
	location.href='noticeDelete.do?bbs_idx='+${dto.bbs_idx};
}
function golist(){
	location.href='noticeList.do';
}
function goUpdateView(){
	location.href='noticeUpdateView.do?bbs_idx='+${dto.bbs_idx};
}
</script>
</head>
<body>

<table>
	<thead>
		<tr>
		<td><input type="hidden" name="bbs_idx" value="${dto.bbs_idx}"></td>
			<th>제목 : ${dto.bbs_subject}</th>
			<th>조회수 : ${dto.bbs_readnum}</th>
			<th>작성일 : ${dto.bbs_writedate}</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="3">이미지</td>
		</tr>
		<tr>
			<td colspan="3">${dto.bbs_content}</td>
		</tr>
		<tr>
			<td>동영상(파일)</td>
		</tr>
	</tbody>
	<tfoot>

	<c:choose>
		<c:when test="${empty prev}">
		<tr>
			<td>이전글이 없습니다.</td>
		</tr>
		</c:when>
		<c:otherwise>
		<hr>
		<tr>
			<td>이전 글<a href="noticeContent.do?bbs_idx=${prev.bbs_idx}">${prev.bbs_subject}</a></td>
		</tr>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty next}">
		<tr>
			<td>다음글이 없습니다.</td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr>
		<hr>
			<td>다음 글<a href="noticeContent.do?bbs_idx=${next.bbs_idx}">${next.bbs_subject}</a></td>
		</tr>
		</c:otherwise>
	</c:choose>
		<tr>
			<td>
				<input type="button" value="삭제" onclick="javascript:goDelete()">
				<input type="button" value="수정" onclick="javascript:goUpdateView()">
				<input type="button" value="목록보기" onclick="javascript:golist()">
			</td>
		</tr>
	</tfoot>
</table>
</body>
</html>