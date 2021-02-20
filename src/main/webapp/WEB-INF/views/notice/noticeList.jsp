<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>


<!-- 
	서브 페이지 : id="container"로 감쌀 것
	페이지 상단 제목 영역 : class="page_top_visual"
	페이지 컨텐츠 : id="contents"로 감쌀 것
	
	ㄴ id : container
	  ㄴ class : page_top_visual
	  ㄴ id : contents 
 -->

	<div id="container">
		<script>
		function goCategory(){
			var bbs_category=document.getElementById("select").value;
			if(bbs_category=='전체'){
				location.href='noticeList.do';
			}
			if(bbs_category!='전체'){
			location.href='noticeSearchList.do?bbs_category='+bbs_category;
			document.getElementById('select').option.innerHTML=selected;
			}
			
		}
		</script>
		
		<div class="page_top_visual">
			<div class="common_page_title">
				<h2 class="page_title">공지사항</h2>
				<p class="page_text">새로운 소식을 알려드립니다.</p>
			</div>		
		</div>
		
		<div id="contents">
			<form action="noticeWriteView.do">
			<div class="table_list_sorting">
				<dl>
					<dt>카테고리 유형</dt>
					<dd>
						<select onchange="javascript:goCategory()" id="select" style="width: 200px;">
							<option <c:if test="${category=='전체'}">selected="selected"</c:if> >전체</option>
							<option <c:if test="${category=='홈짐'}">selected="selected"</c:if>  >홈짐</option>
							<option <c:if test="${category=='코치 매칭'}">selected="selected"</c:if> >코치 매칭</option>
							<option <c:if test="${category=='결제'}">selected="selected"</c:if>  >결제</option>
							<option <c:if test="${category=='기타'}">selected="selected"</c:if>>기타</option>
						</select>
					</dd>
				</dl>
			</div>
		
			<div class="table_list_01">
				<table>
					<colgroup>
						<col style="width: 100px;">
						<col style="width: auto;">
						<col style="width: 100px;">
						<col style="width: 100px;">
						<col style="width: 100px;">
					</colgroup>
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}">
							<tr>
								<th colspan="5" style="text-align : center;">등록된 공지사항이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.bbs_idx }</td>
								<c:url var="contentUrl" value="noticeContent.do">
					            	<c:param name="bbs_idx">${dto.bbs_idx}</c:param>
					        	</c:url>
								<td><a href="${contentUrl}">[${dto.bbs_category}]${dto.bbs_subject}</a></td>
								<td>${dto.bbs_mem_id}</td>
								<td>${dto.bbs_readnum}</td>
								<td>${dto.bbs_writedate}</td>
							</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			
			<div class="table_list_bottom">
				<c:if test="${!empty list }">
					<div class="pagination">${pageStr}</div>
				</c:if>
					<c:if test="${login.mem_id=='admin'}">
						<div class="btn_right_box">
							<input type="submit" value="글쓰기" class="btn1 c1">				
						</div>
					</c:if>
			</div>
			</form>
		</div>
    </div> <!-- id : container -->

<%@include file="../_include/footer.jsp" %>


