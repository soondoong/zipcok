<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>

<link rel="stylesheet" type="text/css" href="css/comm/commDailyWriteLayout.css">

<script>
	//사진파일계속추가
	function plus(){
		var wrapul=document.getElementById("fileUl");	
		var newli=document.createElement("li");
		newli.innerHTML='올릴파일:<input type="file" name="upload">';
		wrapul.appendChild(newli);
		
	}
</script>
<%@include file="../header2.jsp"%>

<style>
		.community_wrap {display: flex; min-height: calc(100vh - 92px);}
		.community_wrap .community_sidebar {flex: 0 0 250px; background-color: #ccc;}
		.community_wrap .community_sidebar ul {padding: 0; margin:  0;}
		.community_wrap .community_sidebar ul li.sidemenuli a {display: block; color: #000; padding: 8px 15px 8px 15px; font-weight: bold;}
		.community_wrap .community_sidebar ul li.sidemenuli a.comm {background-color: tomato; color: #fff;}
		.community_wrap .community_sidebar ul li.sidemenuli a:hover:not(.comm) {background-color: #333; color: #fff;}
</style>

<div class="community_wrap">
	<%@include file="./commSideMenu.jsp"%>
	<!-- <div id="container" style="z-index: -1">
		<div class="page_top_visual">
			<div class="common_page_title">
				<h2 class="page_title">일일 운동 게시판</h2>
				<p class="page_text">오늘의 운동을 기록하세요.</p>
			</div>
		</div>
	</div> -->
	<div id="contents">
		<form name="dailyWrite" action="commDailyWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ex_comm_idx" value="${com_idx}">
		<style>
			.white_talbe_01 {border-top: 1px solid #333333;}
			.white_talbe_01 tbody tr th {width: 200px; padding: 10px 20px; background: #f7f7f7; border-bottom: 1px solid #dddddd;}
			.white_talbe_01 tbody tr td {padding: 10px 20px; border-bottom: 1px solid #dddddd;}
		</style>
		
		<div class="white_talbe_01">
				<table>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="2"><input type="text" name="ex_subject"></td>
						</tr>
						<tr>
							<th>오늘의 운동 :</th>
							<td colspan="2"><input type="text" name="ex_name"></td>
						</tr>
						<tr>
							<th>오늘의 소비 칼로리 :</th>
							<td colspan="2"><input type="text" name="ex_cal"><input type="button" value="수정"></td>
						</tr>
						<tr>
							<td colspan="3"><textarea cols="120" rows="10" name="ex_content" placeholder="내용을 입력해주세요" style="height: 300px; white-space: pre-line;"></textarea></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: right"><input type="reset" value="처음부터 쓰기"><input type="submit" value="글쓰기"></td>
						</tr>
					</tbody>
				</table>
					<div class="form-group">
						<label>사진등록</label>
					<ul id="fileUl">
						<li>올릴파일:<input type="file" name="upload"></li>
					</ul>
						<div>
							<input type="button" value="파일추가" class="btn1 c1" onclick="plus();">
						</div>
					</div>
		</div>		
		</form>		
	</div>
</div>
	
<%@include file="../_include/footer.jsp" %>