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
.table { border-spacing: ''; table-layout: auto; text-align: center; margin-bottom:70px;} 
.table th{font-weight: bold; border-color:#848282;}
a{cursor:pointer;}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}

.cmtablea,.cmtablea:link{color:blue;}
.surgestForm select {width:195px; margin-right:10px;}
.surgestForm input[type=text] {width:195px; margin-right:10px;}
.test-inline{display: inline-flex;}
.infoTable {font-size:15px;}
.infoTable td, th{width:100px; }
.price{width:80px;}
.addr{width:230px;}
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
			var starAvg = data.starAvg;
			document.getElementById('memberIdx').innerText = memberInfo;
			document.getElementById('homegymId').innerText = homegymInfo.hg_mem_id;
			document.getElementById('homegymNickname').innerText = homegymInfo.hg_nickname;
			document.getElementById('homegymDate').innerText = homegymInfo.hg_regist_date;
			document.getElementById('homegymAddr').innerText = homegymInfo.hg_faddr + " " + homegymInfo.hg_saddr;
			var list = '';
			document.getElementById('homegymEqlist').innerHTML = '';
			for(var i = 0 ; i < equipmentInfo.length; i++){
				var eqItem = equipmentInfo[i];
				list += eqItem.eq_name + ' : ' + eqItem.eq_count + '<br>';
			}
			document.getElementById('homegymEqlist').innerHTML = list;	
			document.getElementById('bank_name').innerText = paymentInfo.pa_bankname;
			document.getElementById('bank_username').innerText = paymentInfo.pa_username;
			document.getElementById('bank_no').innerText = paymentInfo.pa_no;
			document.getElementById('homegymStarAvg').innerText = starAvg;
		
			if(homegymInfo.hg_status=='1'){
				if(homegymInfo.hg_approved_check=='1'){
					var approved_check = document.createElement('input');
					approved_check.setAttribute('id', 'approved_status');
					approved_check.setAttribute('type', 'checkbox');
					approved_check.setAttribute('checked', true);	
					approved_check.setAttribute('onchange', 'javascript:homegymApprovedCheckChange("'+homegymInfo.hg_mem_id+'");');
					while ( document.getElementById('homegymApproved_check').hasChildNodes() ) { document.getElementById('homegymApproved_check').removeChild( document.getElementById('homegymApproved_check').firstChild ); }
					document.getElementById('homegymApproved_check').appendChild(approved_check); 
				}else if(homegymInfo.hg_approved_check=='0'){
					var approved_check = document.createElement('input');
					approved_check.setAttribute('id', 'approved_status');
					approved_check.setAttribute('type', 'checkbox');
					approved_check.setAttribute('onchange', 'javascript:homegymApprovedCheckChange("'+homegymInfo.hg_mem_id+'");');
					while ( document.getElementById('homegymApproved_check').hasChildNodes() ) { document.getElementById('homegymApproved_check').removeChild( document.getElementById('homegymApproved_check').firstChild ); }
					document.getElementById('homegymApproved_check').appendChild(approved_check); 
				}

			}else if(homegymInfo.hg_status=='0'){
				document.getElementById('homegymApproved_check').innerText = '홈짐이 활성화 되지 않음';
			}
			/*
			var delete_homegym = document.createElement('input');
			delete_homegym.setAttribute('type', 'button');
			delete_homegym.setAttribute('value', '활동 정지'');
			delete_homegym.setAttribute('onclick', 'javacript:homegymDelete('+homegymInfo.hg_mem_id+');');
			while ( document.getElementById('homegymDeleteBtn').hasChildNodes() ) { document.getElementById('homegymDeleteBtn').removeChild( document.getElementById('homegymDeleteBtn').firstChild ); }
			document.getElementById('homegymDeleteBtn').appendChild(delete_homegym);*/
		}
	}
}
function homegymApprovedCheckChange(hg_mem_id){
	var status = document.getElementById('approved_status').checked;
	var status_param = status==true?'1':'0';
	var params = 'hg_mem_id='+hg_mem_id+'&hg_approved_check='+status_param;
	sendRequest('changeApprovedStatus.do', params, homegymApprovedCheckChange_rq, 'GET');
}
function homegymApprovedCheckChange_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var status = data.hg_status;
			var hg_mem_id = data.hg_mem_id;
			var hg_approvedCheck = data.hg_approved_check;
			if(status>0){
				window.alert('홈짐 정보가 변경되었습니다.');
				var status = document.getElementById(hg_mem_id+'_check');
				if(hg_approvedCheck=='1'){
					status.innerText = '활성화';
				}else if(hg_approvedCheck=='0'){
					status.innerText = '승인요청중';
				}
			}
		}
	}
}
/*
function homegymDelete(hg_mem_id){
	
}
*/
</script>

</head>
<body>
	<%@include file="../../header2.jsp"%>
	<style>
	.hgaaaa,.hgaaaa:link{color:blue;}
	</style>
	<div class="adminPage_wrap">
		<%@include file="../adminSideBar.jsp"%>
		<div class="container adminPage_contents">
			<div class="adminPage_main">
				<h3>홈짐 조회</h3>
				<form action="adminHomeGymSearch.do" class = "surgestForm">
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
						<li><input type="submit" value="검색" class="btn btn-primary"></li>
					</ul>
				</form>
				<div>
					<ul class="test-inline">
						<li>등록된 홈짐 수 : ${k:length(list)}</li>
					</ul>
				</div>
				<div>
					<!-- 회원목록부분 테이블 div -->
					<table class = "table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>홈짐 이름</th>
								<th>공유자 아이디</th>
								<th>등록일</th>
								<th>가격</th>
								<th>주소</th>
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
									<td><a  class="hgaaaa" onclick = "javascript:homegymInfoView('${dto.hg_mem_id}')">${dto.hg_mem_id}</a></td>
									<td>${dto.hg_regist_date}</td>
									<td class = "price">${dto.hg_price}</td>
									<td class = "addr">${dto.hg_faddr}</td>
									<td id = "${dto.hg_mem_id }_check">
									<c:if test="${dto.hg_status==1 && dto.hg_approved_check==1}">활성</c:if>
									<c:if test="${dto.hg_status==1 && dto.hg_approved_check==0 }">승인 요청중</c:if>
									<c:if test="${dto.hg_status==0}">비활성</c:if>
									</td>
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
				<table class = "table table-hover infotable">
					<tr>
						<th colspan = "2">회원 번호</th>
						<td id = "memberIdx" colspan = "3"></td>
					</tr>
					<tr>
						<th colspan = "2">아이디</th>
						<td id = "homegymId" colspan = "3"></td>
					</tr>
					<tr>
						<th colspan = "2">닉네임</th>
						<td id = "homegymNickname" colspan = "3"></td>
					</tr>
					<tr>
						<th colspan = "2">홈짐 등록일</th>
						<td id = "homegymDate" colspan = "3"></td>
					</tr>
					<tr>
						<th colspan = "2">주소</th>
						<td id = "homegymAddr" colspan = "3"></td>
					</tr>
					<tr>
						<th colspan = "2">보유 기구</th>
						<td colspan = "3"></td>
					</tr>
					<tr>
						<td colspan = "2"></td>
						<td id = "homegymEqlist" colspan = "2" style = "text-align: left;"></td>
						<td colspan = "1"></td>
					</tr>
					<tr>
						<th colspan = "2">결제 계좌 정보</th>
						<td id = "bank_name"></td>
						<td id = "bank_username"></td>
						<td id = "bank_no"></td>
					</tr>
					<tr>
						<th colspan = "2">평점</th>
						<td id = "homegymStarAvg" colspan = "3"></td>
					</tr>
					<tr>
						<th colspan = "2">등록 여부</th>
						<td id = "homegymApproved_check" colspan = "3"></td>
					</tr>
					<!-- <tr>
						<th>활동 정지</th>
						<td id = "homegymDeleteBtn"></td>
					</tr> -->
				</table>
			</div>
		</div>
	</div>


	<%@include file="../../_include/footer.jsp"%>