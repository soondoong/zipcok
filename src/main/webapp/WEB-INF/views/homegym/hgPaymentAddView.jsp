<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#paymentAddForm input{
width:300px;
}
</style>
<script>
function paymentAddCheck(check){

	if(check==true){
		document.getElementById('paymentAddForm').submit();
	}else if(check==false){
		var check_confirm = confirm('나중에 계좌를 등록하시겠습니까?')
		if(check_confirm){
			location.href = 'index.do';
		}
	}
}
</script>
</head>
<body>
<%@include file="../header2.jsp" %>
<h1>홈짐 결제 계좌 등록</h1>
<form id = "paymentAddForm" action = "HomeGymPaymentAdd.do" method = "post">
<input type = "hidden" name = "hg_mem_id" value = "${sessionScope.sid==null?sessionScope.coachid:sessionScope.sid }">
	<ul>
		<li>은행 명</li>
		<li><input type = "text" name = "pa_bankname" placeholder="은행 명을 입력해주세요." required="required"></li>
		<li>계좌 번호</li>
		<li><input type = "text" name = "pa_no" placeholder="'-' 없이 번호만 입력해주세요." required="required"></li>
		<li>예금주 명</li>
		<li><input type = "text" name = "pa_username" placeholder="계좌의 예금 주 이름을 입력해주세요." required="required"></li>
	</ul>
	<input type = "button" value = "등록하기" onclick = "javascript:paymentAddCheck(true);">
	<input type = "button" value = "나중에 작성하기" onclick = "javascript:paymentAddCheck(false);">
</form>

</body>
</html>