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
         	<div>
				<h5>[커뮤니티 관리]</h5>
			</div>
			<div>
				<form name="adminCommSearchList" action="admin_coachMatchCommunityList.do">
					<ul class="test-inline">
						<li>커뮤니티 검색</li>
						<li><select><option>커뮤니티 이름</option></select></li>
						<li><input type="text" name="com_name"></li>
						<li><input type="submit" value="검색하기"></li>
					</ul>
				</form>
			</div>
			<div>
				<ul	class="test-inline">
					<li>총 커뮤니티 수: </li>
					<li>검색 커뮤니티 수: </li>
				</ul>
			</div>
			<div><!-- 검색결과  테이블 div -->
				<form name="adminCommSearch" action="admin_coachMatchCommunitySubmit.do">
				<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>선택</th>
							<th>코드</th>
							<th>커뮤니티 이름</th>
							<th>코치</th>
							<th>소속 회원 수</th>
							<th>개설일</th>
							<th>최근 활동일</th>
							<th>커뮤니티 정보보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						
							<td><input type="checkbox" name="com_name" value="${commInfo.com_name }" checked></td>
							<td>${commInfo.com_idx }</td>
							<td>${commInfo.com_name }</td>
							<td>${memInfo.mem_name }</td>
							<td>${commInfo.com_mem_sum }</td>
							<td>${commInfo.com_opendate }</td>
							<td>?</td>
							<td><input type="button" value="보기"></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8">페이징 들어갈 자리</td>
						</tr>
						<tr>
							<td colspan="8" align="right"><input type="submit" value="내역보기"></td>
						</tr>
					</tfoot>
				</table>
				</form>
				<hr>
			</div>
			<div><!-- 커뮤니티 코치정보  테이블 div -->
				<div>
					<h5>커뮤니티 코치정보</h5>
				</div>
				<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>휴대폰번호</th>
							<th>이메일</th>
							<th>관리 회원 수</th>
							<th>가입일</th>
							<th>코치 정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${memInfo.mem_idx }</td>
							<td>${memInfo.mem_name }</td>
							<td>${memInfo.mem_id }</td>
							<td>${memInfo.mem_phone }</td>
							<td>${memInfo.mem_email }</td>
							<td>?</td>
							<td>${memInfo.mem_joindate }</td>
							<td><input type="button" value="가기" onclick="location.href='http://localhost:9090/zipcok/admin_coachMatchAdminSearch.do?choice=id&searchText=${memInfo.mem_id}'"></td>
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
			<div><!-- 커뮤니티 코치정보  테이블 div -->
				<div>
					<h5>커뮤니티 회원정보</h5>
				</div>
				<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>휴대폰번호</th>
							<th>이메일</th>
							<th>소속 커뮤니티</th>
							<th>합류일</th>
							<th>회원관리보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>구병모</td>
							<td>qudah123</td>
							<td>123456789</td>
							<td>a@naver.com</td>
							<td><select><option>커뮤니티 이름</option></select></td>
							<td>2021.01.12</td>
							<td><input type="button" value="가기"></td>
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
			<div><!-- 커뮤니티 게시판정보 테이블 div -->
				<div>
					<h5>커뮤니티 게시판정보</h5>
				</div>
				<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>게시판</th>
							<th>총 게시물 수</th>
							<th>댓글 수</th>
							<th>일일 평균 게시글</th>
							<th>최근 작성일</th>
							<th>활동 회원 수</th>
							<th>게시판 가기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>일일 운동 게시판</td>
							<td>50</td>
							<td>50</td>
							<td>5</td>
							<td>2021.01.12</td>
							<td>10</td>
							<td><input type="button" value="가기"></td>
						</tr>
					</tbody>
				</table>
				<hr>
			</div>
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>