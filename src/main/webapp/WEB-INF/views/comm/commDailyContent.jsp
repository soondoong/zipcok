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
	url="commDailyReWrite.do?re_idx="+re_idx+"&ex_idx="+ex_idx+"&re_content="+re_content;
	location.href=url;
}
function bbsRereWrite(re_group,re_bbs_idx,index){
	re_content=document.getElementById("rere_content"+index).value;
	url="commDailyReReWrite.do?ex_idx="+re_bbs_idx+"&re_group="+re_group+"&re_bbs_idx="+re_bbs_idx+"&re_content="+re_content;
	location.href=url;
}
/* function bbsReReOpen(re_idx){
	url=location.href;
	url+="&re_idx="+re_idx;
	location.href=url;
	var tr1=document.getElementById("rereple");
	tr1.style.display="table-row";
}
function bbsReReClose(){
	var tr1=document.getElementById("rereple");
	tr1.style.display="none";
} */
</script>
<link rel="stylesheet" type="text/css" href="css/comm/commDailyContentLayout.css">
</head>
<body>
	<%@include file="../header2.jsp"%>
	
	<style>
		.community_wrap {display: flex; min-height: calc(100vh - 92px);}
		.community_wrap .community_sidebar {flex: 0 0 250px; background-color: #ccc;}
		.community_wrap .community_sidebar ul {padding: 0; margin:  0;}
		.community_wrap .community_sidebar ul li.sidemenuli a {display: block; color: #000; padding: 8px 15px 8px 15px; font-weight: bold;}
		.community_wrap .community_sidebar ul li.sidemenuli a.comm {background-color: tomato; color: #fff;}
		.community_wrap .community_sidebar ul li.sidemenuli a:hover:not(.comm) {background-color: #333; color: #fff;}
		
		.community_wrap .community_contents {flex: 1 1 auto; padding: 30px;}
		
		.community_daily_summary {width: 100%; border-top: 1px solid #dddddd;}
		.community_daily_summary tbody tr th {background: #f7f7f7; padding: 10px; border-bottom: 1px solid #dddddd;}
		.community_daily_summary tbody tr td {padding: 10px; border-bottom: 1px solid #dddddd;}
	</style>

	<div class="community_wrap">
		<%@include file="./commSideMenu.jsp"%>

		<div class="community_contents">
			<h1>일일 운동 게시판 글보기</h1>
			<table class="community_daily_summary">
				<colgroup>
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: auto;" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${dto.ex_subject}(${dto.ex_recnt})</td>
						<th>조회수</th>
						<td>${dto.ex_readnum}</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${dto.ex_writedate}</td>
						<th>작성자</th>
						<td>${dto.ex_id}</td>
					</tr>
					<%-- <tr>
						<th>파일</th>
						<c:forEach var="filelist" items="${filelist}">
						<td><img src="/zipcok/upload/comm/${filelist.bfile_rename}"></td>
						</c:forEach>
					</tr> --%>	
					<tr>
						<th >오늘의 운동</th>
						<td colspan="3">${dto.ex_name}</td>
					</tr>
					<tr>
						<th>오늘의 소비 칼로리</th>
						<td colspan="3">${dto.ex_cal}</td>
					</tr>
					<tr>
						<td colspan="4">${dto.ex_content }</td>
					</tr>
				</tbody>
			</table>

			<style>
				.reply_wrap {margin-top: 50px;}
				.reply_wrap .reply_count {margin-bottom: 30px;}
				.reply_wrap .reply_area {position: relative; padding: 15px; border-bottom: 1px solid #cccccc;}
				.reply_wrap .reply_area:first-child {border-top: 1px solid #cccccc;}
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
					<div class="reply_area"><!-- for -->
						<div class="reply_item"><!-- 1depth 댓글 -->
							<div class="reply_writer">홍승표</div>
							<div class="reply">댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</div>
							<div class="reply_btns">
								<button type="button" class="reply_comment" onclick="$(this).parents('.reply_item').next().toggle();">답글</button>
								<button type="button" class="reply_delete">삭제</button>
							</div>
						</div>
						<div class="comment_area" style="display: none;">
							<textarea placeholder="답글을 입력해주세요."></textarea>
							<button type="button" class="reply_confirm">작성완료</button>
						</div>
					</div>
					<div class="reply_area"><!-- for -->
						<div class="reply_item depth2"><!-- 2depth 댓글일때 depth2 클래스만 추가 -->
							<div class="reply_writer">홍승표</div>
							<div class="reply">대댓글입니다. 대댓글입니다. 대댓글입니다. 대댓글입니다. 대댓글입니다. 대댓글입니다. 대댓글입니다.</div>
							<div class="reply_btns">
								<button type="button" class="reply_delete">삭제</button>
							</div>
						</div>
					</div>
					<!-- for문 끝 -->
					
					
					
					
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
			
			<table>
				<tr>
					<td>이전글</td>
					<td>위화살표</td>
					<td colspan="6"><a href="#">이전글</a></td>
				</tr>
				<tr>
					<td>다음글</td>
					<td>아래화살표</td>
					<td colspan="6"><a href="#">다음글</a></td>
				</tr>
				<tr>
					<td><input type="button" value="삭제"
						onclick="location.href='commDailyDelete.do?ex_idx=${dto.ex_idx}'"></td>
					<td><input type="button" value="수정"
						onclick="location.href='commDailyUpdate.do?ex_idx=${dto.ex_idx}'"></td>
					<td><input type="button" value="목록보기"
						onclick="location.href='commDailyList.do'"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>