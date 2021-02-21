<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">  
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
	var pg_choice_method = $('input:radio[name="pd_method"]:checked').val();
	IMP.request_pay({
	    pg : 'kakaopay', // version 1.1.0부터 지원.
	    cid : 'A52CY',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : ${reserInfo.reser_price},
	}, function(rsp) {
	    if ( rsp.success ) {
			var params = '?pd_code='+rsp.merchant_uid;
			
		    params += '&mem_id='+'${reserInfo.mem_id}';
		    params += '&hg_mem_id='+'${reserInfo.hg_mem_id}';
		    params += '&reser_date='+'${reserInfo.reser_date}';
		    params += '&reser_start_time='+'${reserInfo.reser_start_time}';
		    params += '&reser_end_time='+'${reserInfo.reser_end_time}';
		    params += '&reser_person_count='+'${reserInfo.reser_person_count}';
		    params += '&reser_price='+'${reserInfo.reser_price}';
		    params += '&pd_target_id='+'${reserInfo.hg_mem_id}';
		    params += '&pd_mem_id='+'${reserInfo.mem_id}';
		    params += '&pd_method='+pg_choice_method;
		    params += '&pd_price='+'${reserInfo.reser_price}';
		    location.href = 'HomeGymPayListAdd.do'+params;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '/n에러내용 : ' + rsp.error_msg;
	    }
	});
}
</script>
<style>
.container{ display:  flex; justify-content:  center; padding:50px;}
.payAllWrap { padding:50px;}
.topInfoDIV{width: 100%; height: 130px; background-image: linear-gradient(to top, #006be0, #0070e1, #0074e1, #0579e1, #0f7de1);	}
.topInfoDIV:before{   
position: relative;
    content: "";
    width: 0;
    height: 0;
    border-left: 27px solid transparent;
    border-right: 27px solid transparent;
    border-top: 32px solid #0875d6;
    left: 50%;
    top: 114%;
    z-index: -1;
    margin-left: -15px;
}
.topInfoDIV h3{  color:white;margin: 30px 0px 30px 302px;}
.booticon{font-size: 46px; color:white; position: relative; top:-20px; }
hr{margin-bottom:40px;}
.hpdTitle{font-size: 20px; font-weight:600; color:#324068; margin-right:30px;}
.hpdText{font-size: 17px;position: relative; top:6px; }
.prices{font-size: 25px; }
.prices2{font-size: 26px;}
.payAllWrap p{height: 30px;}
input[name = "pd_method"]{ 
width:20px; height: 20px;
font-size: 15px; margin-right:15px;
}
.paymethod{font-size: 17px;}
.btn{display: block; width: 100%; height: 53px;}
.OKbtn{ margin:40px 0 10px 0;}
.returnbtn{ }
</style>
<div class= "topInfoDIV">
	<h3><i class="bi bi-credit-card booticon"></i>&nbsp;&nbsp;&nbsp;결제 정보를 확인해주세요&nbsp;&nbsp;!</h3>
</div>
<div class = "container">
	<div class = "payAllWrap card">
	<h3 style="margin-bottom:20px;">결제세부 정보</h3>
	<hr>
	<div>
		<p><span class = "hpdTitle">대여자 홈짐 아이디</span><span class = "hpdText">${reserInfo.hg_mem_id }</span></p>
		<div style = "display:flex;">
			<p style = "margin-right:40px;"><span class ="hpdTitle">예약자 아이디</span><span class = "hpdText">${reserInfo.mem_id }</span></p>
		</div>
		<div style = "display:flex;">
			<p style = "margin-right:40px;"><span class ="hpdTitle">예약 일자</span><span class = "hpdText">${reserInfo.reser_date }</span></p>
		</div>
		<div style = "display:flex;">
			<p><span class ="hpdTitle">예약 시작 시간</span>
			<span class = "hpdText"><c:if test = "${reserInfo.reser_start_time<10 }">0</c:if>${reserInfo.reser_start_time }:00</span></p>
		</div>
		<div style = "display:flex;">
			<p><span class ="hpdTitle">예약 종료 시간</span>
			<span class = "hpdText"><c:if test = "${reserInfo.reser_end_time<10 }">0</c:if>${reserInfo.reser_end_time }:00</span></p>
		</div>
		<div style = "display:flex;">
			<p style = "margin-right:40px;"><span class ="hpdTitle">예약 인원</span><span class = "hpdText">${reserInfo.reser_person_count }</span></p>
		</div>
	</div>
	<hr>
	<p><span class = "hpdTitle prices">결제예상 금액</span>&nbsp;<span class = "hpdText prices2">${reserInfo.reser_price }&nbsp;원</span></p>

	<hr style = "border-top:3px solid #d1d5dc; margin-top:24px;">
	
	<p class = "hpdTitle">결제 방법</p>
	<div>
		<input type = "radio" name = "pd_method" checked ="checked" value = "카카오페이"><span class = "paymethod">카카오페이</span>
		<input type = "radio" name = "pd_method" value = "신용카드"><span class = "paymethod">신용카드</span>
		<input type = "radio" name = "pd_method" value = "실시간 계좌 이체"><span class = "paymethod">실시간 계좌 이체</span>
		<input type = "radio" name = "pd_method" value = "폰 뱅킹"><span class = "paymethod">폰 뱅킹</span>
		<input type = "radio" name = "pd_method" value = "삼성페이"><span class = "paymethod">삼성페이</span>
	</div>
	<input type = "button" value = "결제하기" class = "btn btn-primary btn-lg sbtn" style = "margin-top:50px;" onclick = "javascript:pg_check();">
	<input type = "button" value = "돌아가기" class = "btn btn=secondary returnbtn">
	</div>
</div>
<input type = "hidden" id = "mem_id" value = '${reserInfo.mem_id }'>
<input type = "hidden" id = "target_id" value = '${reserInfo.hg_mem_id }'>
<input type = "hidden" id = "reser_date" value = '${reserInfo.reser_date }'>
<input type = "hidden" id = "reser_start_time" value = '${reserInfo.reser_start_time }'>
<input type = "hidden" id = "reser_end_time" value = '${reserInfo.reser_end_time }'>	
<input type = "hidden" id = "reser_person_count" value = '${reserInfo.reser_person_count }'>
<input type = "hidden" id = "reser_date">
<input type = "hidden" id = "reser_price" value = "${reserInfo.reser_price }">
<%@include file="../_include/footer.jsp" %>