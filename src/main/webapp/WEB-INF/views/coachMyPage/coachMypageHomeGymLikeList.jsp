<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
</head>
<body>

<%@include file="../header2.jsp"%>
<div class="mypage_wrap">	

	<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main">
		<h3>${sessionScope.sname }님의 홈짐 좋아요 목록</h3>
		<hr>
		<table width="700px">
			<tbody>
			<c:if test="${empty list }">
			<tr>
				<td>
					좋아요를 눌러보아요~
				</td>
			</tr>
			</c:if>
			
			<c:forEach var="dto" items="${list }">
					<tr>
						<td><img src="img/coach/noimg.png" width="150px"></td>
						<td>
						<label><b>좋아요 받은 홈짐 등록자 아이디 : ${dto.like_target_id}</b></label>
						<br>
						<label>좋아요 누른사용자 아이디 : ${dto.like_mem_id }</label>
						</td>
						<td style="padding-top: 0; text-align: right;" valign="bottom"><label>좋아요 누른 날짜 : ${dto.like_date }</label></td>
					</tr>
					</c:forEach>
			</tbody>
			<tfoot>
			<tr>
			<td colspan="3" align="center">${pageStr }</td>
			</tr>
			</tfoot>
		</table>
	</div>
	</div>
	</div>
	 <%@include file="../_include/footer.jsp" %>
</body>
</html>