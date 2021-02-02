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
<body>
    <fieldset>
    <div class="container">
     <h2>${login.mem_name }<c:if test="${empty sessionScope.sid ==null}">코치</c:if>님</h2>
     
     	<div class="col-12">
		<div class="col-2" style="float: left">
			<span> 목록 </span>
		</div>
		<div class="col-8" style="float: left; text-align: center;">고객이름 님과 대화</div>
		<div class="col-2" style="float: right">
			<span> 닫기 </span>
		</div>
		</div>
		
		<div class="col-12" style="margin-top: 40px; clear: both;">
		<div class="col-10"
			style="margin: 20px auto; text-align: center; color: white; background-color: #01D1FE; border: 1px solid #01D1FE; padding: 10px 10px; border-radius: 8px;">
			수업 일정과 강의 내용에 대해 문의해보세요. <br>(연락처 문의 또는 직접 알려주는 것은 불가)
		</div>
		
		
	<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-11"  style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow:scroll" id = "chatArea">
			<div id="chatMessageArea" style = "margin-top : 10px; margin-left:10px;"></div>
		</div>
	</div>

	<!-- 채팅 입력창 -->
	<div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-12" style="float: left">
			<textarea class="form-control" id="inputMessage"   style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." ></textarea>
				
				<button id=sendBtn class="btn btn-lg btn-primary" onclick="send()">전송</button>		
		</div>
	</div>
	</div>	
		
<!-- 내메세지 -->		
<div class='col-4 row' style = 'margin-left:470px; height : auto; margin-top : 5px;'>
			
			<div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:left;'>
				<div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>메세지입니다</span></div>	
				<div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >201024423</span></div>
	        </div>
		
			<div class='col-2' style = 'padding-right:0px; padding-left : 0px;'>
				<img id='profileImg' class='img-fluid' src='img/coach/noimg.png' style = 'width:50px; height:50px; '>
				<div style='font-size:9px; clear:both;'>${login.mem_name}</div>
			</div>
</div>	


 <!-- 상대메세지 -->
<div class='col-4 row' style = 'margin-left:470px; height : auto; margin-top : 5px;'>
			<div class='col-2' style = 'padding-right:0px; padding-left : 0px;'>
				<img id='profileImg' class='img-fluid' src='img/coach/noimg.png' style = 'width:50px; height:50px; '>
				<div style='font-size:9px; clear:both;'>${login.mem_name}</div>
			</div>
			
			<div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'>
				<div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>메세지입니다</span></div>	
				<div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >201024423</span></div>
	        </div>
		
</div>	

		
	<!-- 채팅 내용 -->
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
      <!-- 채팅 입력-->  
        <input type="text"/>
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
textarea.value +=  event.data + "\n";    //상대에게 받은 메시지
appendOtherMessage( event.data + "\n");
}

function onOpen(event) {
textarea.value += "연결 성공\n";
}

function onError(event) {
alert(event.data);
}

function send() {  //내가 보내는 메세지
textarea.value += "${login.mem_name} : " + inputMessage.value + "\n";
appendMyMessage( inputMessage.value + "\n");   //내채팅은 오른쪽으로붙게
webSocket.send("${login.mem_name} : " +inputMessage.value);
inputMessage.value = "";

}


	 // java 로직을 처리
	 // top.window.appendMessage(obj.message_content);
	  
	

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



 function appendMyMessage(msg) {  //내메세지는 오른쪽

	 if(msg == ''){
		 return false;
	 }else{

	 var t = getTimeStamp();
	 $("#chatMessageArea").append("<div class='col-4 row' style = 'margin-left:470px; height : auto; margin-top : 5px;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:left;'>"
	 +"<div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div>"
	 +"<div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div>"
	 +"</div>"
	 +"<div class='col-2' style = 'padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='img/coach/noimg.png' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${login.mem_name}</div></div></div>");		 

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
	 $("#chatMessageArea").append("<div class='col-4 row' style = 'margin-left:470px; height : auto; margin-top : 5px;'><div class='col-2' style = 'padding-right:0px; padding-left : 0px;'><div style='font-size:9px; clear:both;'>상대이름</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")		 

	  var chatAreaHeight = $("#chatArea").height();
	  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	  $("#chatArea").scrollTop(maxScroll);

	 }
 }
 


</script>

</body>
</html>
