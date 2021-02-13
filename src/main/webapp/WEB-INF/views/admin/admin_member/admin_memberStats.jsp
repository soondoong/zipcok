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
         <br>	
            <div>
               <h3>회원 통계</h3>
               <br>
            </div>
            <h3>기간별 통계</h3>
            <form action="#">
                  <ul class="test-inline">
                     <li>기간</li>
                     <li><select><option>2020</option></select></li>
                     <li><input type="submit" value="검색"></li>
                  </ul>
               </form>
            <br><br><br><br>
            
            
			
            
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>