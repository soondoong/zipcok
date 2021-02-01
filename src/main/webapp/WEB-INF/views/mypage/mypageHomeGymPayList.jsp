<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function mypageHomeGymPayList(){
	location.href='mypageHomeGymPayList.do?mem_id=${sessionScope.sid}';
}
function mypageCoachMatchPayList(){
	location.href='mypageCoachMatchPayList.do?mem_id=${sessionScope.sid}';
}
</script>
</head>
<body>
<%@include file="../header2.jsp"%>
	<%@include file="./mypageSideMenu.jsp"%>
	<div style="margin-left: 200px; padding: 1px 16px;">
		<br>
		<h3>${sessionScope.sname }님의 결제내역</h3>
		<hr>
		<input type="button" value="홈짐 결제내역" onclick="mypageHomeGymPayList()">
		<input type="button" value="코치매치 결제내역" onclick="mypageCoachMatchPayList()">
				<hr>
		<table border="1" cellspacing="0" width="550">
	<thead>
		<tr>
			<th>결제일자</th>
			<th>홈짐이름</th>
			<th>금액</th>
			<th>처리상태</th>
			<th>후기</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="5" align="center">페이지들어갈곳</td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5" align="center">
					등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="">
		<tr>
			<td></td>
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