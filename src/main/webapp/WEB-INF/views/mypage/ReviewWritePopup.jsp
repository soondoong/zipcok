<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<style>
body{padding:0; margin:0;}
.ReviewWrap{width:450px; padding:40px 30px 30px 30px;}
.ReviewWrap .info{font-size:18px;}
.starimg{width:55px; margin-right:7px;}
.starDiv{margin-bottom:20px;}
textarea{width:100%; height: 140px;}
input[type=radio]{margin-top:5px;}
.rev_sub{width:100%;}
.okbtn{width:100%;}
</style>
</head>
<body>
<div class="ReviewWrap">
	<h3>코치매칭 후기작성</h3>
	<form name="reviewform" action="coachStarReviewAdd.do">
	<input type="hidden" name="rev_target_id" value="${map.coach_id }">
	<input type="hidden" name="rev_mem_id" value="${login.mem_id } ">
	<input type="hidden" name="rev_pd_idx" value="${map.pd_idx } ">
	<p class="info">${map.coach_name }코치님에 대한 평가를 남겨주세요.</p>
	<hr>
	<div class="starDiv">
	<input type="radio" name="rev_star" value="1"><img src="img/coach/star/star1.jpg" class="starimg">
		<input type="radio" name="rev_star" value="2"><img src="img/coach/star/star2.jpg" class="starimg">
			<input type="radio" name="rev_star" value="3"><img src="img/coach/star/star3.jpg" class="starimg"> 
				<input type="radio" name="rev_star" value="4"><img src="img/coach/star/star4.jpg" class="starimg">
					<input type="radio" name="rev_star" value="5" checked><img src="img/coach/star/star5.jpg" class="starimg">
	</div>	
	<input type="text" name="rev_sub" class="rev_sub" placeholder="제목">			
	<textarea  name="rev_cont" placeholder="내용을 입력해주세요"></textarea>
	<input type="submit" class="btn btn-primary okbtn" value="작성완료">
	</form>
</div>

</body>
</html>