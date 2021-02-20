<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<script>
/*주소*/
function addrshowPopup(hasFilter) {
	const popup = document.querySelector('#popup');
  
  if (hasFilter) {
  	popup.classList.add('has-filter');
  } else {
  	popup.classList.remove('has-filter');
  }
  
  popup.classList.remove('hide');
}

function addrclosePopup() {
	const popup = document.querySelector('#popup');
  popup.classList.add('hide');
}

/*이메일*/
function phoneshowPopup(hasFilter) {
	const popup = document.querySelector('#popup2');
  
  if (hasFilter) {
  	popup.classList.add('has-filter');
  } else {
  	popup.classList.remove('has-filter');
  }
  
  popup.classList.remove('hide2');
}

function phoneclosePopup() {
	const popup = document.querySelector('#popup2');
  popup.classList.add('hide2');
}



/*비밀번호*/
function pwdshowPopup(hasFilter) {
	const popup = document.querySelector('#popup3');
  
  if (hasFilter) {
  	popup.classList.add('has-filter');
  } else {
  	popup.classList.remove('has-filter');
  }
  
  popup.classList.remove('hide3');
}

function pwdclosePopup() {
	const popup = document.querySelector('#popup3');
  popup.classList.add('hide3');
}



/*이메일*/
function emailshowPopup(hasFilter) {
	const popup = document.querySelector('#popup4');
  
  if (hasFilter) {
  	popup.classList.add('has-filter');
  } else {
  	popup.classList.remove('has-filter');
  }
  
  popup.classList.remove('hide4');
}

function emailclosePopup() {
	const popup = document.querySelector('#popup4');
  popup.classList.add('hide4');
}
</script>




<style>

#popup { display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, .7);z-index: 1; }
#popup.hide { display: none; }
#popup.has-filter { backdrop-filter: blur(4px); -webkit-backdrop-filter: blur(4px); }
#popup .content { padding: 20px; background: #fff; border-radius: 5px; box-shadow: 1px 1px 3px rgba(0, 0, 0, .3); width : 550px; }


#popup2 { display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, .7);z-index: 1; }
#popup2.hide2 { display: none; }
#popup2.has-filter { backdrop-filter: blur(4px); -webkit-backdrop-filter: blur(4px); }
#popup2 .content2 { padding: 20px; background: #fff; border-radius: 5px; box-shadow: 1px 1px 3px rgba(0, 0, 0, .3); width : 550px; }


#popup3 { display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, .7);z-index: 1; }
#popup3.hide3 { display: none; }
#popup3.has-filter { backdrop-filter: blur(4px); -webkit-backdrop-filter: blur(4px); }
#popup3 .content3 { padding: 20px; background: #fff; border-radius: 5px; box-shadow: 1px 1px 3px rgba(0, 0, 0, .3); width : 550px; }


#popup4 { display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, .7);z-index: 1; }
#popup4.hide4 { display: none; }
#popup4.has-filter { backdrop-filter: blur(4px); -webkit-backdrop-filter: blur(4px); }
#popup4 .content4 { padding: 20px; background: #fff; border-radius: 5px; box-shadow: 1px 1px 3px rgba(0, 0, 0, .3); width : 550px; }


/**/
.mypage_contents .reupload {
	position: relative;
	top: -77px;
	left: 359px;
	background-color: #b7b7b7;
	font-size: 23px;
	text-align: center;
	padding: 12px;
	color: white;
	border-radius: 50%;
}

#file {
	display: none;
}

.titlee {
	
	color: #12151d;
	margin-bottom: 20px;
}

.titlee:before {
	content: "";
	display: inline-block;
	background-color: #257cda;
	width: 11px;
	height: 41px;
}

.titlee hr {
	border-top: 1px solid #d1d1d4;
	margin-bottom: 30px;
}

/*일반프로필 css*/
.pfDIV {
	height: 360px;
	margin-top: 30px;
}

.nomalInfo {
	padding: 0 0 50px 40px;
}

.nomalInfo div {
	width: 500px;
	padding: 15px 0;
	font-size: 19px;
	border-bottom: 1px solid #e4e4e4;
}

.nomalInfo div span {
	font-weight: 550;
	padding-right: 50px;
}

.rebtn {
	width: 50px;
	margin: 4px 0 0 10px;
	height: 20px;
	font-size: 12px;
	border: 0px;
	border-radius: 5px;
	background-color: #e4e4e4;
}
</style>


<script src="https://kit.fontawesome.com/802041d611.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<%@include file="../header2.jsp"%>

	<div class="mypage_wrap">
		<%@include file="./mypageSideMenu.jsp"%>

		<div class="mypage_contents">
			<div class="mypage_main">
				<div class="nomalAllWrap">

					<h2 class="titlee">&nbsp;기본 프로필</h2>
					<hr>

					<form id="uploadForm" enctype="multipart/form-data" method="POST"
						action="moProfileImgReUpload.do">
						<div class="pfDIV">
							<div class="profileIMG">
								<img src="/zipcok/upload/member/${cdto.mfile_upload}">
							</div>
							<!-- 프로필사진 수정 -->
							<a href="#" id="a-upload"><i class="fas fa-camera reupload"></i></a>
							<input type="file" id="file" name="upload"
								onchange="changeValue(this)"
								accept="image/gif, image/jpeg, image/png" /> <input
								type="hidden" name="id" value="${login.mem_id }">
						</div>
					</form>
					<!-- 프로필사진 수정 -->
					<script type="text/javascript">
						$(function() { //사진수정버튼

							$('#a-upload').click(function(e) {
								e.preventDefault();
								$('#file').click();
							});
						});
						function changeValue(obj) { //사진선택하면
							var fileValue = $("#file").val().split("\\");
							var fileName = fileValue[fileValue.length - 1]; // 파일명
							var result = confirm(fileName + "사진으로 변경하시겠습니까?");
							if (result) {
								$('#uploadForm').submit();
							}

						}
					</script>

					<div class="nomalInfo">
						<div class="name">
							<span>이름</span>${dto.mem_name }<input type="hidden"
								name="mem_name" value="${dto.mem_name }">
						</div>
						<div>
							<span>생년월일</span>${dto.mem_birth }<input type="hidden"
								name="mem_birth" value="${dto.mem_birth }">
						</div>
						<div>
							<span>아이디</span>${dto.mem_id }<input type="hidden"
								name="mem_id" value="${dto.mem_id }">
						</div>
						<div>
							<span>비밀번호</span>****<input type="hidden" name="mem_pwd"
								value="${dto.mem_pwd }"><input type="button"
								value="수정" class="rebtn" onclick="pwdshowPopup(true)">
						</div>
						<div>
							<span>주소</span><input type="button" value="수정" class="rebtn" onclick="addrshowPopup(true)">
							<p>${dto.mem_addr }<br>${dto.mem_detailaddr }</p>
							<input type="hidden" name="mem_zipcode" value="${dto.mem_zipcode }">
							<input type="hidden" name="mem_addr" value="${dto.mem_addr }">
							<input type="hidden" name="mem_detailaddr"value="${dto.mem_detailaddr }">
								
						</div>
						<div>
							<span>이메일</span>${dto.mem_email } <input type="hidden"
								name="mem_email" value="${dto.mem_email }">
								<input type="button" value="수정" class="rebtn" onclick="emailshowPopup(true)">
						</div>
						<div>
							<span>전화번호</span>${dto.mem_phone } <input type="hidden"
								name="mem_phone" value="${dto.mem_phone }"><input
								type="button" value="수정" class="rebtn" onclick="phoneshowPopup(true)">
						</div>
						<div style="text-align: right;">
							<a href="#">[회원탈퇴]</a>
							<!-- memberDeleteForm.do?mem_id=${sessionScope.sid}'  -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
<!-- 주소변경 팝업 테스트 -->
<div id="popup" class="hide">
  <div class="content">
    <article>
		<form id="addrForm" action="mypageAddrUpdate.do">
		<div class="member-profile-container">
			
			<div class="col-sm-20 col-md-offset-3">
			<h4>주소변경</h4>
			<hr>
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
						name="mem_detailaddr" id="mem_detailaddr" type="text" required="required"/>
				</div>
				<br>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<button type="button" class="btn btn-primary" onclick="addrclosePopup()">닫기</button>
				</div>
			</div>
			</div>
		</form>
	</article>
    
  </div>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
var address = $('#mem_detailaddr');

$(document).ready(function() {
   var address = $('#mem_detailaddr');
   
 
     $('#addrForm').on('submit',function(){
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



<!-- 휴대전화 테스트 -->
<div id="popup2" class="hide2">
  <div class="content2">
    <article>
		<form id="phoneForm" action="mypagePhoneUpdate.do">
			<h4>전화번호 변경</h4>
			<hr>
			<div class="col-sm-20 col-md-offset-3">

				<div class="form-group">
					<label for="mem_phone">변경하실 휴대폰 번호('-'없이 번호만 입력해주세요)</label><br> <input
						type="tel" class="form-control" id="mem_phone" name="mem_phone"
						placeholder="Phone Number">
					<div class="eheck_font" id="phone_check">
						<input type="button" class="btn btn-default"
							style="background-color: cornflowerblue; color: white; line-height: 1.20;"
							value="인증번호전송" onclick="sendphone()"><p></p> <input class="form-control"
							style="width: 40%; display: inline;" placeholder="인증번호"
							name="mem_phoneOk" id="mem_phoneOk" type="text"> <input
							type="button" class="btn btn-default"
							style="background-color: cornflowerblue; color: white; line-height: 1.20;"
							 id="checkBtn" value="인증하기">
					</div>

				
					<div class="form-group mt-5" style="text-align : center;">
						<button type="submit" class="btn btn-primary">변경하기</button>
						<button type="button" class="btn btn-primary" onclick="phoneclosePopup()">닫기</button>
					</div>
				</div>
			</div>
		</form>
	</article>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/

	$(document).ready(function() {

		$('phoneForm').on('submit', function() {
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

		     
	         /*폰인증조건-수연*/
	         if($('#mem_phone').is('[readonly]')){
	         		return true;
	         }else{
	        	 alert("휴대폰 본인인증을 진행해주세요");
	        	 return false;
	         }
			
			
			
			
		});

	});

function sendphone(){
	 var phoneNumber = $('#mem_phone').val();
	
	var sendData =	 {"phoneNumber" : phoneNumber };
	 // alert('문자보낼게' ); 	    
	    	$.ajax({
	        	
	            url :"sendSms.do",
	            type :"POST",
	            data :sendData,
	            success : function(data) {
	            	   $('#checkBtn').click(function(){
	                        if($.trim(data) ==$('#mem_phoneOk').val()){
	                           alert('인증에 성공하였습니다.' );
	                           $('#mem_phone').attr('readonly',true);
	                        }else{
	                      	  alert('인증실패');	
	                        }	     
	                      });
	    				},
	           error: function(data) { 
	            	alert('error');
	            }

	        });
	    			
}	

</script>


<!-- 비밀번호 테스트 -->
<div id="popup3" class="hide3">
  <div class="content3">
    <article>
	<h2>비밀번호 수정</h2>
	<hr>
		<form id="pwdForm" action="mypagePwdUpdate.do">
			<input type="hidden" name="mem_id" value="${sessionScope.sid }">
			<div class="col-sm-20 col-md-offset-3">
				<div class="form-group">
					<label for="pw">새 비밀번호</label> <input type="password"
						class="form-control" id="mem_pwd" name="mem_pwd"
						placeholder="PASSWORD" required="required">
					<div class="eheck_font" id="pw_check"></div>
				</div>


				<div class="form-group">
					<label for="pw2">새 비밀번호 확인</label> <input type="password"
						class="form-control" id="mem_pwd2" name="mem_pwd2"
						placeholder="Confirm Password" required="required">
					<div class="eheck_font" id="pw2_check"></div>
				</div>
				<br>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<button type="button" class="btn btn-primary" onclick="pwdclosePopup()">닫기</button>
				</div>
			</div>
		</form>
		</article>
	</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<script type="text/javascript">
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;

$(document).ready(function() {

     $('pwdForm').on('submit',function(){
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




<!-- 이메일 테스트 -->
<div id="popup4" class="hide4">
  <div class="content4">
<article>
		<form name="emailUpdateForm" id="emailForm" action="mypageEmailUpdate.do">
			<h4>이메일 변경</h4>
			<hr>
			<div class="col-sm-20 col-md-offset-3">

				<div class="form-group">
					<label for="mem_email">변경할 이메일 주소</label> <input type="email"
						class="form-control" id="mem_email" name="mem_email"
						placeholder="E-mail" required="required">
					
               <div class="eheck_font" id="email_check"></div>
				</div>

				<div class="form-group mt-5" style="text-align : center;">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<button type="button" class="btn btn-primary" onclick="emailclosePopup()">닫기</button>
				</div>
			</div>
		</form>
	</article>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

//모든 공백 체크 정규식
var empJ = /\s/g;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

$(document).ready(function() {

	/*이메일*/
	$("#mem_email").blur(function() {
	       if($('#mem_email').val()==''){
	          $('#email_check').text('이메일을 양식을 확인해주세요.');
	          $('#email_check').css('color', 'red');                     
	   
	          }else { 
	             showTwo();
	          }
	});
	
     $('emailForm').on('submit',function(){
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
});
</script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript">
/*2021-02-19 이메일중복체크 추가*/
function showTwo(){
	   var mem_email=document.emailUpdateForm.mem_email.value;
	   var params='mem_email='+mem_email;
	   sendRequest('emailConfirm.do',params,showResultTwo,'GET');
	}
	function showResultTwo(){
	   if(XHR.readyState==4){
	      if(XHR.status==200){
	         var data2=XHR.responseText;
	         data2=eval('('+data2+')');
	         var result2=data2.result2;
	         
	         var msg='';
	         
	         if(result2 >0){
	            msg='중복된 이메일입니다.';
	            $('#email_check').text(msg);
	            $('#email_check').css('color', 'red');
	         }else{
	            msg='사용가능한 이메일입니다.';
	            $('#email_check').text(msg);
	            $('#email_check').css('color', 'blue');
	         }
	           
	      }
	   }
	}

</script>
	<%@include file="../_include/footer.jsp"%>
</body>
</html>