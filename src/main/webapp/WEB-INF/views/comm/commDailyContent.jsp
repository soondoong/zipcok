<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
function bbsReReOpen(re_idx){
	url=location.href;
	url+="&re_idx="+re_idx;
	location.href=url;
	var tr1=document.getElementById("reple");
	tr1.style.display="table-row";
}
function bbsReReClose(){
	var tr1=document.getElementById("reple");
	tr1.style.display="none";
}
</script>
</head>
<body>
<%@include file="../header2.jsp" %>
<%@include file="./commSideMenu.jsp" %>
<h1>일일 운동 게시판 글보기</h1>
<table border="1" cellspacing="0" width="550">
		<tr>
			<th>제목</th>
			<td>${dto.ex_subject}(${dto.ex_recnt})</td>
			<th>조회수</th>
			<td>${dto.ex_readnum}</td>
			<th>작성날짜</th>
			<td>${dto.ex_writedate}</td>
			<th>작성자</th>
			<td>${dto.ex_id}</td>
		</tr>
		<tr>
			<th>오늘의 운동</th>
			<td colspan="7">${dto.ex_name}</td>
		</tr>
		<tr>
			<th>오늘의 소비 칼로리</th>
			<td colspan="7">${dto.ex_cal}</td>
		</tr>
		<tr height="250">
			<td colspan="8" align="left" valign="top">${dto.ex_content }</td>
		</tr>
	</table>
	<form name="replyform" action="commDailyReWrite.do">
		<table border="1">
			<tr>
				<td>총 댓글 수</td>
				<td>${dto.ex_recnt}</td>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="8" align="center">
						등록된 댓글이 없습니다.
					</td>
				</tr>
				<c:set var="re_idx" value="0"></c:set>
				<c:set var="ex_idx" value="${dto.ex_idx}"></c:set>
			</c:if>
			<c:forEach var="dto2" items="${list}" varStatus="i">
			<tr>
				<td>${dto2.re_id}</td>
				<td colspan="6" align="center">${dto2.re_content}</td>
				<td><input type="button" value="삭제" onclick="location.href='commDailyReDelete.do?re_lev=${dto2.re_lev}&re_idx=${dto2.re_idx}&re_group=${dto2.re_group}&ex_idx=${dto2.re_bbs_idx}'"></td>
			</tr>
			<c:if test="${i.last}">
			<c:set var="re_idx" value="${dto2.re_idx}"></c:set>
			<c:set var="ex_idx" value="${dto.ex_idx}"></c:set>
			</c:if>
			<tr>
				<td>대댓글</td>
				<td><input type="text" name="re_content" id="rere_content${i.index}"></td>
				<td><input type="button" value="대댓글달기" onclick="bbsRereWrite(${dto2.re_group},${dto2.re_bbs_idx},${i.index})"></td>
			</tr>
			</c:forEach>
			<tr>
				<td>${sessionScope.sname}</td>
				<td colspan="6"><input type="text" name="re_content" id="re_content"></td>
				<td><input type="button" value="댓글달기" onclick="bbsReWrite(${re_idx},${ex_idx})"></td>
			</tr>
			</table>
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
				<td><input type="button" value="삭제" onclick="location.href='commDailyDelete.do?ex_idx=${dto.ex_idx}'"></td>
				<td><input type="button" value="수정" onclick="location.href='commDailyUpdate.do?ex_idx=${dto.ex_idx}'"></td>
				<td><input type="button" value="목록보기" onclick="location.href='commDailyList.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>