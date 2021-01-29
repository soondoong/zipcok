<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function popupClose(){
	window.self.close();
}
</script>

<script type="text/javascript">

//모든 공백 체크 정규식
var empJ = /\s/g;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

$(document).ready(function() {
 
     $('form').on('submit',function(){
         var inval_Arr = new Array(8).fill(false);
        
         // 이메일 정규식
         if (mailJ.test($('#mem_email').val())){
            console.log(phoneJ.test($('#mem_email').val()));
            inval_Arr[4] = true;
         } else {
            inval_Arr[4] = false;
            alert('이메일을 확인하세요.');
            return false;
         }
              
       });

   $("#mem_email").blur(function() {
      if (mailJ.test($(this).val())) {
         $("#email_check").text('');
      } else {
         $('#email_check').text('이메일 양식을 확인해주세요.');
         $('#email_check').css('color', 'red');
      }
   });
         
});

</script>
</head>
<body>
	<article>
		<form action="mypageEmailUpdate.do">
			<h4>이메일 변경</h4>
			<hr>

			<div class="col-sm-3 col-md-offset-3">

				<div class="form-group">
					<label for="mem_email">변경할 이메일 주소</label> <input type="email"
						class="form-control" id="mem_email" name="mem_email"
						placeholder="E-mail">
					<div class="eheck_font" id="email_check"></div>
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">수정하기</button>
					<input type="button" class="btn btn-primary" value="취소"  onclick="popupClose()">
				</div>
			</div>
		</form>
	</article>
</body>
</html>