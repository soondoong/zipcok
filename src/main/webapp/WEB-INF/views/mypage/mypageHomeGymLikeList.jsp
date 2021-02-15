<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="assets/css/mypage.css" rel="stylesheet">
<script>
   function mypageHomeGymLikeList() {
      location.href = 'mypageHomeGymLikeList.do?mem_id=${sessionScope.sid}';
   }
   function mypageCoachMatchLikeList() {
      location.href = 'mypageCoachMatchLikeList.do?mem_id=${sessionScope.sid}';
   }
</script>
</head>
<body>
   <%@include file="../header2.jsp"%>
   <div class="mypage_wrap">
   <%@include file="./mypageSideMenu.jsp"%>
   <div class="mypage_contents">
         <div class="mypage_main LikePageMainSize">
        
      <br>
      <div id="toggle_tab" class="tab_style_01 mb50">
      <style>
      .mypage_main .tab_style_01 {}
      .mypage_main .tab_style_01 ul {display: flex; border-bottom: 2px solid #006be0;}
      .mypage_main .tab_style_01 li {flex: 1 1 auto;}
      .mypage_main .tab_style_01 li button {display: block; width: 100%; background: #f7f7f7; line-height: 40px; text-align: center; border: none;}
      .mypage_main .tab_style_01 li.on button {background: #006be0; color: #ffffff;}
      </style>      
         <ul>
            <li class="on"><button type="button" onclick="mypageHomeGymLikeList()">홈짐 좋아요 목록</button></li>
            <li><button type="button" onclick="mypageCoachMatchLikeList()">코치매칭 좋아요 목록</button></li>
         </ul>
      </div>
      <div class="mypage_main_table">
      <table>
         <tbody>
         <c:if test="${empty list }">
         <tr>
            <td>
               좋아요를 눌러보아요~
            </td>
         </tr>
         </c:if>
         
         <c:forEach var="dto" items="${list }">
               <tr>
                  <td><img src="img/coach/noimg.png" width="150px"></td>
                  <td>
                  <label><b>좋아요 받은 홈짐 등록자 아이디 : ${dto.like_target_id}</b></label>
                  <br>
                  <label>좋아요 누른사용자 아이디 : ${dto.like_mem_id }</label>
                  <br>
                  <label>좋아요 구분 : ${dto.like_key }</label>
                  </td>
                  <td style="padding-top: 0; text-align: right;" valign="bottom"><label>좋아요 누른 날짜 : ${dto.like_date }</label></td>
               </tr>
               </c:forEach>
         </tbody>
         <tfoot>
         <tr>
         <td colspan="3" align="center">${pageStr }</td>
         </tr>
         </tfoot>
      </table>
      </div>
      </div>
   </div>
   </div>
      <%@include file="../_include/footer.jsp" %>
</body>
</html>