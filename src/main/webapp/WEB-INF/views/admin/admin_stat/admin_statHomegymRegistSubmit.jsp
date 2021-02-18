<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
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
         <hr>
         <h3>홈짐 등록 통계</h3> 
         <hr>
         	<div>
         	<form name="date" action="admin_statHomegymRegistSubmit.do">
         		<ul class="test-inline">
         			<li>조회일</li>
         			<li><input type="date" min="" max="" id="startDate" name="startDate" required="required"></li>
         			<li>~</li>
         			<li><input type="date" min="" max=""  id="endDate" name="endDate" required="required"></li>
         			<li><input type="button" name="datebtn" value="오늘"></li>
         			<li><input type="button" name="datebtn" value="일주일"></li>
         			<li><input type="button" name="datebtn" value="한달"></li>
         		</ul>
         		<input type="submit" value="검색">
         	</form>
         	</div>
         	<hr>
         	<div>
         	통계 그래프 div
         	</div>
         	<hr>
         	<div><!-- 코치 매출 통계 테이블 div -->
         		<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>날짜</th>
							<th>신규 등록 홈짐 수</th>
							<th>활성화 된 홈짐 수</th>
							<th>거래된 횟수</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="datejoindatesum" value="0" />
						<c:set var="dateStatusOnsum" value="0" />
						<c:set var="datePaymentCountsum" value="0" />
						<c:forEach var="date" items="${datelist }" varStatus="i">
							<tr>
								<td>${i.current }</td>
									<!-- 홈짐 등록 갯수 -->
									<c:forEach var="datejoindate" items="${dateJoinCount }" varStatus="j">
										<c:if test="${i.index eq j.index }">
												<td>${j.current }</td>
										<c:set var="datejoindatesum" value="${mem_joindatecountsum + j.current}"/>
										</c:if>
									</c:forEach>
									<!-- 활성화 된 홈짐 갯수 -->
									<c:forEach var="dateStatusOn" items="${dateStatusOnCount }" varStatus="h">
										<c:if test="${i.index eq h.index }">
												<td>${h.current }</td>
										<c:set var="dateStatusOnsum" value="${dateStatusOnsum + h.current}"/>
										</c:if>
									</c:forEach>
									<!-- 거래된 홈짐 수 -->
									<c:forEach var="paymentdate" items="${datePaymentCount }" varStatus="o">
										<c:if test="${i.index eq o.index }">
												<td>${o.current }</td>
										<c:set var="datePaymentCountsum" value="${datePaymentCountsum + o.current}"/>
										</c:if>
									</c:forEach>
						</c:forEach>	
					</tbody>
					<tfoot>
						<tr>
							<td>합계</td>
							<td>${datejoindatesum}</td>
							<td>${dateStatusOnsum}</td>
							<td>${datePaymentCountsum }</td>
						</tr>
					</tfoot>
				</table>
         	</div>
         </div>
      </div>
   </div>
   
   <script>
   
   
   /*---------------------------------------------------*/

   /*yyyy-mm-dd 포맷날짜가져오기*/


   function getTimeStamp() {

       var d = new Date();
       var s =
           leadingZeros(d.getFullYear(), 4) + '-' +
           leadingZeros(d.getMonth() + 1, 2) + '-' +
           leadingZeros(d.getDate(), 2);

       return s;
   }

   function leadingZeros(n, digits) {

       var zero = '';
       n = n.toString();

       if (n.length < digits) {
           for (i = 0; i < digits - n.length; i++)
               zero += '0';
       }
       return zero + n;
   }

  $(function(){
	  var today = getTimeStamp() ;
	   //$( '#startDate' ).attr('min', today);
	   $( '#startDate' ).val(today);
	   
		   $( '#startDate' ).on('change', function(){
		   	$( '#endDate' ).attr('min', $( '#startDate' ).val());	
		   	$( '#endDate' ).val($( '#startDate' ).val());	
		   });
	   
	   
	   $("input[name='datebtn']").on('click',function(){
		   var btnval= $(this).val();
		 if( btnval == '오늘'){
			   $( '#startDate' ).val(today);
			   	$( '#endDate' ).val($( '#startDate' ).val());	
		 }else if(btnval =='일주일'){
			   var d = new Date($( '#endDate' ).val());
		       var s =
		           leadingZeros(d.getFullYear(), 4) + '-' +
		           leadingZeros(d.getMonth() + 1, 2) + '-' +
		           leadingZeros(d.getDate()-7, 2);
			 	
			 	$( '#endDate' ).val(today);	
			 	 $( '#startDate' ).val(s);
		 }else if( btnval =='한달'){
			  var d = new Date($( '#endDate' ).val());
		       var s =
		           leadingZeros(d.getFullYear(), 4) + '-' +
		           leadingZeros(d.getMonth() , 2) + '-' +
		           leadingZeros(d.getDate(), 2);
			 	
			 	$( '#endDate' ).val(today);	
			 	 $( '#startDate' ).val(s);
			 
			 
		 }
	   });
	   
	   
  }) ;


   /*-----------------------------------------------------*/

   </script>
<%@include file="../../_include/footer.jsp" %>