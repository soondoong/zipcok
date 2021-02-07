<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">

<style>
.chatroomDiv{ margin:0 auto;max-width: 1000px;}
</style>
</head>
<%@include file="../header2.jsp" %>
<body>
	<div class="mypage_wrap">
		<%@include file="./mypageSideMenu.jsp" %>
		
		
		<c:set var="list" value="${ chatList }"/>
		<div class="chatroomDiv">
		<h2 class="p-4">일반회원채팅방목록</h2>
		<hr>
			
		<table style="width:800px;border:1px solid lightgray; margin-right: auto;">
		<tbody>
		<c:forEach var="cdto" items="${list}">
			<tr>
			<td rowspan="2"><p style="font-weight: 600; font-size: 1.4rem;">${cdto.mem_name }코치와 대화</p><img src="upload/member/${cdto.mfile_upload }" style="width:100px; height: 100px; object-fit: cover; padding:0px;" ></td>
			<td >
			 <c:if test="${!empty cdto.user_name}">
			<br><label>${cdto.user_name} : ${cdto.msg_content }</label>
			<br><label>메세지보낸시각:${cdto.msg_sendtime }</label>
			 </c:if>
			 
			 <c:if test="${empty cdto.user_name}">
			 <br><br>
				<p  style="background-color: yellow;">아직 채팅이 시작되지않았습니다!</p>
			 </c:if>
			</td>
			<td style="padding-top:0; text-align:right;"  valign="top"><label>생성일: ${cdto.croom_opendate }</label></td>
			</tr>
			<tr>
			<td colspan="2" align="right">
			
			
				<!-- 대화하기 버튼 클릭시 넘길 파라미터 -->
			<c:url value="/gotoChat.do" var="url">
				 <c:param name="croom_idx" value="${cdto.croom_idx }" />
			 	<c:param name="req_idx" value="${cdto.croom_req_idx}" />
			 	 <c:param name="type" value="${login.mem_type}" />
			</c:url>
			
			<!-- 나가기 버튼 클릭시 넘길 파라미터 -->
				<c:url value="/roomDelete.do" var="delurl">
				 <c:param name="id" value="${sessionScope.sid}" />	 
			 	<c:param name="croom_idx" value="${cdto.croom_idx}" />
			 	<c:param name="req_idx" value="${cdto.croom_req_idx}" />
			</c:url>
			
			
			<input type="button" value="대화하기" class="btn btn-primary"
			onclick="location.href='${url}'">
			<input type="button" value="나가기" class="btn btn-danger"
			onclick="location.href='${delurl}'">
			</td>
			</tr>
			
				
			
		</c:forEach>
		</tbody>
		</table>
	</div>	
</div>

</body>
</html>