<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<script>
function backPage(){
	location.href='memberProfileForm.do';
}
</script>
<script type="text/javascript">
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;

$(document).ready(function() {
   var address = $('#mem_detailaddr');
   
 
     $('form').on('submit',function(){
         var inval_Arr = new Array(8).fill(false);
        
         if (($('#mem_pwd').val() == ($('#mem_pwd2').val()))
               && pwJ.test($('#mem_pwd').val())) {
            inval_Arr[1] = true;
         } else {
            inval_Arr[1] = false;
            alert('비밀번호를 확인하세요.');
            return false;
         }
              
       });


   $('#mem_pwd').blur(function() {
      if (pwJ.test($('#mem_pwd').val())) {
         console.log('true');
         $('#pw_check').text('');
      } else {
         console.log('false');
         $('#pw_check').text('4~12자의 숫자 , 문자가 아닙니다.');
         $('#pw_check').css('color', 'red');
      }
   });

   //1~2 패스워드 일치 확인
   $('#mem_pwd2').blur(function() {
      if ($('#mem_pwd').val() != $(this).val()) {
         $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
         $('#pw2_check').css('color', 'red');
      } else {
         $('#pw2_check').text('');
      }
   });

});

</script>
</head>
<body>
	<%@include file="../_include/head.jsp" %>
	<%@include file="../header2.jsp"%>
	<div class="mypage_wrap">
	<%@include file="./mypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main">
	<h2>회원탈퇴</h2>
	<br>
		<form action="memberDelete.do">
			<input type="hidden" name="mem_id" value="${sessionScope.sid }">
			<div class="col-sm-3 col-md-offset-3">
				<div class="form-group">
					<label for="pw">현재 비밀번호</label> <input type="password"
						class="form-control" id="mem_pwd" name="mem_pwd"
						placeholder="PASSWORD">
					<div class="eheck_font" id="pw_check"></div>
				</div>


				<div class="form-group">
					<label for="pw2">현재 비밀번호 확인</label> <input type="password"
						class="form-control" id="mem_pwd2" name="mem_pwd2"
						placeholder="Confirm Password">
					<div class="eheck_font" id="pw2_check"></div>
				</div>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">탈퇴하기</button>
					<input type="button" class="btn btn-primary" value="돌아가기" onclick="backPage()">
				</div>
			</div>
		</form>
</div>
</div>
</div>
   <%@include file="../_include/footer.jsp" %>
</body>
</html>