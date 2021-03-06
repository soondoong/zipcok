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
.chatroomDiv{ display:flex; max-width:1000px; width:800px; }
.chatroomDiv .chattt{ width:inherit;  justify-content: center; padding:40px 0 100px 80px;}
.chatroomDiv .chattt .chats .onechat{  display:flex; justify-content:space-between; height:160px;   cursor:pointer; border-top:4px solid #257cda; border-bottom:1px solid #e5e6e8; margin:0 0 10px 0; box-shadow: 5px 5px 5px #e5e6e8; }
.chatroomDiv .chattt .zipcoktalk:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }
.chatroomDiv .chattt .zipcoktalk{color:#12151d; margin-bottom:20px;}
.chatroomDiv .chattt hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}
.onechat .chatprofile{padding:10px;}
.onechat .chatprofile img{width:120px; height: 120px; object-fit: cover; padding:10px; border-radius:50%; }
.onechat .chatcontents{position:relative; top:14px;  width:300px;height:inherit;}
.onechat .chatcontents p{margin:0; padding:0;}
.onechat .chatcontents .name{font-weight: 600; font-size: 22px; color:#12151d; }
.onechat .chatcontents .talk{font-size: 20px; color:#12151d; margin:10px 0 0 10px;}
.onechat .opendate{font-size: 12px;color:##6f6f71;padding:10px 0 0 0; justify-content: flex-end;}
.onechat .talktime{font-size: 11px; color:#54545f;position:absolute; right:10px;}
.noreq{margin:70px 0 0 50px;}
.opendate{ position:relative; height: 100%; }
.opendate p{ position:relative;right:20px; font-size: 16px;}
.onechat .btnout{font-size: 35px; color:#1a346d;cursor: pointer; position:absolute; bottom:20px;right:20px;}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}

</style>
</head>
<body>
<%@include file="../header2.jsp" %>
<!-- 메뉴바 -->
<div class="mypage_wrap">
	 <c:if test="${!empty sessionScope.coachId }">	
	<%@include file="./coachMypageSideMenu.jsp"%>
	</c:if>
	<c:if test="${!empty sessionScope.sid }">	
	<%@include file="../mypage/mypageSideMenu.jsp"%>
	</c:if>
 
<!-- 메뉴바 --> 

		<div  class="chatroomDiv">
				<div class="chattt">
					<c:set var="list" value="${ chatList }"/>				
						<h2  class="zipcoktalk">&nbsp;집콕톡</h2>
						<p>집콕톡을 통해 편리하게 대화를 나눠보세요!</p>
					 <hr>	
				<div class="chats">
				<c:if test="${empty list }">
				<p class="noreq"> 현재 상담 중인 채팅방이 존재하지 않습니다!</p>
				</c:if> 
				
	
				
		<c:if test="${!empty list }">	
		<c:if test="${!empty sessionScope.coachId }">
		<c:forEach var="cdto" items="${list}" >
						<!--코치버전 대화하기 버튼 클릭시 넘길 파라미터 -->
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
								
								<c:if test="${cdto.msg_idx ne ''}">
									<div class="chatcontents">
										 <p class="name">${cdto.mem_name }님과의 채팅방</p>
										<c:choose>
										 <c:when test="${cdto.msg_type == '텍스트' }">
										<p  class="talk" name="msgContent_p" >${cdto.msg_content }</p>
										</c:when>
										 <c:when test="${cdto.msg_type == '결제요청서' }">
										<p class="talk">[결제요청서]</p>
										</c:when>
										</c:choose>
										<p class="talktime">${cdto.msg_sendtime }</p>
									</div>
								 </c:if>
									 
								 <c:if test="${cdto.msg_idx eq ''}">
								   <div class="chatcontents">
									 	<p class="name">${cdto.mem_name }님과의 채팅방</p>
										<p  class="talk">아직 채팅이 시작되지않았습니다!</p>
									</div>
								 </c:if>
									<div class="opendate">
										<p>생성일 ${cdto.croom_opendate }</p>
										<i class="fas fa-door-open btnout coachoutbtn"></i>			
									</div>
									
					</div>				 
					</c:forEach>
					</c:if>
					
		<c:if test="${!empty sessionScope.sid }">
		<c:forEach var="cdto" items="${list}" >

											<!--일반회원버전 대화하기 버튼 클릭시 넘길 파라미터 -->
											<c:url value="/gotoChat.do" var="nurl">
												 <c:param name="croom_idx" value="${cdto.croom_idx }" />
											 	<c:param name="req_idx" value="${cdto.croom_req_idx}" />
											 	 <c:param name="type" value="${login.mem_type}" />
											</c:url>
											
											<!-- 나가기 버튼 클릭시 넘길 파라미터 -->
												<c:url value="/roomDelete.do" var="ndelurl">
												 <c:param name="id" value="${sessionScope.sid}" />	 
											 	<c:param name="croom_idx" value="${cdto.croom_idx}" />
											 	<c:param name="req_idx" value="${cdto.croom_req_idx}" />
											</c:url>
					
			
			<!-- dto시작 -->						
					<div class="onechat" onclick="javascript:location.href='${nurl}'">	
								<div class="chatprofile">
									<img src="upload/member/${cdto.mfile_upload }" >
								</div>		
								
								<c:if test="${cdto.msg_idx ne ''}">
									<div class="chatcontents">
										 <p class="name">${cdto.mem_name }님과의 채팅방</p>
										<c:choose>
										 <c:when test="${cdto.msg_type == '텍스트' }">
										<p  class="talk" name="msgContent_p" >${cdto.msg_content }</p>
										</c:when>
										 <c:when test="${cdto.msg_type == '결제요청서' }">
										<p class="talk">[결제요청서]</p>
										</c:when>
										</c:choose>
										<p class="talktime">${cdto.msg_sendtime }</p>
									</div>
								 </c:if>
									 
								 <c:if test="${cdto.msg_idx eq ''}">
								   <div class="chatcontents">
									 	<p class="name">${cdto.mem_name }님과의 채팅방</p>
										<p  class="talk">아직 채팅이 시작되지않았습니다!</p>
									</div>
								 </c:if>
									<div class="opendate">
										<p>생성일 ${cdto.croom_opendate }</p>
										<i class="fas fa-door-open btnout normaloutbtn"></i>			
									</div>
									
					</div>				 
					</c:forEach>
					</c:if>
						
					
					
					
					
						
					</c:if>
				</div>
				<div class="paging">
					<c:if test="${!empty pageStr }">
					${pageStr }
					</c:if>
				</div>
				
			</div><!-- chattt -->
		</div>		
</div>

<script>
$('.coachoutbtn').on('click',function(e){
	e.stopPropagation();
	var result=confirm('채팅방을 나가시겠습니까?');
	if(result){
		location.href='${delurl}';
	}else{
		
	}
});

$('.normaloutbtn').on('click',function(e){
	e.stopPropagation();
	var result=confirm('채팅방을 나가시겠습니까?');
	if(result){
		location.href='${ndelurl}';
	}else{
		
	}
});
$(function(){
	var conts = $('p[name=msgContent_p]');
	for(var i=0; i<conts.length; i++){
		var content=conts.eq(i).text();
		if(content.length>25){
			var newcont=content.substring(0,25);
			conts.eq(i).text(newcont);
		}
	}

});
</script>

 <%@include file="../_include/footer.jsp" %>
</body>
</html>