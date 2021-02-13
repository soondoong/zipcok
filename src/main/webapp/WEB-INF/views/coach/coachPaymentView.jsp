<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				    params += '&pd_target_id='+'${prdto.pr_receiver}';
				    params += '&pd_mem_id='+'${sessionScope.loginAll.mem_name}';
				    params += '&pd_method='+pg_choice_method;
				    params += '&pd_price='+'${prdto.pr_price}'
				    params += '&pr_msg_idx='+'${prdto.pr_msg_idx}';
				  
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '/n에러내용 : ' + rsp.error_msg;
			    }
			    location.href = 'CoachPayOKListAdd.do'+params;
			   
		});
}
</script>
<style>
.payAllWrap { padding:50px;}
</style>
<c:set var="prdto" value="${prdto}"/>
<c:set var="cdto" value="${coachmap.coachDTO }"/>
<c:set var="memdto" value="${ memdto}"/>
<div class="payAllWrap">
		<h2>결제세부 정보</h2>
		<div>
		<p>매칭 코치이름 : ${cdto.mem_name }</p>
		<p>수업유형 : ${cdto.coach_ex_type }</p>
		<p>운동 카테고리 : ${cdto.cate_name}</p>
		<p>결제예상 금액 : ${prdto.pr_price }</p>
		<p>서비스 시작일 : ${prdto.pr_start }</p>
		<p>서비스 종료일 : ${prdto.pr_end }</p>		
		<p>서비스 상세정보 : ${prdto.pr_content }</p>		
		</div>
		<div>
		<input type = "radio" name = "pd_method" checked="checked" value = "신용카드">신용카드
		<input type = "radio" name = "pd_method" value = "실시간 계좌 이체">실시간 계좌 이체
		<input type = "radio" name = "pd_method" value = "가상 계좌">가상 계좌
		<input type = "radio" name = "pd_method" value = "폰 뱅킹">폰 뱅킹
		<input type = "radio" name = "pd_method" value = "삼성페이">삼성페이
		<input type = "radio" name = "pd_method" value = "K_Pay">K_Pay
		<input type = "radio" name = "pd_method" value = "문화상품권">문화상품권
		<input type = "radio" name = "pd_method" value = "스마트상품권">스마트상품권
		<input type = "radio" name = "pd_method" value = "해피머니 문화상품권">해피머니 문화상품권
		<input type = "radio" name = "pd_method" value = "도서 상품권">도서 상품권
		</div>
		<input type = "button" value = "결제하기" onclick = "javascript:pg_check();">
		<input type = "button" value = "돌아가기">
</div>
<%@include file="../_include/footer.jsp" %>
</body>
</html>