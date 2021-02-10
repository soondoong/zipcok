<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="memplus_wrap">
	<div class="memplus_title">
		<h1>수강생 추가</h1>
	</div>
	<form action="coachMyPageMemPlus.do" method="post">
	<div class="memplus_table">
		<table>
			<tr>
				<td>수강생 아이디</td>
				<td>
				<select name="fruit">
				<option value="바나나">바나나</option>
				<option value="사과">사과</option>
				<option value="파인애플" selected="selected">파인애플</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="수강생 검색"></td>
			</tr>
		</table>
	</div>
	</form>
</div>
</body>
</html>