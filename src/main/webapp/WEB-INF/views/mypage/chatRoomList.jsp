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
<h2>채팅방목록</h2>
<hr>
	
<table style=" border:1px solid lightgray; margin-left: 10%; margin-right: auto;">
<tbody>
<c:forEach var="cdto" items="${list}">
	<tr>
	<td rowspan="2"><img src="img/coach/noimg.png" width="130px"></td>
	<td >
	<dt>${cdto.croom_userid }</dt>
	<label>무언가넣자</label>
	<br><label>마지막메세지같은거넣자</label>
	<br><label>메세지보낸시각:2021-01-22</label>
	</td>
	<td style="padding-top:0; text-align:right;"  valign="top"><label>생성일: ${cdto.croom_opendate }</label></td>
	</tr>
	<tr>
	<td><p>메세지를넣을까?</p></td>
	<td>
	<input type="button" value="나가기" class="btn btn-danger"
	onclick="location.href='roomDelete.do?croom_idx=${cdto.croom_idx}&id=${sessionScope.sid}'">
	</td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>