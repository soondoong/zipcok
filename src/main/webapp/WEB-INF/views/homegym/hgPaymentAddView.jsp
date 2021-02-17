<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<script>
function paymentAddCheck(check){

	if(check==true){
		document.getElementById('paymentAddForm').submit();
	}else if(check==false){
		var check_confirm = confirm('나중에 계좌를 등록하시겠습니까?')
		if(check_confirm){
			location.href = 'myHomeGymHavingCheck.do?mem_id=${mem_id}';
		}
	}
}
</script>
<style>
.payment_container {width:600px; height:400px; margin:100px auto; vertical-align: middle;}
.payment_container .payment_info input[type=text] {width:300px; }
</style>
<div class = "payment_container">
	<h1>홈짐 결제 계좌 등록</h1>
	<div class = "payment_info">
		<form id = "paymentAddForm" action = "HomeGymPaymentAdd.do" method = "post">
		<input type = "hidden" name = "hg_mem_id" value = "${mem_id }">
			<ul>
				<li>은행 명</li>
				<li><input type = "text" name = "pa_bankname" placeholder="은행 명을 입력해주세요." required="required"></li>
				<li>계좌 번호</li>
				<li><input type = "text" name = "pa_no" placeholder="'-' 없이 번호만 입력해주세요." required="required"></li>
				<li>예금주 명</li>
				<li><input type = "text" name = "pa_username" placeholder="계좌의 예금 주 이름을 입력해주세요." required="required"></li>
			</ul>
			<input type = "button" class = "btn btn-primary btn-lg sbtn" value = "등록하기" onclick = "javascript:paymentAddCheck(true);">
			<input type = "button" class = "btn btn-primary btn-lg sbtn" value = "나중에 작성하기" onclick = "javascript:paymentAddCheck(false);">
		</form>
	</div>
</div>
<%@include file="../_include/footer.jsp" %>