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
.requestroomDiv{ display:flex; max-width: 1000px;}
.requestroomDiv .reqwrap{ min-width:800px; justify-content: center; padding:40px 0 100px 80px;}
.requestroomDiv .reqwrap h2:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }
.requestroomDiv .reqwrap h2{font-weight: 550; color:#12151d; margin-bottom:20px;}
.requestroomDiv .reqwrap hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}
.requestroomDiv .reqwrap .noreq{margin:50px 0 70px 300px;}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
.reqListwrap{display: flex;}
.reqListwrap .card{width:300px; margin-right: 20px; box-shadow: 3px 11px 9px #d8d8d8;}
.icondiv{background-color: #569be2; width: 100%; text-align: center; padding:3px 0; border-radius:0 0 7px 7px;margin-bottom: 20px;}
.dumbbellicon{font-size:25px; color:white; }
.btnAllDiv{text-align: right;}
.title{font-weight: 600; font-size: 14px; color:#12151d; margin-right:15px; }
</style>
</head>
<body>
<%@include file="../header2.jsp" %>
<div class="mypage_wrap">
	<c:if test="${!empty sessionScope.coachId }">	
	<%@include file="./coachMypageSideMenu.jsp"%>
	</c:if>
	<c:if test="${!empty sessionScope.sid }">	
	<%@include file="../mypage/mypageSideMenu.jsp"%>
	</c:if>	
	
<div  class="requestroomDiv">
    <div  class="reqwrap">
				
		<c:set var="list" value="${ requestList }"/>
		
		<c:if test="${!empty sessionScope.coachId }">	
		<h2>&nbsp;받은 요청서</h2>
		<p>상담하기 버튼을 누르면 고객님과 채팅으로 대화 하실 수 있습니다!</p>
		</c:if>
		<c:if test="${!empty sessionScope.sid }">	
		<h2>&nbsp;보낸 요청서</h2>
		<p>코치님이 요청서를 수락하시면 채팅으로 대화 하실 수 있습니다!</p>
		</c:if>
		<hr>
<div class="reqListwrap">			
				<c:if test="${empty list }">
				<p class="noreq">아직 요청서가 없습니다.</p>
				</c:if> 
		
	<c:if test="${!empty list }">			
		<c:forEach var="rdto" items="${list}">
			
			<div  class="card" > 
				<div class="card-body" style="padding-top:0px;">
		         <div >
		          	 
		           		<div class="icondiv"><i class="fas fa-dumbbell dumbbellicon"></i></div>	           
		        		<p><span class="title">${empty sessionScope.sid?"요청인":"코치명"}</span><span>${rdto.mem_name }</span></p>
						<p><span class="title">주소</span><span>${rdto.mem_addr }</span></p>	
						<p><span class="title">희망수업유형</span><span>${rdto.req_type }</span></p>
						<p><span class="title">카테고리</span><span>${rdto.req_category}</span></p>	
						<p><span class="title">희망 시작일</span><span>${rdto.req_start_date }</span></p>	
						<p><span class="title">요청일</span><span>${rdto.req_date }</span></p>
						<p class="title">상담문의내용</p>	
						<p>${rdto.req_cont }</p>		
				
		        </div>
	           
			<!-- 상담버튼 클릭시 넘길 파라미터 -->
			<c:url value="/startToChat.do" var="url">
				 <c:param name="userid" value="${rdto.req_mem_id }" />
			 	<c:param name="coachid" value="${rdto.req_receive_id}" />
			 	<c:param name="req_idx" value="${rdto.req_idx}" />
			 	<c:param name="type" value="${login.mem_type}" />
			</c:url>
				
			
			<!-- 삭제버튼 클릭시 넘길 파라미터 -->
				<c:url value="/requestDelete.do" var="delurl">
				 <c:param name="mem_id" value="${login.mem_id}" />	 
			 	<c:param name="req_idx" value="${rdto.req_idx}" />
			</c:url>
				<div class="btnAllDiv">
					<c:if test="${!empty sessionScope.coachId }">		
						<input type="button" value="${rdto.req_status eq '대기중'?'상담하기':rdto.req_status}" class="btn ${rdto.req_status eq '대기중'?'btn-primary':'btn-warning'}"
						onclick="location.href='${rdto.req_status eq '대기중'?url:'#'}'">
					</c:if>
					<c:if test="${empty sessionScope.coachId }">
						<input type="button" value="${rdto.req_status}" class="btn ${rdto.req_status eq '대기중'?'btn-primary':'btn-warning'}"
						onclick="location.href='#'">
					</c:if>
						<input type="button" value="삭제" class="btn btn-danger"
						onclick="location.href='${delurl}'"> <!-- id잇어야원래페이지넘어오기편함 -->
				</div>	
			</div><!-- card-body -->	 			
		  </div><!-- card 하나의 요청서묶음 -->
			
		</c:forEach>
	</c:if>
</div><!-- ReqWrap -->
	
	<div class="paging">
		<c:if test="${!empty pageStr }">
		${pageStr }
		</c:if>
	</div>
	
		
	</div>	
</div>
</div>	

 <%@include file="../_include/footer.jsp" %>
</body>
</html>