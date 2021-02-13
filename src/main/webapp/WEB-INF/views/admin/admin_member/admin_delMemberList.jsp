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
               <h3>탈퇴 회원</h3>
               <br>
            </div>
            <div>
               <form action="#">
                  <ul class="test-inline">
                     <li>조건 검색</li>
                     <li><select><option>고객명</option></select></li>
                     <li><input type="text" placeholder="구 병 모"></li>
                     <li><input type="submit" value="검색"></li>
                  </ul>
               </form>
            </div>
             <div>
               <form action="#">
                  <ul class="test-inline">
                     <li>조건 검색</li>
                     <li><select><option>탈퇴일</option></select></li>
                    <li><select><option>날짜</option></select></li>~
                    <li><select><option>날짜</option></select></li>
                     <li><input type="submit" value="검색"></li>
                  </ul>
               </form>
            </div>

            <div><!-- 회원목록부분 테이블 div -->
               <table border="1" cellspacing="0">
                  <thead>
                     <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>회원등급</th>
                        <th>탈퇴일</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>1</td>
                        <td>구병모</td>
                        <td>일반회원</td>
                        <td>2021.02.10</td>
                     </tr>
                  </tbody>
                  <tfoot>
                     <tr>
                        <td colspan="4" align="center">페이징 들어갈 자리</td>
                     </tr>
                  </tfoot>
               </table>
            </div>
            
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>