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
         <hr>
         <h3>홈짐 매출 통계</h3>
         <hr>
         	<div>
         		<ul class="test-inline">
         			<li>조회일</li>
         			<li><input type="date" min="" max="" id="startDate"></li>
         			<li>~</li>
         			<li><input type="date" min="" max=""  id="endDate"> </li>
         			<li><input type="button" value="오늘"></li>
         			<li><input type="button" value="일주일"></li>
         			<li><input type="button" value="한달"></li>
         		</ul>
         		<input type="button" value="검색">
         	</div>
         	<hr>
         	<div>
         	통계 그래프 div
         	</div>
         	<hr>
         	<div><!-- 홈짐 매출 통계 테이블 div -->
         		<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>날짜</th>
							<th>대여 건수</th>
							<th>총 거래 비용</th>
							<th>중계 수수료</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2021-01-12</td>
							<td>32</td>
							<td>610000</td>
							<td>122000</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>합계</td>
							<td>132</td>
							<td>610000</td>
							<td>122000</td>
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

   var today = getTimeStamp() ;
   $( '#startDate' ).attr('min', today);
   $( '#startDate' ).val(today);
   $( '#startDate' ).on('change', function(){
   	$( '#endDate' ).attr('min', $( '#startDate' ).val());	
   	$( '#endDate' ).val($( '#startDate' ).val());	
   });

   /*-----------------------------------------------------*/

   </script>
<%@include file="../../_include/footer.jsp" %>