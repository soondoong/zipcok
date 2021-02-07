<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<script>
function coachMypageWriteList() {
	location.href='coachMypageWriteList.do?mem_id=${sessionScope.sid}';
}
function coachMypageCommWriteList() {
	location.href='coachMypageCommWriteList.do?mem_id=${sessionScope.sid}';
}
</script>
</head>
<body>
<body>
	<%@include file="../_include/head.jsp" %>
	<%@include file="../header2.jsp"%>
	<div class="mypage_wrap">
	<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main">
	<h3>${sessionScope.sname }님의 작성글</h3>
	<hr>
		<input type="button" value="F&A/고객센터 작성글" onclick="coachMypageWriteList()">
		<input type="button" value="커뮤니티 작성글" onclick="coachMypageCommWriteList()">
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
			<td colspan="5" align="center">${pageStr }</td>
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
			<td>${dto.bbs_key }</td>
			<td>${dto.bbs_category }</td>
			<td>${dto.bbs_subject }</td>
			<td>${dto.bbs_category }</td>
			<td>${dto.bbs_writedate }</td>
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