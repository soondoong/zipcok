<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="dto" value="${dto}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<thead>
		<tr>
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
		<tr>
			<td>이전글</td>
		</tr>
		<tr>
			<td>다음글</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="삭제" onclick="#">
				<input type="button" value="수정" onclick="#">
				<input type="button" value="목록보기" onclick="#">
			</td>
		</tr>
	</tfoot>
</table>
</body>
</html>