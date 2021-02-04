<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.profileIMG { width:300px; height:300px;  border-radius: 50%; overflow: hidden; margin-bottom: 50px;}
.profileIMG img { width:300px; height:300px; object-fit: cover; background-color:lightgray;}
</style>

<script>
function mypagePwdUpdate(){
	location.href='mypagePwdUpdateForm.do';
}
function mypageAddrUpdate(){
	window.open('mypageAddrUpdateForm.do?mem_id=${sessionScope.sid}','addrUpdate','width=550,height=300');
}
function mypageEmailUpdate(){
	window.open('mypageEmailUpdateForm.do?mem_id=${sessionScope.sid}','emailUpdate','width=550,height=300');
}
function mypagePhoneUpdate(){
	window.open('mypagePhoneUpdateForm.do?mem_id=${sessionScope.sid}','emailUpdate','width=550,height=300');
}
</script>

</head>
<body>
	<%@include file="../header2.jsp"%>
	<%@include file="./mypageSideMenu.jsp" %>
	<div style="margin-left: 250px; padding: 1px 16px;">
	<br>
	<h3>${sessionScope.sname }님의 프로필</h3>
	<hr>
	<br>
	<div class="profileIMG">
			 <img src="/zipcok/upload/member/${cdto.mfile_upload}"  width="250px" height="250px" alt="">
	</div>
	
		<div>
			<label>이름 : ${dto.mem_name }<input type="hidden"
				name="mem_name" value="${dto.mem_name }"></label>
		</div>
		<div>
			<label>생년월일 : ${dto.mem_birth }<input type="hidden"
				name="mem_birth" value="${dto.mem_birth }"></label>
		</div>
		<div>
			<label>아이디 : ${dto.mem_id }<input type="hidden" name="mem_id"
				value="${dto.mem_id }"></label>
		</div>
		<div>
			<label>비밀번호 : ****<input type="hidden" name="mem_pwd"
				value="${dto.mem_pwd }"></label> <input type="button" value="수정하기" onclick="mypagePwdUpdate()">
		</div>
		<div>
			<label>주소 : ${dto.mem_addr } ${dto.mem_detailaddr }
				<input type="hidden" name="mem_zipcode" value="${dto.mem_zipcode }">
				<input type="hidden" name="mem_addr" value="${dto.mem_addr }">
				<input type="hidden" name="mem_detailaddr"value="${dto.mem_detailaddr }">
			</label>
			<input type="button"value="수정하기" onclick="mypageAddrUpdate()">
		</div>
		<div>
			<label>이메일 : ${dto.mem_email } <input type="hidden"
				name="mem_email" value="${dto.mem_email }"></label> <input
				type="button" value="수정하기" onclick="mypageEmailUpdate()">
		</div>
		<div>
			<label>전화번호 : ${dto.mem_phone } <input type="hidden"
				name="mem_phone" value="${dto.mem_phone }"></label> <input
				type="button" value="수정하기" onclick="mypagePhoneUpdate()">
		</div>
		<div>
		<a href="#">[회원탈퇴]</a> <!-- memberDeleteForm.do?mem_id=${sessionScope.sid}'  --> 
		</div>
	</div>
</body>
</html>