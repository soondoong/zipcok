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
var address = $('#mem_detailaddr');

$(document).ready(function() {
   var address = $('#mem_detailaddr');
   
 
     $('form').on('submit',function(){
         var inval_Arr = new Array(8).fill(false);
       
         //주소확인
         if(address.val() == ''){
            inval_Arr[7] = false;
            alert('주소를 확인하세요.');
            return false;
         }else
            inval_Arr[7] = true;
      
       });

});

//우편번호 찾기 버튼 클릭시 발생 이벤트
function execPostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);
         /*      var a = console.log(data.zonecode);
            var b = console.log(fullRoadAddr);
            
            if(a == null || b = null){
               alert("주소를 확인하세요.");
               return false;
            }   */
            
            
            $("[name=mem_zipcode]").val(data.zonecode);
            $("[name=mem_addr]").val(fullRoadAddr);
            
            document.getElementById('mem_zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('mem_addr').value = fullRoadAddr;

            //document.getElementById('mem_detailaddr').value = data.jibunAddress; 
        }
     }).open();
 }
</script>

</head>

<body>
	<article>
		<form action="coachMypageAddrUpdate.do">
			<h4>주소변경</h4>
			<hr>
			<div class="col-sm-3 col-md-offset-3">
			
				<div class="form-group">
					<input class="form-control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="mem_zipcode" id="mem_zipcode" type="text"
						readonly="readonly">
					<button type="button" class="btn btn-default"
						style="background-color: cornflowerblue; color: white; line-height: 1.20;"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>


				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="mem_addr" id="mem_addr" type="text" readonly="readonly" />
				</div>


				<div class="form-group">
					<input class="form-control" placeholder="상세주소"
						name="mem_detailaddr" id="mem_detailaddr" type="text" />
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<input type="button" class="btn btn-primary" value="취소"  onclick="popupClose()">
				</div>
			</div>
		</form>
	</article>
</body>
</html>