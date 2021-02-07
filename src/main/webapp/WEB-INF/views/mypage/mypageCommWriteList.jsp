<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
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
	<%@include file="../_include/head.jsp" %>
	<%@include file="../header2.jsp"%>
	<div class="mypage_wrap">
	<%@include file="./mypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main">
	<br>
	<div id="toggle_tab" class="tab_style_01 mb50">
		<style>
		.mypage_main .tab_style_01 {}
		.mypage_main .tab_style_01 ul {display: flex; border-bottom: 2px solid #006be0;}
		.mypage_main .tab_style_01 li {flex: 1 1 auto;}
		.mypage_main .tab_style_01 li button {display: block; width: 100%; background: #f7f7f7; line-height: 40px; text-align: center; border: none;}
		.mypage_main .tab_style_01 li.on button {background: #006be0; color: #ffffff;}
		</style>		
			<ul>
				<li><button type="button" onclick="mypageWriteList()">F&A / 고객센터 작성글</button></li>
				<li class="on"><button type="button" onclick="mypageCommWriteList()">커뮤니티 작성글</button></li>
			</ul>
		</div>
		<div class="mypage_main_table">
	<table border="1" cellspacing="0">
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
	</div>
	</div>
	</div>
	   <%@include file="../_include/footer.jsp" %>
</body>
</html>