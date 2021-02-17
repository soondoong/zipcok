<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">	
<script>
function commplus(){
	window.open('coachMyPageCommPlusForm.do?com_coach_id=${sessionScope.coachId}','commUpdate','width=550,height=300');
}
</script>
	
<%@include file="../header2.jsp"%>
<style>
.table { border-spacing: ''; table-layout: auto; text-align: center;} 
.table th{font-weight: bold; border-color:#848282;}
.revbtn{width:72px; height: 25px; }
.table a,.table a:hover,.table a:link{color:blue;}
h3:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 32px; }
h3{font-weight: 550; color:#12151d; margin-bottom:24px;}
hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}

</style>
<div class="mypage_wrap">
<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
		<div class="mypage_main paymentMain">
		<br>
			
			<h3 >&nbsp;커뮤니티 관리</h3>
				<p style="margin-bottom:44px;">매칭된 회원님들과 함께 운동스켸줄을 관리하고 친목을 다지세요!</p>
				
			<div class="mypage_payment_table">
				
			<style>
			.mypage_payment_table .paymentList {text-align: center;}
			.mypage_payment_table .paymentList thead {background-color: grey;}
			</style>
					
				<h6><b>[결제한 수강생 내역]</b></h6>
				<table class="table table-hover" class="paymentList">
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
					
				
				
					<h3>&nbsp;개설된 커뮤니티</h3> 
						<p >커뮤니티를 생성하고 관리 할 수 있습니다</p>
						
					<input type="button" class="btn btn-primary btn-sm"  style="display: block; float:right;padding:7px 10px;"
					value="커뮤니티 추가" <c:if test="${!empty paymentlist}">onclick="commplus()"</c:if>>
					
		
						<table class="table table-hover" class="commList">
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
								<td><a href="coachMyPageCommSetting.do?uc_comm_idx=${dto2.com_idx}">[설정]</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
			</div>
				
				
		 </div>
	</div>
</div>
		
<%@include file="../_include/footer.jsp" %>