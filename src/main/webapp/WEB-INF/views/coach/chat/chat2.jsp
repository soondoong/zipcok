<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>

</style>
</head>
<body>
<%@include file="../../header2.jsp" %>
<c:set var="cdto" value="${croomDTO}"/>
<c:set var="mtype" value="${empty sessionScope.sid ?'코치':'일반' }"/>
<c:set var="myid" value="${mtype eq '코치'?cdto.croom_coachid : cdto.croom_userid}"/>
<c:set var="yourid" value="${mtype eq '코치'?cdto.croom_userid : cdto.croom_coachid}"/>
<c:set var="rdto" value="${receiveDTO}"/>

<div class="container">
	<h2>${login.mem_name}<c:if test="${sessionScope.sid ==null}">코치</c:if>님</h2>
	     
	<h3>${rdto.mem_name}<c:if test="${sessionScope.sid !=null}">코치</c:if>님과의 채팅 페이지</h3>
	
	<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-8"  style=" border: 1px solid lightgray; height: 400px; border-radius: 10px; overflow:scroll" id = "chatArea">
			<div id="chatMessageArea" style = "margin-top : 10px; margin-left:10px;"></div>
		</div>
	</div>

	
		<!-- 전송메세지 입력창 -->
		<div class="col-6" style="float: left;">
			<textarea class="form-control" style="border: 1px solid gray; height: 65px; float: left; width:100%"
				placeholder="Enter ..."  id="message-input"></textarea>
		</div>
	
	
	<!-- 전송버튼 -->
			<div class="col-4"style="float: left; margin-top: 20px; margin-bottom: 20px;" >	
			<button type="button" class="btn btn-primary" id="btnSend" >전송</button>
			<button type="button" class="btn btn-warning" id="btnClose" onclick="location.href='index.do'">나가기</button>
			</div>
    <!-- 전송버튼 -->
		
</div>
<script type="text/javascript">

var sock;

var myname = '${login.mem_name}';  //나의이름
var type='${mtype}';  //나의회원타입
var yourid= '${yourid}';   //채팅상대아이디
var myid='${myid}';   //로그인한나의아이디
var roomidx = '${cdto.croom_idx}';  //채팅방번호


function openSocket() {
	if (sock != null && sock !== undefined && sock.readyState !== WebSocket.CLOSED) {
		$('#messages').append('웹소켓이 이미 연결되었습니다.<br>');
		scroll();
		return;
	}
	

	// 웹소켓 객체 생성하여 소켓서버에 연결 요청하기. 채팅에 사용할 이름도 함께 보냄.
	sock = new WebSocket('ws://localhost:9090/zipcok/broadcasting/'+myid+'/'+myname+'/'+roomidx);
	
	// 서버와 연결이 완료된후 자동호출됨
	sock.onopen = function (event) {
	//	$('#messages').append('연결되었습니다.<br>');
		 appendMessage("연결되었습니다.<br>.");
		scroll();
	}
	
	// onmessage는 서버로부터 메시지를 받았을때 호출됨======================onMessage
	sock.onmessage = function (event) {
		console.log('event.data : ' + event.data);
		var message = JSON.parse(event.data);
		console.log('message : ' + message);
		
		var str = message.msg_content  + '\n';
		appendOtherMessage(str);
		//$('#chatMessageArea').append(str);
		scroll();
	};
	
	sock.onclose = function (event) {
	//	$('#messages').append('연결이 끊어졌습니다.<br>');
		 appendMessage("연결을 끊었습니다.");
		scroll();
	}
	
}

function closeSocket() {
	sock.close();
	sock = null;
}

function send() {
	
	var inputMessage = $('#message-input').val();
	if (inputMessage == '') {
		return;
	}

	var t = getTimeStamp();
	
	/*메세지데이터 전송json타입 (시간은서버단에서)*/
	var message = {};	
	message.msg_idx=1; //defalut;
	message.msg_croom_idx = roomidx;
	message.msg_req_idx = '${cdto.croom_req_idx}';
	message.msg_sender ='${myid}'; //구분키중요
	message.msg_receiver = yourid; //받을상대아이디;구분키중요
	message.msg_content = inputMessage;
	message.msg_userid = '${myid}';
	message.msg_coachid = yourid; //받을상대아이디;
	message.user_mfile_upload = 'noimg.png';
	message.receiver_mfile_upload = 'noimg.png'; 
    message.user_name = '${login.mem_name}';
    message.receiver_user_name = '${rdto.mem_name}';
    message.msg_sendtime = t;
    message.msg_readtime = t;
    message.unReadCount= 1;//default

	console.log('message : ' + message);
	sock.send(JSON.stringify(message)); //서버에 json형태로메세지보내기
	
	var str = message.msg_content  + '\n';
	appendMyMessage(str); //채팅창에 내가보낸메세지 추가해줌	
	
	scroll();	
	$('#message-input').val(''); //메세지입력창 리셋
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
	 $("#chatMessageArea").append("<div class='col-6 row' style = 'margin-left:50%; height : auto; margin-top : 5px;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:left;'>"
	 +"<div class = 'col-12' style = ' background-color:lightgray; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div>"
	 +"<div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div>"
	 +"</div>"
	 +"<div class='col-2' style = 'padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/zipcok/upload/member/${loginAll.mfile_upload}' style = 'width:50px; height:50px; '><div style='font-size:15px; clear:both;'>${login.mem_name}</div></div></div>");		 

	  var chatAreaHeight = $("#chatArea").height();
	  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	  $("#chatArea").scrollTop(maxScroll);

	 }
 }
 
 function appendOtherMessage(msg) {   //상대메세지는 왼쪽

	 if(msg == ''){
		 return false;
	 }else{

	 var t = getTimeStamp();
	 $("#chatMessageArea").append("<div class='col-6 row' style = 'margin-left:50%; height : auto; margin-top : 5px;'><div class='col-2' style = 'padding-right:0px; padding-left : 0px;'><img id='profileImg' src='/zipcok/upload/member/${rdto.mfile_upload}' style = 'width:50px; height:50px; '><div style='font-size:15px; clear:both;'>"+yourid+"</div></div>"
	 +"<div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color: yellow; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")		 

	  var chatAreaHeight = $("#chatArea").height();
	  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	  $("#chatArea").scrollTop(maxScroll);

	 }
 }





/*웹소켓연결단*/

$(document).ready(function () {
	

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



</script>

</body>
</html>
