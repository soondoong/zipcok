<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

var sock;

function openSocket() {
	if (sock != null && sock !== undefined && sock.readyState !== WebSocket.CLOSED) {
		$('#messages').append('웹소켓이 이미 연결되었습니다.<br>');
		scroll();
		return;
	}
	
	// 채팅에 사용할 이름 가져오기
	var name = '${login.mem_name}';
	
	// 웹소켓 객체 생성하여 소켓서버에 연결 요청하기. 채팅에 사용할 이름도 함께 보냄.
	sock = new WebSocket('ws://localhost:9090/zipcok/broadcasting/'+name);
	
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
	
	var message = {};
	message.user_name = '${login.mem_name}';
	message.msg_sender = '';
	message.msg_reciever = '';
	message.msg_content = inputMessage;
	
	var msg_reciever = $('#msg_reciever').val();
	if (msg_reciever != '') {
		message.msg_reciever = msg_reciever;
	}
	
	console.log('message : ' + message);
	sock.send(JSON.stringify(message));
	
	var str = '<span style="color: red;">' + message.user_name + ' ▶ ' + message.msg_content  + '</span><br>';
	$('#messages').append(str);
	scroll();
	
	$('#message-input').val('');
}

function scroll() {
	var top = $('#messages').prop('scrollHeight');
	$('#messages').scrollTop(top);
}


$(document).ready(function () {
	
	$('#btnOpen').on('click', function (event) {
		openSocket();
	});
	
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


</head>

<body>
<%@include file="../../header2.jsp" %>
<body>

<h2>${login.mem_name }<c:if test="${empty sessionScope.sid ==null}">코치</c:if>님</h2>
     
<h3>채팅 페이지</h3>
나의 이름: <input type="text" id="name"><br>
귓속말할 상대 아이디: <input type="text" id="msg_reciever"><br>
메시지: <input type="text" id="message-input"><br>

<div>
	<button type="button" id="btnOpen">입장</button>
	<button type="button" id="btnSend">전송</button>
	<button type="button" id="btnClose">나가기</button>
</div>

<div id="messages" style="overflow: auto; width: 500px; height: 500px; border: 1px solid black;"></div>

</body>


</body>
</html>
