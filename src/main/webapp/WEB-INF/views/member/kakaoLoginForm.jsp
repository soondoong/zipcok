<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakako.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init("cd8daaff19cb8599e035f36bc6c19666");

function kakaoLogin(){
	window.Kakao.Auth.login({
		scope:'profile, account_email,gender,birthday',
		success : function(authObj){
			console.log(authObj);
			window.Kakao.API.request({	
				url:'/v2/user/me',
				sucess : res => {
					const kakao_account = res.kakako_account;
					console.log(kakao_account);
				}
			});
		}
	});
}
</script>
</head>
<body>
<a href="javascript:kakaoLogin();">카카오로그인</a>
</body>
</html>