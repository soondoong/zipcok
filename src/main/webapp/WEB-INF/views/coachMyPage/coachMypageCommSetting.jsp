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
<style>
.table { border-spacing: ''; table-layout: auto; text-align: center; border-bottom: 2px solid #dee2e6;} 
.table th{font-weight: bold; border-color:#848282;}
.revbtn{width:72px; height: 25px; }
.table a,.table a:hover,.table a:link{color:blue;}
h2:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 32px; }
h2{ color:#12151d; margin-bottom:40px;}
hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}
.mypage_comm_table .commList {text-align: center;}
.mypage_comm_table .commList thead {background-color: grey;}
</style>
<div class="mypage_wrap">
<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
		<div class="mypage_main paymentMain">
		<br>
			 	
			<h2>&nbsp;커뮤니티 설정</h2>
			<div class="mypage_comm_table">

					
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
					
				<h5 style="font-weight: 600;">수강생 관리</h5> 
				<div style="display:flex; justify-content: flex-end;">
				<a href="#" onclick="memplus(${uc_comm_idx})" style=" font-size: 18px; font-weight: bold; padding: 4px;">수강생 추가</a>
				<a href="#" onclick="memplus(${uc_comm_idx})"><img src="assets/img/plus.png" style="width: 30px; height: 15px; margin: 10px -3px 0px;"></a>
				</div>
				
				
				<table class="table table-hover" class="commList">
				<thead>
					<tr>
						<th>No.</th>
						<th>수강생 이름</th>
						<th>계정</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty commlist}">
						<tr>
							<td colspan="3" align="center">
								소속된 수강생이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto2" items="${commlist}" varStatus="i">
					<tr>
						<td>${i.index+1}</td>
						<td>${dto2.uc_mem_name }</td>
						<td>${dto2.uc_mem_id }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			
			<div class="mypage_comm_table">
				<input type="button" value="목록으로 가기" class="btn1 c1" onclick="location.href='coachMyPageCommManage.do'">
			</div>	
				
		 </div>
	</div>
</div>
		
<%@include file="../_include/footer.jsp" %>