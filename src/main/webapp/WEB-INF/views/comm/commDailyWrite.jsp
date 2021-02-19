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
		
		.community_wrap #contents {padding:0 0 0;}
		.community_wrap #contents .com_top {background-color: #46a4da; height: 170px; padding: 15px;}
		.community_wrap #contents .com_top h1{color: white;}
		.community_wrap #contents .com_top h3{color: white;}
		.community_wrap #contents .com_top .comm_menu{float: right;}
</style>

<div class="community_wrap">

	<div id="contents">
	<div class="com_top">
		<h1><a class="comm" href="commMain.do?com_idx=${com_idx }">${com_name}</a></h1>
		<h3>코치 : ${coach_name} 코치</h3>
		<div class="comm_menu"><h3><a href="commDailyList.do">일일 운동 게시판</a></h3></div>
	</div>
		<form name="dailyWrite" action="commDailyWrite.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ex_comm_idx" value="${com_idx}">
		
		<style>
			.white_talbe_01 {border-top: 1px solid #333333;}
			.white_talbe_01 tbody tr th {width: 200px; padding: 10px 20px; background: #f7f7f7; border-bottom: 1px solid #dddddd;}
			.white_talbe_01 tbody tr td {padding: 10px 20px; border-bottom: 1px solid #dddddd;}
		</style>
		<c:set var="dto" value="${recentCnt}" />
		<c:choose>
			<c:when test="${empty dto }">
				<input type="hidden" name="ex_group" value="0">
			</c:when>
			<c:when test="${!empty dto }">
				<input type="hidden" name="ex_group" value="${dto.ex_group}">
			</c:when>
		</c:choose>
		
		<c:set var="ex_id" value="${ex_id}" />
		<div class="white_talbe_01">
				<table>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="2"><input type="text" name="ex_subject" required="required"></td>
						</tr>
						<c:if test="${dto.ex_id ne ex_id and !empty dto}">
						<input  type="hidden" name="ex_id" value="${ex_id}">
							<tr>
								<th>오늘의 운동 :</th>
								<td colspan="2"><input type="text" name="ex_name" value="${dto.ex_name}" readonly></td>
							</tr>
							<tr>
								<th>오늘의 소비 칼로리 :</th>
								<td colspan="2"><input type="text" name="ex_cal" value="${dto.ex_cal}" readonly><input type="button" value="수정"></td>
							</tr>
						</c:if>
						<c:if test="${dto.ex_id eq ex_id or empty dto}">
						<input  type="hidden" name="ex_id" value="${ex_id}">
							<tr>
								<th>오늘의 운동 :</th>
								<td colspan="2"><input type="text" name="ex_name" required="required"></td>
							</tr>
							<tr>
								<th>오늘의 소비 칼로리 :</th>
								<td colspan="2"><input type="text" name="ex_cal" required="required"><input type="button" value="수정"></td>
							</tr>
						</c:if>
						<tr>
							<td colspan="3"><textarea cols="120" rows="10" name="ex_content" placeholder="내용을 입력해주세요" style="height: 300px; white-space: pre-line;" required="required"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="writebtn" style="float: right; margin: 10px;">
					<ul style="display: inline-flex; margin: 10px;">
						<li style="float: left;"><input type="reset" value="다시 작성"  class="btn1 c1"></li>
						<li><input type="submit" value="글쓰기"  class="btn1 c1"></li>
					</ul>
				</div>
					<div class="form-group">
						<label>사진등록</label>
					<ul id="fileUl">
						<li>올릴파일:<input type="file" name="upload"></li>
					</ul>
						<div>
							<input type="button" value="파일추가" onclick="plus();">
						</div>
					</div>
		</div>		
		</form>		
	</div>
</div>

<%@include file="../_include/footer.jsp" %>