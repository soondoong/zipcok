<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header2.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function pg_setting(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp05175150'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
}
function pg_check(){
	 var pg_method = document.getElementsByName('pg_method');
	 var pg_choice_method = '';
	 for(var i = 0 ; i < pg_method.length; i++){
		 if(pg_method[i].checked == true){
			 pg_choice_method = pg_method[i].value;
		 }
	 }
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
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    var parmas = '';
		params = '?pd_req_idx='+${reservationInfo.reser_idx};
	    params += '&pd_code='+rsq.merchant_uid;
	    params += '&pd_target_id='+${reservationInfo.hg_mem_id};
	    params += '&pd_mem_id='+${sessionScope.loginAll.mem_name};
	    params += '&pd_method='+pg_choice_method;
	    params += '&pd_price='+${reservationInfo.reser_price};
	    window.alert(params);
		location.href = 'HomeGymPayListAdd.do'+params;
	    alert(msg);
	});
}
</script>
</head>
<body onload = "javscript:pg_setting();">

<h1>결제 페이지</h1>
<div>
예약 번호  : ${reservationInfo.reser_idx }<br>
에약자 아이디 : ${reservationInfo.mem_id }<br>
제공자 아이디 : ${reservationInfo.hg_mem_id }<br>
예약 일자 : ${reservationInfo.reser_date }<br>
예약 시작 시간 : ${reservationInfo.reser_start_time }<br>
예약 종료 시간 : ${reservationInfo.reser_end_time }<br>
에약자 수 : ${reservationInfo.reser_person_count }<br>
에약 접수 날짜 : ${reservationInfo.reser_regist_date }<br>
에약 상태 : ${reservationInfo.reser_status }<br>
예약 대금 : ${reservationInfo.reser_price }<br>
</div>
<div>
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
</body>

</html>