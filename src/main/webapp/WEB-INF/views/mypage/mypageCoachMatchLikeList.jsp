<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function mypageHomeGymLikeList(){
	location.href='mypageHomeGymLikeList.do?mem_id=${sessionScope.sid}';
}
function mypageCoachMatchLikeList(){
	location.href='mypageCoachMatchLikeList.do?mem_id=${sessionScope.sid}';
}
</script>
</head>
<body>
<%@include file="../header2.jsp"%>
	<%@include file="./mypageSideMenu.jsp"%>
	<div style="margin-left: 200px; padding: 1px 16px;">
		<br>
		<h3>${sessionScope.sname }님의 좋아요 목록</h3>
		<hr>
		<input type="button" value="홈짐 좋아요 목록" onclick="mypageHomeGymLikeList()">
		<input type="button" value="코치매치 좋아요 목록" onclick="mypageCoachMatchLikeList()">
				<hr>
			<table
			style="border: 1px solid lightgray; width:550px;">
					<tr>
						<td rowspan="2"><img src="img/coach/noimg.png" width="150px"></td>
						<td>
						<label><b>123</b></label>
						<br>
						<label>123</label>
						<br>
						<label>123</label>
						</td>
						<td style="padding-top: 0; text-align: right;" valign="bottom"><label>요청일:
								123</label></td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
						</td>
					</tr>
			
		</table>
	</div>
</body>
</html>