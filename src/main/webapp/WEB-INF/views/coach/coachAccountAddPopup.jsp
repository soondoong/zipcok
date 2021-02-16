<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<body>
<style>
.payment_container {width:600px; height:400px; margin:100px auto; vertical-align: middle;}
.payment_container .payment_info input[type=text] {width:300px; }
</style>
<div class = "payment_container">
	<h1>코치 결제 계좌 등록</h1>
	<div class = "payment_info">
		<form id = "paymentAddForm" action = "coachAccountAdd.do" method = "post">
		<input type = "hidden" name = "hg_mem_id" value = "${sessionScope.sid }">
		<input type = "hidden" name = "pa_key" value = "코치">
			<ul>
				<li>은행 명</li>
				<li><input type = "text" name = "pa_bankname" placeholder="은행 명을 입력해주세요." required="required"></li>
				<li>계좌 번호</li>
				<li><input type = "text" name = "pa_no" placeholder="'-' 없이 번호만 입력해주세요." required="required"></li>
				<li>예금주 명</li>
				<li><input type = "text" name = "pa_username" placeholder="계좌의 예금 주 이름을 입력해주세요." required="required"></li>
			</ul>
			<input type = "submit" class = "btn btn-primary btn-lg" value = "등록하기" >
		</form>
	</div>
</div>

</body>
</html>