<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header2.jsp" %>
<script>
function golist(){
	location.href='noticeList.do';
}
</script>
</head>
<body>

<form action="noticeWrite.do" method="post" enctype="multipart/form-data">
<table border="1" style="width: 500px; height: 400px; align-content: center;">
	<tr>
		<th colspan="2">카테고리 유형
		 <select name="bbs_category">
			<option selected="selected">홈짐</option>
			<option>코치 매칭</option>
			<option>결제</option>
			<option>기타</option>
		</select></th>
	</tr>
	<tr>
		<th colspan="2">제목 <input type="text" name="bbs_subject"></th>
	</tr>
	<hr>
	<tr>
		<td colspan="2">
			<textarea rows="6" cols="80" name="bbs_content" placeholder="내용을 입력해주세요"></textarea>
		</td>
	</tr>
	<tr>
		<td><input type="file" name="upload" value="파일첨부"></td>
		<td>
		<input type="submit" value="글쓰기">
		<input type="reset" value="다시작성">
		<input type="button" value="목록보기" onclick="javascript:golist()">
		</td>
	</tr>
</table>
</form>
</body>
</html>