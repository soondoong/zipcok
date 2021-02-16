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
   <%@include file="../adminSideBar.jsp"%>
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
				</ul>
			</div>
			<div><!-- 검색결과  테이블 div -->
				<table border="1" cellspacing="0">
					<thead>
						<tr>
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
							<td colspan="7" style="text-align: center">커뮤니티 이름을 검색해주세요</td>
						</tr>
					</tbody>
				</table>
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
							<td colspan="8" style="text-align: center"></td>
						</tr>
					</tbody>
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
							<th>활동 시작일</th>
							<th>회원관리보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="8" style="text-align: center"></td>
						</tr>
					</tbody>
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
							<th>삭제 게시문 수</th>
							<th>댓글 수</th>
							<th>일일 평균 게시글</th>
							<th>최근 작성일</th>
							<th>활동 회원 수</th>
							<th>게시판 가기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="8" style="text-align: center"> </td>
						</tr>
					</tbody>
				</table>
				<hr>
			</div>
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>