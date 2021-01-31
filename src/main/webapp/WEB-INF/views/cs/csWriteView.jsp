<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../_include/head.jsp" %>

<%@include file="../_include/header.jsp" %>

<c:if test="${empty sessionScope.sid } || ${empty sessionScope.coachid }">
<script>
window.alert('로그인 후 이용가능 합니다!');
location.href='csList.do';
</script>
</c:if>
<div class="container">
	<div class="page_top_visual">
		<div class="common_page_title">
			<h2 class="page_title">고객센터</h2>
			<p class="page_text">자주 묻는 질문과 교객센터입니다.</p>
		</div>
	</div>
<div class="contents">
<form action="csWrite.do" method="post" enctype="multipart/form-data">
	<style>
		.white_talbe_01 {border-top: 1px solid #333333;}
		.white_talbe_01 tbody tr th {width: 200px; padding: 10px 20px; background: #f7f7f7; border-bottom: 1px solid #dddddd;}
		.white_talbe_01 tbody tr td {padding: 10px 20px; border-bottom: 1px solid #dddddd;}
	</style>
<div class="white_talbe_01">
<table>
	<tr>
		<th>카테고리 유형</th>
		<td> <select name="bbs_category">
			<option selected="selected">홈짐</option>
			<option>코치 매칭</option>
			<option>결제</option>
			<option>기타</option>
		</select></td>
	</tr>
	<input type="hidden" name="bbs_mem_id" value="${sessionScope.sid}">
	<input type="hidden" name="bbs_mem_id" value="${sessionScope.coachid}">
	<tr>
		<th>제목</th>
		<td><input type="text" name="bbs_subject"></td>
	</tr>
	<hr>
	<tr>
		<td colspan="2">
			<textarea rows="6" cols="80" name="bbs_content" placeholder="내용을 입력해주세요" style="height: 300px;"></textarea>
		</td>
	</tr>
	<tr>
		<th>파일첨부</th>
		<td><input type="file" name="upload" value="파일첨부"></td>
	</tr>
</table>
</div>
<div class="table_list_bottom">
			<div class="btn_left_box">
				<a href="csList.do" class="btn1 c2">목록보기</a>
			</div>
			<div class="btn_right_box">
				<input type="submit" value="글쓰기" class="btn1 c1">
				<input type="reset" value="다시작성" class="btn1 c1">
			</div>
		</div>
</form>
</div>
</div>

<%@include file="../_include/footer.jsp" %>