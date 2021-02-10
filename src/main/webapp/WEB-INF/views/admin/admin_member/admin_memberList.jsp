<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<style type="text/css">
.test-inline {
	display: inline-flex;
}
</style>
</head>
<body>
<%@include file="../../header2.jsp" %>
	<div class="adminPage_wrap">
		<%@include file="../adminSideMenu.jsp"%>
		<div class="adminPage_contents">
			<div class="adminPage_main">
				<div>
					<h3>회원목록</h3>
				</div>
				<div>
					<form action="#">
						<ul class="test-inline">
							<li><select><option>회원등급</option></select></li>
							<li><select><option>고객명</option></select></li>
							<li><input type="text" placeholder="내용을 입력해주세요"></li>
							<li><input type="submit" value="검색"></li>
						</ul>
					</form>
				</div>
				<div>
					<ul	class="test-inline">
						<li>총 회원수: </li>
						<li>검색 회원수: </li>
					</ul>
				</div>
				<div>
					<table border="1" cellspacing="0">
						<thead>
							<tr>
								<th>회원번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>휴대폰번호</th>
								<th>이메일</th>
								<th>가입일</th>
								<th>정보수정일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>구병모</td>
								<td>qudah123</td>
								<td>123456789</td>
								<td>a@naver.com</td>
								<td>2021.01.12</td>
								<td>2021.01.21</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">페이징 들어갈 자리</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div>
					<div>
						<h3>회원관리</h3>
					</div>
					<div>
						<table>
							<tr>
								<th>회원번호<input type="text" readonly="readonly">회원번호</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>


	</div>

<%@include file="../../_include/footer.jsp" %>