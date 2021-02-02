<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function mypageHomeGymLikeList() {
		location.href = 'mypageHomeGymLikeList.do?mem_id=${sessionScope.sid}';
	}
	function mypageCoachMatchLikeList() {
		location.href = 'mypageCoachMatchLikeList.do?mem_id=${sessionScope.sid}';
	}
</script>
</head>
<body>
	<%@include file="../header2.jsp"%>
	<%@include file="./mypageSideMenu.jsp"%>
	<div style="margin-left: 200px; padding: 1px 16px;">
		<br>
		<h3>${sessionScope.sname }님의좋아요 목록</h3>
		<hr>
		<input type="button" value="홈짐 좋아요 목록"
			onclick="mypageHomeGymLikeList()"> <input type="button"
			value="코치매치 좋아요 목록" onclick="mypageCoachMatchLikeList()">
		<hr>
		<table width="550px">
			<tbody>
			<c:if test="${empty list}">
			<tr>
				<td align="center">
					좋아요를 눌러보아요~
				</td>
			</tr>
			</c:if>
			
			<c:forEach var="dto" items="${list }">
					<tr>
						<td><img src="img/coach/noimg.png" width="150px"></td>
						<td>
						<label><b>${dto.like_target_id }</b></label>
						<br>
						<label>${dto.like_mem_id }</label>
						<br>
						<label>${dto.like_key }</label>
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
</body>
</html>