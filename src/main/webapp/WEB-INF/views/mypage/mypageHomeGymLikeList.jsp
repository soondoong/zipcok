<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function mypageHomeGymLikeList(){
	location.href='mypageHomeGymLikeList.do?mem_id=${sessionScope.sid}';
}
function mypageCoachMatchLikeList(){
	location.href='mypageCoachMatchLikeList.do?mem_id=${sessionScope.sid}';
}
</script>
</head>
<body>
<%@include file="../header2.jsp"%>
	<%@include file="./mypageSideMenu.jsp"%>
	<div style="margin-left: 200px; padding: 1px 16px;">
		<br>
		<h3>${sessionScope.sname }님의 좋아요 목록</h3>
		<hr>
		<input type="button" value="홈짐 좋아요 목록" onclick="mypageHomeGymLikeList()">
		<input type="button" value="코치매치 좋아요 목록" onclick="mypageCoachMatchLikeList()">
		<hr>
				<table border="1" cellspacing="0" width="550">
	<thead>
		<tr>
			<th>홈짐등록자</th>
			<th>홈짐사용자</th>
			<th>홈짐이름</th>
			<th>별점</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="4" align="center">페이지들어갈곳</td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="4" align="center">
					등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td><input type="button" value="후기쓰기"></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
	</div>
</body>
</html>