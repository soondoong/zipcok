<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>

<c:choose>
	<c:when test="${empty sessionScope.sid && empty sessionScope.coachId }">
		<script>
			alert('로그인 후 이용가능 합니다!');
			location.href = 'csList.do';
		</script>
	</c:when>
</c:choose>
<div class="container">
	<div class="page_top_visual">
		<div class="common_page_title">
			<h2 class="page_title">고객센터</h2>
			<p class="page_text">자주 묻는 질문과 교객센터입니다.</p>
		</div>
	</div>
<div class="contents">
<form action="csWrite.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bbs_mem_id" value="${login.mem_id}">
	<!-- <input type="hidden" name="bbs_mem_id" value="${sessionScope.coachid}"> -->

	<style>
		.white_talbe_01 {border-top: 1px solid #333333;}
		.white_talbe_01 tbody tr th {width: 200px; padding: 10px 20px; background: #f7f7f7; border-bottom: 1px solid #dddddd;}
		.white_talbe_01 tbody tr td {padding: 10px 20px; border-bottom: 1px solid #dddddd;}
		.autosize { min-height: 50px;}
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

	<tr>
		<th>제목</th>
		<td><input type="text" name="bbs_subject" required="required"></td>
	</tr>
	<hr>
	<tr>
		<td colspan="2">
			<textarea class="autosize" onkeydown="resize(this)" required="required" onkeyup="resize(this)" rows="6" cols="50" name="bbs_content" placeholder="내용을 입력해주세요" style="height: 300px;"></textarea>
		</td>
	</tr>
	
</table>
<div class="form-group">
		<label>사진등록</label>
		<ul id="fileUl">
			<li>올릴파일:<input type="file"  name="upload"></li>
		</ul>
		<div><input type="button" value="파일추가" class="btn1 c1" onclick="plus();"></div>
</div>
<script>
	//사진파일계속추가
	function plus(){
		var wrapul=document.getElementById("fileUl");	
		var newli=document.createElement("li");
		newli.innerHTML='올릴파일:<input type="file" name="upload">';
		wrapul.appendChild(newli);
		
	}
	function resize(obj) {
		   obj.style.height = "1px";
		   obj.style.height = (12+obj.scrollHeight)+"px";
	}
</script>
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