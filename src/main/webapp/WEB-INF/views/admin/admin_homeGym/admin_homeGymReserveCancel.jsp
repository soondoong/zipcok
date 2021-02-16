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
      <%@include file="../adminSideBar.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
         	<div><!-- 검색하는 부분 div -->
				<form action="#">
					<div>
						<h5>[결제 내역]</h5>
					</div>
					<div>
						<ul class="test-inline">
							<li>검색조건</li>
							<li><select><option>최근 순</option></select></li>
						</ul>
					</div>
					<div>
						<ul class="test-inline">
							<li>상태</li>
							<li><select><option>취소대기</option></select></li>
						</ul>
					</div>
					<div>
						<ul class="test-inline">
							<li>예약자 검색</li>
							<li><select><option>예약자명</option></select></li>
							<li><input type="text"></li>
						</ul>
					</div>
					<div>
						<ul class="test-inline">
							<li>예약 일자</li>
							<li><input type="date"></li>
							<li>~</li>
							<li><input type="date"></li>
						</ul>
					</div>
					<div>
						<input type="submit" value="검색">
					</div>
				</form>
			</div>
			<hr>
			<div><!-- 검색결과  테이블 div -->
				<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>결제일</th>
							<th>예약자명</th>
							<th>홈짐닉네임</th>
							<th>이용일</th>
							<th>결제금액</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a>12345</a></td>
							<td>2021.01.12</td>
							<td>구병모</td>
							<td><a>헬창남</a></td>
							<td>2021.01.12</td>
							<td>15000</td>
							<td>취소대기</td>
							<td><input type="button" value="취소승인"></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8">페이징 들어갈 자리</td>
						</tr>
					</tfoot>
				</table>
			</div>
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>