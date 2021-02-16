<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
</head>
<body>
<%@include file="../../header2.jsp" %>
<style type="text/css">
.test-inline {
   display: inline-flex;
}
.table { border-spacing: ''; table-layout: auto; text-align: center;} 
.table th{font-weight: bold; border-color:#848282;}
</style>
   <div class="adminPage_wrap">
      <%@include file="../adminSideBar.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
         <br>
         	<div><!-- 검색하는 부분 div -->
					<div>
					<h3>예약조회</h3>
					<br>
					</div>
					<div>
					<form>
						<ul class="test-inline">
							<li>예약자 검색&nbsp;</li>
							<li>
							<select name="type">
									<option>전체</option>
									<option>예약자명</option>
									<option>예약자아이디</option>
							</select>
							<li><input type="text" name="searchContent" placeholder="내용을 입력해주세요."></li>
							<li><input type="submit" value="검색"></li>
						</ul>
					</form>
					</div>
				<div>
				<form action="adminDelMemberDate.do">
					<ul class="test-inline">
						<li>조건 검색&nbsp;</li>
						<li><input type="date" id="start_date" name="start_date" onchange="javascript:start_change();" required="required"></li>~
						<li><input type="date" id="end_date" name="end_date" onchange="javascript:end_change();" required="required"></li>
					</ul>
					<input type="submit" value="검색">
				</form>
				</div>
				
			</div>
			<hr>
			<div><!-- 검색결과  테이블 div -->
				<table class="table" class="table table-hover">
						<thead style="background-color : whitesmoke;">
						<tr>
							<th>예약번호</th>
							<th>결제일</th>
							<th>예약자명</th>
							<th>홈짐닉네임</th>
							<th>이용일</th>
							<th>이용시간</th>
							<th>결제금액</th>
							<th>결제상태</th>
							<th>사용여부</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="9" align="center">검색된 홈짐예약 목록이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${list }">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="9" align="center">${pageStr }</td>
						</tr>
					</tfoot>
				</table>
			</div>
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>