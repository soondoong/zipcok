<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<!-- 차트용 cdn -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
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
         <h3>회원 등록 통계</h3>
         <hr>
         	<div>
         		<form name="date" action="dd">
         		<ul class="test-inline">
         			<li>조회일</li>
         			<li><input type="date" min="" max="" id="startDate" name="startDate"></li>
         			<li>~</li>
         			<li><input type="date" min="" max=""  id="endDate" name="endDate"></li>
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
							<th>총 회원수</th>
							<th>등록한 회원 수</th>
							<th>탈퇴한 회원 수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2021-01-12</td>
							<td>132313</td>
							<td>5111</td>
							<td>탈퇴한 회원 수</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>합계</td>
							<td>132313</td>
							<td>5111</td>
							<td>회원 비율</td>
						</tr>
					</tfoot>
				</table>
         	</div>
         	<hr>
         	<h3>회원 등급별 통계</h3>
            <div><!-- 회원목록부분 테이블 div -->
               <table border="1" cellspacing="0">
                  <thead>
                     <tr>
                        <th>회원 등급</th>
                        <th>회원 수</th>
                        <th>비율</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>일반회원</td>
                        <td>${sidCount }</td>
                        <td>${(sidCount / (sidCount + coachIdCount)) * 100}%</td>
                     </tr>
                     <tr>
                        <td>코치회원</td>
                        <td>${coachIdCount }</td>
                        <td>${(coachIdCount / (sidCount + coachIdCount)) * 100}%</td>
                     </tr>
                  </tbody>
              
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