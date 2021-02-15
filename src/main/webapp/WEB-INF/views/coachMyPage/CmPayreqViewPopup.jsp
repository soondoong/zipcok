<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<link href="css/coach/chat.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script><!-- 폰트 -->
<style>
.allWrap{display: flex; justify-content: center;}
.OnechatfromMe{justify-content: center;}
.CmreqDiv{border-radius: 10px;}
.sendtime{font-size: 14px;}
</style>
</head>
<body>
<div class="allWap">
	<div class='OnechatfromMe'>
								<div class = 'card ContentWrap' >
								     <div class = 'card-body' >
											<div class='mprWrap' style='width:320px;'>
										 			<p style='margin-bottom:20px;margin-top:0;'><i class='fas fa-won-sign mn'></i><span class='mprtitle mprhead'>결제요청서</span></p>										 					 				
													<p>${map.mem_name }고객님 안녕하세요. 상담내용에 따른 예상금액입니다.</p><hr>
													<p><span class='mprtitle'>예상금액</span><span class='mprprice'>${map.prdto.pr_price }원</span></p>
													<p><span class='mprtitle'>카테고리</span><span class='mprprice'>${map.catename}</span></p>
													<p><span class='mprtitle'>서비스 시작일</span><span>${map.prdto.pr_start}</span></p>
													<p><span class='mprtitle'>서비스 종료일</span><span>${map.prdto.pr_end}</span></p><hr>
													<p  class='mprtitle'>서비스 상세설명</p>
													<p>${map.prdto.pr_content}</p>								
											</div>
										<div class='sendtime' >${map.prdto.pr_senddate}</div>		
										</div>
										
									</div>
						</div>	
</div>
</body>
</html>