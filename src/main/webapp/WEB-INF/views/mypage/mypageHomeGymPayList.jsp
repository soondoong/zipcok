<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">

<script>
function mypageHomeGymPayList(){
	location.href='mypageHomeGymPayList.do?mem_id=${sessionScope.sid}';
}
function mypageCoachMatchPayList(){
	location.href='mypageCoachMatchPayList.do?mem_id=${sessionScope.sid}';
}
</script>
</head>
<body>
<%@include file="../header2.jsp"%>
<div class="mypage_wrap">
<%@include file="./mypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main paymentMain">
		<div id="toggle_tab" class="tab_style_01 mb50">
		<style>
		.paymentMain{width:1000px;}
		.mypage_main .tab_style_01 ul {display: flex; }
		.mypage_main .tab_style_01 li {flex: 1 1 auto;}
		.mypage_main .tab_style_01 li button {display: block; width: 100%; background: #f7f7f7; line-height: 40px; text-align: center; border: none;}
		.mypage_main .tab_style_01 li.on button {background: #006be0; color: #ffffff;}
		.table { border-spacing: ''; table-layout: auto; text-align: center;} 
		.table th{font-weight: bold; border-color:#848282;}
		.revbtn{width:72px; height: 25px; }
		</style>		
			<ul>
				<li><button type="button" onclick="mypageHomeGymPayList()">홈짐 결제내역</button></li>
				<li class="on"><button type="button" onclick="mypageCoachMatchPayList()">코치매치 결제내역</button></li>
			</ul>
		</div>
		<div class="mypage_main_table">
		<table class="table table-hover" > 
	<thead>
		<tr>
			<th>결제번호</th>
			<th>홈짐공유자명</th>
			<th>이용일</th>
			<th>시작시간</th>
			<th>종료시간</th>
			<th>상세주소</th>
			<th>금액</th>
			<th>결제상태</th>
			<th>후기</th>
			<th>기타</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="10" align="center">${pageStr}</td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty pdList}">
			<tr>
				<td colspan="9" align="center">
					등록된 결제내역이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="p" items="${pdList }"  varStatus="st">
		<tr>
			<td>${p.pd_idx }</td>
			<td>${p.hg_nickname }</td>
			<td>${p.reser_date }</td>
			<td>${p.reser_start_time }</td>
			<td>${p.reser_end_time }</td>
			<td>${p.hg_saddr }</td>
			<td>${p.pd_price }</td>
			<td>${p.pd_price }원</td>
			<td>${p.pd_status }</td>
			<td>
			
				<c:if test="${ review_idxList[st.index] == 0 }">
				<input type="button" class="revbtn" value="후기작성" onclick="writeReview('${p.pd_status}','${p.reser_date }','${p.pd_idx }','${p.hg_nickname }','${p.hg_mem_id}'  );">
				</c:if>
				
				<c:if test="${ review_idxList[st.index] != 0  }">
				<input type="button" class="revbtn" value="보기" onclick="seeReview('${p.pd_idx }','${p.hg_nickname }','${p.hg_mem_id}', '${review_idxList[st.index] }');">
				</c:if>
			
			</td>
			<td><input type="button" class="revbtn"  value="결제취소"></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
	</div>
	</div>
	</div>
	<script>
	function writeReview(status,reserdate,idx,nickname,hgid){
		//첫번째 조건-서비스종료일이 지낫는지
		var d = new Date();		 
	    var year = d.getFullYear(); //년도
	    var month = d.getMonth()+1; //월
	    var day = d.getDate(); //일
	 	
	    if ((day+"").length < 2) {       // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
	        day = "0" + day;
	    }	 
	    var getToday = year+"-"+month+"-"+day; // 오늘 날짜 (2021-02-07)
		
	    var enddate = new Date(reserdate);
		var todaydate= new Date(getToday);
		if(todaydate>enddate){ //날짜비교

				if(status == '결제완료'){
					var params="pd_idx="+idx+"&hg_nickname="+nickname+"&hg_mem_id="+hgid;
					window.open("HgReviewWritePopup.do?"+params, "HgReviewWritePopup","width=450,height=470,top=100,left=500");

				}else if(status == '취소요청중'){
					
				}else if(status == '취소완료'){
					
				}
					
		}else{
			alert('서비스 종료일 이후 작성 가능합니다.')
		}


		
	}
	
	function seeReview(idx,nickname,hgid,revidx){
		
		var params="pd_idx="+idx+"&hg_nickname="+nickname+"&hg_mem_id="+hgid+"&rev_idx="+revidx;
		window.open("seeHgReviewPopup.do?"+params, "seeHgReviewPopup","width=450,height=470,top=100,left=500");
	}
	</script>
	   <%@include file="../_include/footer.jsp" %>
</body>
</html>