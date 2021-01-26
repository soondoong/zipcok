<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type='text/javascript'>
 
Kakao.init('bd21082a499aaa79b4c08e01935a8a70'); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
 
//카카오 로그인 버튼을 생성합니다. 
 
Kakao.Auth.createLoginButton({ 
    container: '#kakao-login-btn', 
    success: function(authObj) { //authObj가 참일때, 자료를 성공적으로 보냈을때 출력되는 부분
           Kakao.API.request({
 
               url: '/v1/user/me',
 
               success: function(res) { //res가 참일때, 자료를 성공적으로 보냈을때 출력되는 부분
 
                     console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
 
                     console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
 
                     console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
                             
                     // res.properties.nickname으로도 접근 가능 )
                     console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
          
         
          var kakaonickname = res.properties.nickname;    //카카오톡 닉네임을 변수에 저장
          var kakaoe_mail = res.properties.kaccount_email;    //카카오톡 이메일을 변수에 저장함
         
          
 
          //카카오톡의 닉네임과,mail을 url에 담아 같이 페이지를 이동한다.
          window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/hansub_project/home?kakaonickname="+kakaonickname+"&kakaoe_mail="+kakaoe_mail);
      
                   }
                 })
               },
               fail: function(error) { //에러 발생시 에러 메시지를 출력한다.
                 alert(JSON.stringify(error));
               }
             });
</script>
</head>
<body>
	<%@include file="../header2.jsp"%>
	<br>
	<br>
	<br>
	<h2>로그인</h2>
	<form action="login.do">
		<div>
			<div>
				<input type="text" name="mem_id" value="${cookie.saveid.value}"
					placeholder="ID">
			</div>
			<div>
				<input type="password" name="mem_pwd" placeholder="Password">
			</div>
			<div>
				<input type="checkbox" name="saveid" value="on"
					${empty cookie.saveid.value?'':'checked' }> ID Save
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="submit" value="로그인">
			</div>
			<div>
				<a href="#">ID Find</a> / <a href="#">Pwd Find</a>
			</div>
			
			<div>
<a id="kakao-login-btn"></a> //버튼의 id를 정함
<a href="http://developers.kakao.com/logout"></a> 
			</div>
		</div>
	</form>
</body>
</html>