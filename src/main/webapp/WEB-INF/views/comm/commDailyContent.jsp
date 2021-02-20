<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function bbsReWrite(re_idx,ex_idx){
	re_content=document.getElementById("re_content").value;
	re_id=document.getElementById("re_id").value;
	url="commDailyReWrite.do?re_idx="+re_idx+"&ex_idx="+ex_idx+"&re_content="+re_content+"&re_id="+re_id;
	location.href=url;
}
function bbsRereWrite(re_group,re_bbs_idx,index){
	re_content=document.getElementById("rere_content"+index).value;
	re_id=document.getElementById("re_id").value;
	url="commDailyReReWrite.do?ex_idx="+re_bbs_idx+"&re_group="+re_group+"&re_bbs_idx="+re_bbs_idx+"&re_content="+re_content+"&re_id="+re_id;
	location.href=url;
}
</script>
</head>
<body>
	<%@include file="../header2.jsp"%>
	
	<style>
		.community_wrap {min-height: calc(100vh - 92px);}
		.community_wrap .community_sidebar {flex: 0 0 250px; background-color: #ccc;}
		.community_wrap .community_sidebar ul {padding: 0; margin:  0;}
		.community_wrap .community_sidebar ul li.sidemenuli a {display: block; color: #000; padding: 8px 15px 8px 15px; font-weight: bold;}
		.community_wrap .community_sidebar ul li.sidemenuli a.comm {background-color: tomato; color: #fff;}
		.community_wrap .community_sidebar ul li.sidemenuli a:hover:not(.comm) {background-color: #333; color: #fff;}
		
		.community_wrap .community_contents {flex: 1 1 auto; padding: 30px;}
		
		.community_wrap .com_top {background-color: #46a4da; height: 170px; padding: 15px;}
		.community_wrap .com_top h1{color: white;}
		.community_wrap .com_top h3{color: white;}
		.community_wrap .com_top .comm_menu{float: right;}
		.community_wrap .com_top .comm_menu span{display: -webkit-inline-box;}
	
		.community_daily_summary {width: 100%; border-top: 1px solid #dddddd;}
		.community_daily_summary tbody tr th {background: #f7f7f7; padding: 10px; border-bottom: 1px solid #dddddd;}
		.community_daily_summary tbody tr td {padding: 10px; border-bottom: 1px solid #dddddd;}
		
		.community_contents .view_body {padding: 30px 20px 50px;}
		
		.community_wrap .view_navi {border-top: 1px solid #dddddd;}
        .community_wrap .view_navi dl {position: relative; padding: 0 0 0 160px; margin: 0;}
        .community_wrap .view_navi dt {position: absolute; top: 0; left: 0; width: 160px; padding: 0 20px; line-height: 40px; background: #f7f7f7;  border-bottom: 1px solid #dddddd;}
        .community_wrap .view_navi dd {margin: 0; padding: 0 20px; line-height: 40px; border-bottom: 1px solid #dddddd;}
	</style>

	<%-- <c:if test="${mem_name eq '로그인필요' }">
		<script>
			window.alert('로그인이 필요합니다.');
			loacation.href="index.do";
		</script>
	</c:if> --%>
	<div class="community_wrap">
		<div class="com_top">
			<h1>일일 운동 게시판</h1>
			<h3>코치 : ${coach_name} 코치</h3>
			<div class="comm_menu"><span><h3><a href="commMain.do?com_idx=${com_idx }">커뮤니티 메인</a></h3>&nbsp;<h3>|</h3>&nbsp;<h3><a href="commDailyList.do">일일 운동 게시판</a></h3></span></div>
		</div>
		<div class="container " style="margin-top: 5px;">
			
		

		<div class="community_contents">
			<h1>일일 운동 게시판 글보기</h1>
			<table class="community_daily_summary">
				<colgroup>
					<col style="width: 10%;" />
					<col style="width: 50%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${dto.ex_subject}(${dto.ex_recnt})</td>
						<th>조회수</th>
						<td>${dto.ex_readnum}</td>
						<th>작성날짜</th>
						<td>${dto.ex_writedate}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${dto.ex_id}</td>
					
					<%-- <tr>
						<th>파일</th>
						<c:forEach var="filelist" items="${filelist}">
						<td><img src="/zipcok/upload/comm/${filelist.bfile_rename}"></td>
						</c:forEach>
					</tr> --%>	
					
						<th>오늘의 운동</th>
						<td>${dto.ex_name}</td>
						<th>오늘의 <br>소비 칼로리</th>
						<td>${dto.ex_cal}cal</td>
					</tr>
				</tbody>
			</table>
			<div class="view_body">
				<c:forEach var="filelist" items="${filelist}" varStatus="i">
				<div>
					<c:if test="${filelist.bfile_type eq 'image/png' or filelist.bfile_type eq 'image/jpeg'}">
						<img src="/zipcok/upload/comm/${filelist.bfile_rename}" style="width:60%;">
					</c:if>
					<c:if test="${filelist.bfile_type eq 'video/mp4'}">
						<video src="/zipcok/upload/comm/${filelist.bfile_rename}" controls style="width:80%;"></video>
					</c:if>
				</div>
				</c:forEach>
				<div class="view_content"><textarea style="height: 300px; white-space: pre-line; border: none;" readonly="readonly">${dto.ex_content }</textarea></div>
			</div>
			<c:if test="${!empty filelist}">
			<div id="fileList">
				<ul>
					<li>첨부파일(클릭으로 다운로드)</li>
					<c:forEach var="filelist" items="${filelist}" varStatus="i">
					<li><a href="/zipcok/upload/comm/${filelist.bfile_rename}" download>${filelist.bfile_origin}</a></li>
					</c:forEach>
				</ul>
			</div>
			</c:if>
			
			<style>
				.reply_wrap {margin-top: 50px;}
				.reply_wrap .reply_count {margin-bottom: 30px;}
				.reply_wrap .reply_area {position: relative; padding: 15px; border-bottom: 1px solid #cccccc;}
				.reply_wrap .reply_area:first-child {border
				-top: 1px solid #cccccc;}
				.reply_wrap .reply_item.depth2 {padding-left: 50px; background: url(assets/img/icon/replyarrow.png) 10px 7px no-repeat; background-size: 20px;}
				.reply_wrap .reply_item .reply_writer {font-size: 14px;}
				.reply_wrap .reply_item .reply {margin-top: 10px; font-size: 14px;}
				.reply_wrap .reply_item .reply_btns {margin-top: 10px;}
				.reply_wrap .reply_item .reply_btns button {width: 80px; height: 30px;}
				.reply_wrap .reply_item .reply_btns button.reply_comment {border: 1px solid #333333;}
				.reply_wrap .reply_item .reply_btns button.reply_delete {border: none; background: #e92727; color: #ffffff;}
				.reply_wrap .comment_area {margin-top: 10px; padding-top: 10px; border-top: 1px solid #cccccc;}
				.reply_wrap .comment_area textarea {height: 80px; border: 1px solid #cccccc; margin-bottom: 10px;}
				.reply_wrap .comment_area .reply_confirm {width: 80px; height: 30px; border: 1px solid #333333;}
			</style>
			<!--  댓글 시작 -->
			<hr>
			<div class="reply_wrap">
				<h4 class="reply_count">총 댓글 수 ${dto.ex_recnt}개</h4>
				<form name="replyform" action="commDailyReWrite.do">
					<c:if test="${empty list}">
						<ul class="reple">
							<li>등록된 댓글이 없습니다.</li>
						</ul>
						<c:set var="re_idx" value="0"></c:set>
						<c:set var="ex_idx" value="${dto.ex_idx}"></c:set>
					</c:if>
					
					<!-- for문 시작 -->
					<c:forEach var="dto2" items="${list}" varStatus="i">
					<div class="reply_area"><!-- for -->
					<c:choose>
						<c:when test="${dto2.re_lev eq '1' }">
							<div class="reply_item"><!-- 1depth 댓글 -->
								<div class="reply_writer">${dto2.re_id}
									<c:choose>
										<c:when test="${mem_name eq coach_name }"> <!-- 코치글일때 -->
											<c:if test="${dto2.re_id eq coach_name}"><!-- 글쓴이가 코치일때 -->
												(코치)
											</c:if>
										</c:when>
										<c:when test="${mem_name ne com_coach_id }"><!-- 일반글일때 -->
											<c:if test="${dto2.re_id eq mem_name}"><!-- 글쓴이일때 -->
												(글쓴이)
											</c:if>
										</c:when>
									</c:choose>
								</div>
								<div class="reply">${dto2.re_content}</div>
								<div class="reply_btns">
									<button type="button" class="reply_comment" onclick="$(this).parents('.reply_item').next().toggle();">답글</button>
									<!-- 작성자와 아이디 일치 확인 -->
										<button type="button" class="reply_delete" onclick="location.href='commDailyReDelete.do?re_lev=${dto2.re_lev}&re_idx=${dto2.re_idx}&re_group=${dto2.re_group}&ex_idx=${dto2.re_bbs_idx}'">삭제</button>
								</div>
							</div>
						</c:when>
						<c:when test="${dto2.re_lev eq '2' }">
							<div class="reply_item depth2"><!-- 2depth 댓글일때 depth2 클래스만 추가 -->
								<div class="reply_writer">${dto2.re_id}
									<c:choose>
										<c:when test="${mem_name eq coach_name }"> <!-- 코치글일때 -->
											<c:if test="${dto2.re_id eq coach_name}"><!-- 글쓴이가 코치일때 -->
												(코치)
											</c:if>
										</c:when>
										<c:when test="${mem_name ne com_coach_id }"><!-- 일반글일때 -->
											<c:if test="${dto2.re_id eq mem_name}"><!-- 글쓴이일때 -->
												(글쓴이)
											</c:if>
										</c:when>
									</c:choose>
								</div>
								<div class="reply">${dto2.re_content}</div>
								<div class="reply_btns">
									<button type="button" class="reply_delete" onclick="location.href='commDailyReDelete.do?re_lev=${dto2.re_lev}&re_idx=${dto2.re_idx}&re_group=${dto2.re_group}&ex_idx=${dto2.re_bbs_idx}'">삭제</button>
								</div>
							</div>
						</c:when>
					</c:choose>
						<div class="comment_area" style="display: none;">
							<textarea placeholder="답글을 입력해주세요." id="rere_content${i.index}" required="required"></textarea>
							<button type="button" class="reply_confirm" onclick="bbsRereWrite(${dto2.re_group},${dto2.re_bbs_idx},${i.index})">작성완료</button>
						</div>
					</div>
					<c:if test="${i.last}">
							<c:set var="re_idx" value="${dto2.re_idx}"></c:set>
							<c:set var="ex_idx" value="${dto.ex_idx}"></c:set>
					</c:if>
					</c:forEach>
					<!-- for문 끝 -->
					<div class="reply_writearea">
					<ul class="replewrite">
						<li><input type="hidden" name="re_id" id="re_id" value="${sessionScope.sname}" readonly>
						<input type="text" name="re_content" id="re_content" required="required"></li>
						<li><input type="button" value="댓글달기" class="btn1 c1" onclick="bbsReWrite(${re_idx},${ex_idx})"></li>
					</ul>
					</div>
					<hr>
					
					
					
					<%-- <c:forEach var="dto2" items="${list}" varStatus="i">
						<div class="replediv">
							<div class="replediv1_1">
								<ul class="reple">
									<li id="writer">${dto2.re_id}</li>
									<li id="content">${dto2.re_content}</li>
								</ul>
							</div>
							<div class="replediv1_2">
								<ul class="reple2">
									<li id="delete"><input type="button" value="삭제"
										onclick="location.href='commDailyReDelete.do?re_lev=${dto2.re_lev}&re_idx=${dto2.re_idx}&re_group=${dto2.re_group}&ex_idx=${dto2.re_bbs_idx}'"></li>
									<li id="rereply"><input type="button"
										value="답글" onclick="bbsReReOpen(${dto2.re_idx});"></li>
								</ul>
							</div>
						</div>
						<c:if test="${i.last}">
							<c:set var="re_idx" value="${dto2.re_idx}"></c:set>
							<c:set var="ex_idx" value="${dto.ex_idx}"></c:set>
						</c:if>
						<div class="rereplediv" id="rereple">
							<div class="rereple1">
								<ul class="rereple">
									<li>대댓글</li>
									<li><input type="text" name="re_content" id="rere_content${i.index}"></li>
								</ul>
							</div>
							<div class="rereple2">
								<ul class="rereple2">
									<li><input class="button2" type="button" value="대댓글달기"
										onclick="bbsRereWrite(${dto2.re_group},${dto2.re_bbs_idx},${i.index})"></li>
									<li><input class="button2" type="button" value="취소" onclick="bbsReReClose();"></li>
								</ul>
							</div>
						</div>
					</c:forEach> --%>
					<%-- <ul class="replewrite">
						<li>${sessionScope.sname}</li>
						<li><input type="text" name="re_content" id="re_content"></li>
						<li><input type="button" value="댓글달기" onclick="bbsReWrite(${re_idx},${ex_idx})"></li>
					</ul> --%>
				</form>
			</div>
			<!-- 댓글 종료 -->
			<div class="contentbtn" style="margin-bottom: 80px;">
				<ul style="display: inline-flex; float: right;">
					<li><input type="button" value="삭제" class="btn1 c1" onclick="location.href='commDailyDelete.do?ex_idx=${dto.ex_idx}&coach_id=${sessionScope.com_coach_id}'">
					<li>&nbsp;&nbsp;</li>
					
					<c:if test="${sid==dto2.re_id }"></c:if>
					<li><input type="button" value="수정" class="btn1 c1" onclick="location.href='commDailyUpdate.do?ex_idx=${dto.ex_idx}'">
					<li>&nbsp;&nbsp;</li>
					<li><input type="button" value="목록보기" class="btn1 c1" onclick="location.href='commDailyList.do'">
					<li>&nbsp;&nbsp;</li>
					<li><input type="button" value="운동하기" class="btn1 c1" onclick="location.href='commDailyWrite.do'">
				</ul>
			</div>
			<div class="view_navi">
	            <dl>
	               <dt>이전 글</dt>
	            <c:choose>
	               <c:when test="${empty prev}">
	                  <dd>이전 글이 없습니다.</dd>
	               </c:when>
	               <c:otherwise>
	                  <dd><a href="commDailyContent.do?ex_idx=${prev.ex_idx}">${prev.ex_subject}</a></dd>
	               </c:otherwise>
	            </c:choose>
	            </dl>
	            <dl>
	               <dt>다음 글</dt>
	            <c:choose>
	               <c:when test="${empty next}">
	                  <dd>다음 글이 없습니다.</dd>
	               </c:when>
	               <c:otherwise>
	                  <dd><a href="commDailyContent.do?ex_idx=${next.ex_idx}">${next.ex_subject}</a></dd>
	               </c:otherwise>
	            </c:choose>
	            </dl>
         	</div> 
		</div>
	</div>
	</div>
</body> 
<%@include file="../_include/footer.jsp" %>
</html>