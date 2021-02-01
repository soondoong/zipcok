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
<%@include file="WEB-INF/views/header2.jsp" %>
<body>
    <fieldset>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
    </fieldset>
</body>
<script type="text/javascript">

var textarea = document.getElementById("messageWindow");
var webSocket = new WebSocket('ws://localhost:9090/zipcok/broadcasting');
var inputMessage = document.getElementById('inputMessage');
webSocket.onerror = function(event) {
onError(event)
};

webSocket.onopen = function(event) {
onOpen(event)
};

webSocket.onmessage = function(event) {
onMessage(event)
};

function onMessage(event) {
textarea.value += "상대 : " + event.data + "\n";
}

function onOpen(event) {
textarea.value += "연결 성공\n";
}

function onError(event) {
alert(event.data);
}

function send() {
textarea.value += "나 : " + inputMessage.value + "\n";
webSocket.send(inputMessage.value);
inputMessage.value = "";
}


	 // java 로직을 처리
	 // top.window.appendMessage(obj.message_content);
	  
	


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







 function appendMessage(msg) {

	 if(msg == ''){
		 return false;
	 }else{


	 var t = getTimeStamp();
	 $("#chatMessageArea").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/displayFile?fileName=${userImage}&directory=profile' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${user_name}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")		 

	  var chatAreaHeight = $("#chatArea").height();
	  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	  $("#chatArea").scrollTop(maxScroll);

	 }
 }
 
 


</script>

</body>
</html>
