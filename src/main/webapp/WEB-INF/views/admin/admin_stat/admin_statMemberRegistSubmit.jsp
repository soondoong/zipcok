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
         		<form name="date" action="admin_statMemberRegistSubmit.do">
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
							<th>일반회원 신규등록 수</th>
							<th>코치회원 전환 수</th>
							<th>탈퇴한 회원 수</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="mem_joindatecountsum" value="0" />
						<c:set var="mem_outdatecountsum" value="0" />
						<c:set var="coachJoinCountsum" value="0" />
						<c:forEach var="date" items="${datelist }" varStatus="i">
							<tr>
								<td>${i.current }</td>
									<!-- 일반회원 신규등록 수 -->
									<c:forEach var="joindate" items="${dateJoinCount }" varStatus="j">
										<c:if test="${i.index eq j.index }">
												<td>${j.current }</td>
										<c:set var="mem_joindatecountsum" value="${mem_joindatecountsum + j.current}"/>
										</c:if>
									</c:forEach>
									<!-- 코치회원 전환 수 -->
									<c:forEach var="coachjoindate" items="${coachJoinCount }" varStatus="h">
										<c:if test="${i.index eq h.index }">
												<td>${h.current }</td>
										<c:set var="coachJoinCountsum" value="${coachJoinCountsum + h.current}"/>
										</c:if>
									</c:forEach>
									<!-- 탈퇴한 회원 수 -->
									<c:forEach var="outdate" items="${dateOutCount }" varStatus="o">
										<c:if test="${i.index eq o.index }">
												<td>${o.current }</td>
										<c:set var="mem_outdatecountsum" value="${mem_outdatecountsum + o.current}"/>
										</c:if>
									</c:forEach>					
						</c:forEach>				
					</tbody>
					<tfoot>
						<tr>
							<td>합계</td>
							<td>${mem_joindatecountsum}</td>
							<td>${coachJoinCountsum }</td>
							<td>${mem_outdatecountsum}</td>
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
                        <th>일반 회원 수 / 비율</th>
						<th>코치 회원 수 / 비율</th>
						<th>총 회원 수</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>${sidCount } / ${(sidCount / (sidCount + coachIdCount)) * 100}%</td>
                        <td>${coachIdCount } / ${(coachIdCount / (sidCount + coachIdCount)) * 100}%</td>
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