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
         <br>	
            <div>
               <h3>목록 조회</h3>
               <br>
            </div>
            <div>
               <form action="#">
                  <ul class="test-inline">
                     <li>지역</li>
                     <li><select><option>전체</option></select></li>
                     <li>홈짐 공유자 이름</li>
                     <li><input type="text" placeholder="내용을 입력해줘"></li>
                     <li><input type="submit" value="검색"></li>
                  </ul>
               </form>
            </div>
            <br>
            <div>
               <ul   class="test-inline">
                  <li>등록된 홈짐 수 : 12</li>
               </ul>
            </div>
			
            <div><!-- 회원목록부분 테이블 div -->
               <table border="1" cellspacing="0">
                  <thead>
                     <tr>
                        <th>번호</th>
                        <th>홈짐이름</th>
                        <th>공유자아이디</th>
                        <th>등록일</th>
                        <th>정보수정일</th>
                        <th>결제계좌정보</th>
                        <th>상태</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>1</td>
                        <td>표승이네건강파크</td>
                        <td>member</td>
                        <td>2021.02.11</td>
                        <td>2021.02.11</td>
                        <td>미등록</td>
                        <td><input type="checkbox"></td>
                     </tr>
                  </tbody>
                  <tfoot>
                     <tr>
                        <td colspan="7" align="center">페이징 들어갈 자리</td>
                     </tr>
                  </tfoot>
               </table>
            </div>
            
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>