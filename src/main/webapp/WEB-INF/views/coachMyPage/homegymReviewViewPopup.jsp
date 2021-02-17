<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<style>
body{padding:0; margin:0;}
.ReviewWrap{width:450px; padding:40px 30px 30px 30px;}
.ReviewWrap .info{font-size:18px;}
.starimg{width:69px; margin-right:7px;}
.starDiv{margin-bottom:20px;}
textarea{width:100%; height: 140px;}
input[type=radio]{margin-top:5px;}
.rev_sub{width:100%;}
.okbtn{width:30%;}
input[type=button] {position: absolute; left:35%; top:90%;}
</style>
<script>
function selfClose(){
	window.self.close();
}
</script>
</head>
<body>
<div class="ReviewWrap">
	<h3>홈짐 이용 후기</h3>
	<p class="info">${review.rev_target_id }님의 홈짐에 대한 리뷰입니다.</p>
	<hr>
	<div class="starDiv">
	<span>별점</span><img src="img/coach/star/star${review.rev_star }.jpg" class="starimg"><span>${review.rev_star }점</span>
	</div>	
	<input type="text" name="rev_sub" class="rev_sub" value="${review.rev_sub }" readonly="readonly">			
	<textarea  name="rev_cont"  readonly="readonly">${review.rev_cont }</textarea>
	<input type = "button" class = "okbtn" value = "닫기" onclick = "javascript:selfClose();">
</div>

</body>
</html>