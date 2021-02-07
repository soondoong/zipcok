<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
</head>
<body>
	<%@include file="../_include/head.jsp" %>
	<%@include file="../header2.jsp"%>
	<div class="mypage_wrap">
	<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main">
<c:set var="list" value="${ requestList }"/>

<br>
<h2>받은 요청서</h2>
<p>상담하기 버튼을 누르면 고객님과 채팅으로 대화 하실 수 있습니다!</p>
<hr>
<br>
<table style=" border:1px solid lightgray; margin-right: auto;">
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

	
	<!-- 상담버튼 클릭시 넘길 파라미터 -->
	<c:url value="/startToChat.do" var="url">
		 <c:param name="userid" value="${rdto.req_mem_id }" />
	 	<c:param name="coachid" value="${rdto.req_receive_id}" />
	 	<c:param name="req_idx" value="${rdto.req_idx}" />
	 	<c:param name="type" value="${login.mem_type}" />
	</c:url>
		
	
	<!-- 삭제버튼 클릭시 넘길 파라미터 -->
		<c:url value="/requestDelete.do" var="delurl">
		 <c:param name="id" value="${login.mem_id}" />	 
	 	<c:param name="req_idx" value="${rdto.req_idx}" />
	</c:url>
	
	
	<input type="button" value="${rdto.req_status eq 'yet'?'상담하기':'상담 중'}" class="btn ${rdto.req_status eq 'yet'?'btn-primary':'btn-warning'}"
	onclick="location.href='${rdto.req_status eq 'yet'?url:'#'}'">

	<input type="button" value="삭제" class="btn btn-danger"
	onclick="location.href='${delurl}'"> <!-- id잇어야원래페이지넘어오기편함 -->
	</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>	
</div>
 <%@include file="../_include/footer.jsp" %>
</body>
</html>