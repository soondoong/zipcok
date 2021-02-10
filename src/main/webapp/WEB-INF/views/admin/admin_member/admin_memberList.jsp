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
							<li>조건 검색</li>
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
				<div><!-- 회원목록부분 div -->
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
					<div><!-- 회원관리부분 div -->
						<table>
							<tr>
								<th>회원번호 <input type="text" readonly="readonly"></th>
							</tr>
							<tr>
								<th>아이디 <input type="text" readonly="readonly"></th>
								<th>비밀번호 <input type="password" readonly="readonly"></th>
							</tr>
							<tr>
								<th>이름 <input type="text"></th>
								<th>회원등급<select><option>일반회원</option></select></th>
							</tr>
							<tr>
								<td>휴대폰번호 <input type="text"></td>
								<th>상호평가 점수 <input type="text" readonly="readonly"></th>
							</tr>
						</table>
					</div>
					<div><!-- 상호평가내역 div -->
						<ul>
							<li>검색 조건</li>
							<li><select><option>홈짐대여</option></select></li>
							<li><input type="button" value="검색"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>


	</div>

<%@include file="../../_include/footer.jsp" %>