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
	location.href='CmHomeGymPayList.do?mem_id=${sessionScope.coachId}';
}
function mypageCoachMatchPayList(){
	location.href='CmPaymentList.do?mem_id=${sessionScope.coachId}';
}
</script>
</head>
<body>
<%@include file="../header2.jsp"%>
<div class="mypage_wrap">
	<%@include file="./coachMypageSideMenu.jsp"%>
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
		.table a,.table a:hover,.table a:link{color:blue;}
		</style>		
			<ul>
				<li><button type="button" onclick="mypageHomeGymPayList()">홈짐 결제내역</button></li>
				<li class="on"><button type="button" onclick="mypageCoachMatchPayList()">코치매칭완료내역</button></li>
			</ul>
		</div>
		<div class="mypage_main_table">
		<table class="table table-hover" > 
	<thead>
		<tr>
			<th>결제번호</th>
			<th>결제요청서번호</th>
			<th>회원명</th>
			<th>요청 카테고리</th>
			<th>서비스시작일</th>
			<th>서비스종료일</th>
			<th>금액</th>
			<th>결제상태</th>
			<th>후기</th>
			
		</tr>
	</thead>
	<tfoot>	
		<tr>
			<td colspan="9" align="center">${pageStr}</td>
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
			<td><a href="javascript:showPayreqPopup('${p.pr_idx }','${p.mem_name }','${p.catename }');">${p.pr_idx }</a></td>
			<td>${p.mem_name }</td>
			<td>${p.catename }</td>
			<td>${p.pr_start }</td>
			<td>${p.pr_end }</td>
			<td>${p.pd_price }원</td>
			<td>${p.pd_status }</td>
			<td>
	
				<c:if test="${ review_idxList[st.index] != 0  }">
				<input type="button" class="revbtn" value="보기" onclick="seeReview('${p.pd_idx }','${p.mem_name }','${p.catename }','${p.pr_sender}', '${review_idxList[st.index] }');">
				</c:if>
			
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
	</div>
	</div>
	</div>
	<script>
	
	function seeReview(idx,name,cate,coachid,revidx){
		var coachname='${sessionScope.login.mem_name}';
		var params="pd_idx="+idx+"&coach_name="+coachname+"&catename="+cate+"&coach_id="+coachid+"&rev_idx="+revidx;
		window.open("seeCoachReviewPopup.do?"+params, "seeCoachReviewPopup","width=450,height=470,top=100,left=500");
	}
	
	function showPayreqPopup(pr_idx,mem_name,catename){	
		var params="pr_idx="+pr_idx+"&mem_name="+mem_name+"&catename="+catename;
		window.open("seePayreqPopup.do?"+params, "seePayreqPopup","width=450,height=470,top=100,left=500");
	}
	</script>
	   <%@include file="../_include/footer.jsp" %>
</body>
</html>