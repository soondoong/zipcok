<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<script src = "js/httpRequest.js"></script>
<style>
.paymentMain {
	width: 1000px;
}

.mypage_main .tab_style_01 ul {
	display: flex;
}

.mypage_main .tab_style_01 li {
	flex: 1 1 auto;
}

.mypage_main .tab_style_01 li button {
	display: block;
	width: 100%;
	background: #f7f7f7;
	line-height: 40px;
	text-align: center;
	border: none;
}

.mypage_main .tab_style_01 li.on button {
	background: #006be0;
	color: #ffffff;
}

.table {
	border-spacing: '';
	table-layout: auto;
	text-align: center;
}

.table th {
	font-weight: bold;
	border-color: #848282;
}

.revbtn {
	width: 72px;
	height: 25px;
}
</style>
<script>
	function mypageHomeGymPayList(){
		location.href='mypageHomeGymPayList.do?mem_id=${sessionScope.sid}';
	}
	function mypageCoachMatchPayList(){
		location.href='mypageCoachMatchPayList.do?mem_id=${sessionScope.sid}';
	}
	function addrDetailsPopup(hg_mem_id){
		window.open('mypageAddrDetailsPopup.do?hg_mem_id='+hg_mem_id,'detailsPopup','width=900, height=600px; left=30%, top=30%');
	}
	function reviewWrite(status,date,idx,target_id,mem_id){
		//첫번째 조건-서비스종료일이 지낫는지
		var d = new Date();		 
	    var year = d.getFullYear(); //년도
	    var month = d.getMonth()+1; //월
	    var day = d.getDate(); //일
	 	
	    if ((day+"").length < 2) {       // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
	        day = "0" + day;
	    }	 
	    var getToday = year+"-"+month+"-"+day; // 오늘 날짜 (2021-02-07)
		
	    var enddate = new Date(date);
		var todaydate= new Date(getToday);
		if(todaydate>enddate){ //날짜비교
				if(status == '결제완료'){
					var params="pd_idx="+idx+"&target_id="+target_id+"&mem_id="+mem_id;
					window.open("mypageReviewWritePopup.do?"+params, "mypageReviewWritePopup","width=450,height=470,top=100,left=500");
					return;
				}else if(status == '취소요청중'){ 
					window.alert('취소 요청중인 결제 내역입니다.');
					return;
				}else if(status == '결제취소완료'){
					window.alert('이미 결제 취소 된 결제 내역입니다,');
					return;
				}
		}else{
			alert('홈짐 이용 이후 작성 가능합니다.');
		}
	}
	function seeReview(pd_idx){
		var params="rev_pd_idx="+pd_idx;
		window.open("mypageSeeHomeGymReviewPopup.do?"+params, "seeHomeGymReviewPopup","width=450,height=470,top=100,left=500");
	}
	function paymentCancel(pd_idx, reser_idx){
		var check = window.confirm('결제를 취소하시겠습니까?');
		if(check){
			var params = 'pd_idx='+pd_idx+'&reser_idx='+reser_idx;
			sendRequest('mypageHomeGymPaymentCancel.do', params, paymentCancel_rq, 'GET');
		}
	}
	function paymentCancel_rq(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				data = eval('('+data+')');
				var payment_result = data.change_payment_result;
				var reservation_result = data.change_reservation_result;
				if(payment_result>0 && reservation_result>0){
					document.getElementById('pd_status').innerText = '취소요청중';
				}
				
			}
		}
	}
</script>
</head>
<body>
	<%@include file="../header2.jsp"%>
	<div class="mypage_wrap">
		<%@include file="./mypageSideMenu.jsp"%>
		<div class="mypage_contents">
			<div class="mypage_main paymentMain">
				<div id="toggle_tab" class="tab_style_01 mb50">
					<ul>
						<li class="on">
						<button type="button" onclick="mypageHomeGymPayList()">홈짐 결제내역</button>
						</li>
						<li>
						<button type="button" onclick="mypageCoachMatchPayList()">코치매치 결제내역</button>
						</li>
					</ul>
				</div>
				<div class="mypage_main_table">
					<h3>나의 예약 내역</h3>
					<table class="table table-hover">
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
								<td colspan="7" align="center">${myPayListpageStr}</td>
							</tr>
						</tfoot>
						<tbody>
							<c:if test="${empty myPayList}">
								<tr>
									<td colspan="7" align="center">등록된 결제내역이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="p" items="${myPayList }" varStatus="st">
								<tr>
									<td>${p.pd_payment_date }</td>
									<td>${p.hg_nickname }</td>
									<td>${p.reser_date }</td>
									<td>${p.pd_price }원</td>
									<td id = "pd_status"><c:if test="${p.pd_status eq '결제완료' }">
											${p.pd_status }<br>
											<input type="button" class="revbtn" value="결제취소" onclick = "javascript:paymentCancel(${p.pd_idx}, ${p.reser_idx });">
										</c:if>
										<c:if test="${p.pd_status ne '결제완료' }">
											${p.pd_status }
										</c:if>
									</td>
									<td><c:if test="${p.reviewCheck eq true }">
											<input type="button" class="revbtn" value="후기 보기" onclick = "javscript:seeReview(${p.pd_idx});">
										</c:if>
										<c:if test="${p.reviewCheck eq false }">
											<input type="button" class="revbtn" value="후기 작성" onclick = "javascript:reviewWrite('${p.pd_status}', '${p.reser_date }', ${p.pd_idx }, '${p.pd_target_id }', '${p.pd_mem_id }');">
										</c:if>
									</td>
									<td><input type="button" value="상세 주소 확인" onclick = "javascript:addrDetailsPopup('${p.pd_target_id}');"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<h3>내 홈짐 결제 리스트</h3>
					<table class="table table-hover">
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
								<td colspan="6" align="center">${homegymPayListpageStr}</td>
							</tr>
						</tfoot>
						<tbody>
							<c:if test="${empty homegymPayList}">
								<tr>
									<td colspan="6" align="center">등록된 홈짐 또는 결제내역이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="pl" items="${homegymPayList }" varStatus="st">
								<tr>
									<td>${pl.pd_payment_date }</td>
									<td>${pl.pd_mem_id }</td>
									<td>${pl.reser_date }</td>
									<td>${pl.pd_price }원</td>
									<td>${pl.pd_status }</td>
									<td><c:if test="${pl.reviewCheck eq true }">
											<input type="button" class="revbtn" value="후기 보기" onclick = "javscript:seeReview(${pl.pd_idx});">
										</c:if>
										<c:if test="${pl.reviewCheck eq false }">
											작성된 후기 없음.
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<%@include file="../_include/footer.jsp"%>
</body>
</html>