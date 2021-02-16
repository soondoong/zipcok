<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
window.addEventListener('load', function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp05175150'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
    var d = new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);
    document.getElementById('reser_date').value = s;
        s += leadingZeros(d.getHours(), 2) +
        leadingZeros(d.getMinutes(), 2) +
        leadingZeros(d.getSeconds(), 2);
     document.getElementById('sysdate').innerText = s;
});
function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}

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
	    amount : ${reserInfo.reser_price},
	}, function(rsp) {
	    if ( rsp.success ) {
			var params = '?pd_code='+rsp.merchant_uid;
		    params += '&pd_target_id='+'${reserInfo.hg_mem_id}';
		    params += '&pd_mem_id='+'${reserInfo.reser_mem_id}';
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
.reserpaymentDiv {width: 850px; margin:0px auto; border:1px solid gray; border-radius: 8px;}
.reserpaymentDiv .reserInfo {width: 850px;}
.reserpaymentDiv .reserInfo h6 {margin-bottom: 20px;}
.payment_method {font-size:20px;}
.payment_btn {text-align: center;}
</style>
<div class = "reserpaymentDiv">
	<div class= "reserInfo">
	<h3>결제 정보</h3>
	<h6>에약자 아이디 : ${reserInfo.mem_id }</h6>
	<input type = "hidden" id = "mem_id" value = '${reserInfo.mem_id }'>
	<h6>대여자 아이디 : ${reserInfo.hg_mem_id }</h6>
	<input type = "hidden" id = "target_id" value = '${reserInfo.hg_mem_id }'>
	<h6>예약 일자 : ${reserInfo.reser_date }</h6>
	<input type = "hidden" id = "reser_date" value = '${reserInfo.reser_date }'>
	<h6>예약 시간 : <c:if test = "${reserInfo.reser_start_time<10 }">0</c:if>${reserInfo.reser_start_time }:00 ~ <c:if test = "${reserInfo.reser_end_time<10 }">0</c:if>${reserInfo.reser_end_time }:00</h6>
	<input type = "hidden" id = "reser_start_time" value = '${reserInfo.reser_start_time }'>
	<input type = "hidden" id = "reser_end_time" value = '${reserInfo.reser_end_time }'>	
	<h6>에약자 수 : ${reserInfo.reser_person_count }</h6>
	<input type = "hidden" id = "reser_person_count" value = '${reserInfo.reser_person_count }'>
	<h6>에약 접수 날짜 : <label id = "sysdate"></label></h6>
	<input type = "hidden" id = "reser_date">
	<h6>예약 대금 : ${reserInfo.reser_price }</h6>
	<input type = "hidden" id = "reser_price" value = "${reserInfo.reser_price }">
	</div>
	<div class = "paymentInfo">
		<h3>결제 페이지</h3>
		<div class = "payment_method">
			<h5>결제 수단</h5>
			<input type = "radio" name = "pd_method" checked="checked" value = "card">신용카드
			<input type = "radio" name = "pd_method" value = "trans">실시간 계좌 이체
			<input type = "radio" name = "pd_method" value = "vbank">가상 계좌<br>
			<input type = "radio" name = "pd_method" value = "phone">폰 뱅킹
			<input type = "radio" name = "pd_method" value = "samsung">삼성페이<br>
			<input type = "radio" name = "pd_method" value = "kpay">K_Pay
			<input type = "radio" name = "pd_method" value = "cultureland">문화상품권
			<input type = "radio" name = "pd_method" value = "smartculture">스마트상품권
			<input type = "radio" name = "pd_method" value = "happymoney">해피머니 문화상품권
			<input type = "radio" name = "pd_method" value = "booknlife">도서 상품권
		</div>
		<div class = "payment_btn">
		<input type = "button" value = "결제하기" class = "btn btn-primary btn-lg sbtn" onclick = "javascript:pg_check();">
		</div>
	</div>
</div>
