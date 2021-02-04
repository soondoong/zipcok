<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
margin:0;
padding:0;
}
</style>
</head>
<body>
<%@include file="../header2.jsp" %>
<%@include file="./coachMypageSideMenu.jsp"%>
<div style="margin-left: 250px; padding: 1px 16px;">
<c:set var="list" value="${ chatList }"/>
<br>
<h2>코치의채팅방목록</h2>
<hr>
	
<table style=" border:1px solid lightgray; margin-left: 10%; margin-right: auto;">
<tbody>
<c:forEach var="cdto" items="${list}">
	<tr>
	<td rowspan="2"><p style="font-weight: 600; font-size: 1.4rem;">${cdto.mem_name }회원님과의 대화</p><img src="upload/member/${cdto.mfile_upload }" style="width:100px; height: 100px; object-fit: cover; padding:0px;" ></td>
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
	 	<c:param name="type" value="${loginAll.mem_type}" />
	</c:url>
	
	<!-- 나가기 버튼 클릭시 넘길 파라미터 -->
		<c:url value="/roomDelete.do" var="delurl">
		 <c:param name="id" value="${sessionScope.coachId}" />	 
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
</body>
</html>