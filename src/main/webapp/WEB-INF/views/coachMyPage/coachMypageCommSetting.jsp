<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="assets/css/mypage.css" rel="stylesheet">

<%@include file="../_include/head.jsp" %>
	
<script>
function commplus(){
	window.open('coachMyPageCommPlusForm.do?com_coach_id=${sessionScope.coachId}','commUpdate','width=550,height=300');
}
</script>
	
<%@include file="../header2.jsp"%>
<div class="mypage_wrap">
<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
		<div class="mypage_main">
		<br>
			 	
			 <div id="toggle_tab" class="tab_style_01 mb50">
			<style>
			.mypage_main .tab_style_01 {}
			.mypage_main .tab_style_01 ul {display: flex; border-bottom: 2px solid #006be0;}
			.mypage_main .tab_style_01 li {flex: 1 1 auto;}
			.mypage_main .tab_style_01 li button {display: block; width: 100%; background: #f7f7f7; line-height: 40px; text-align: center; border: none;}
			.mypage_main .tab_style_01 li.on button {background: #006be0; color: #ffffff;}
			</style>		
					
				<ul>
					<li><button type="button">커뮤니티 관리</button></li>
					<li class="on"><button type="button">커뮤니티 설정</button></li>
				</ul>
			</div>
			<h4>커뮤니티 설정</h4>
			<div class="mypage_comm_table">
				
			<style>
			.mypage_comm_table .commList {text-align: center;}
			.mypage_comm_table .commList thead {background-color: grey;}
			</style>
					
				<h6>커뮤니티 이름</h6>
				<table border="1" cellspacing="0" class="commList">
				<thead>
					<tr>
						<th>No.</th>
						<th>게시판 명</th>
						<th>활성 여부</th>
						<th>비공개 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4" align="center">
								결제한 수강생이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list}" varStatus="i">
					<tr>
						<td>${i.index}</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
				
			<div class="mypage_comm_table">
				
			<style>
			.mypage_comm_table .commList {text-align: center;}
			.mypage_comm_table .commList thead {background-color: grey;}
			</style>
					
				<h6>수강생</h6> <input type="button" value="수강생 추가" onclick="commplus()">
				<table border="1" cellspacing="0" class="commList">
				<thead>
					<tr>
						<th>No.</th>
						<th>수강생 이름</th>
						<th>계정</th>
						<th>커뮤니티 활성화</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4" align="center">
								생성된 커뮤니티가 없습니다
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto2" items="${list}">
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
				
				
		 </div>
	</div>
</div>
		
<%@include file="../_include/footer.jsp" %>