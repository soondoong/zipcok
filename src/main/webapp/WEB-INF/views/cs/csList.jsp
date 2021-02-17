<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>

<c:set var="dto" value="${dto}"></c:set>

<div id="container">
	<div class="page_top_visual">
		<div class="common_page_title">
			<h2 class="page_title">고객센터</h2>
			<p class="page_text">자주 묻는 질문과 고객센터입니다.</p>
		</div>
	</div>
	<div id="contents">
		<style>
			.tab_style_01 {}
			.tab_style_01 ul {display: flex; border-bottom: 2px solid #006be0;}
			.tab_style_01 li {flex: 1 1 auto;}
			.tab_style_01 li button {display: block; width: 100%; background: #f7f7f7; line-height: 40px; text-align: center; border: none;}
			.tab_style_01 li.on button {background: #006be0; color: #ffffff;}
		</style>
		<div id="toggle_tab" class="tab_style_01 mb50">
			<ul>
				<li class="on"><button type="button">자주묻는질문</button></li>
				<li><button type="button">고객센터</button></li>
			</ul>
		</div>
	
		<div id="toggle_contents">
			<div>
				<!-- 자주묻는질문 -->
				<h2 class="mb30">자주묻는질문</h2>
				<style>
					.qna_list {border-top: 1px solid #cccccc;}
					.qna_list li {}
					.qna_list li .q_box {border-bottom: 1px solid #cccccc;}
					.qna_list li .q_box button {display: block; width: 100%; padding: 15px; background: url(assets/img/icon/arrow-down.svg) right 15px center no-repeat; background-size: 10px auto; text-align: left; transition: all 200ms; border: none;}
					.qna_list li .q_box button:hover {background-color: #f7f7f7;}
					.qna_list li .a_box {display: none; padding: 15px; border-bottom: 1px solid #cccccc;}
					.qna_list li .a_box p {margin-bottom: 0;}
					.qna_list li.on .a_box {display: block;}
				</style>
				<ul id="qna_list" class="qna_list">
					<li>
						<div class="q_box">
							<button type="button">어떤 클래스가 준비되어 있나요?</button>
						</div>
						<div class="a_box">
							<p>하루홈트는 라이브 운동 플랫폼 입니다. 명상/요가/필라테스/피트니스 등 다양한 운동 컨텐츠를 선보일 예정이에요 🤸&zwj;♀️ 열정적인 트레이너 그리고 다양한 멤버들을 만나보세요.</p>
						</div>
					</li>
					<li>
						<div class="q_box">
							<button type="button">어떤 클래스가 준비되어 있나요?</button>
						</div>
						<div class="a_box">
							<p>하루홈트는 라이브 운동 플랫폼 입니다. 명상/요가/필라테스/피트니스 등 다양한 운동 컨텐츠를 선보일 예정이에요 🤸&zwj;♀️ 열정적인 트레이너 그리고 다양한 멤버들을 만나보세요.</p>
						</div>
					</li>
					<li>
						<div class="q_box">
							<button type="button">어떤 클래스가 준비되어 있나요?</button>
						</div>
						<div class="a_box">
							<p>하루홈트는 라이브 운동 플랫폼 입니다. 명상/요가/필라테스/피트니스 등 다양한 운동 컨텐츠를 선보일 예정이에요 🤸&zwj;♀️ 열정적인 트레이너 그리고 다양한 멤버들을 만나보세요.</p>
						</div>
					</li>
					<li>
						<div class="q_box">
							<button type="button">어떤 클래스가 준비되어 있나요?</button>
						</div>
						<div class="a_box">
							<p>하루홈트는 라이브 운동 플랫폼 입니다. 명상/요가/필라테스/피트니스 등 다양한 운동 컨텐츠를 선보일 예정이에요 🤸&zwj;♀️ 열정적인 트레이너 그리고 다양한 멤버들을 만나보세요.</p>
						</div>
					</li>
				</ul>
				<script>
					$('#qna_list button').on('click', function() {
						$(this).parents('li').toggleClass('on');
					})
				</script>
			</div>

			<div style="display: none;">
				<!-- 고객센터 -->
				<form action="csWriteView.do">
		
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
								<th>id</th>
								<th>조회수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<th colspan="5">등록된 문의가 없습니다.</th>
								</tr>
							</c:if>
							<c:if test="${!empty list }">
								<c:forEach var="dto" items="${list}">
									<tr>
										<td>${dto.bbs_idx }</td>
										<c:url var="contentUrl" value="csContent.do">
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
					<div class="pagination">${pageStr}</div>
					<c:if test="${login.mem_id!='admin'}">
					<div class="btn_right_box">
						<input type="submit" value="1:1 문의하기" class="btn1 c1">				
					</div>
					</c:if>
				</div>
				</form>
			</div>
		</div>
		
		<script>
			$('#toggle_tab button').on('click', function(e) {
				var index = $(this).parent().index();
				$(this).parent().addClass('on').siblings().removeClass('on');
				$('#toggle_contents > div').eq(index).show().siblings().hide();
			});
		</script>
	</div>
</div>



<%@include file="../_include/footer.jsp"%>