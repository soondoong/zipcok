<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="commplus_wrap">
	<div class="commplus_title">
		<h1>커뮤니티 추가</h1>
	</div>
	<form action="coachMyPageCommPlus.do">
	<input type="hidden" name="com_coach_id" value="${sessionScope.coachId}">
	<div class="commplus_table">
		<table>
			<tr>
				<td>커뮤니티 이름</td>
				<td><input type="text" name="com_name"></td>
			</tr>
			<tr>
				<td><input type="submit" value="커뮤니티 만들기"></td>
			</tr>
		</table>
	</div>
	</form>
</div>
</body>
</html>