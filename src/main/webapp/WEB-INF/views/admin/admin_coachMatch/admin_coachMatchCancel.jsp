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
	
       display: flex;
}
</style>
<script type="text/javascript">
function showList(){
	var cancelSelect=document.getElementById('cancelSelect').value;
	
	location.href='coachListSearch.do?cancelSelect='+cancelSelect;
}
</script>
</head>
<body>
<%@include file="../../header2.jsp" %>
   <div class="adminPage_wrap">
      <%@include file="../adminSideMenu.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
         	<div><!-- 검색하는 부분 div -->
					<div>
						<h5>[취소 환불 관리]</h5>
					</div>
					<div>
						<ul class="test-inline">
							<li>상태</li>
							<li>
								<select id="cancelSelect" onchange="javascript:showList();">
									<option <c:if test="${cancelSelect=='전체'}">selected="selected"</c:if> >전체</option>
									<option <c:if test="${cancelSelect=='환불요청중'}">selected="selected"</c:if> >환불요청중</option>
									<option <c:if test="${cancelSelect=='환불완료'}">selected="selected"</c:if> >환불완료</option>
									<option <c:if test="${cancelSelect=='결제완료'}">selected="selected"</c:if> >결제완료</option>
								</select>
							</li>
						</ul>
					</div>
				<form action="coachCancelSearch.do">
					<div>
						<ul class="test-inline">
							<li>코치 검색</li>
							<li>
								<select name="searchCon">
									<!-- <option <c:if test="${searchCon=='회원번호'}">selected="selected"</c:if> >회원번호</option>
									<option <c:if test="${searchCon=='아이디'}">selected="selected"</c:if> >아이디</option>
									<option <c:if test="${searchCon=='이름'}">selected="selected"</c:if> >이름</option> -->
									<option <c:if test="${searchCon=='회원아이디'}">selected="selected"</c:if> >회원아이디</option>
									<option <c:if test="${searchCon=='코치아이디'}">selected="selected"</c:if> >코치아이디</option>							
								</select>
							</li>
							<li><input type="text" name="searchT"></li>
							<li><input type="submit" value="검색"></li>
						</ul>
					</div>
				</form>
			</div>
			<hr>
			<div><!-- 코치의 취소 내역  테이블 div -->
				<div>
					<h5>코치 취소 신청내역</h5>
				</div>
				<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>결제번호</th>
							<th>요청서번호</th>
							<th>결제코드</th>
							<th>금액</th>
							<th>회원아이디</th>
							<th>코치아이디</th>
							<th>결제일</th>
							<th>결제방법</th>
							<th>상태</th>
							<th>결제취소하기</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="paymentlist" value="${paymentlist }"></c:set>
					<c:set var="memlist" value="${memlist}"></c:set>
						<c:if test="${empty paymentlist && empty memlist}">
						<tr>
							<th colspan="8">검색된 회원이 없습니다</th>
						</tr>
						</c:if>
						<c:forEach var="memlist" items="${memlist}" varStatus="status">
						<tr>
							<td>${memlist.mem_idx}</td>
							<td>${memlist.mem_name}</td>
							<td>${paymentlist[status.index].pd_mem_id}</td>
							<td>${memlist.mem_phone}</td>
							<td>${memlist.mem_email}</td>
							<td>${paymentlist[status.index].pd_payment_date }</td>
							<td>${paymentlist[status.index].pd_status}</td>
							<td><input type="button" value="환불 승인"></td>
						</tr>
						</c:forEach>
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