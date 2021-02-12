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
			
			<h4>커뮤니티 관리</h4>
			<div class="mypage_payment_table">
				
			<style>
			.mypage_payment_table .paymentList {text-align: center;}
			.mypage_payment_table .paymentList thead {background-color: grey;}
			</style>
					
				<h6>결제한 수강생 내역</h6>
				<table border="1" cellspacing="0" class="paymentList">
				<thead>
					<tr>
							<th>No.</th>
						<th>수강생 이름</th>
						<th>결제 상태</th>
						<th>과정 진행률</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty paymentlist}">
						<tr>
							<td colspan="4" align="center">
								결제한 수강생이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${paymentlist}">
					<tr>
						<td>${dto.pr_idx }</td>
						<td>${dto.pr_sender }</td>
						<td>${dto.pr_status }</td>
						<td>${dto.pr_end }</td>
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
					
				<h6>개설된 커뮤니티</h6> <input type="button" value="커뮤니티 추가" onclick="commplus()">
				<table border="1" cellspacing="0" class="commList">
				<thead>
					<tr>
						<th>No.</th>
						<th>커뮤니티 이름</th>
						<th>수강 인원</th>
						<th>개설일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty commlist}">
						<tr>
							<td colspan="5" align="center">
								생성된 커뮤니티가 없습니다
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto2" items="${commlist}">
					<tr>
						<td>${dto2.com_idx}</td>
						<td>${dto2.com_name}</td>
						<td>${dto2.com_mem_sum}</td>
						<td>${dto2.com_opendate}</td>
						<td><a href="coachMyPageCommSetting.do?uc_comm_idx=${dto2.com_idx}">설정</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
				
				
		 </div>
	</div>
</div>
		
<%@include file="../_include/footer.jsp" %>