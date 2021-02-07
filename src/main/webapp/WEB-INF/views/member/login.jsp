<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/member/login.css">
</head>
<body>
	<%@include file="../_include/head.jsp"%>
	<%@include file="../header2.jsp"%>

	<!--
	<h2>로그인</h2>
	<div class="main-container">
		<div class="main-wrap">
			<section class="login-input-section-wrap">
				<form action="login.do">
					<div>
						<div class="login-input-wrap">
							<input type="text" name="mem_id" value="${cookie.saveid.value}"
								placeholder="ID">
						</div>
						<div class="login-input-wrap password-wrap">
							<input type="password" name="mem_pwd" placeholder="Password">
						</div>

						<div class="login-button-wrap">
							<input type="submit" value="로그인">
						</div>

						<div class="login-stay-sign-in">
							<input type="checkbox" name="saveid" value="on"
								${empty cookie.saveid.value?'':'checked' }> ID Save
						</div>

						<div>
							<a href="idFindForm.do">ID Find</a> / <a href="pwdFindForm.do">Pwd
								Find</a> <a href="kakaoLoginForm.do">카카오테스트</a>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>
	-->
	
	
	<div class="login-main-container" style="height: 660px;">
		<div class="login-main-wrap">
			<form action="login.do">
				<section class="login-input-section-wrap">
					<div style="font-size: 60px; color: deepskyblue;">Z I P C O K
					</div>
					<br>
					<div class="login-input-wrap">
						<input type="text" name="mem_id" value="${cookie.saveid.value}"
							placeholder="ID"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input type="password" name="mem_pwd" placeholder="PASSWORD"></input>
					</div>
					<div class="login-button-wrap">
						<button type="submit">Sign in</button>
					</div>
					<div class="login-stay-sign-in">
						<span> <input type="checkbox" name="saveid" value="on"
							${empty cookie.saveid.value?'':'checked' }>&nbsp; Stay
							Signed in
						</span>
					</div>
				</section>
			</form>
			<section class="Easy-sgin-in-wrap">
				<p class="forget-msg">
					<a href="idFindForm.do">ID Find</a> / <a href="pwdFindForm.do">Pwd
						Find</a> / <a href="memberJoinForm.do">Sign up</a>
				</p>
			</section>
		</div>
	</div>
	<%@include file="../_include/footer.jsp"%>
</body>
</html>