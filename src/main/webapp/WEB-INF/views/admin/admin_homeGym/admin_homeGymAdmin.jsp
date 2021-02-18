<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="k"%>
<c:set var="list" value="${list}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<script src = "js/httpRequest.js"></script>
<style type="text/css">
.test-inline {
	display: inline-flex;
}

.paging {
	margin: 40px 0 0;
	text-align: center;
}

.paging a {
	display: inline-block;
	background: #f7f7f7;
	text-align: center;
	width: 30px;
	height: 30px;
	font-size: 14px;
	line-height: 30px;
}
</style>
<script>
function homegymInfoView(hg_mem_id){
	var params = 'hg_mem_id='+hg_mem_id;
	sendRequest('adminHomeGymInfoAjax.do',params, homegymInfoView_rq, 'GET');
}
function homegymInfoView_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data = eval('('+data+')');
			var homegymInfo = data.hgContent;
			var memberInfo = data.memberIdx;
			var equipmentInfo = data.eqContent;
			var paymentInfo = data.payContent;
			var reviewInfo = data.reviewContent;
			var pageStr = data.pageStr;
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
			document.getElementById().innerText = 
		}
	}
}
</script>

</head>
<body>
	<%@include file="../../header2.jsp"%>
	<div class="adminPage_wrap">
		<%@include file="../adminSideBar.jsp"%>
		<div class="container adminPage_contents">
			<div class="adminPage_main">
				<h3>홈짐 조회</h3>
				<form action="adminHomeGymSearch.do">
					<ul class="test-inline">
						<li><select name="searchType">
								<option
									<c:if test="${searchType=='전체'}">selected="selected"</c:if>>전체</option>
								<option
									<c:if test="${searchType=='아이디'}">selected="selected"</c:if>>아이디</option>
								<option
									<c:if test="${searchType=='닉네임'}">selected="selected"</c:if>>닉네임</option>
						</select></li>
						<li><input type="text" name="searchText" placeholder="홈짐이름"></li>
						<li><input type="submit" value="검색"></li>
					</ul>
				</form>
				<div>
					<ul class="test-inline">
						<li>등록된 홈짐 수 : ${k:length(list)}</li>
					</ul>
				</div>
				<div>
					<!-- 회원목록부분 테이블 div -->
					<table border="1">
						<thead>
							<tr>
								<th>번호</th>
								<th>홈짐이름</th>
								<th>공유자아이디</th>
								<th>등록일</th>
								<th>정보수정일</th>
								<th>결제계좌정보</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="7" align="center">등록된 홈짐정보가 없습니다</td>
								</tr>
							</c:if>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.rnum}</td>
									<td>${dto.hg_nickname}</td>
									<td><a onclick = "javascript:homegymInfoView('${dto.hg_mem_id}')">${dto.hg_mem_id}</a></td>
									<td>${dto.hg_regist_date}</td>
									<td>${dto.hg_price}</td>
									<td>${dto.hg_faddr}</td>
									<td><c:if test="${dto.hg_status==1}">활성</c:if> <c:if
											test="${dto.hg_status==0}">비활성</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="paging">
						<c:if test="${!empty list }">
						${pageStr}
						</c:if>
					</div>
				</div>
				<h3>홈짐 정보 관리</h3>
				<table>
					<tr>
						<th>회원 번호</th>
						<td id = "memberIdx"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td id = "homegymId"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td id = "homegymNickname"></td>
					</tr>
					<tr>
						<th>홈짐 등록일</th>
						<td id = "homegymDate"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td id = "homegymAddr"></td>
					</tr>
					<tr>
						<th>보유 기구</th>
					</tr>
					<tr>
						<th>결제 계좌 정보</th>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>평점</th>
						<td></td>
					</tr>
					<tr>
						<th>상태</th>
						<td></td>
					</tr>
				</table>
				<h4>홈짐 등록 승인<input type = "checkbox"></h4>
				<input type = "button" value = "홈짐 삭제">
				<div>
					<!-- 회원목록부분 테이블 div -->
					<h3>홈짐 후기 관리</h3>
					<table border="1" cellspacing="0">
						<thead>
							<tr>
								<th>번호</th>
								<th>예약자</th>
								<th>등록일</th>
								<th>평점</th>
								<th>내용</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>김둘리</td>
								<td>2021.02.22</td>
								<td>3.8</td>
								<td><input type="button" value="보기"></td>
								<td><input type="button" value="삭제"></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6" align="center">페이징 들어갈 자리</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../../_include/footer.jsp"%>