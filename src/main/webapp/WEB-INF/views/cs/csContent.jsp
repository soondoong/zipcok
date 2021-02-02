<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../header2.jsp" %>

<c:set var="dto" value="${dto}"/>
<c:choose>
	<c:when test="${empty sessionScope.sid && empty sessionScope.coachId }">
		<script>
			alert('로그인 후 이용가능 합니다!');
			location.href = 'csList.do';
		</script>
	</c:when>
	
</c:choose>

   <c:if  test="${login.mem_id!=dto.bbs_mem_id}">
   <script>
   window.alert('본인이 작성한 글만 볼 수 있습니다.');
   location.href = 'csList.do';
   </script>
   </c:if>
   <div id="container">
	<div class="page_top_visual">
		<div class="common_page_title">
			<h2 class="page_title">고객센터</h2>
			<p class="page_text">자주하는질문과 고객센터입니다</p>
		</div>		
	</div>
	<div id="contents">
		<input type="hidden" name="bbs_idx" value="${dto.bbs_idx}">
		<style>
			.content_view_wrap {}
			.content_view_wrap .view_head {padding: 20px; border-top: 1px solid #333333; border-bottom: 1px solid #dddddd;}
			.content_view_wrap .view_head .view_title {font-weight: 700; font-size: 24px;}
			.content_view_wrap .view_info {overflow: hidden;}
			.content_view_wrap .view_info span {float: left; font-size: 12px; color: #999999;}
			.content_view_wrap .view_info span:not(:first-child) {margin-left: 10px;}
			.content_view_wrap .view_body {padding: 30px 20px 50px;}
			.content_view_wrap .view_navi {border-top: 1px solid #dddddd;}
			.content_view_wrap .view_navi dl {position: relative; padding: 0 0 0 160px; margin: 0;}
			.content_view_wrap .view_navi dt {position: absolute; top: 0; left: 0; width: 160px; padding: 0 20px; line-height: 40px; background: #f7f7f7;  border-bottom: 1px solid #dddddd;}
			.content_view_wrap .view_navi dd {margin: 0; padding: 0 20px; line-height: 40px; border-bottom: 1px solid #dddddd;}
		</style>
		<article class="content_view_wrap">
			<div class="view_head">
				<h1 class="view_title">${dto.bbs_subject}</h1>
				<div class="view_info">
					<span>조회수 : ${dto.bbs_readnum}</span>
					<span>작성일 : ${dto.bbs_writedate}</span>
				</div>
			</div>
			<div class="view_body">
				<c:forEach var="List" items="${list}">
				<img alt="${List.zfile_upload }" src="/zipcok/upload/cs/${List.zfile_upload}">
				</c:forEach>
				<div class="view_content">${dto.bbs_content}</div>
			</div>
		
		</article>
		
		<div class="table_list_bottom">
			<div class="btn_left_box">
				<a href="csList.do" class="btn1 c2">목록보기</a>
			</div>
			<div class="btn_right_box">
				<a href="csDelete.do?bbs_idx=${dto.bbs_idx}" class="btn1 c1">삭제하기</a>
				<a href="csUpdateView.do?bbs_idx=${dto.bbs_idx}" class="btn1 c1">수정하기</a>
			</div>
		</div>
	</div>
</div>


<%@include file="../_include/footer.jsp" %>