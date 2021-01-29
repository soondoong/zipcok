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
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/

	$(document).ready(function() {

		$('form').on('submit', function() {
			var inval_Arr = new Array(8).fill(false);

			// 휴대폰번호 정규식
			if (phoneJ.test($('#mem_phone').val())) {
				console.log(phoneJ.test($('#mem_phone').val()));
				inval_Arr[5] = true;
			} else {
				inval_Arr[5] = false;
				alert('휴대폰 번호를 확인하세요.');
				return false;
			}

		});

		// 휴대전화
		$('#mem_phone').blur(function() {
			if (phoneJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해주세요 ');
				$('#phone_check').css('color', 'red');
			}
		});
	});
</script>
</head>
<body>
	<article>
		<form action="mypagePhonUpdate.do">
			<h4>전화번호 변경</h4>
			<hr>
			<div class="col-sm-3 col-md-offset-3">

				<div class="form-group">
					<label for="mem_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label><br> <input
						type="tel" class="form-control" id="mem_phone" name="mem_phone"
						placeholder="Phone Number">
					<div class="eheck_font" id="phone_check">
						<input type="button" class="btn btn-default"
							style="background-color: cornflowerblue; color: white; line-height: 1.20;"
							value="인증번호전송"><br> <input class="form-control"
							style="width: 40%; display: inline;" placeholder="인증번호"
							name="mem_phoneOk" id="mem_phoneOk" type="text"> <input
							type="button" class="btn btn-default"
							style="background-color: cornflowerblue; color: white; line-height: 1.20;"
							value="인증">
					</div>


					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">수정하기</button>
						<input type="button" class="btn btn-primary" value="취소"  onclick="popupClose()">
					</div>
				</div>
			</div>
		</form>
	</article>
</body>
</html>