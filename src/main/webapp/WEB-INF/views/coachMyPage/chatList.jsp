<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<style>
.chatroomDiv{ display:flex; max-width: 1000px;}
.chatroomDiv .chattt{ justify-content: center; padding:60px 0 100px 60px;}
.chatroomDiv .chattt .chats .onechat{ display:flex; cursor:pointer; border:1px solid #e5e6e8; border-radius:7px; margin:0 0 10px 0; box-shadow: 5px 5px 5px #e5e6e8; }
.chatroomDiv .chattt .zipcoktalk:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }
.chatroomDiv .chattt .zipcoktalk{font-weight: 550; color:#12151d;}
.chatroomDiv .chattt hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}
.onechat .chatprofile{padding:10px;}
.onechat .chatprofile img{width:120px; height: 120px; object-fit: cover; padding:10px; border-radius:50%; }
.onechat .chatcontents{position: relative; top:34px; left:21px; width:261px;height:140px;}
.onechat .chatcontents p{margin:0; padding:0;}
.onechat .chatcontents .name{font-weight: 600; font-size: 19px; color:#12151d; }
.onechat .chatcontents .talk{font-size: 14px; color:#12151d; margin:10px 0 0 0;}
.onechat .opendate{font-size: 12px;color:##6f6f71;padding:10px 0 0 0; position:relative; left:17px;}
.onechat .btnout{position:relative; top:88px; right:15px; font-size: 28px; color:#1a346d;}
.onechat .talktime{font-size: 11px; color:#54545f;}
</style>
</head>
<body>
<%@include file="../header2.jsp" %>
<div class="mypage_wrap">	
		<%@include file="./coachMypageSideMenu.jsp"%>
		<div  class="chatroomDiv">
				<div class="chattt">
					<c:set var="list" value="${ chatList }"/>				
						<h2  class="zipcoktalk">&nbsp;집콕톡</h2>
					 <hr>	
				<div class="chats">
		<c:forEach var="cdto" items="${list}">
								<!-- 대화하기 버튼 클릭시 넘길 파라미터 -->
									<c:url value="/gotoChat.do" var="url">
										 <c:param name="croom_idx" value="${cdto.croom_idx }" />
									 	<c:param name="req_idx" value="${cdto.croom_req_idx}" />
									 	<c:param name="type" value="${loginAll.mem_type}" />
									</c:url>
									
									<!-- 나가기 버튼 클릭시 넘길 파라미터 -->
										<c:url value="/roomDelete.do" var="delurl">
										 <c:param name="id" value="${sessionScope.coachId}" />	 
									 	<c:param name="croom_idx" value="${cdto.croom_idx}" />
									 	<c:param name="req_idx" value="${cdto.croom_req_idx}" />
									</c:url>
			<!-- dto시작 -->						
					<div class="onechat" onclick="javascript:location.href='${url}'">	
								<div class="chatprofile">
									<img src="upload/member/${cdto.mfile_upload }" >
								</div>		
								
								<c:if test="${!empty cdto.user_name}">
									<div class="chatcontents">
										 <p class="name">${cdto.mem_name }</p>
										<p class="talk">${cdto.user_name} : ${cdto.msg_content }</p>
										<p class="talktime">${cdto.msg_sendtime }</p>
									</div>
								 </c:if>
									 
								 <c:if test="${empty cdto.user_name}">
								   <div class="chatcontents">
									 	<p class="name">${cdto.mem_name }</p>
										<p  class="talk">아직 채팅이 시작되지않았습니다!</p>
									</div>
								 </c:if>
									<div class="opendate">
										<label>생성일 ${cdto.croom_opendate }</label>
									</div>
																	
									<div>
									<a href="javascript:location.href='${delurl}'">
									<i class="fas fa-door-open btnout"></i>
									</a>							
									</div>
									
					</div>				 
					</c:forEach>
				</div><!-- chats -->
			</div>
		</div>		
</div>
 <%@include file="../_include/footer.jsp" %>
</body>
</html>