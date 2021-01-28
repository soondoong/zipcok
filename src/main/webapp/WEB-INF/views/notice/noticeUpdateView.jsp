<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="dto" value="${dto}"></c:set>
<script>
function golist(){
	location.href='noticeList.do';
}
function deletefile(){
	location.href='deleteFile.do';
}
</script>
</head>
<body>
<form action="noticeUpdate.do" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<th>카테고리 유형</th>
		<td> <select name="bbs_category">
			<option>홈짐</option>
			<option>코치 매칭</option>
			<option>결제</option>
			<option>기타</option>
		</select></td>
	</tr>
	<input type="hidden" name="bbs_idx" value="${dto.bbs_idx}">
	<tr>
		<th>제목</th>
		
		<td><input type="text" name="bbs_subject" value="${dto.bbs_subject}"></td>
	</tr>
	<hr>

	<tr>
			<td colspan="3">이미지</td>
		</tr>
		<c:if test="${empty list}">
		<tr>
			<th colspan="3">등록된 사진이 없습니다.</th>
		</tr>
		</c:if>
		<c:forEach var="List" items="${list}">
		
		<tr>
			<td colspan="3">
				<img alt="${List.zfile_upload }" src="upload/zipcok/notice/${List.zfile_upload}" width="500" height="500">
			</td>
		</tr>

		</c:forEach>
	<tr>
		<td colspan="2">
			<textarea rows="6" cols="80" name="bbs_content" placeholder="내용을 입력해주세요">${dto.bbs_content }</textarea>
		</td>
	</tr>
	<tr>
		<td><input type="file" name="upload" value="사진수정"></td>
		<td><input type="button" value="사진삭제" onclick="javascript:deletefile()"></td>
		<td>
		<input type="submit" value="수정하기">
		<input type="reset" value="다시작성">
		<input type="button" value="목록보기" onclick="javascript:golist()">
		</td>
	</tr>
</table>
</form>
</body>
</html>