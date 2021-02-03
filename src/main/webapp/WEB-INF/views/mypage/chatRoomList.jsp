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
<c:set var="list" value="${ chatList }"/>

<br>
<h2>일반회원채팅방목록</h2>
<hr>
	
<table style=" border:1px solid lightgray; margin-left: 10%; margin-right: auto;">
<tbody>
<c:forEach var="cdto" items="${list}">
	<tr>
	<td rowspan="2"><img src="img/coach/noimg.png" width="130px"></td>
	<td >
	<dt>${cdto.croom_coachid }</dt>
	<label><strong>보낸이:${cdto.msg_sender }</strong></label>
	<br><label>${cdto.msg_content }</label>
	<br><label>메세지보낸시각:${cdto.msg_sendtime }</label>
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
</body>
</html>