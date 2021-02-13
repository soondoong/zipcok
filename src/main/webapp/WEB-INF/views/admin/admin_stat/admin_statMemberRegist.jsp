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
      <%@include file="../adminSideMenu.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
         <hr>
         <h3>회원 등록 통계</h3>
         <hr>
         	<div>
         		<ul class="test-inline">
         			<li>조회일</li>
         			<li><input type="date"></li>
         			<li>~</li>
         			<li><input type="date"></li>
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
                        <td>83명</td>
                        <td>70%</td>
                     </tr>
                     <tr>
                        <td>코치회원</td>
                        <td>20명</td>
                        <td>30%</td>
                     </tr>
                  </tbody>
              
               </table>
            </div>
         </div>
      </div>
   </div>
<%@include file="../../_include/footer.jsp" %>