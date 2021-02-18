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
							<p>집콕헬스는 엄선된 홈짐, 엄선된 트레이너와 고객님의 징검다리 역할을 해주는 멀티운동 플랫폼 입니다.<br><br>
							요가/필라테스/피트니스 등 다양한 운동 컨텐츠를 선보일 예정이에요 🤸&zwj;♀️ 깔끔한 홈짐, 열정적인 트레이너 그리고 다양한 멤버들을 만나보세요.</p>
						</div>
					</li>
					<li>
						<div class="q_box">
							<button type="button">운동 효과를 높일 수 있는 팁이 있을까요?</button>
						</div>
						<div class="a_box">
							<p>1. 미리 준비운동을 하시면 더욱 좋아요! 10분전 미리 준비한다면 좀 더 여유로운 마음으로 참여할 수 있어요!<br><br>
								2. 좋아하는 음악을 블루투스 스피커로 틀어주세요. 🎵 명상, 요가 클래스에 더욱 집중할 수 있어요.<br><br>
								3. 하루의 시작 그리고 하루의 마무리 조도를 낮추고 멋진 조명을 준비해보는 건 어떨까요? 나만의 분위기있는 클래스룸을 만들어보세요. 😏<br><br>
								4. 좋아하는 아로마 향을 준비해보는 것도 좋은 방법이에요❤️<br><br>
								수업 후기에 다양한 팁들을 이야기해주세요. 다른 멤버들에게 더 나은 경험을 전달할 수 있어요!</p>
						</div>
					</li>
					<li>
						<div class="q_box">
							<button type="button">예약한 클래스를 취소하고 싶어요.</button>
						</div>
						<div class="a_box">
							<p>클래스에 불참하면 패스는 사용처리 됩니다.🏄‍♂️ <br><br>
							회식, 출장, 업무 등의 사유로 불가피하게 참석이 어려운 경우, 클래스 시작 1시간 전에 취소해주세요 🧘‍♂️</p>
						</div>
					</li>
					<li>
						<div class="q_box">
							<button type="button">어떤 목적의 운동이 가능한가요?</button>
						</div>
						<div class="a_box">
							<p> 다이어트와 근력 향상, 스트레스 해소, 바른 체형을 위한 신체 정렬, 산전/산후 전문 관리, 통증 완화, 기능회복이 모두 가능합니다. 🤸&zwj;♀️</p>
						</div>
					</li>
					<li>
						<div class="q_box">
							<button type="button">운동 도구가 없는데 괜찮나요?</button>
						</div>
						<div class="a_box">
							<p> 기본적으로 운동에 필요한 소도구는 코치가 준비합니다.<br><br>
							하지만, 코치별로 사용하는 소도구나 준비사항이 다르기 때문에, 코치 프로그램 페이지의 ‘준비물’ 항목을 참고해주시면 됩니다🏄‍♂️.</p>
						</div>
					</li>
					<li>
						<div class="q_box">
							<button type="button">평소에 가지고 있는 장애 또는 질병이 있다면 어떻게 해야 하나요?</button>
						</div>
						<div class="a_box">
							<p>장애나 질병의 종류에 따라 프로그램 진행이 불가능할 수도 있으니 신청 전에 코치님께 꼭 알려주세요.🏄‍♂️<br><br>
							 코치님이 프로그램 진행 가능 여부를 알려드립니다.🏄‍♂️</p>
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