<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pwdUpdate-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}
.pwdUpdate-button-wrap button{
	width: 250px;
	height :48px;
	font-size: 18px;
	background: #257cda;
	color: white;
	border: solid 1px #257cda;
	border-radius: 5px;
	margin : 15px 0 15px 0;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

window.alert('${msg}');

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
         $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
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

<script>
function backPage(){
	location.href='index.do';
}
</script>


</head>
<body>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp"%>
<br><br><br>
<div class="pwdUpdate-container" style="height: 590px;">
	<article>
	<h2 align="center">비밀번호 수정</h2>
	<br>
		<form action="pwdUpdate.do">
		<c:set var="id" value="${mem_id }"></c:set>
			<input type="hidden" name="mem_id" value="${id }">
			<div class="col-sm-12 col-md-offset-3">
				<div class="form-group">
					<label for="pw">새 비밀번호</label> <input type="password"
						class="form-control" id="mem_pwd" name="mem_pwd"
						placeholder="PASSWORD">
					<div class="eheck_font" id="pw_check"></div>
				</div>


				<div class="form-group">
					<label for="pw2">새 비밀번호 확인</label> <input type="password"
						class="form-control" id="mem_pwd2" name="mem_pwd2"
						placeholder="Confirm Password">
					<div class="eheck_font" id="pw2_check"></div>
				</div>
				<div class="pwdUpdate-button-wrap">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<button type="button" class="btn btn-primary" onclick="backPage()">메인으로</button>
				</div>
			</div>
		</form>
	</article>
	</div>
	 <%@include file="../_include/footer.jsp" %>
</body>
</html>