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
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
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
					<form action="adminHomeGymReservationSearch.do">
						<ul class="test-inline">
							<li>조건 검색&nbsp;</li>
							<li>
							<select name="type">
									<option <c:if test="${keyword.keywordType=='전체'}">selected="selected"</c:if>>전체</option>
									<option <c:if test="${keyword.keywordType=='예약자아이디'}">selected="selected"</c:if>>예약자아이디</option>
									<option <c:if test="${keyword.keywordType=='제공자아이디'}">selected="selected"</c:if>>제공자아이디</option>
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
							<th>예약일</th>
							<th>예약일자</th>
							<th>이용시간</th>
							<th>제공자아이디</th>
							<th>예약자아이디</th>
							<th>결제금액</th>
							<th>상태</th>
							<th>취소</th>
						</tr>
					</thead>
					<tbody>
						
						
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><input type="button" value="취소승인"></td>
						</tr>
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="9" class="paging">${pageStr }</td>
						</tr>
					</tfoot>
				</table>
			</div>
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>