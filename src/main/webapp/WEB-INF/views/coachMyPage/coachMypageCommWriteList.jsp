<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">

<script>
function coachMypageWriteList() {
	location.href='coachMypageWriteList.do?mem_id=${sessionScope.coachId}';
}
function coachMypageCommWriteList() {
	location.href='coachMypageCommWriteList.do?mem_id=${sessionScope.coachId}';
}
</script>
</head>
<body>
	<%@include file="../_include/head.jsp" %>
	<%@include file="../header2.jsp"%>
	<div class="mypage_wrap">
	<%@include file="./coachMypageSideMenu.jsp"%>
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
				<li><button type="button" onclick="coachMypageWriteList()">F&A / 고객센터 작성글</button></li>
				<li class="on"><button type="button" onclick="coachMypageCommWriteList()">커뮤니티 작성글</button></li>
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
	</div>
	   <%@include file="../_include/footer.jsp" %>
</body>
</html>