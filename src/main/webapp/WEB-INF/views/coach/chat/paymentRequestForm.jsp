<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.pr_allWrap{width: inherit; height:inherit; background-color: white;border:1px solid black; }	
.pr_allWrap #pr_OKbtn{width: inherit;height: 37px; border:0px; border-radius:5px; color:white; background-color: #256abf;}	
.pr_allWrap .inside{margin:0 auto;width: 280px;}
.pr_allWrap .inside .title{margin-right: 20px; font-size: 17px; font-weight: bold;}
.pr_allWrap .inside textarea{width: 280px; height: 140px; }
.pr_allWrap .price_input{width: 120px; height: 36px; }	
#startDate,#endDate{width: 170px; height: 36px; }	
</style>
<!-- 결제요청서 영역 -->
<form id="prForm" action="paymentReqInsert.do" method="post">  
<input type="hidden" name="pr_msg_idx" id="pr_msg_idx" value="1"><!-- 메세지 번호 -->
<input type="hidden" name="pr_req_idx" value="${reqdto.req_idx }"><!-- 요청서번호 -->
<input type="hidden" name="pr_receiver" value="${rdto.mem_id }"><!-- 받는이 아이디 -->
<input type="hidden" name="pr_sender" value="${login.mem_id }"><!-- 보내는이 아이디 -->
<div class="pr_allWrap">
	<div class="inside">
	 	<div class="closeDiv" style="height: 32px;">
		    <a href="javascript:close();" style="font-size:2.4rem;position:relative; left:300px;top:-10px;" >&times;</a>
		 </div>
		<h2 style="margin-bottom:30px;margin-top:0;">결제요청서 작성</h2>	
		<div>
			<span class="title">예상금액</span><span style="font-size: 17px; margin-right: 10px;">총</span><input type="text" class="price_input" name="pr_price"><span style="font-size: 17px; ">원</span>
		</div>
		<div>
			<span class="title">서비스 시작일</span><input type="date" name="pr_start" id="startDate" min="">
		</div>
		<div>
			<span class="title">서비스 종료일</span><input type="date" name="pr_end" id="endDate" min="" max="2022-01-01">
		</div>
		<div>
			<p class="title">서비스 상세설명</p>
			<textarea name="pr_content" id="requestText" onkeyup="lengthLimit();" placeholder="합의된 사항을 구체적으로 적어주세요.(최대 200자)"></textarea>
		</div>

		<input type="button" id="pr_OKbtn" style="margin-bottom: 50px;" value="결제요청서 전송">
	
	</div>
</div>
</form>
<!-- 결제요청서 영역 -->

