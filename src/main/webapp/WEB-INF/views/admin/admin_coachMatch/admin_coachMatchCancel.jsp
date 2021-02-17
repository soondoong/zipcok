<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<style type="text/css">
.test-inline {
	
       display: flex;
}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
</style>
<script type="text/javascript">
function showList(){
	var cancelSelect=document.getElementById('cancelSelect').value;
	
	location.href='coachListSearch.do?cancelSelect='+cancelSelect;
}
</script>
</head>
<body>
<%@include file="../../header2.jsp" %>
<style>
.table { border-spacing: ''; table-layout: auto; text-align: center;} 
.table th{font-weight: bold; border-color:#848282;}
a{cursor:pointer;}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
	
		
</style>


   <div class="adminPage_wrap">
    <%@include file="../adminSideBar.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
         	<div><!-- 검색하는 부분 div -->
					<div>
						<h5>[결제 관리]</h5>
					</div>
					<div>
						<ul class="test-inline">
							<li>상태</li>
							<li>
								<select id="cancelSelect" onchange="javascript:showList();">
									<option <c:if test="${cancelSelect=='전체'}">selected="selected"</c:if> >전체</option>
									<option <c:if test="${cancelSelect=='취소요청중'}">selected="selected"</c:if> >취소요청중</option>
									<option <c:if test="${cancelSelect=='결제취소완료'}">selected="selected"</c:if> >결제취소완료</option>
									<option <c:if test="${cancelSelect=='결제완료'}">selected="selected"</c:if> >결제완료</option>
								</select>
							</li>
						</ul>
					</div>
				<form action="coachCancelSearch.do">
					<div>
						<ul class="test-inline">
							<li>코치 검색</li>
							<li>
								<select name="searchCon">
									<!-- <option <c:if test="${searchCon=='회원번호'}">selected="selected"</c:if> >회원번호</option>
									<option <c:if test="${searchCon=='아이디'}">selected="selected"</c:if> >아이디</option>
									<option <c:if test="${searchCon=='이름'}">selected="selected"</c:if> >이름</option> -->
									<option <c:if test="${searchCon=='회원아이디'}">selected="selected"</c:if> >회원아이디</option>
									<option <c:if test="${searchCon=='코치아이디'}">selected="selected"</c:if> >코치아이디</option>							
								</select>
							</li>
							<li><input type="text" name="searchT"></li>
							<li><input type="submit" value="검색"></li>
						</ul>
					</div>
				</form>
			</div>
			<hr>
			<div><!-- 코치의 취소 내역  테이블 div -->
				
				<table   align="center" class="table table-hover" >
					<thead>
						<tr>
							<th>결제번호</th>
							<th>요청서번호</th>
							<th>금액</th>
							<th>회원아이디</th>
							<th>코치아이디</th>
							<th>결제일</th>
							<th>결제방법</th>
							<th>상태</th>
							<th>결제취소승인</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="paymentlist" value="${paymentlist }"></c:set>
						<c:if test="${empty paymentlist}">
						<tr>
							<th colspan="9">검색된 회원이 없습니다</th>
						</tr>
						</c:if>
						<c:forEach var="list" items="${paymentlist}">
						<input type="hidden" value=""${list.pd_code}>
						<tr>
							<td>${list.pd_idx}</td>
							<td>${list.pd_req_idx}</td>
							<td>${list.pd_price}</td>
							<td>${list.pd_mem_id}</td>
							<td>${list.pd_target_id}</td>
							<td>${list.pd_payment_date}</td>
							<td>${list.pd_method}</td>
							<td id="${list.pd_idx}_pd_status">${list.pd_status}</td>
							<td id="${list.pd_idx}_pd_btn">
								<c:if test="${list.pd_status=='취소요청중'}"> 	
									
									<input type="button" value="취소 승인" onclick="javascript:updateStatus('${list.pd_idx}','${list.pd_req_idx}');">
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="paging">
	               <c:if test="${!empty pageStr }">
	               ${pageStr}
	               </c:if>
	           </div>
				<hr>
			</div>
         </div>
      </div>
   </div>
<script src="js/httpRequest.js"></script>
<script type="text/javascript">
function updateStatus(idx,pr_idx){
	var result = confirm('취소요청을 승인하시겠습니까?');
	if(result){
		location.href='javascript:show('+idx+','+pr_idx+');';
	}
}
function show(idx,pr_idx){
	var params='pd_idx='+idx+'&pr_idx='+pr_idx;
	sendRequest('updateStatus.do',params,showResult,'GET');
}
function showResult(){
	   if(XHR.readyState==4){
	      if(XHR.status==200){
	         var data=XHR.responseText;
	         data=eval('('+data+')');
	         var idx=data.pd_idx;
	         var msg=data.result;
	         if(msg>0){
	        	 window.alert('결제취소가 승인되었습니다');
	        	 document.getElementById(idx+'_pd_status').innerText='결제취소완료';
	        	 document.getElementById(idx+'_pd_btn').innerHTML='';
	        	
	         }else{
	        	 window.alert('에베베베베베');
	         }
	         
	         
	      }
	   }
	}


</script>
<%@include file="../../_include/footer.jsp" %>