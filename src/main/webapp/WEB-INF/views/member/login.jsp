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
					<div style="font-size: 60px; color: #257cda; font-weight : 900;">집 콕 헬 스
					</div>
					<br>
					<div class="login-input-wrap">
						<input type="text" name="mem_id" value="${cookie.saveid.value}"
							placeholder="아이디"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input type="password" name="mem_pwd" placeholder="비밀번호"></input>
					</div>
					<div class="login-button-wrap">
						<button type="submit">로 그 인</button>
					</div>
					<div class="login-stay-sign-in">
						<span> <input type="checkbox" name="saveid" value="on"
							${empty cookie.saveid.value?'':'checked' }>&nbsp;
							아이디 저장
						</span>
					</div>
				</section>
			</form>
			<section class="Easy-sgin-in-wrap">
				<p class="forget-msg">
					<a href="idFindForm.do">아이디 찾기</a> / <a href="pwdFindForm.do">비밀번호 찾기
					</a> / <a href="memberJoinForm.do">회원가입</a>
				</p>
			</section>
		</div>
	</div>
	<%@include file="../_include/footer.jsp"%>
</body>
</html>