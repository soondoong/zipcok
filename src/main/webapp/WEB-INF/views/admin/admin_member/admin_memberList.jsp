<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div class="container adminPage_contents">
			<div class="adminPage_main">
				<div>
					<h3>회원목록</h3>
				</div>
				<div>
					<form action="adminMemberListAction.do">
						<ul class="test-inline">
							<li>조건 검색&nbsp;&nbsp;&nbsp;</li>
							<li>등급 : </li>
							<li>
							<select name="type">
							<option>전체</option>
							<option>일반회원</option>
							<option>코치회원</option>
							</select>
							</li>
							<li><input type="text" placeholder="고객명" name="name"></li>
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
				<!-- 회원목록부분 테이블 div -->
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
						<c:if test="${empty list}">
							<tr>
								<td colspan="7" align="center">
								검색된 회원이 없습니다.
								</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>1</td>
								<td>구병모</td>
								<td>qudah123</td>
								<td>123456789</td>
								<td>a@naver.com</td>
								<td>2021.01.12</td>
								<td>2021.01.21</td>
							</tr>
						</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7" align="center">페이징 들어갈 자리</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div>
					<div>
					
					<br><br>
				
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
						<ul class="test-inline">
							<li>검색 조건</li>
							<li><select><option>홈짐대여</option></select></li>
							<li><input type="button" value="검색"></li>
						</ul>
					</div>
					<div><!-- 상호평가내역 테이블 div -->
					<table border="1" cellspacing="0">
						<thead>
							<tr>
								<th>홈짐공유자id</th>
								<th>공유자입장평가</th>
								<th>홈짐대여자id</th>
								<th>대여자입장평가</th>
								<th>결제일</th>
								<th>이용완료일</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>qudah</td>
								<td>4점</td>
								<td>tmdvy</td>
								<td>5점</td>
								<td>2021.01.12</td>
								<td>2021.01.21</td>
								<td><input type="button" value="수정"></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">페이징 들어갈 자리</td>
							</tr>
						</tfoot>
					</table>
				</div>
				</div>
			</div>
		</div>


   </div>

<%@include file="../../_include/footer.jsp" %>