<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<script>
   function coachMypageHomeGymLikeList() {
      location.href = 'coachMypageHomeGymLikeList.do?mem_id=${sessionScope.coachId}';
   }
</script>
</head>
<body>

<%@include file="../header2.jsp"%>
 <style>
      .mypage_main {width: 600px; padding: 10px 0 0 60px;}
		.mypage_main .likeprofileIMG {overflow: hidden;  width: 170px; height: 170px; border-radius: 50%; margin-bottom:20px;}
	.mypage_main .likeprofileIMG img {width:170px; height:170px; object-fit: cover;}
	.mypage_main .profile_info {padding: 0 0 0 100px;}

      .paging {margin: 40px 0 0; text-align: center;}
		.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
    
      .likekeybtn{min-width:900px;}
      .alllikecontent_wrap{min-width:900px;}
      .likepersonAllWrap{display:flex; place-content: center;}
      </style>     
<div class="mypage_wrap ">	

	<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main LikePageMainSize ">
         
		<div class="alllikecontent_wrap">


    				<div class="likepersonAllWrap">
    				
    				<c:if test="${empty list }">
    					<div>검색된 좋아요 내역이 없습니다.</div>
    				</c:if>
    				<c:forEach var="dto" items="${list }" varStatus="status">
    				<div  style="text-align: center; padding:20px;">
    					<div class="likeprofileIMG">
    					<img src="/zipcok/upload/member/${memarr[status.index].mfile_upload}">
    					</div>
    					<h5>${dto.like_target_id}</h5>
    				</div>	
    					
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