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
						<ul class="test-inline">
							<li>상태 보기&nbsp;</li>
							<li>
							<select id="reservationSelect" onchange="javascript:showList();">
							<option <c:if test="${keyword.reservationSelect=='전체'}">selected="selected"</c:if>>전체</option>
							<option <c:if test="${keyword.reservationSelect=='예약완료'}">selected="selected"</c:if>>예약완료</option>
							<option <c:if test="${keyword.reservationSelect=='예약취소중'}">selected="selected"</c:if>>예약취소중</option>
							<option <c:if test="${keyword.reservationSelect=='예약취소완료'}">selected="selected"</c:if>>예약취소완료</option>
							</select>
							</li>
						</ul>
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
				<form action="adminHomeGymReservationDate.do">
					<ul class="test-inline">
						<li>날짜 검색&nbsp;</li>
						<li><input type="date" id="start_date" name="start_date" value="${keyword.keywordStart }" required="required"></li>~
						<li><input type="date" id="end_date" name="end_date" value="${keyword.keywordEnd }" required="required"></li>
						<li><input type="submit" value="검색"></li>
						<!-- 
						<li><input type="date" id="start_date" name="start_date" onchange="javascript:start_change();"
						value="${keyword.keywordStart }" required="required"></li>~
						<li><input type="date" id="end_date" name="end_date" onchange="javascript:end_change();"
						value="${keyword.keywordEnd }" required="required"></li>
						 -->
					</ul>
					
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
							<th>이용시간</th>
							<th>제공자아이디</th>
							<th>예약자아이디</th>
							<th>결제금액</th>
							<th>상태</th>
							<th>취소</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}">
								<tr>
									<td colspan="8" align="center">검색된 예약목록 없습니다.</td>
								</tr>
						</c:if>
						<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.reser_idx }</td>
							<td>${dto.reser_date }</td>
							<td>${dto.reser_start_time }:00 ~ ${dto.reser_end_time }:00</td>
							<td>${dto.hg_mem_id }</td>
							<td>${dto.mem_id }</td>
							<td>${dto.reser_price }</td>
							<td id="${dto.mem_id}_reser_status">${dto.reser_status }</td>
							<td id="${dto.mem_id}_pd_btn">
							<c:if test="${dto.reser_status=='예약취소중'}">
							<input type="button" value="취소승인" onclick="javascript:updateStatus('${dto.mem_id}');">
							</c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8" class="paging">${pageStr }</td>
						</tr>
					</tfoot>
				</table>
			</div>
         </div>
      </div>
   </div>
<script type="text/javascript">
function showList(){
	var reservationSelect=document.getElementById('reservationSelect').value;
	
	location.href='adminHomeGymReservationSelect.do?reservationSelect='+reservationSelect;
}
</script>

<script src="js/httpRequest.js"></script>
<script type="text/javascript">
function updateStatus(id){
	var result = confirm('취소요청을 승인하시겠습니까?');
	if(result){
		var params='mem_id='+id;
		sendRequest('reservationUpdateStatus.do',params,showResult,'GET');
	}
}
function showResult(){
	   if(XHR.readyState==4){
	      if(XHR.status==200){	
	         var data=XHR.responseText;
	         data=eval('('+data+')');
	         var id=data.mem_id;
	         var msg=data.result;
	         if(msg>0){
	        	window.alert('결제취소가 승인되었습니다');
				window.location.reload();
	         }else{
	        	 window.alert('에베베베베베');
	         }
	         
	         
	      }
	   }
	}
</script>
<%@include file="../../_include/footer.jsp" %>