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
   <style>
      .mypage_main {width: 600px; padding: 10px 0 0 60px;}
	.mypage_main .likeprofileIMG {overflow: hidden; width: 200px; height: 200px; border-radius: 50%; margin: 0 auto 50px;}
	.mypage_main .likeprofileIMG img {width:200px; height:200px; object-fit: cover;}
	.mypage_main .profile_info {padding: 0 0 0 100px;}
      .mypage_main .tab_style_01 {}
      .mypage_main .tab_style_01 ul {display: flex; border-bottom: 2px solid #006be0;}
      .mypage_main .tab_style_01 li {flex: 1 1 auto;}
      .mypage_main .tab_style_01 li button {display: block; width: 100%; background: #f7f7f7; line-height: 40px; text-align: center; border: none;}
      .mypage_main .tab_style_01 li.on button {background: #006be0; color: #ffffff;}
      .paging {margin: 40px 0 0; text-align: center;}
		.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
    
      .likekeybtn{min-width:900px;}
      .alllikecontent_wrap{min-width:900px;}
      .likepersonAllWrap{display:flex; }
      </style>     
   <div class="mypage_wrap">
   <%@include file="./mypageSideMenu.jsp"%>
   <div class="mypage_contents">
         <div class="mypage_main LikePageMainSize">
        		
        		
        	<div class="alllikecontent_wrap">
       			<div id="toggle_tab" class="tab_style_01 mb50 likekeybtn">
			         <ul>
			            <li class="on"><button type="button" onclick="mypageHomeGymLikeList()">홈짐 좋아요 목록</button></li>
			            <li><button type="button" onclick="mypageCoachMatchLikeList()">코치매칭 좋아요 목록</button></li>
			         </ul>
      			</div>
    
    
    				<div class="likepersonAllWrap">
    				<c:if test="${empty list }">
    					<div>좋아요를 눌러보아요~</div>
    				</c:if>
    				<c:forEach var="dto" items="${list }" varStatus="status">
    					<div class="likeprofileIMG">
    					<img src="/zipcok/upload/member/${memarr[status.index].mfile_upload}">
    					</div>
    					<div>타겟: ${dto.like_target_id}</div>
    				</c:forEach>
    					
    				</div>
    				<div class="paging">${pageStr }</div>
    		</div>
      </div>
      </div>
   </div>
   
      <%@include file="../_include/footer.jsp" %>
</body>
</html>