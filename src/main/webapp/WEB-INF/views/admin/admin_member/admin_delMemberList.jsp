<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
</head>
<body>
	<%@include file="../../header2.jsp"%>
<style type="text/css">
.test-inline {
   display: inline-flex;
}
.table { border-spacing: ''; table-layout: auto; text-align: center;} 
.table th{font-weight: bold; border-color:#848282;}
.paging {margin: 40px 0 0; text-align: center;}
		.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
</style>
	<div class="adminPage_wrap">
		<%@include file="../adminSideBar.jsp"%>
		<div class="container adminPage_contents">
			<div class="adminPage_main">
				<br>
				<div>
					<h3>탈퇴 회원</h3>
					<br>
				</div>
				<div>
					<form action="adminDelMemberListAction.do">
						<ul class="test-inline">
							<li class="srchtitle">검색 조건</li>
							<li>
							<select name="type">
									<option <c:if test="${keyword.keywordType=='전체'}">selected="selected"</c:if>>전체</option>
									<option <c:if test="${keyword.keywordType=='회원이름'}">selected="selected"</c:if>>회원이름</option>
									<option <c:if test="${keyword.keywordType=='회원아이디'}">selected="selected"</c:if>>회원아이디</option>
							</select>
							</li>
							<li><input type="text" name="searchContent" placeholder="내용을 입력해주세요."></li>
							<li><input type="submit" value="검색" id="searchbtn" class="btn btn-primary"></li>
						</ul>
					</form>
				</div>

				<div>
				<form action="adminDelMemberDate.do">
					<ul class="test-inline">
						<li class="srchtitle">날짜 검색</li>
						<li><input type="date" id="start_date" name="start_date" value="${keyword.keywordStart }" required="required"></li>~
						<li><input type="date" id="end_date" name="end_date" value="${keyword.keywordEnd }" required="required"></li>
						<li><input type="submit" value="검색" id="searchbtn" class="btn btn-primary"></li>
					</ul>
				</form>
				</div>
				<hr>
				<br>
				
				<div>
					<!-- 회원목록부분 테이블 div -->
					<table class="table" class="table table-hover">
						<thead style="background-color : whitesmoke;">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>회원등급</th>
								<th>탈퇴일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5" align="center">검색된 탈퇴회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.mem_idx }</td>
									<td>${dto.mem_name }</td>
									<td>${dto.mem_id }</td>
									<td>${dto.mem_type }</td>
									<td>${dto.mem_outdate }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5" class="paging">${pageStr }</td>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
		</div>
	</div>
	



	<%@include file="../../_include/footer.jsp"%>