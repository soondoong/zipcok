<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header2.jsp" %>
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
<input type = "button" value = "결제하기">
<input type = "button" value = "돌아가기">
</body>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</html>