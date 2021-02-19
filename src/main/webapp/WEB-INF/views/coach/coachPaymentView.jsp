<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">  

</head>
<body>
<%@include file="../header2.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
window.addEventListener('load', function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp05175150'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
});


function pg_check(){

		 var pg_choice_method = $('input:radio[name="pd_method"]:checked').val();
	
		IMP.request_pay({
		    pg : 'kakaopay', // version 1.1.0부터 지원.
		    cid : 'A52CY',
		    pay_method : pg_choice_method,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : ${prdto.pr_price },
		    buyer_email : '${sessionScope.loginAll.mem_email}',
		    buyer_name : '${sessionScope.loginAll.mem_name}',
		    buyer_tel : '${sessionScope.loginAll.mem_phone}',
		    buyer_addr : '${sessionScope.loginAll.mem_addr}',
		    buyer_postcode : '${sessionScope.loginAll.mem_zipcode}',
		}, function(rsp) {
			    if ( rsp.success ) {
					var params = '?pd_req_idx='+${prdto.pr_idx};
				    params += '&pd_code='+rsp.merchant_uid;
				    params += '&pd_key=코치';
				    params += '&pd_target_id='+'${prdto.pr_sender}';
				    params += '&pd_mem_id='+'${sessionScope.loginAll.mem_id}';
				    params += '&pd_method='+pg_choice_method;
				    params += '&pd_price='+'${prdto.pr_price}'
				    params += '&pr_msg_idx='+'${prdto.pr_msg_idx}';
				    params += '&pr_req_idx='+'${prdto.pr_req_idx}';
				  
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '/n에러내용 : ' + rsp.error_msg;
			    }
			    location.href = 'CoachPayOKListAdd.do'+params;
			   
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
.cpdtitle{font-size: 20px; font-weight:600; color:#324068; margin-right:30px;}
.cpdText{font-size: 17px;position: relative; top:6px; }
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
<c:set var="prdto" value="${prdto}"/>
<c:set var="cdto" value="${coachmap.coachDTO }"/>
<c:set var="memdto" value="${ memdto}"/>
<div class="topInfoDIV">
	<h3><i class="bi bi-credit-card booticon"></i>&nbsp;&nbsp;&nbsp;결제 정보를 확인해주세요&nbsp;&nbsp;!</h3>
</div>
<div class="container">
	<div class="payAllWrap card" >
			<h3 style=" margin-bottom:20px;">결제세부 정보</h3>
			<hr>
			<div>
			<p><span class="cpdtitle">매칭 코치이름</span><span class="cpdText">${cdto.mem_name }</span></p>
				<div style="display:flex;" >
				<p style="margin-right:40px;"><span class="cpdtitle">수업유형</span><span class="cpdText">${cdto.coach_ex_type }</span></p>
				<p><span class="cpdtitle">운동 카테고리</span><span class="cpdText">${cdto.cate_name}</span></p>
				</div>
				<div style="display:flex;" >
				<p style="margin-right:40px;"><span class="cpdtitle">서비스 시작일</span><span class="cpdText">${prdto.pr_start }</span></p>
				<p><span class="cpdtitle">서비스 종료일</span><span class="cpdText">${prdto.pr_end }</span></p>		
				</div>
			<p><span class="cpdtitle">서비스 상세정보</span></p>
			<pre class="cpdText"  style="border:1px solid lightgray;height: 150px; border-radius: 5px;">${prdto.pr_content }</pre>	
			</div>
			
			<hr>
			
			<p><span class="cpdtitle prices">결제예상 금액</span><span class="prices2">${prdto.pr_price }&nbsp;원</span></p>
		
			<hr style="border-top:3px solid #d1d5dc;margin-top:24px;  ">
			
			<p class="cpdtitle">결제 방법</p>
			<div>
			<input type = "radio" name = "pd_method" checked="checked" value = "카카오페이"><span class="paymethod">카카오페이</span>
			<input type = "radio" name = "pd_method" value = "신용카드"><span class="paymethod">신용카드</span>
			<input type = "radio" name = "pd_method" value = "실시간 계좌 이체"><span class="paymethod">실시간 계좌 이체</span>
			<input type = "radio" name = "pd_method" value = "폰 뱅킹"><span class="paymethod">폰 뱅킹</span>
			<input type = "radio" name = "pd_method" value = "삼성페이"><span class="paymethod">삼성페이</span>
		
			</div>
			<input type = "button" value = "결제하기"  class="btn btn-primary OKbtn"onclick = "javascript:pg_check();">
			<input type = "button" value = "돌아가기" class="btn btn-secondary returnbtn">
	</div>
</div>
<%@include file="../_include/footer.jsp" %>
</body>
</html>