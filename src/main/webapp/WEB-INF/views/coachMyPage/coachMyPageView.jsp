<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"> 
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<!-- 병모 팝업 수정 함수 -->
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


/*주소 (코치버전)*/
function addrshowPopupCoach(hasFilter) {
		const popup = document.querySelector('#popupCoach');
		  
		  if (hasFilter) {
		  	popup.classList.add('has-filter');
		  } else {
		  	popup.classList.remove('has-filter');
		  }
		  
		  popup.classList.remove('hide');
}

function addrclosePopupCoach() {
	const popup = document.querySelector('#popupCoach');
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
<!-- 병모 팝업 함수 끝 -->

</head>
<body>
<%@include file="../header2.jsp"%>
<style>
.mypage_contents .reupload{position: relative; top:-77px; left:359px; background-color: #b7b7b7; 
font-size:23px; text-align: center; padding:12px;color:white; border-radius: 50%;}
#file{display:none;}
.titlee{ color:#12151d; margin-bottom:20px;}
.titlee:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }
.titlee hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}

/*일반프로필 css*/
.pfDIV{ height:360px; margin-top:30px;}
.nomalInfo{ padding: 0 0 50px 40px;}
.nomalInfo div{width: 500px; padding: 15px 0; font-size: 19px; border-bottom:1px solid #e4e4e4;}
.nomalInfo div span{ font-weight: 550; padding-right: 50px;}
.rebtn{width:50px; margin:4px 0 0 10px; height:20px; font-size: 12px; border: 0px; border-radius: 5px; background-color: #e4e4e4;}
.okbtn{width: 100px; margin:0; height: 30px; font-weight:bold; font-size:15px;  border: 0px; border-radius: 5px; color:white;background-color:#257cd6;}
/*코치프로필 css*/
.coachInfo{width:500px;flex-direction: row; margin-left:100px;}
/*커리큘럼css*/
    .nocurriWrap{display:flex; width:400px; margin-top:20px;}
	.catenameDiv .catename{font-size:17px;font-weight: bold;} 
	.currimore{cursor: pointer;margin-right: 10px;}
	.currimore .curriP {padding-left:20px;font-size:18px;color:#20208a;}
	.showinputs{display:none;}
	.showinputs input{ width: 300px;}
	.showinputs textarea{ width: 300px; height: 100px;}
    .showinputs ol,.showinputs li{ list-style: decimal;width: 300px; }
    .showinputs li{ margin-top:15px;}
    .plusbtn,.minusbtn{font-size:20px; color: #257cd6; margin:5px 0 0 5px; cursor: pointer;}
	.minusbtn{font-size:21px; margin-left:3px; color:#ce0c0c;}
	.plusbtn span{font-size:15px;  }
	.currititle{display:inline-block;}
	.curriesInputAll{display:block; border:0px;  border-radius: 5px; padding: 0 15px; width: 300px; font-weight: 400; font-size: 14px;}
	.curriOneDIV .curri_name_input{margin:13px 0 12px 0; font-size: 17px; font-weight:bold; }
	.curriOneDIV .curri_content_input{margin:0 0 25px 0; font-size: 14px; width: 300px; }

/*readonly수정되는 인풋들*/

.coachInfo input[type="text"]:not(.cnginputs),textarea:not(.cnginputs){background-color:  white; border:0px;}
/*코치소개사진*/
.lastimgDiv{ color:#12151d; margin-bottom:20px;}
.lastimgDiv:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }
.coachmypage_main hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}
/* 병모 팝업 수정css */

#popup,#popupCoach { display: flex; justify-content: center; align-items: center; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, .7);z-index: 1; }
#popup.hide,#popupCoach.hide { display: none; }
#popup.has-filter,#popupCoach.has-filter { backdrop-filter: blur(4px); -webkit-backdrop-filter: blur(4px); }
#popup .content,#popupCoach .content { padding: 20px; background: #fff; border-radius: 5px; box-shadow: 1px 1px 3px rgba(0, 0, 0, .3); width : 550px; }


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
</style>
<!-- 병모 팝업 수정css 끝-->



<c:set var="dto" value="${resultMap.coachDTO }"/>
<c:set var="file" value="${resultMap.coachFileList }"/>
<c:set var="curri" value="${resultMap.curriList }"/>
<c:set var="review" value="${resultMap.reviewList }"/>
<c:set var="oneList" value="${oneCurriList}"/>
<c:set var="twoList" value="${twoCurriList }"/>	
<c:set var="mdto" value="${mdto }"></c:set>
<c:set var="catelist" value="${catelist }"/>
<div class="mypage_wrap">	
<%@include file="./coachMypageSideMenu.jsp"%>
<!-- 프로필 본문-->
<div class="mypage_contents">
<div >	
	<div class="mypage_main coachmypage_main">		
	<div class="nomalAllWrap">
		<h2  class="titlee">&nbsp;기본 프로필</h2>
		<p>회원프로필사진은 코치프로필 사진으로 사용됩니다</p>
		 <hr>	
		 
		<form id="uploadForm" enctype="multipart/form-data" method="POST" action="profileImgReUpload.do">
			<div class="pfDIV">
			<!-- 프로필사진 수정 -->
				<div class="profileIMG">
					<!-- 프로필사진 수정 -->
					<img src="/zipcok/upload/member/${dto.mfile_upload }" >
				</div>				
				<a href="#" id="a-upload"><i class="fas fa-camera reupload" ></i></a>
					<input type="file" id="file" name="upload" onchange="changeValue(this)" accept="image/gif, image/jpeg, image/png"/>
					<input type="hidden" name="id" value="${login.mem_id }">				
			</div>	
							
		</form>
			
		<!-- 프로필사진 수정 -->
						
<!-- 일반프로필 시작 -->


<div class="nomalInfo">
		<div class="name">
			<span>이름</span>${mdto.mem_name }<input type="hidden" name="mem_name" value="${mdto.mem_name }">
		</div>
		
		<div>		
			<span id="birth">생년월일</span>${mdto.mem_birth }<input type="hidden" name="mem_birth" value="${mdto.mem_birth }">
		</div>
	
		<div>		
			<span>아이디</span>${mdto.mem_id }<input type="hidden" name="mem_id" value="${mdto.mem_id }">
		</div>
		
		<div>		
			<span>비밀번호</span>****<input type="hidden" name="mem_pwd"value="${mdto.mem_pwd }">
			<input type="button" value="수정"  class="rebtn" onclick="pwdshowPopup(false)">
		</div>
		 
		<div>		
			<span>주소</span><input type="button"value="수정" class="rebtn" onclick="addrshowPopup(false)">
			<p>${mdto.mem_addr } <br>${mdto.mem_detailaddr }</p>
				<input type="hidden" name="mem_zipcode" value="${mdto.mem_zipcode }">
				<input type="hidden" name="mem_addr" value="${mdto.mem_addr }">
				<input type="hidden" name="mem_detailaddr"value="${mdto.mem_detailaddr }">
			
			
		</div>
		
		<div>		
			<span>이메일</span>${mdto.mem_email } <input type="hidden"
				name="mem_email" value="${mdto.mem_email }"> <input type="button" value="수정" class="rebtn" onclick="emailshowPopup(false)">
		</div>
		
		<div>			
			<span>전화번호</span>${mdto.mem_phone } <input type="hidden"
				name="mem_phone" value="${mdto.mem_phone }"><input type="button" value="수정"  class="rebtn" onclick="phoneshowPopup(false)">
		</div>
		
		<div style="text-align: right;">
		<a href="#" >[회원탈퇴]</a> <!-- memberDeleteForm.do?mem_id=${sessionScope.sid}'  --> 
		</div>
		
	</div>
</div>



<!-- 주소변경 팝업 테스트 -->
<div id="popup" class="hide">
  <div class="content">
    <article>
		<form id="addrForm" action="coachMypageAddrUpdate.do">
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
						onclick="execPostCode('일반');">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>


				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="mem_addr" id="mem_addr" type="text" readonly="readonly" />
				</div>


				<div class="form-group">
					<input class="form-control" placeholder="상세주소"
						name="mem_detailaddr" id="mem_detailaddr" type="text" required="required" />
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
<!-- 병모주소변경팝업 -->

<!-- 코치주소변경팝업 -->
<div id="popupCoach" class="hide">
  <div class="content">
    <article>
		<form id="addrForm" action="coachAddrUpdate.do">
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
						onclick="execPostCode('코치');">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>


				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="coach_floc" id="coach_floc" type="text" readonly="readonly" />
				</div>


				<div class="form-group">
					<input class="form-control" placeholder="상세주소"
						name="coach_sloc" id=coach_sloc type="text" required="required" />
				</div>
				<br>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<button type="button" class="btn btn-primary" onclick="addrclosePopupCoach()">닫기</button>
				</div>
			</div>
			</div>
		</form>
	</article>
    
  </div>
</div>
<!-- 코치주소 변경팝업 -->





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
function execPostCode(key) {
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
            
            if(key =='일반'){
                
                $("[name=mem_zipcode]").val(data.zonecode);
                $("[name=mem_addr]").val(fullRoadAddr);
                           
                document.getElementById('mem_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_addr').value = fullRoadAddr;
            }else{
                
                $("[name=mem_zipcode]").val(data.zonecode);
                $("[name=coach_floc]").val(fullRoadAddr);
                           
                document.getElementById('mem_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('coach_floc').value = fullRoadAddr;
            }
       
          

            //document.getElementById('mem_detailaddr').value = data.jibunAddress; 
        }
     }).open();
 }
</script>



<!-- 휴대전화 테스트 -->
<div id="popup2" class="hide2">
  <div class="content2">
    <article>
		<form id="phoneForm" action="coachMypagePhoneUpdate.do">
			<h4>전화번호 변경</h4>
			<hr>
			<div class="col-sm-20 col-md-offset-3">

				<div class="form-group">
					<label for="mem_phone">변경하실 휴대폰 번호('-'없이 번호만 입력해주세요)</label><br> <input
						type="tel" class="form-control" id="mem_phone" name="mem_phone"
						placeholder="Phone Number" required="required">
					<div class="eheck_font" id="phone_check">
						<input type="button" class="btn btn-default"
							style="background-color: cornflowerblue; color: white; line-height: 1.20;"
							value="인증번호전송" onclick="sendphone()"><p></p> <input class="form-control"
							style="width: 40%; display: inline;" placeholder="인증번호"
							name="mem_phoneOk" id="mem_phoneOk" type="text" required="required"> <input
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
		<form id="pwdForm" action="coachMypagePwdUpdate.do">
			<input type="hidden" name="mem_id" value="${sessionScope.coachId }">
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
		<form name="emailUpdateForm" id="emailForm" action="coachMypageEmailUpdate.do">
			<h4>이메일 변경</h4>
			<hr>
			<div class="col-sm-20 col-md-offset-3">

				<div class="form-group">
					<label for="mem_email">변경할 이메일 주소</label> <input type="email"
						class="form-control" id="mem_email" name="mem_email"
						placeholder="E-mail">
					
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
<!-- 일반프로필영역 끝 -->


	<!-- 코치소개 영역 -->

		<div class="coachInfo">	
            <h2  class="titlee" >&nbsp;코치 프로필</h2>
            <p>센스있는 프로필일수록 매칭성공률이 높습니다!</p>
			<hr>			
		
	<style>
	.ptitle{font-size:20px; font-weight: 550;margin:0 0 10px 0; display: inline-block;}
	.coachdetails{margin:30px 0 0 30px;}
	.crebtn{margin: 4px 0 0 30px; }
	.upokbtn{width:60px;}
	.currititle{font-size:18px; font-weight: 400;}
	.acc{width: auto;}
	.bankname{width: 40px;}
	</style>				
						
			<div class="coachdetails">
					<div>
						<p class="ptitle">결제계좌정보</p><span class="accspan"><input type="button"value="수정" class="rebtn crebtn" onclick="accountUpdate()"></span>
						<p style="display: flex;">
						<input type="text"  class="bankname acc"  value="${accdto.pa_bankname }"  placeholder="은행 명을 입력해주세요."maxlength='5'  readonly="readonly">
						<input type="text" class="banknum acc"    value="${accdto.pa_no }"  placeholder="'-' 없이 번호만 입력해주세요."  maxlength='14'  readonly="readonly">
						<input type="text" class="accname acc"    value="${accdto.pa_username }"placeholder="계좌의 예금 주 이름을 입력해주세요."  maxlength='6' readonly="readonly"></p>
					</div>
					<div>
						<p class="ptitle">활동지역</p><input type="button"value="수정" class="rebtn" onclick="addrshowPopupCoach(false)">
						<p>${dto.coach_floc }</p>
					</div>
					
					<div >
						<p class="ptitle">강의유형</p><input type="button"value="수정" class="rebtn crebtn" onclick="">	
						<p>${dto.coach_ex_type}</p>
					</div>	
					
					<div style="margin-top:30px;">
						<p class="ptitle">소개글 제목</p><span class="contspan"><input type="button"value="수정" class="rebtn crebtn" onclick="introContUpdate()"></span>
						<p><input type="text" id="sub"  value="${dto.coach_intro_sub }" maxlength='15'  readonly="readonly"></p>
					</div>
					<div  style="margin-top:30px;">
						<p class="ptitle">소개글</p>
						<textarea  id="coach_intro_cont" style="height: 100px;"   readonly="readonly">${dto.coach_intro_cont }</textarea>		
					</div>	
									
					<div style="margin-top:30px;">	 
						<span class="ptitle">받은 별점 평균</span>
						<img src="img/coach/star.png"  style="width:30px;margin-left:20px;" ><span  style="font-size:20px;">${dto.avg }	</span>
					</div>
					
					<div style="margin-top:30px;">	 
						<p class="ptitle">카테고리</p><input type="button"value="수정" class="rebtn crebtn" onclick="cateUpdate();">
						<p>${dto.cate_name }</p>	
					</div>
					
					
			<!-- 커리큘럼영역 -->
			<div  style="margin-top:30px;">
					<p class="ptitle"><span>커리큘럼</span></p>			
			
			<c:forEach var="c" items="${catelist }">
			<form name="${c.cate_name }form">
				<div class="nocurriWrap">
						<div class="catenameDiv">
							<p class="catename">${c.cate_name }</p>
						</div>
						<div class="currimore"  id="${c.cate_name }">	
					<c:if test="${c.cate_name ne oneList.get(0).curri_catename && c.cate_name ne twoList.get(0).curri_catename }">						
						<span class="curriP">커리큘럼 추가하기</span>
					</c:if>
					<c:if test="${c.cate_name eq oneList.get(0).curri_catename ||  c.cate_name eq twoList.get(0).curri_catename }">			
							<span class="curriP">커리큘럼 수정하기</span>
					</c:if>	
							<i class="fas fa-plus-square plusbtn"></i>
						</div>
					<c:if test="${c.cate_name eq oneList.get(0).curri_catename ||  c.cate_name eq twoList.get(0).curri_catename }">			
						<i class="fas fa-minus-square minusbtn" onclick="thisCurriDelete('${c.cate_name }')"></i>
					</c:if>
				</div>				
					<div  class="showinputs" id="${c.cate_name }1">
						<ol>
							<li>
								<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
								<input type="hidden" name="curri_catename" value="${c.cate_name }">
								<input type="hidden" name="curri_order" value="1">
								<input type="text" class="cnginputs" name="curri_name" id="${c.cate_name }11" placeholder="운동제목" 
								value="${c.cate_name eq oneList.get(0).curri_catename?oneList.get(0).curri_name:twoList.get(0).curri_name}"><br>
								<textarea name="curri_content" class="cnginputs"  id="${c.cate_name }12" placeholder="간단한 설명을 적어주세요(최대100자)">
								${c.cate_name eq oneList.get(0).curri_catename?oneList.get(0).curri_content:twoList.get(0).curri_content}</textarea>
							
							<li>
								<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
								<input type="hidden" name="curri_catename" value="${c.cate_name }">
								<input type="hidden" name="curri_order" value="2">	
								<input type="text"  class="cnginputs" name="curri_name" id="${c.cate_name }21" placeholder="운동제목"
								value="${c.cate_name eq oneList.get(0).curri_catename?oneList.get(1).curri_name:twoList.get(1).curri_name}"><br>
								<textarea name="curri_content"class="cnginputs"  id="${c.cate_name }22"placeholder="간단한 설명을 적어주세요(최대100자)">
								${c.cate_name eq oneList.get(0).curri_catename?oneList.get(1).curri_content:twoList.get(1).curri_content}</textarea>
						    </li>	
						    <li>	
						    	<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
						    	<input type="hidden" name="curri_catename" value="${c.cate_name }">
								<input type="hidden" name="curri_order" value="3">
						    	<input type="text" name="curri_name" class="cnginputs" id="${c.cate_name }31" placeholder="운동제목"
						    	value="${c.cate_name eq oneList.get(0).curri_catename?oneList.get(2).curri_name:twoList.get(2).curri_name}"><br>
								<textarea name="curri_content"  class="cnginputs" id="${c.cate_name }32" placeholder="간단한 설명을 적어주세요(최대100자)">
								${c.cate_name eq oneList.get(0).curri_catename?oneList.get(2).curri_content:twoList.get(2).curri_content}</textarea>
							</li>	
						</ol>	
					<c:if test="${c.cate_name ne oneList.get(0).curri_catename && c.cate_name ne twoList.get(0).curri_catename  }">
					<input type="button" value="등록완료" class="okbtn nodataOKbtn" name="${c.cate_name }form">
					</c:if>
					<c:if test="${c.cate_name eq oneList.get(0).curri_catename || c.cate_name eq twoList.get(0).curri_catename  }">
					<input type="button" value="수정완료" class="okbtn nodataOKbtn" name="${c.cate_name }form">
					</c:if>							
				 </div>
			</form>							
			</c:forEach>	
				
			
								
</div>	<!-- 커리큘럼영역 -->	
							
						<div style="margin-top:30px;">
							<p class="ptitle">준비물</p><span class="matspan"><input type="button"value="수정" class="rebtn crebtn" onclick="matUpdateGo()"></span>
							<p><input type="text" id= "mat" value="${dto.coach_mat }" readonly="readonly"></p>
						</div>		
						
						
					</div>
				</div><!-- coach_info -->
<!-- 코치소개 영역 끝 -->	
			
		</div><!-- mypage_main -->
	</div><!-- mypage_contents 일반,코치묶음-->	
		<!-- 코치사진수정 -->
			<div class="coachmypage_main" style="display: block; width:1200px;">
				<h3 class="lastimgDiv">&nbsp;코치 소개 사진</h3>
				<hr>
				<div style="margin-bottom:15px;">
				<form id="coachInfoImgForm">
					<a href="#" id="btn-upload" style="font-size:18px;"><span  style="margin-right:15px;">사진추가하기</span><i class="bi bi-plus-square-fill"></i></a>
						<input type="file"  name="coachimgupload"  id="coachInfoFile"accept="image/gif, image/jpeg, image/png" style="display:none;">
				</form>		
				</div>
				<c:if test="${empty resultMap.coachFileList }">
					<p>등록 된 사진이 없습니다.</p>
				</c:if>
				<div style="">
				<c:forEach var ="f" items="${resultMap.coachFileList }">
				
					<img src = "/zipcok/upload/coach/${f.mfile_upload }" style="width:160px; height: 120px; object-fit:cover; margin:20px 5px;">
					<a href="#" onclick="coachImgDelete('${f.mfile_upload }')" ><i class="bi bi-dash-square-dotted" style="font-size:20px;"></i></a>
					
				</c:forEach>
				</div>
			</div>
			
			
</div><!-- 본문묶음 -->	
				
	
</div><!-- 사이드메뉴바 최종div-->	









<script src="js/httpRequest.js"></script>
<script>
/*코치사진 추가*/
$(function(){
		$('#btn-upload').click(function (e) {
		e.preventDefault();
		$('#coachInfoFile').click();
			});

		
		 $("#coachInfoFile").change(function(e){
			 	 var form = $('#coachInfoImgForm')[0];
			    var formData = new FormData(form);

			  $.ajax({
				    type : 'post',
				    enctype: 'multipart/form-data',
				    url : 'CoachImagesUpdateInsert.do',
				    data :formData,
		
				    contentType : false,
				    processData:false,
				    error: function(xhr, status, error){
				      alert('err');
				    },
				    success : function(data){  
				    	
						
					    location.reload();
				    	
				    
				    }
			
		
				});
			 
			 
		 });
 
	
});

function coachImgDelete(imgname) {
	
		 $.ajax({
			    type : 'post',
			    url : 'CoachImagesUpdateDel.do',
			    data :{
			    	
			    	"upload":imgname
			    },
			    contentType : "application/x-www-form-urlencoded; charset=utf-8",
			    dataType : "json",
			    error: function(xhr, status, error){
			      alert('err');
			    },
			    success : function(data){  
			    	
					
				    location.reload();
			    	
			    
			    }
		
	
			});
		
	}



/*코치수정 ajax*/

function showResultIntroAjax(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			alert(data.msg);
			location.href="coachMyPage.do?id=${sessionScope.coachId }";			
		}
	}
}


 
 
/*결제계좌수정*/
function accountUpdate(){
	$('.bankname').attr('readonly',false);
	$('.banknum').attr('readonly',false);
	$('.accname').attr('readonly',false);
	$('.acc').addClass('cnginputs');
	
	$('.accspan').html("<input type='button'  value='수정완료'  onclick='accountUpdateSubmitAjax()' class='rebtn crebtn upokbtn' >");
}
//결제계좌수정 수정완료버튼누를때 파람넘겨주는 함수
function accountUpdateSubmitAjax(){
	var params='pa_bankname='+$('.bankname').val()+'&pa_no='+$('.banknum').val()+"&pa_username="+$('.accname').val()+'&hg_mem_id=${sessionScope.coachId }'+'&pa_key=코치';
	sendRequest('accountUpdate.do',params,showResultIntroAjax,'GET');
}

 
 
/*소개글제목내용수정*/
 function introContUpdate(){
	$('#sub').attr('readonly',false);
	$('#coach_intro_cont').attr('readonly',false);
	$('#sub').attr('class','cnginputs');
	$('#coach_intro_cont').attr('class','cnginputs');
	
	
	$('.contspan').html("<input type='button'  value='수정완료'  onclick='introUpdateSubmitAjax()' class='rebtn crebtn upokbtn' >");
}
//소개글수정 수정완료버튼누를때 파람넘겨주는 함수
 function introUpdateSubmitAjax(){
 	var params='coach_intro_sub='+$('#sub').val()+'&coach_intro_cont='+$('#coach_intro_cont').val()+"&coach_mem_id=${sessionScope.coachId }";
 	sendRequest('introUpdateSubmitAjax.do',params,showResultIntroAjax,'GET');
 }
 
//준비물수정 버튼누를때 수정완료버튼 생기고 리드온리 풀리는 함수
 function matUpdateGo(){
 	$('#mat').attr('readonly',false);
 	$('#mat').addClass('cnginputs');
 	$('.matspan').html("<input type='button' value='수정완료' onclick='matUpdateSubmitAjax();' class='rebtn crebtn upokbtn' >");
 }
 //준비물수정 수정버튼 누를때 파람넘겨주는 함수
 function matUpdateSubmitAjax(){
 	var params = 'coach_mat='+$('#mat').val()+'&coach_mem_id=${sessionScope.coachId }';
 	sendRequest('matUpdateSubmitAjax.do',params,showResultIntroAjax,'GET');
 }
 
//활동지역 수정버튼누를때 팝업창 열기
 function flocUpdateGo(){
		var id = '${sessionScope.coachId }';
		window.open('flocUpdatePopup.do?coachidText='+id,'floc','width=550,height=300');
	}
 
 
 

/*커리큘럼 삭제*/
function thisCurriDelete(str){
	var result=confirm('등록하신 커리큘럼을 삭제하시겠습니까?');
	if(result){
		location.href='DeleteCurri.do?cate_name='+str;
	}
	
}

/*카테고리수정*/
function cateUpdate(){
	window.open('categoryUpdate.do?mem_id=${login.mem_id}','cateUpdate','left=200, top=100, width=450, height=260');	
}
 
function subrewrite(){
	$('#sub').attr('readonly',false);
	$('.subspan').html('');
	$('.subspan').html("<input type='button'  value='수정완료' class='rebtn crebtn upokbtn' >");
	
	
}
function gosubmit() {
	$('#폼아이이넣엉').attr("action", "어쩌구.do").submit();
}


/*프사수정=============*/
$(function () { //사진수정버튼

			$('#a-upload').click(function (e) {
			e.preventDefault();
			$('#file').click();
			 });
			 
});
function changeValue(obj){ //사진선택하면
	var fileValue = $("#file").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
   var result=confirm(fileName+"사진으로 변경하시겠습니까?");
	if(result){		
		  $('#uploadForm').submit();
	}
/*프사수정===============*/	

}
</script>
<script>
	$(function(){
		var input1= '';
		var textarea1='';  
		var input2='';
		var textarea2= '';
		var input3='';
		var textarea3= '';
			
		
		/*커리큘럼 toggle*/
		$('.currimore').on('click',function(){
			var ww = document.getElementById($(this).attr('id')+"1");
				if($(ww).hasClass('toggle')){
					ww.style.display='none';
					$(ww).removeClass('toggle');
				}else{
					$(ww).addClass('toggle');
					ww.style.display='block';			
				}			
						
				 input1= $(this).attr('id')+"11";
				 textarea1= $(this).attr('id')+"12";
				 input2=$(this).attr('id')+"21";
				textarea2= $(this).attr('id')+"22";
				input3= $(this).attr('id')+"31";
				 textarea3= $(this).attr('id')+"32";
					
	
				$('#'+textarea1).on('focus',function(){
							if($('#'+input1).val()==''){
								$('#'+input1).focus();
							}
				    });
					
				$('#'+input2).on('focus',function(){
					if($('#'+input1).val()==''){
						$('#'+input1).focus();
					}
				});
				
				$('#'+input3).on('focus',function(){
					if($('#'+input1).val()==''){
						$('#'+input1).focus();
					}else if($('#'+input2).val()==''){
						$('#'+input2).focus();
					}
				});
				
					$('#'+textarea2).on('focus',function(){
						if($('#'+input1).val()==''){
							$('#'+input1).focus();
						}else if($('#'+textarea1).val()==''){
							$('#'+textarea1).focus();
						}else if($('#'+input2).val()==''){
							$('#'+input2).focus();
						}
					  });	
						$('#'+textarea3).on('focus',function(){
							if($('#'+input1).val()==''){
								$('#'+input1).focus();
							}else if($('#'+textarea1).val()==''){
								$('#'+textarea1).focus();
							}else if($('#'+input2).val()==''){
								$('#'+input2).focus();
							}else if($('#'+textarea2).val()==''){
								$('#'+textarea2).focus();
							}else if($('#'+input3).val()==''){
								$('#'+input3).focus();
							}	
			  		  });
				
		});
		
		/*커리큘럼 등록기능*/
		$('.nodataOKbtn').on('click',function(){
			
					var formname=$(this).attr('name');
					if( $('#'+input1).val()=='' || $('#'+input2).val()=='' ||  $('#'+input3).val()==''|| $('#'+textarea1).val()=='' || $('#'+textarea2).val()=='' || $('#'+textarea3).val()==''){			
						alert('내용을 모두 작성해주세요');
						return false;
					}else{
						
							if($(this).val() == '등록완료'){			
								$('form[name='+formname+']').attr('action','NodataCurriInsert.do').submit();												
							}else{
								$('form[name='+formname+']').attr('action','DataCurriInsert.do').submit();			
							}
						
						
					}	
		});
		
		
		
});
	
	
	</script>	


 <%@include file="../_include/footer.jsp" %>

</body>
</html>