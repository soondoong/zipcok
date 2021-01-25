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

</script>
</head>
<body>
<form action="noticeUpdate.do">
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
	<tr>
		<th>제목</th>
		<td><input type="text" name="bbs_subject" value="${dto.bbs_subject}"></td>
	</tr>
	<hr>
	<tr>
		<td>사진</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="6" cols="80" name="bbs_content" placeholder="내용을 입력해주세요">${dto.bbs_content }</textarea>
		</td>
	</tr>
	<tr>
		<td><input type="button" value="파일첨부"></td>
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