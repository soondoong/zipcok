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
         <hr>
         <h3>코치 매출 통계</h3>
         <hr>
         	<div>
         	<form action="searchCoachTongGye.do">
         		<ul class="test-inline">
         			<li>조회일</li>
         			<li><input type="date" min="" max="" id="startDate" name="startDate"></li>
         			<li>~</li>
         			<li><input type="date" min="" max=""  id="endDate" name="endDate"> </li>
         			<li><input type="button" name="datebtn" value="오늘"></li>
         			<li><input type="button"  name="datebtn" value="일주일"></li>
         			<li><input type="button"  name="datebtn"  value="한달"></li>
         		</ul>
         		<input type="submit" value="검색" id="searchbtn" >
         	</form>	
         	</div>
         	<hr>
        
         <div id="myfirstchart" style="height: 350px;width:100%;" ></div>
         	
         	<hr>
         	<div><!-- 코치 매출 통계 테이블 div -->
         		<table  align="center" class="table table-hover">
					<thead>
						<tr>
							<th>날짜</th>
							<th>매칭 수</th>
							<th>총 매출액</th>
							<th>총 취소금액</th>							
							<th>총 순수익</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2021-01-12 ~ 2021-03-12 </td>
							<td>32</td>
							<td>610000</td>
							<td>610000</td>
							<td>122000</td>
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
	   $( '#startDate' ).attr('min', today);
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
   <script>
   const monthNames = ["", "1월", "2월", "3월", "4월", "5월", "6월",
       "7월", "8월", "9월", "10월", "11월", "12월"
   ];
new Morris.Line({
			// 그래프를 표시 하기 위한 객체의 ID
			  element: 'myfirstchart',
			// 그래프 데이터. 각 요소가 하나의 그래프 상의 값에 해당
		
			  data: [
		          {y: 1, a: 10},
		          {y: 2, a: 20},
		          {y: 3, a: 60},
		          {y: 4, a: 40},
		          {y: 5, a: 50},
		          {y: 6, a: 60}
		      ],
		      // 그래프 데이터에서 x축에 해당하는 값의 이름 
		      xkey: 'y',
		      parseTime: false,
		      // 그래프 데이터에서 y축에 해당하는 값의 이름
		      ykeys: ['a'],
		      xLabelFormat: function (x) {
		          var index = parseInt(x.src.y);
		          return monthNames[index];
		      },
		      xLabels: "month",
		   // 각 값에 대해서 마우스 오버시 표시 하기 위한 레이블
		      labels: ['매칭 수'],
		      lineColors: ['#a0d0e0', '#3dbeee'],
		      hideHover: 'auto'

	});
</script>
   
<%@include file="../../_include/footer.jsp" %>