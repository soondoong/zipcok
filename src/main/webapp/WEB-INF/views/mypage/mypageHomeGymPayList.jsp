<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<li class="on"><button type="button" onclick="mypageHomeGymPayList()">홈짐 결제내역</button></li>
				<li><button type="button" onclick="mypageCoachMatchPayList()">코치매치 결제내역</button></li>
			</ul>
		</div>
	<div class="mypage_main_table">
	<table class="table table-hover" >
	<thead>
		<tr>
			<th>결제일자</th>
			<th>홈짐이름</th>
			<th>금액</th>
			<th>처리상태</th>
			<th>후기</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="5" align="center">페이지들어갈곳</td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5" align="center">
					등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><input type="button" value="후기쓰기"></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
	</div>
	</div>
	</div>
	   <%@include file="../_include/footer.jsp" %>
</body>
</html>