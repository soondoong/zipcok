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
	
       display: flex;
}
</style>
</head>
<body>
<%@include file="../../header2.jsp" %>
   <div class="adminPage_wrap">
      <%@include file="../adminSideMenu.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
         	<div><!-- 검색하는 부분 div -->
				<form action="#">
					<div>
						<h5>[취소 환불 관리]</h5>
					</div>
					<div>
						<ul class="test-inline">
							<li>상태</li>
							<li><select><option>환불요청중</option></select></li>
						</ul>
					</div>
					<div>
						<ul class="test-inline">
							<li>코치 검색</li>
							<li><select><option>회원번호</option></select></li>
							<li><input type="text" ></li>
							<li><input type="button" value="검색"></li>
						</ul>
					</div>
				</form>
			</div>
			<hr>
			<div><!-- 코치의 취소 내역  테이블 div -->
				<div>
					<h5>구병모 코치 매칭 회원내역</h5>
				</div>
				<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>휴대폰번호</th>
							<th>이메일</th>
							<th>취소요청일</th>
							<th>환불여부</th>
							<th>결제취소하기</th>
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
							<td>환불 미완료</td>
							<td><input type="button" value="환불 승인"></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8">페이징 들어갈 자리</td>
						</tr>
					</tfoot>
				</table>
				<hr>
			</div>
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>