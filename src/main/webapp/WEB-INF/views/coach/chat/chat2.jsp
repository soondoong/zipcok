<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script><!-- 폰트 -->
<script>
/*사진미리띄워주기*/
function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#image_section').attr('src', e.target.result);  
	   $('#image_sectionDIV').css('display', 'block');  
	   
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	 
	// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
	$("#file").change(function(){
	   readURL(this);
	});
	
/*사진파일전송*/
$(function () {

	$('#btn-upload').click(function (e) {
	e.preventDefault();
	$('#file').click();
		});

	$('#imgDel').click(function (e) {
		e.preventDefault();
		$('#file').val('');		
		 $('#image_sectionDIV').css('display', 'none');  
			});

	});

</script>
 
</head>
<%@include file="../../header2.jsp" %>
<link href="css/coach/chat.css" rel="stylesheet">

<body>
<c:set var="cdto" value="${croomDTO}"/>
<c:set var="mtype" value="${empty sessionScope.sid ?'코치':'일반' }"/>
<c:set var="myid" value="${mtype eq '코치'?cdto.croom_coachid : cdto.croom_userid}"/>
<c:set var="yourid" value="${mtype eq '코치'?cdto.croom_userid : cdto.croom_coachid}"/>
<c:set var="rdto" value="${receiveDTO}"/>
<c:set var="msglist" value="${msglist }"/>
<c:set var="coachdto" value="${coachMap.coachDTO }"/>
<c:set var="reqdto" value="${reqdto }"/>
<!-- 메뉴바 -->
<div class="mypage_wrap">
	 	<c:if test="${!empty sessionScope.coachId }">	
	<%@include file="../../coachMyPage/coachMypageSideMenu.jsp"%>
	</c:if>
	<c:if test="${!empty sessionScope.sid }">	
	<%@include file="../../mypage/mypageSideMenu.jsp"%>
	</c:if>
 
<!-- 메뉴바 --> 

<script>

$(document).ready(function(){
	/*별점사진정보*/
	var starnumsosu='${coachdto.avg }';
	var starnum = starnumsosu.split( '.', 1 );
	if(starnum==0)starnum=1;
	$('#starimg').attr('src','img/coach/star/star'+starnum+'.jpg')
	
	
	
	/*나이정보*/
	var birthdate='${rdto.mem_birth}';
	var byear=birthdate.substring(0,4);
	var today = new Date();
	var ages = today.getFullYear() - byear;
	var teen =Math.floor(ages/10);/*몇십대인지*/
	var teeninfo= teen*10+'대';
	$('span[class="type"]').html(teeninfo);
})
</script>	
<!-- 채팅컨텐츠 -->
<div class="newcont">

	     
<div class="allchatWrap">

	<div class="chatTitle">
		<i class="fas fa-comment-dots chattitleIcon"></i>
		<span>${rdto.mem_name}님과의 채팅</span>
			<!-- 목록으로버튼 -->  
		  	<i class="fas fa-bars hammenu" onclick="location.href='chatRoomList.do?mem_id=${login.mem_id}'"></i>
	</div>
	
<!-- 채팅 내용 -->	
<div class="AreaAll" id = "chatArea">
	<div id="chatMessageArea">
					
	<c:if test="${!empty msglist}">
		<c:forEach var="msgdto" items="${msglist}">					
			<c:if test="${msgdto.msg_sender eq login.mem_id }"> <!-- 보낸이가 나라면 -->
					<c:choose>
						<c:when test="${msgdto.msg_type eq '텍스트' }">
						    <div class='OnechatfromMe'>
									<div class = 'ContentWrap' >
										 <div class = 'cont mymsg' > ${msgdto.msg_content }</div>
										 <div class="sendtime" > ${msgdto.msg_sendtime }</div>
									 </div>
									 
									 <div class='chatimgdiv' >
											 <img  src='/zipcok/upload/member/${loginAll.mfile_upload}'  >
											 <div>${login.mem_name}</div>
									</div>
							</div>						
						
						</c:when>
						<c:when test="${msgdto.msg_type eq '결제요청서' }">
						<div class='OnechatfromMe'>
								<div class = 'ContentWrap' >
								     <div class = 'cont mymsg' >
										<div class='mprWrap' style='width:320px;'>
									 			<p style='margin-bottom:30px;margin-top:0;'><i class='fas fa-won-sign mn'></i><span class='mprtitle mprhead'>결제요청서</span></p>
									 					 				
												<p>고객님 안녕하세요. 상담내용에 따른 예상금액입니다.</p><hr>
												<p><span class='mprtitle'>예상금액</span><span class='mprprice'>${msgdto.msg_file_upload }원</span></p>
												<p><span class='mprtitle'>서비스 시작일</span><span>${msgdto.msg_file_path}</span></p>
												<p><span class='mprtitle'>서비스 종료일</span><span>${msgdto.receiver_user_name}</span></p><hr>
												<p  class='mprtitle'>서비스 상세설명</p>
												<p><pre>${msgdto.msg_content}</pre></p>								
												<p><input type='button' value='결제요청서 삭제하기' onclick="deltoPay('${msgdto.msg_idx}')" class='btn btn-danger delbtn'></p>															
									 	   </div>
										</div>
										<div class='sendtime' >${msgdto.msg_sendtime}</div>
									</div>
									<div class='chatimgdiv' >
								 	     <img  src='/zipcok/upload/member/${loginAll.mfile_upload}'  >
								 	     <div>${login.mem_name}</div>
								     </div>	
						</div>		     
						</c:when>
						<c:when test="${msgdto.msg_type eq '사진' }"></c:when>					
					</c:choose>
						
				</c:if>
				
					
				<c:if test="${msgdto.msg_sender ne login.mem_id }"> <!-- 보낸이가 상대라면 -->	
						<c:choose>
						<c:when test="${msgdto.msg_type eq '텍스트' }">
						   <div class='OnechatfromMe OnechatNotMe '>
							<div class='chatimgdiv' >
										 <img  src='/zipcok/upload/member/${rdto.mfile_upload}'  >
										 <div>${msgdto.user_name}</div>
						    </div>
							<div class = 'ContentWrap' >
								 <div class = 'cont mymsg' ><pre> ${msgdto.msg_content }</pre></div>
								 <div class="sendtime" > ${msgdto.msg_sendtime }</div>
							 </div>		
						</div>										
						</c:when>
						<c:when test="${msgdto.msg_type eq '결제요청서' }">
						<div class='OnechatfromMe OnechatNotMe'>
						<div class='chatimgdiv' >
							 <img  src='/zipcok/upload/member/${rdto.mfile_upload}'  >
							 <div>${msgdto.user_name}</div>
						 </div>
								<div class = 'ContentWrap' >
								     <div class = 'cont mymsg' >
										<div class='mprWrap' style='width:320px;'>
									 			<p style='margin-bottom:30px;margin-top:0;'><i class='fas fa-won-sign mn'></i><span class='mprtitle mprhead'>결제요청서</span></p>
									 					 				
												<p>고객님 안녕하세요. 상담내용에 따른 예상금액입니다.</p><hr>
												<p><span class='mprtitle'>예상금액</span><span class='mprprice'>${msgdto.msg_file_upload }원</span></p>
												<p><span class='mprtitle'>서비스 시작일</span><span>${msgdto.msg_file_path}</span></p>
												<p><span class='mprtitle'>서비스 종료일</span><span>${msgdto.receiver_user_name}</span></p><hr>
												<p  class='mprtitle'>서비스 상세설명</p>
												<p>${msgdto.msg_content}</p>								
												<p><input type='button' value='결제하러가기' onclick="gotoPay('${msgdto.msg_idx}')"class='btn btn-primary gotopaybtn'></p>															
									 	   </div>
										</div>
										<div class='sendtime' >${msgdto.msg_sendtime}</div>
									</div>
						</div>		     
						</c:when>
						<c:when test="${msgdto.msg_type eq '사진' }"></c:when>					
					</c:choose>			
					
				</c:if>	
									
	</c:forEach>
</c:if>
		
			
	</div><!-- chatMessageArea -->
</div><!-- AreaAll -->

	
	<!--채팅치는부분 -->
	<div class="chatWriteWrap">
			<!-- 파일첨부 결제요청서 -->
			<div id="filemenu">
			  <div style="float:left;">
			  <a href="#"  class="afile" id="btn-upload" data-bs-toggle="tooltip" data-bs-placement="top" title="사진전송하기"><i class="far fa-image"></i></a>
			  </div>
			  <div  style="float:left;">
			  <c:if test="${!empty sessionScope.coachId }">
			  <a href="#" class="afile" id="pr_icon" data-bs-toggle="tooltip" data-bs-placement="top" title="결제요청서 보내기"><i class="fas fa-receipt"></i></a>
			  </c:if>
			  </div>
			</div>
			<input type="file" id="file" name="file" onchange="changeValue(this);">
			
	
	
	
			<!-- 전송메세지 입력창 -->
			<div class="messageinputDIV" >
				<div id="image_sectionDIV" >
					<img id="image_section" src="" style="width:140px"/>
					<a href="#" id="imgDel" ><i class="fas fa-minus-square" style="font-size:2rem;"></i></a>			
				</div>
			
				<textarea class="form-control" placeholder="Enter ..."  id="message-input" onkeyup="lengthLimit()"> </textarea>
			</div>
			
			<!-- 전송버튼 -->
			    <i class="fas fa-paper-plane " id="btnSend"></i>
			
	</div><!-- chatWriteWrap -->	

  </div><!-- allchatWrap -->	
  
  
  
  		<div class="othermanInfo">	  
		 
		  
		  <c:if test="${!empty  coachdto }">
				  <div class="infos">
				    <img src="/zipcok/upload/member/${rdto.mfile_upload}">
						<div class="inner_info">
						  	  <h3>${rdto.mem_name}코치</h3>
						  	  <p>${coachdto.cate_name}</p>
						  	  <p style="font-size:1.3rem; font-weight: 300;"><img src=""  id="starimg">${coachdto.avg }</p>
						 </div>
				  </div>
				  <hr>
				  <div class="onelineInfo">
				  		<p class="title">한 줄 소개</p>
					  	<p><pre>${coachdto.coach_intro_sub }</pre></p>				
		   		 </div>
		   		   <div class="serviceInfo">
				  		<p class="title">기본정보</p>
					  	<p>본인인증</p>				
					  	<p>3회 고용됨</p>				
					  	<p>${coachdto.coach_floc }</p>				
		   		 </div>
		   		  <div class="extraInfo">
				  		<p class="title">추가정보</p>							
					  	<p>경력 ${coachdto.coach_year }년</p>		
					  	<p>${coachdto.coach_ex_type}수업 가능(대면/비대면)</p>		
		   		 </div>

		  </c:if>
		  
		 <c:if test="${empty  coachdto }">
		   <div class="infos">
				      <img src="/zipcok/upload/member/${rdto.mfile_upload}">
						<div class="inner_info">
						  	    <h3>요청인 : ${rdto.mem_name}</h3>
						  	 	<p><span> ${reqdto.req_type }</span><span class="rightgt">/</span><span>${reqdto.req_category }</span></p>
						  	 	<div>
						  		  <span class="type">몇십대</span>
						  		  <span class="gender">${rdto.mem_gender }자</span>
						  	  	</div>
						 </div>						 
				  </div>
				  <hr>
				   <div class="onelineInfo">
				  		<p class="title">희망 시작일</p>
					  	<p><pre>${reqdto.req_start_date}</pre></p>				
		   		 </div>
				  <div class="onelineInfo">
				  		<p class="title">문의 내용</p>
					  	<p><pre>${reqdto.req_cont }</pre></p>				
		   		 </div>
 	
		  </c:if>
		  
		 
	</div><!-- othermanInfo -->  
  
  
  
</div><!-- newcont -->	
<!-- 채팅컨텐츠 -->
		<!-- 결제요청서폼 -->
			<div class="pmDiv" id="pmDiv">
			<%@include file="./paymentRequestForm.jsp" %>
			</div>
			<!-- 결제요청서폼 -->






	
		
<script>

/*상담요청서 작성폼 띄우기*/

function showForm(){
	
	$('.pmDiv').css('display','block');
}	

function close(){
	$('.pmDiv').css('display','none');
	$("#prForm")[0].reset();
}


/*---------------------------------------------------*/

/*yyyy-mm-dd 포맷날짜가져오기*/

function getTimeStamp() {

    var d = new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);

    return s;
}

function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}

var today = getTimeStamp() ;
$( '#startDate' ).attr('min', today);
$( '#startDate' ).val(today);
$( '#startDate' ).on('change', function(){
	$( '#endDate' ).attr('min', $( '#startDate' ).val());	
	$( '#endDate' ).val($( '#startDate' ).val());	
});

/*-----------------------------------------------------*/


/*null값전송막기*/
 $('#requestForm').on('submit',function(){
         
         if ( $( '#startDate' ).val() =='' ) {
             
             alert('희망 시작일을 선택해주세요');
             $( '#startDate' ).focus();
             return false;
          } 
         
   });
 /*-----------------------------------------------------*/
/*상담요청서 글자수 제한*/
function lengthLimit(){
    var content = $('#requestText').val();
    var msgcontent = $('#message-input').val();
    if (content.length > 200){
        alert("최대 200자까지 입력 가능합니다.");
        $('#requestText').val(content.substring(0, 200));
    }
    
    if (msgcontent.length > 150){
        alert("최대 150자까지 입력 가능합니다.");
        $('#message-input').text(content.substring(0,150));
    }
}

</script>
			



<script type="text/javascript">
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})

var file= $("#file").val();
var sock;

var myname = '${login.mem_name}';  //나의이름
var type='${mtype}';  //나의회원타입
var yourid= '${yourid}';   //채팅상대아이디
var myid='${myid}';   //로그인한나의아이디
var roomidx = '${cdto.croom_idx}';  //채팅방번호
var pr_msg_idx='';

function openSocket() {
	if (sock != null && sock !== undefined && sock.readyState !== WebSocket.CLOSED) {
		$('#messages').append('웹소켓이 이미 연결되었습니다.<br>');
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		return;
	}

	// 웹소켓 객체 생성하여 소켓서버에 연결 요청하기. 채팅에 사용할 이름도 함께 보냄.

	sock = new WebSocket('ws://localhost:9090/zipcok/chat?realid='+myid+'&realname='+myname+'&roomidx='+roomidx);
	
	// 서버와 연결이 완료된후 자동호출됨
	sock.onopen = function (event) {
		$( '#endDate' ).val($( '#startDate' ).val());
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
	}
	
	// onmessage는 서버로부터 메시지를 받았을때 호출됨======================onMessage
	sock.onmessage = function (event) {	
		
			console.log('event.data : ' + event.data);
			var data = event.data;
			var msg = JSON.parse(data);
			var str = msg.msg_content  + '\n';
			
			if(msg.msg_type=='텍스트'){
				
				appendOtherMessage(str);
				
			}else if(msg.msg_type=='결제요청서' ){
				appendOtherMessagePR(msg);
				
			}else if(msg.msg_type=='사진' ){
				
			}
			
			$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
	};
	
	sock.onclose = function (event) {
		scroll();
	}
	
}

function closeSocket() {
	sock.close();
	sock = null;
}

// BLOB데이터를 가지고 URL객체를 만들어 내는 함수
function createObjectURL (blob) {
 if ( window.webkitURL ) {
  return window.webkitURL.createObjectURL( blob );
 } else if ( window.URL && window.URL.createObjectURL ) {
  return window.URL.createObjectURL( blob );
 } else {
  return null;
 }
}



function send() {
	
	var inputMessage = $('#message-input').val();
	if (inputMessage == '') {
		return;
	}

	var t = getTimeStamp(); //현재시간
	
	/*메세지데이터 전송json타입 */
	var message = {};
	message.msg_idx=1; //defalut;
	message.msg_croom_idx = roomidx;
	message.msg_req_idx = '${cdto.croom_req_idx}';
	message.msg_sender ='${myid}'; //구분키중요
	message.msg_receiver = yourid; //받을상대아이디;구분키중요
	message.msg_content = inputMessage;
	message.msg_userid = '${myid}';
	message.msg_coachid = yourid; //받을상대아이디;
	message.msg_file_upload = 'noimg.png';
	message.msg_file_path = 'noimg.png'; 
    message.user_name = '${login.mem_name}';
    message.receiver_user_name = '${rdto.mem_name}';
    message.msg_sendtime = t;
    message.msg_readtime = t;
    message.unReadCount= 1;//default
	message.msg_type= '텍스트';

	sock.send(JSON.stringify(message)); //서버에 json형태로메세지보내기
	
	var str = message.msg_content  + '\n';

	appendMyMessage(str); //채팅창에 내가보낸메세지 추가해줌	

	scroll();	
	$('#message-input').val(''); //메세지입력창 리셋
	$('#file').val('');		//파일창리셋
	 $('#image_sectionDIV').css('display', 'none');  //이미지미리보여주기리셋
}

function sendPR() { //결제요청서 메세지에담아보내기
	
	var t = getTimeStamp(); //현재시간
	 var price = $('.price_input').val();
 	 var start=$('#startDate').val();
 	 var end=$('#endDate').val();
 	 var cont=$('#requestText').val();
	/*메세지데이터 전송json타입 */
	var message = {};
	message.msg_idx=1; //defalut;
	message.msg_croom_idx = roomidx;
	message.msg_req_idx = '${cdto.croom_req_idx}';
	message.msg_sender ='${myid}'; //구분키중요
	message.msg_receiver = yourid; //받을상대아이디;구분키중요
	message.msg_content = cont;
	message.msg_userid = '${myid}';
	message.msg_coachid = yourid; //받을상대아이디;
	message.msg_file_upload = price;
	message.msg_file_path = start; 
    message.user_name ='${login.mem_name}';;
    message.receiver_user_name =end;
    message.msg_sendtime = t;
    message.msg_readtime = t;
    message.unReadCount= 1;//default
	message.msg_type= '결제요청서';

	sock.send(JSON.stringify(message)); //서버에 json형태로메세지보내기
	
	var str = message.msg_content  + '\n';

	appendMyMessagePR(); //채팅창에 내가보낸메세지 추가해줌	

	scroll();	
	$('#message-input').val(''); //메세지입력창 리셋
	$('#file').val('');		//파일창리셋
	 $('#image_sectionDIV').css('display', 'none');  //이미지미리보여주기리셋
}











function scroll() {
	var top = $('#messages').prop('scrollHeight');
	$('#messages').scrollTop(top);
}


/*메시지전송시간처리*/
function getTimeStamp() {
  var d = new Date();
  var s =
    leadingZeros(d.getFullYear(), 4) + '-' +
    leadingZeros(d.getMonth() + 1, 2) + '-' +
    leadingZeros(d.getDate(), 2) + ' ' +

    leadingZeros(d.getHours(), 2) + ':' +
    leadingZeros(d.getMinutes(), 2) + ':' +
    leadingZeros(d.getSeconds(), 2);

  return s;
}

function leadingZeros(n, digits) {
  var zero = '';
  n = n.toString();

  if (n.length < digits) {
    for (i = 0; i < digits - n.length; i++)
      zero += '0';
  }
  return zero + n;
}



/*채팅방에 메세지붙여주기*/
function appendMyMessage(msg) {  //내메세지는 오른쪽

	 if(msg == ''){
		 return false;
	 }else{

	 var t = getTimeStamp();
	 
	 
	 $("#chatMessageArea").append("<div class='OnechatfromMe'>"+
				"<div class = 'ContentWrap' >"+
				 "<div class = 'cont mymsg' ><pre>"+msg+"</pre></div>"+
				 "<div class='sendtime' > "+t+"</div>"+
			 "</div>"+		 
			" <div class='chatimgdiv' >"+
					"<img  src='/zipcok/upload/member/${loginAll.mfile_upload}'  >"+
					 "<div>${login.mem_name}</div>"+
			"</div>"+
	"</div>");


	 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);


	 }
 }
 
 
 function appendOtherMessage(msg) {   //상대메세지는 왼쪽

	 if(msg == ''){
		 return false;
	 }else{
	 var t = getTimeStamp();
	  
	 var otherid = '${rdto.mem_name}';
	 $("#chatMessageArea").append("<div class='OnechatfromMe OnechatNotMe '>"+
		"<div class='chatimgdiv' >"+
			" <img  src='/zipcok/upload/member/${rdto.mfile_upload}' >"+
		     "<div>"+otherid+"</div>"+
	   " </div>"+
		"<div class = 'ContentWrap' >"+
			 "<div class = 'cont mymsg' ><pre>"+msg+"<pre></div>"+
			 "<div class='sendtime' >"+t+"</div>"+
		 "</div>"+	
	"</div>");		
	 
	 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);

	 }
 }

 
 /*채팅방에 결제요청서붙여주기*/
 function appendMyMessagePR() {  //내메세지는 오른쪽 ==결제요청서코치

 	 var t = getTimeStamp(); //지금시간
 	 var price = $('.price_input').val();
 	 var start=$('#startDate').val();
 	 var end=$('#endDate').val();
 	 var cont=$('#requestText').val();
 	 
 	
 	 $("#chatMessageArea").append(
 			 "<div class='OnechatfromMe'>"+
 				"<div class = 'ContentWrap' >"+
 					 "<div class = 'cont mymsg' >"+
 					 		"<div class='mprWrap' style='width:320px;>"+
 					 				"<p style='margin-bottom:30px;margin-top:0;'><i class='fas fa-won-sign mn'></i><span class='mprtitle mprhead'>결제요청서</span></p>"+
 					 				
										"<p>고객님 안녕하세요. 상담내용에 따른 예상금액입니다.</p><hr>"+
										"<p><span class='mprtitle'>예상금액</span><span class='mprprice'>"+price+"원</span></p>"+
										"<p><span class='mprtitle'>서비스 시작일</span><span>"+start+"</span></p>"+
										"<p><span class='mprtitle'>서비스 종료일</span><span>"+end+"</span></p><hr>"+
										"<p  class='mprtitle'>서비스 상세설명</p>"+
										"<p><pre>"+cont+"</pre></p>"+									
										"<p><input type='button' value='결제요청서 삭제하기' class='btn btn-danger delbtn'></p>"+									
									
 					 		"</div>"+
 					 	"</div>"+
 					 	"<div class='sendtime' > "+t+"</div>"+
 			 	"</div>"+		 
 					" <div class='chatimgdiv' >"+
 					"<img  src='/zipcok/upload/member/${loginAll.mfile_upload}'  >"+
 					 "<div>${login.mem_name}</div>"+
		 		"</div>"+
		 	"</div>");


 	 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
  }
 
 
 function appendOtherMessagePR(msg) {   //상대메세지는 왼쪽  ==결제요청서고객
	/*message dto 재활용중이라 어쩔수없음 ㅠ*/
	 var t = getTimeStamp(); //지금시간
 	 var price = msg.msg_file_upload;
 	 var start=msg.msg_file_path;
 	 var end=msg.receiver_user_name;
 	 var cont=msg.msg_content;
 	 var msgidx=msg.unReadCount; //결제요청서가담긴메세지번호 ajax로받음
 	 var otherid = '${rdto.mem_name}';
 	 $("#chatMessageArea").append(
 			 "<div class='OnechatfromMe OnechatNotMe'>"+
 			"<div class='chatimgdiv' >"+
				" <img  src='/zipcok/upload/member/${rdto.mfile_upload}' >"+
		  		   "<div>"+otherid+"</div>"+
		   " </div>"+
 				"<div class = 'ContentWrap' >"+
 					 "<div class = 'cont mymsg' >"+
 					 		"<div class='mprWrap' style='width:320px;>"+
 					 				"<p style='margin-bottom:30px;margin-top:0;'><i class='fas fa-won-sign mn'></i><span class='mprtitle mprhead'>결제요청서</span></p>"+
 					 				
										"<p>고객님 안녕하세요. 상담내용에 따른 예상금액입니다.</p><hr>"+
										"<p><span class='mprtitle'>예상금액</span><span class='mprprice'>"+price+"원</span></p>"+
										"<p><span class='mprtitle'>서비스 시작일</span><span>"+start+"</span></p>"+
										"<p><span class='mprtitle'>서비스 종료일</span><span>"+end+"</span></p><hr>"+
										"<p  class='mprtitle'>서비스 상세설명</p>"+
										"<p><pre>"+cont+"</pre></p>"+									
										"<p><input type='button' value='결제하러가기' class='btn btn-primary gotopaybtn' onclick='gotoPay("+msgidx+")'></p>"+									
									
 					 		"</div>"+
 					 	"</div>"+
 					 	"<div class='sendtime' > "+t+"</div>"+
		 	"</div>");


 	 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
 }
 
 //결제로고고(고객만가능)
 function gotoPay(msgidx){	 
	//alert(msgidx);
	var reqidx = '${cdto.croom_req_idx}';  
	var roomidx= '${cdto.croom_idx}'; 
	var coachid= '${cdto.croom_coachid}';  
	var param='msg_idx='+msgidx+'&req_idx='+reqidx+'&coach_id='+coachid+'&croom_idx='+roomidx;
	location.href='gotoCoachPaymentView.do?'+param;
 }
 
 //요청서삭제로 고고(코치만가능)
 function deltoPay(msgidx){
	var reqidx = '${cdto.croom_req_idx}'; 
	var roomidx= '${cdto.croom_idx}';  
	var param='msg_idx='+msgidx+'&req_idx='+reqidx+'&croom_idx='+roomidx;
	location.href='gotoCoachPaymentDelete.do?'+param;
	
 }
 
 
 

/*웹소켓연결단*/
$(document).ready(function () {
	$( '#endDate' ).attr('min', $( '#startDate' ).val());
	$( '#endDate' ).val($( '#startDate' ).val());	
		openSocket(); //입장버튼없이 바로연결

	$('#btnClose').on('click', function (event) {
		closeSocket();
	});
	
	$('#btnSend').on('click', function (event) {
		send();
	});

	$('#message-input').on('keydown', function (event) {
		if (event.keyCode == 13) { // 엔터키
			send();
		}
	});	
});



/*결제요청서 관련~~~~~~~~~~~~~~~~~*/
$('#pr_icon').on('click',function(){
	 $('.pmDiv').css('display','block');
});

/*요청서전송버튼을 누르면 1. 메세지전송 2.결제요청서등록*/
$('#pr_OKbtn').on('click',function(){
	 var price = $('.price_input').val();
 	 var start=$('#startDate').val();
 	 var end=$('#endDate').val();
 	 var cont=$('#requestText').val();
 	 
	 	 if(price == '' || start == '' || end == '' || cont == ''){
	 		 alert('모든 사항을 작성해주세요');
	 	 }else{
	 		 
		 		var result=confirm('결제요청서를 전송하시겠습니까?');
		 		if(result){
		 			 sendPR() ; 
		 			 $('.pmDiv').css('display','none');
		 	          // $("#prForm")[0].reset();
		 	           window.location.reload();
		 			/*	pr_msg_idx = msg.msg_req_idx;
					$('#pr_msg_idx').val(pr_msg_idx);
		 			/*ajax로 결제요청서등록하기*/
		 				/*	  to_ajax();*/
		 			
		 		}	
			 		 
	 	 }
 	 
 	
});

function to_ajax(){
	  var formData = $("#prForm").serialize();
   $.ajax({
       type : 'post',
       url : 'paymentReqInsert.do',
       data : formData,
       contentType : "application/x-www-form-urlencoded; charset=utf-8",
       dataType : "json",
       error: function(xhr, status, error){
           alert(error);
       },
       success : function(data){    
    	   alert(data.msg);
           $('.pmDiv').css('display','none');
           $("#prForm")[0].reset();
           
       }
   });

}
</script>
</div>
 <%@include file="../../_include/footer.jsp" %>
</body>
</html>
