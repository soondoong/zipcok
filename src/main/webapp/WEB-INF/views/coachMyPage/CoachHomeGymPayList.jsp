<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.mypage_main_paging {margin: 40px 0 0; text-align: center;}
.mypage_main_paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
.mypage_main_paging a:not(:first-child) {margin-left: 5px;}
</style>
<script>
	function coachmypageHomeGymPayList() {
		location.href = 'CmHomeGymPayList.do?mem_id=${sessionScope.coachId}';
	}
	function coachmypageCoachMatchPayList() {
		location.href = 'CmPaymentList.do?mem_id=${sessionScope.coachId}';
	}
	function addrDetailsPopup(hg_mem_id){
		window.open('coachAddrDetailsPopup.do?hg_mem_id='+hg_mem_id,'detailsPopup','width=900, height=600px; left=30%, top=30%');
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
					window.open("coachHomegymReviewWritePopup.do?"+params, "coachReviewWritePopup","width=450,height=470,top=100,left=500");
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
		window.open("coachSeeHomeGymReviewPopup.do?"+params, "seeHomeGymReviewPopup","width=450,height=470,top=100,left=500");
	}
	function paymentCancel(pd_idx, reser_idx, startdate){
		//첫번째 조건-서비스종료일이 지낫는지
		var d = new Date();
		var year = d.getFullYear(); //년도
		var month = d.getMonth()+1; //월
		var day = d.getDate()+1; //일
		if ((day+"").length < 2) {       // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
				day = "0" + day;
	       }
		var getToday = year+"-"+month+"-"+day; // 오늘 날짜 (2021-02-07)
		var startdate2 = new Date(startdate);
		var todaydate= new Date(getToday);
		if(startdate2 > todaydate){
			var check = window.confirm('결제를 취소하시겠습니까?');
			if(check){
				var params = 'pd_idx='+pd_idx+'&reser_idx='+reser_idx;
				sendRequest('coachmypageHomeGymPaymentCancel.do', params, paymentCancel_rq, 'GET');
			}else{
				window.alert('취소하였습니다.');
			}
		}else{
			window.alert('예약 날짜 이후에는 결제 내역을 취소할 수 없습니다.\n자세한 내용은 고객센터로 부탁드립니다. ');
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
		<%@include file="./coachMypageSideMenu.jsp"%>
		<div class="mypage_contents">
			<div class="mypage_main paymentMain">
				<div id="toggle_tab" class="tab_style_01 mb50">
					<ul>
						<li class="on">
						<button type="button" onclick="coachmypageHomeGymPayList()">홈짐 결제내역</button>
						</li>
						<li>
						<button type="button" onclick="coachmypageCoachMatchPayList()">코치매치 결제내역</button>
						</li>
					</ul>
				</div>
				<div class="mypage_main_table">
					<h3>나의 예약 내역</h3>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>결제번호</th>
								<th>홈짐명</th>
								<th>예약정보</th>
								<th>금액</th>
								<th>결제일</th>
								<th>결제상태</th>
								<th>후기</th>
								<th>상세주소</th>
								<th>결제 취소</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="9" align="center" class = "mypage_main_paging">${myPayListpageStr}</td>
							</tr>
						</tfoot>
						<tbody>
							<c:if test="${empty myPayList}">
								<tr>
									<td colspan="9" align="center">등록된 결제내역이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="p" items="${myPayList }" varStatus="st">
								<tr>
									<td>${p.pd_idx }</td>
									<td>${p.hg_nickname }</td>
									<td>${p.reser_date }<br>
									<c:if test = "${p.reser_start_time<10}">0</c:if>${p.reser_start_time }:00~
									<c:if test = "${p.reser_end_time<10}">0</c:if>${p.reser_end_time }:00
									</td>
									<td>${p.pd_price }원</td>
									<td>${p.pd_payment_date }</td>
									<td id = "pd_status">${p.pd_status }</td>
									<td><c:if test="${p.reviewCheck eq true }">
											<input type="button" class="revbtn" value="후기 보기" onclick = "javscript:seeReview(${p.pd_idx});">
										</c:if>
										<c:if test="${p.reviewCheck eq false }">
											<input type="button" class="revbtn" value="후기 작성" onclick = "javascript:reviewWrite('${p.pd_status}', '${p.reser_date }', ${p.pd_idx }, '${p.pd_target_id }', '${p.pd_mem_id }');">
										</c:if>
									</td>
									<td><input type="button" value="상세 주소 확인" onclick = "javascript:addrDetailsPopup('${p.pd_target_id}');"></td>
									<td>									
									<c:if test="${p.pd_status eq '결제완료' }">
										<input type="button" class="revbtn" value="결제취소" onclick = "javascript:paymentCancel(${p.pd_idx}, ${p.reser_idx },'${p.reser_date }');">
									</c:if>								
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<h3>내 홈짐 결제 리스트</h3>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>결제번호</th>
								<th>예약자 명</th>
								<th>예약정보</th>
								<th>금액</th>
								<th>결제일</th>
								<th>결제상태</th>
								<th>후기여부</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="7" align="center" class = "mypage_main_paging">${homegymPayListpageStr}</td>
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
									<td>${pl.pd_idx }</td>
									<td>${pl.pd_mem_id }</td>
									<td>
									${pl.reser_date }<br>
									<c:if test = "${pl.reser_start_time<10}">0</c:if>${pl.reser_start_time }:00~
									<c:if test = "${pl.reser_end_time<10}">0</c:if>${pl.reser_end_time }:00
									</td>
									<td>${pl.pd_price }원</td>
									<td>${pl.pd_payment_date }</td>
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