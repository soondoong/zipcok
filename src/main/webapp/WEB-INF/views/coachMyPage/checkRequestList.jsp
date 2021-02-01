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
<c:set var="list" value="${ requestList }"/>

<br>
<h2>받은 요청서</h2>
<hr>
	
<table style=" border:1px solid lightgray; margin-left: 10%; margin-right: auto;">
<tbody>
<c:forEach var="rdto" items="${list}">
	<tr>
	<td rowspan="2"><img src="img/coach/noimg.png" width="130px"></td>
	<td >
	<dt>${rdto.mem_name }</dt>
	<label>${rdto.mem_addr }</label>
	<br><label>희망수업유형:${rdto.req_type }/카테고리:${rdto.req_category}</label>
	<br><label>희망 시작일: ${rdto.req_start_date }</label>
	</td>
	<td style="padding-top:0; text-align:right;"  valign="top"><label>요청일: ${rdto.req_date }</label></td>
	</tr>
	<tr>
	<td><p>${rdto.req_cont }</p></td>
	<td>
	<input type="button" value="상담하기" class="btn btn-primary"
	onclick="location.href='startToChat.do?userid=${rdto.req_mem_id }&coachid=${rdto.req_receive_id}&req_idx=${rdto.req_idx}'">
	<input type="button" value="삭제" class="btn btn-danger"
	onclick="location.href='requestDelete.do?req_idx=${rdto.req_idx}&id=${login.mem_id}'">
	</td>
	</tr>
</c:forEach>
</tbody>
</table>
	

</body>
</html>