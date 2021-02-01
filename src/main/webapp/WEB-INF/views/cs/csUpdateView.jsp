<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../header2.jsp" %>

<c:set var="dto" value="${dto}"></c:set>
<script>
	function deletefile() {
		window.alert(document.getElementById("csImg"));
	}
</script>
<div id="container">
	<div class="page_top_visual">
		<div class="common_page_title">
			<h2 class="page_title">고객센터</h2>
			<p class="page_text">수정할 부분을 다시 작성해 주세요</p>
		</div>
	</div>
	<div id="contents">
		<form action="csUpdate.do" method="post"
			enctype="multipart/form-data">
<style>
.white_talbe_01 {
	border-top: 1px solid #333333;
}

.white_talbe_01 tbody tr th {
	width: 200px;
	padding: 10px 20px;
	background: #f7f7f7;
	border-bottom: 1px solid #dddddd;
}

.white_talbe_01 tbody tr td {
	padding: 10px 20px;
	border-bottom: 1px solid #dddddd;
}
</style>
			<table>
				<tr>
					<th>카테고리 유형</th>
					<td><select name="bbs_category">
							<option>홈짐</option>
							<option>코치 매칭</option>
							<option>결제</option>
							<option>기타</option>
					</select></td>
				</tr>
				<input type="hidden" name="bbs_idx" value="${dto.bbs_idx}">
				<tr>
					<th>제목</th>

					<td><input type="text" name="bbs_subject"
						value="${dto.bbs_subject}"></td>
				</tr>
					<hr>
				<c:if test="${empty list}">
					<tr>
						<th colspan="3">등록된 사진이 없습니다.</th>
					</tr>
				</c:if>
				<c:forEach var="List" items="${list}">

					<tr>
						<td colspan="3" class="imgtd"><img id="csImg"
							alt="${List.zfile_upload }"
							src="/zipcok/upload/cs/${List.zfile_upload}" width="800px;"
							height="500px;"></td>
					</tr>

				</c:forEach>
				<tr>
					<td colspan="3"><textarea rows="6" cols="70"
							name="bbs_content" placeholder="내용을 입력해주세요"
							style="width: 800px; height: 200px;">${dto.bbs_content } </textarea></td>
				</tr>
				<tr>
					<td><input type="file" name="upload" value="사진수정"></td>
					<td><input type="button" value="사진삭제"
						onclick="javascript:deletefile()"></td>
					<td></td>
				</tr>
			</table>
			<div class="table_list_bottom">
				<div class="btn_left_box">
					<a href="csList.do" class="btn1 c2">목록보기</a>
				</div>
				<div class="btn_right_box">
					<input type="submit" value="수정하기" class="btn1 c1"> <input
						type="reset" value="다시작성" class="btn1 c1">
				</div>
			</div>
		</form>
	</div>
</div>



<%@include file="../_include/footer.jsp"%>