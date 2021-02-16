<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
window.addEventListener('load', function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp05175150'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
});
function pg_check(){
	 var pg_method = document.getElementsByName('pg_method');
	 var pg_choice_method = '';
	 for(var i = 0 ; i < pg_method.length; i++){

		 if(pg_method[i].checked == true){
			 pg_choice_method = pg_method[i].value;
		 }
	 }
	 window.alert('메서드로 들어온 정보는 : '+pg_choice_method);
	IMP.request_pay({
	    pg : 'kakaopay', // version 1.1.0부터 지원.
	    cid : 'A52CY',
	    pay_method : pg_choice_method,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : ${reservationInfo.reser_price},
	    buyer_email : '${sessionScope.loginAll.mem_email}',
	    buyer_name : '${sessionScope.loginAll.mem_name}',
	    buyer_tel : '${sessionScope.loginAll.mem_phone}',
	    buyer_addr : '${sessionScope.loginAll.mem_addr}',
	    buyer_postcode : '${sessionScope.loginAll.mem_zipcode}',
	}, function(rsp) {
	    if ( rsp.success ) {
			var params = '?pd_req_idx='+${reservationInfo.reser_idx};
		    params += '&pd_code='+rsp.merchant_uid;
		    params += '&pd_target_id='+'${reservationInfo.hg_mem_id}';
		    params += '&pd_mem_id='+'${sessionScope.loginAll.mem_name}';
		    params += '&pd_method='+pg_choice_method;
		    params += '&pd_price='+'${reservationInfo.reser_price}';
		    	
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '/n에러내용 : ' + rsp.error_msg;
	    }
	    location.href = 'HomeGymPayListAdd.do'+params;
	});
}
</script>
<style>
.reserpaymentDiv {width: 800px; margin:0px auto;}
.reserpaymentDiv .reserInfo {width: 800px;}
</style>
<div class = "reserpaymentDiv">
	<div class= "reserInfo">
	<h3>고객님의 예약 요청이 정상적으로 처리되었습니다.</h3>
	<h6>예약 번호  : ${reservationInfo.reser_idx }</h6>
	<h6>에약자 아이디 : ${reservationInfo.mem_id }</h6>
	<h6>대여자 아이디 : ${reservationInfo.hg_mem_id }</h6>
	<h6>예약 일자 : ${reservationInfo.reser_date }</h6>
	<h6>예약 시간 : <c:if test = "${reservationInfo.reser_start_time<10 }">0</c:if>${reservationInfo.reser_start_time }:00 ~ <c:if test = "${reservationInfo.reser_end_time<10 }">0</c:if>${reservationInfo.reser_end_time }:00</h6>
	<h6>에약자 수 : ${reservationInfo.reser_person_count }</h6>
	<h6>에약 접수 날짜 : ${reservationInfo.reser_regist_date }</h6>
	<h6>에약 상태 : ${reservationInfo.reser_status }</h6>
	<h6>예약 대금 : ${reservationInfo.reser_price }</h6>	
	</div>
	<div class = "paymentInfo">
		<h3>결제 페이지</h3>
		<div class = "payment_method">
			<h5>결제 수단</h5>
			<input type = "radio" name = "pd_method" checked="checked" value = "card">신용카드
			<input type = "radio" name = "pd_method" value = "trans">실시간 계좌 이체
			<input type = "radio" name = "pd_method" value = "vbank">가상 계좌
			<input type = "radio" name = "pd_method" value = "phone">폰 뱅킹
			<input type = "radio" name = "pd_method" value = "samsung">삼성페이
			<input type = "radio" name = "pd_method" value = "kpay">K_Pay
			<input type = "radio" name = "pd_method" value = "cultureland">문화상품권
			<input type = "radio" name = "pd_method" value = "smartculture">스마트상품권
			<input type = "radio" name = "pd_method" value = "happymoney">해피머니 문화상품권
			<input type = "radio" name = "pd_method" value = "booknlife">도서 상품권
		</div>
		<input type = "button" value = "결제하기" onclick = "javascript:pg_check();">
		<input type = "button" value = "돌아가기">
	</div>
</div>
<%@include file="../_include/footer.jsp" %>