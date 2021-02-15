<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="assets/css/mypage.css" rel="stylesheet">
<script>
function memplus(uc_comm_idx){
	var url='coachMyPageMemPlusForm.do?uc_comm_idx='+uc_comm_idx;
	window.open(url,'memUpdate','width=550,height=300');
}
</script>
	
<%@include file="../header2.jsp"%>
<div class="mypage_wrap">
<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
		<div class="mypage_main">
		<br>
			 	
			<h4>커뮤니티 설정</h4>
			<div class="mypage_comm_table">
				
			<style>
			.mypage_comm_table .commList {text-align: center;}
			.mypage_comm_table .commList thead {background-color: grey;}
			</style>
					
				<%-- <h6>커뮤니티 이름</h6>
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
								커뮤니티 게시판 관리
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
			</table> --%>
			</div>
				
			<div class="mypage_comm_table">
				
			<style>
			.mypage_comm_table .commList {text-align: center;}
			.mypage_comm_table .commList thead {background-color: grey;}
			</style>
					
				<h6>수강생 관리</h6> <input type="button" value="수강생 추가" onclick="memplus(${uc_comm_idx})">
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
					<c:if test="${empty commlist}">
						<tr>
							<td colspan="4" align="center">
								소속된 수강생이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto2" items="${commlist}" varStatus="i">
					<tr>
						<td>${i.index+1}</td>
						<td>${dto2.uc_mem_name }</td>
						<td>${dto2.uc_mem_id }</td>
						<td>${dto2.uc_status }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
				
				
		 </div>
	</div>
</div>
		
<%@include file="../_include/footer.jsp" %>