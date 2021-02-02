<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#top_info{
background-color:blue;
width:100%;
height:50px; 
}
#reservationArea{
border: 1px solid black;
width: 400px;
height:300px;
}
#imgArea{
border: 1px solid black;
width:300px;
height:300px;
padding: 10px;
margin-right: 100px;
}
#imgArea img{
width:250px;
height:250px;}
</style>
</head>
<body>
<%@include file="../header2.jsp" %>
<div id = "top_info">
${hgContent.hg_nickname }님의 홈짐<br>
${hgContent.hg_faddr }/${hgContent.hg_station }
</div>
<div id = "imgArea">
<c:forEach var = "img" items = "${imgContent }">
<img src = "upload/homegymInfo/${img.mfile_upload }">
</c:forEach>
</div>
<div id = "reservationArea">
${hgContent.hg_nickname }님의 홈짐<br>
<table>
	<tr>
		<th>이용 일자</th>
		<td><input id = "choice_date" type = "date"></td>
	</tr>
	<tr>
		<th>이용 시간</th>
		<td>
		<select id = "choice_start_time" name = "choice_start_time">
		</select>
		-
		<select id = "choice_end_time" name = "choice_end_time">
		</select>
		</td>
	</tr>
	<tr>
		<th>이용 인원</th>
		<td></td>
	</tr>
	<tr>
		<th>결제 예상 금액</th>
		<td>${hgContent.hg_price }</td>
	</tr>
</table>
<script>
var start_date = '${hgContent.hg_start_date}';
start_date = start_date.substring(0,10);
var end_date = '${hgContent.hg_end_date}';
end_date = end_date.substring(0,10);
document.getElementById('choice_date').setAttribute('min',start_date);
document.getElementById('choice_date').setAttribute('max',end_date);

var choice_start_time = document.getElementById('choice_start_date');
var choice_end_time = document.getElementById('choice_end_date');
</script>
<input type = "button" value = "홈짐 예약하기" onclick = "javascript:location.href='HomeGymReservation.do'">
</div>
<input type = "button" value = "홈짐 목록보기" onclick = "javascript:location.href='HomeGymList.do'">
</body>
</html>