<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">

<script>
function mypageHomeGymPayList(){
	location.href='CmHomeGymPayList.do?mem_id=${sessionScope.coachId}';
}
function mypageCoachMatchPayList(){
	location.href='CmPaymentList.do?mem_id=${sessionScope.coachId}';
}
</script>
</head>
<body>
<%@include file="../header2.jsp"%>
<div class="mypage_wrap">
<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main paymentMain">
		<div id="toggle_tab" class="tab_style_01 mb50">
		<style>
		.paymentMain{width:1000px;}
		.mypage_main .tab_style_01 ul {display: flex; }
		.mypage_main .tab_style_01 li {flex: 1 1 auto;}
		.mypage_main .tab_style_01 li button {display: block; width: 100%; background: #f7f7f7; line-height: 40px; text-align: center; border: none;}
		.mypage_main .tab_style_01 li.on button {background: #006be0; color: #ffffff;}
		.table { border-spacing: ''; table-layout: auto; text-align: center;} 
		.table th{font-weight: bold; border-color:#848282;}
		.revbtn{width:72px; height: 25px; }
		</style>		
			<ul>
				<li class="on"><button type="button" onclick="mypageHomeGymPayList()">홈짐 결제내역</button></li>
				<li><button type="button" onclick="mypageCoachMatchPayList()">코치매치 결제내역</button></li>
			</ul>
		</div>
		<div class="mypage_main_table">
		<h3>내 홈짐 결제 리스트</h3>
		<table class="table table-hover" > 
	<thead>
		<tr>
			<th>결제날짜</th>
			<th>예약자 명</th>
			<th>예약날짜</th>
			<th>금액</th>
			<th>결제상태</th>
			<th>후기여부</th>
		</tr>
	</thead>
	<tfoot>	
		<tr>
			<td colspan="6" align="center">${myHomeGymlistpageStr}</td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty myHomeGymlist}">
			<tr>
				<td colspan="6" align="center">
					등록된 홈짐 또는 결제내역이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="p" items="${myHomeGymlist }"  varStatus="st">
		<tr>
			<td>${p.pd_payment_date }</td>
			<td><!-- ${p.mem_id } --></td>
			<td>${p.reser_date }</td>
			<td>${p.pd_price }원</td>
			<td>
				<c:if test = "${p.pd_status eq '결제완료' }">
					<input type="button" class="revbtn"  value="결제취소">
				</c:if>
				<c:if test = "${p.pd_status ne '결제완료' }">
					${p.pd_status }
				</c:if>
			</td>
			<td>		
				<c:if test = "${p.reviewCheck }">
					<input type="button" class="revbtn"  value="후기 보기">
				</c:if>
				<c:if test = "${!p.reviewCheck }">
					작성된 후기 없음.
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

	<h3>결제 리스트</h3>
		<table class="table table-hover" > 
	<thead>
		<tr>
			<th>결제날짜</th>
			<th>결제 홈짐명</th>
			<th>예약날짜</th>
			<th>금액</th>
			<th>결제상태</th>
			<th>후기여부</th>
			<th>상세 주소 보기</th>
		</tr>
	</thead>
	<tfoot>	
		<tr>
			<td colspan="9" align="center">${pageStr}</td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="7" align="center">
					등록된 결제내역이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="p" items="${list }"  varStatus="st">
		<tr>
			<td>${p.pd_payment_date }</td>
			<td>${p.hg_nickname }</td>
			<td>${p.reser_date }</td>
			<td>${p.pd_price }원</td>
			<td>
				<c:if test = "${p.pd_status eq '결제완료' }">
					<input type="button" class="revbtn"  value="결제취소">
				</c:if>
				<c:if test = "${p.pd_status ne '결제완료' }">
					${p.pd_status }
				</c:if>
			</td>
			<td>		
				<c:if test = "${p.reviewCheck }">
					<input type="button" class="revbtn"  value="작성한 후기 보기">
				</c:if>
				<c:if test = "${!p.reviewCheck }">
					<input type="button" class="revbtn"  value="후기 작성">
				</c:if>
			</td>
			<td>
				<input type = "button" value = "상세 주소 확인">
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
	</div>
	</div>
	</div>
	   <%@include file="../_include/footer.jsp" %>
</body>
</html>