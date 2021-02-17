<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>  
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
        
         <h3>코치 매출 통계</h3>
      
         	<div>
         	<form action="searchCoachTongGye.do">
         		<ul class="test-inline">
         			<li  class="checkdate">조회일</li>
         			<li><input type="date" min="" max="" id="startDate" name="startDate"></li>
         			<li>~</li>
         			<li><input type="date" min="" max=""  id="endDate" name="endDate"> </li>
         			<li><input type="button" name="datebtn" class="datebtn" value="오늘"></li>
         			<li><input type="button"  name="datebtn" class="datebtn" value="일주일"></li>
         			<li><input type="button"  name="datebtn"  class="datebtn" value="한달"></li>
         		</ul>
         		<input type="submit" value="검색" id="searchbtn" >
         	</form>	
         	</div>
         
			<hr>
        
         	<!-- 그래프 -->
         	<h5 style="margin-bottom:25px;">월간 수익 그래프</h5>
         	<div id="myfirstchart" style="height: 350px;width:100%;margin-bottom:50px;" ></div>
         	
         	
         	        <div><!-- 코치 매출 통계 테이블 div -->
         		<table  align="center" class="table table-hover">
					<thead>
						<tr>
							<th>날짜</th>
							<th>매칭 수</th>
							<th>총 매출액</th>
							<th>총 취소액</th>							
							<th>총 순수익</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${tonggyedto.startDate } ~ ${tonggyedto.endDate } </td>
							<td>${tonggyedto.sumAllMatch }</td>
							<td>${tonggyedto.sumAllSell }</td>
							<td>${tonggyedto.sumAllCancel }</td>
							<td>${tonggyedto.sumResultSell }</td>
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
   <script>
   const monthNames = ["", "1월", "2월", "3월", "4월", "5월", "6월",
       "7월", "8월", "9월", "10월", "11월", "12월"
   ];
new Morris.Line({
			// 그래프를 표시 하기 위한 객체의 ID
			  element: 'myfirstchart',
			// 그래프 데이터. 각 요소가 하나의 그래프 상의 값에 해당
		
			  data: [
		          {y: ${graphdata[0].y}, a: ${graphdata[0].sumAllMatch}, b:${graphdata[0].sumAllSell},c:${graphdata[0].sumResultSell}},
		          {y: ${graphdata[1].y}, a: ${graphdata[1].sumAllMatch}, b:${graphdata[1].sumAllSell},c:${graphdata[1].sumResultSell}},
		          {y: ${graphdata[2].y}, a: ${graphdata[2].sumAllMatch}, b:${graphdata[2].sumAllSell},c:${graphdata[2].sumResultSell}},
		          {y: ${graphdata[3].y}, a: ${graphdata[3].sumAllMatch}, b:${graphdata[3].sumAllSell},c:${graphdata[3].sumResultSell}},
		          {y: ${graphdata[4].y}, a: ${graphdata[4].sumAllMatch}, b:${graphdata[4].sumAllSell},c:${graphdata[4].sumResultSell}},
		          {y: ${graphdata[5].y}, a: ${graphdata[5].sumAllMatch}, b:${graphdata[5].sumAllSell},c:${graphdata[5].sumResultSell}},
		          {y: ${graphdata[6].y}, a: ${graphdata[6].sumAllMatch}, b:${graphdata[6].sumAllSell},c:${graphdata[6].sumResultSell}},
		          {y: ${graphdata[7].y}, a: ${graphdata[7].sumAllMatch}, b:${graphdata[7].sumAllSell},c:${graphdata[7].sumResultSell}},
		          {y: ${graphdata[8].y}, a: ${graphdata[8].sumAllMatch}, b:${graphdata[8].sumAllSell},c:${graphdata[8].sumResultSell}},
		          {y: ${graphdata[9].y}, a: ${graphdata[9].sumAllMatch}, b:${graphdata[9].sumAllSell},c:${graphdata[9].sumResultSell}},
		          {y: ${graphdata[10].y}, a: ${graphdata[10].sumAllMatch}, b:${graphdata[10].sumAllSell},c:${graphdata[10].sumResultSell}},
		          {y: ${graphdata[11].y}, a: ${graphdata[11].sumAllMatch}, b:${graphdata[11].sumAllSell},c:${graphdata[11].sumResultSell}}
		      ],
		    
		      // 그래프 데이터에서 x축에 해당하는 값의 이름 
		      xkey: 'y',
		      parseTime: false,
		      // 그래프 데이터에서 y축에 해당하는 값의 이름
		      ykeys: ['a','b','c'],
		      xLabelFormat: function (x) {
		          var index = parseInt(x.src.y);
		          return monthNames[index];
		      },
		      xLabels: "month",
		   // 각 값에 대해서 마우스 오버시 표시 하기 위한 레이블
		      labels: ['매칭 수','총매출','순수익'],
		      lineColors: ['#e19bdc', '#3dbeee','green'],
		      hideHover: 'auto'

	});
</script>
   
<%@include file="../../_include/footer.jsp" %>