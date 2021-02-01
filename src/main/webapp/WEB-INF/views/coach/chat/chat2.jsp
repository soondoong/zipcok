<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
<%@include file="../../header2.jsp" %>
<c:set var="cdto" value="${croomDTO}"/>
<c:set var="mtype" value="${empty sessionScope.sid ?'코치':'일반' }"/>
<c:set var="myid" value="${mtype eq '코치'?cdto.croom_coachid : cdto.croom_userid}"/>
<c:set var="yourid" value="${mtype eq '코치'?cdto.croom_userid : cdto.croom_coachid}"/>

<h2>${myid }<c:if test="${sessionScope.sid ==null}">코치</c:if>님</h2>
     
<h3>채팅 페이지</h3>
메시지: <input type="text" id="message-input"><br>

<div>
	
	<button type="button" id="btnSend">전송</button>
	<button type="button" id="btnClose">나가기</button>
</div>

<div id="messages" style="overflow: auto; width: 500px; height: 500px; border: 1px solid black;"></div>

<script type="text/javascript">

var sock;

var myname = '${login.mem_name}';
var type='${mtype}';
var yourid= '${yourid}';

function openSocket() {
	if (sock != null && sock !== undefined && sock.readyState !== WebSocket.CLOSED) {
		$('#messages').append('웹소켓이 이미 연결되었습니다.<br>');
		scroll();
		return;
	}
	
	// 채팅에 사용할 이름 가져오기

	
	// 웹소켓 객체 생성하여 소켓서버에 연결 요청하기. 채팅에 사용할 이름도 함께 보냄.
	sock = new WebSocket('ws://localhost:9090/zipcok/broadcasting/'+myname);
	
	// 서버와 연결이 완료된후 자동호출됨
	sock.onopen = function (event) {
		$('#messages').append('연결되었습니다.<br>');
		scroll();
	}
	
	// onmessage는 서버로부터 메시지를 받았을때 호출됨
	sock.onmessage = function (event) {
		console.log('event.data : ' + event.data);
		var message = JSON.parse(event.data);
		console.log('message : ' + message);
		
		var str = message.user_name + '(' + message.msg_sender + ') ▶ ' + message.msg_content  + '<br>';
		
		$('#messages').append(str);
		scroll();
	};
	
	sock.onclose = function (event) {
		$('#messages').append('연결이 끊어졌습니다.<br>');
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
	
	/*메세지데이터 전송json타입 (시간은서버단에서)*/
	var message = {};
	message.user_name = '${login.mem_name}';
	message.msg_sender = '${myid}'; //이게세션정보가들어가야하나?
	message.msg_reciever = yourid; //받을상대아이디;이게세션정보가들어가야하나?
	message.msg_userid = '${myid}';
	message.msg_coachid = yourid; //받을상대아이디;
	message.msg_content = inputMessage;
	message.msg_req_idx = '${cdto.croom_req_idx}';

	
	console.log('message : ' + message);
	sock.send(JSON.stringify(message));
	
	var t = getTimeStamp();
	var str = '<span style="color: red;">' + message.user_name + ' ▶ ' + message.msg_content  + '</span><span>'+t+'</span><br>';
	$('#messages').append(str);
	scroll();
	
	$('#message-input').val('');
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
