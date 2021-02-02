<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function mypageWriteList() {
	location.href='mypageWriteList.do?mem_id=${sessionScope.sid}';
}
function mypageCommWriteList() {
	location.href='mypageCommWriteList.do?mem_id=${sessionScope.sid}';
}
</script>
</head>
<body>
<%@include file="../header2.jsp"%>
	<%@include file="./mypageSideMenu.jsp" %>
	<div style="margin-left: 250px; padding: 1px 16px;">
	<br>
	<h3>${sessionScope.sname }님의 작성글</h3>
	<hr>
		<input type="button" value="F&A/고객센터 작성글" onclick="mypageWriteList()">
		<input type="button" value="커뮤니티 작성글" onclick="mypageCommWriteList()">
		<hr>
	<table border="1" cellspacing="0" width="550">
	<thead>
		<tr>
			<th>게시판</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="5" align="center">페이징들어갈곳</td>
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
		<c:forEach var="dto" items="${list }">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
	</div>
</body>
</html>