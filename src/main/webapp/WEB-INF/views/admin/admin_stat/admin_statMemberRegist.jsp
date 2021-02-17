<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>
.table { border-spacing: ''; table-layout: auto; text-align: center; margin-bottom:70px;} 
.table th{font-weight: bold; border-color:#848282;}
a{cursor:pointer;}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
</style>
   <div class="adminPage_wrap">
     <%@include file="../adminSideBar.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
        
         <h3>회원 등록 통계</h3>
        
         	<div>
         		<form name="date" action="admin_statMemberRegistSubmit.do">
         		<ul class="test-inline">
         			<li>조회일</li>
         			<li><input type="date" min="" max="" id="startDate" name="startDate" required="required"></li>
         			<li>~</li>
         			<li><input type="date" min="" max=""  id="endDate" name="endDate" required="required"></li>
         			<li><input type="button" name="datebtn"  class="datebtn" value="오늘"></li>
         			<li><input type="button" name="datebtn"  class="datebtn"  value="일주일"></li>
         			<li><input type="button" name="datebtn"  class="datebtn"  value="한달"></li>
         		</ul>
         		<input type="submit" value="검색"  id="searchbtn" class="btn btn-primary" >
         		</form>
         	</div>
         
         
         	<div><!-- 코치 매출 통계 테이블 div -->
         		<table class="table table-hover">
					<thead>
						<tr>
							<th>날짜</th>
							<th>일반회원 신규등록 수</th>
							<th>코치회원 전환 수</th>
							<th>탈퇴한 회원 수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">검색 된 게시글이 없습니다.</td>
						</tr>
					</tbody>
					<tfoot>
						<tr class="table-info">
							<td>합계</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tfoot>
				</table>
         	</div>
         	<hr>
         	<h3>회원 등급별 통계</h3>
            <div><!-- 회원목록부분 테이블 div -->
               <table class="table table-hover">
                  <thead>
                      <tr>
                        <th>일반 회원 수 / 비율</th>
						<th>코치 회원 수 / 비율</th>
						<th>총 회원 수</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <fmt:parseNumber var="sidavg" integerOnly= "true" value="${(sidCount / (sidCount + coachIdCount)) * 100}" />
                     	<fmt:parseNumber var="coachIdavg" integerOnly= "true" value="${(coachIdCount / (sidCount + coachIdCount)) * 100}" />
                        <td>${sidCount } / ${sidavg}%</td>
                        <td>${coachIdCount } / ${coachIdavg}%</td>
                        <td>${sidCount + coachIdCount}</td>
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
	  // $( '#startDate' ).attr('min', today);
	   $( '#startDate' ).val(today);
	   $( '#endDate' ).val(today);
	   $( '#endDate' ).attr('max', today);	
	   $( '#startDate' ).attr('max', today);	
	   
		   $( '#startDate' ).on('change', function(){
		   	$( '#endDate' ).attr('min', $( '#startDate' ).val());
		   	$( '#endDate' ).attr('max', today);	
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