<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>

<div id="container">
	<div class="page_top_visual">
		<div class="common_page_title">
			<h2 class="page_title">공지사항</h2>
			<p class="page_text">자주 묻는 질문과 교객센터입니다.</p>
		</div>
	</div>
	<div id="contents">
		<form action="noticeWrite.do" method="post" enctype="multipart/form-data">
		
		<style>
			.white_talbe_01 {border-top: 1px solid #333333;}
			.white_talbe_01 tbody tr th {width: 200px; padding: 10px 20px; background: #f7f7f7; border-bottom: 1px solid #dddddd;}
			.white_talbe_01 tbody tr td {padding: 10px 20px; border-bottom: 1px solid #dddddd;}
		</style>
		
		<div class="white_talbe_01">
			<table>
				<tbody>
					<tr>
						<th>카테고리 유형</th>
						<td>
							<select name="bbs_category" style="width: 250px;">
								<option selected="selected">홈짐</option>
								<option>코치 매칭</option>
								<option>결제</option>
								<option>기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="bbs_subject"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="6" cols="80" name="bbs_content" placeholder="내용을 입력해주세요" style="height: 300px;"></textarea></td>
					</tr>
				</tbody>
			</table>
				<div class="form-group">
					<label>사진등록</label>
					<ul id="fileUl">
						<li>올릴파일:<input type="file" name="upload" accept="image/gif, image/jpeg, image/png"></li>
					</ul>
					<div>
						<input type="button" value="파일추가" class="btn1 c1"
							onclick="plus();">
					</div>
				</div>
<script>
	//사진파일계속추가
	function plus(){
		var wrapul=document.getElementById("fileUl");	
		var newli=document.createElement("li");
		newli.innerHTML='올릴파일:<input type="file" name="upload" accept="image/gif, image/jpeg, image/png">';
		wrapul.appendChild(newli);
		
	}
</script>
		</div>
		<div class="table_list_bottom">
			<div class="btn_left_box">
				<a href="noticeList.do" class="btn1 c2">목록보기</a>
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