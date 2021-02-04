<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f0e5f2abca3d4fd875382e01cfd5ab6&libraries=services"></script>
<script>
function hgContent_setting(){
	var start_date = '${hgContent.hg_start_date}';
	start_date = start_date.substring(0,10);
	var end_date = '${hgContent.hg_end_date}';
	end_date = end_date.substring(0,10);
	document.getElementById('choice_date').setAttribute('min',start_date);
	document.getElementById('choice_date').setAttribute('max',end_date);
	
	var start_time = ${hgContent.hg_start_time};
	var end_time = ${hgContent.hg_end_time};
	for(var i = start_time ; i <= end_time; i++){
		var start_option = document.createElement('option');
		var end_option = document.createElement('option');
		start_option.setAttribute('value', i);
		end_option.setAttribute('value', i);
		var numberTrans = i;
		if(i < 10){
			numberTrans = '0'+i;

		}
		start_option.innerText = numberTrans+':00';
		end_option.innerText = numberTrans+':00';
		document.getElementById('choice_start_time').appendChild(start_option);
		document.getElementById('choice_end_time').appendChild(end_option);
	}
	var person_count = ${hgContent.hg_person_count};
	for(var i = 1 ; i <= person_count ; i++){
		var person_count_option = document.createElement('option');
		person_count_option.setAttribute('value', i);
		person_count_option.innerText = i;
		document.getElementById('choice_person_count').appendChild(person_count_option);
	}
}
function end_time_click(){
	var start_time = document.getElementById('choice_start_time').value;
	if(start_time == '-'){
		window.alert('시작 시간을 먼저 선택해주세요');
		return;
	}
}
function price_result(){
	var homegym_price = ${hgContent.hg_price};
	var start_time = document.getElementById('choice_start_time').value;
	var end_time = document.getElementById('choice_end_time').value;
	var reservation_time = end_time - start_time;
	if(reservation_time<1){
		window.alert('종료 시간은 시작시간보다 커여합니다.');
		document.getElementById('choice_end_time').value = '-';
		return;
	}

	var recent_price = document.getElementById('expect_price');
	recent_price.innerText = homegym_price * reservation_time;
}
function reservation(){
	var use_date = document.getElementById('choice_date').value;
	var use_start_time = document.getElementById('choice_start_time').value
	var use_end_time = document.getElementById('choice_end_time').value;
	var use_person_count = document.getElementById('choice_person_count').value;
	var use_price = document.getElementById('expect_price').innerText;
	var use_time = use_end_time - use_start_time;
	if(use_date == '' || use_start_time == '' || use_end_time ==''){
		window.alert('옵션을 확인해주세요.');
		return;
	}
	if(use_start_time < 10){
		use_start_time = '0'+use_start_time;
	}
	if(use_end_time < 10){
		use_end_time = '0'+use_end_time;
	}
	use_start_time +=':00';
	use_end_time +=':00';
	
	var reservationInfo = document.getElementById('reservationInfo');
	document.getElementById('reservationInfo').style.display = 'none';
	document.getElementById('reservationInfo_click').style.display = 'block';
	
	document.getElementById('use_date').innerHTML=use_date+'<input type = "hidden" name = "use_date" value = "'+use_date+'">';
	document.getElementById('use_time').innerHTML=use_start_time+'-'+use_end_time+'/'+use_time+'시간'+'<input type = "hidden" name = "use_time" value = "'+use_time+'">';
	document.getElementById('use_person_count').innerHTML=use_person_count+'<input type = "hidden" name = "use_person_count" value = "'+use_person_count+'">';
	document.getElementById('use_price').innerHTML=use_price+'<input type = "hidden" name = "use_price" value = "'+use_price+'">';
	window.alert(use_price);
}
function reservation_click(){
	
}
function reservation_back_click(){
	document.getElementById('reservationInfo').style.display = 'block';
	document.getElementById('reservationInfo_click').style.display = 'none';
}
</script>

<style>
#top_info{
background-color:blue;
width:100%;
height:50px; 
}
#reservationArea{
border: 1px solid black;
width: 400px;
margin-bottom: 120px;
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
height:250px;
}
.eqList{
border:1px solid black;
}
#reservationInfo_click{
display:none;
}
</style>
</head>
<body onload = "javascript:hgContent_setting();">
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
<input type = "button" value = "목록으로" onclick = "javascript:location.href='HomeGymList.do'">
<div id = "reservationArea">
	${hgContent.hg_nickname }님의 홈짐<br>
	<ul id = "reservationInfo">
		<li>이용 일자</li>
		<li><input id = "choice_date" type = "date"></li>
		<li>이용 시간</li>
		<li><select id = "choice_start_time" name = "choice_start_time"><option value = "">시작 시간</option></select>
			-
			<select id = "choice_end_time" name = "choice_end_time" onclick = "javascript:end_time_click();" onchange = "javscript:price_result();"><option value = "">종료 시간</option></select></li>
		<li>이용 인원</li>
		<li><select id = "choice_person_count"></select></li>
		<li>결제 예상 금액</li>
		<li><label id = "expect_price">${hgContent.hg_price }</label>원</li>
		<li><input type = "button" value = "홈짐 예약하기" onclick = "javascript:reservation();"></li>
	</ul>
	<ul id = "reservationInfo_click">
		<li>이용 일자</li>
		<li id = "use_date">
		<input type = "text" id = "use_date_hidden" name = "use_date">
		</li>
		<li>이용 시간</li>
		<li id = "use_time"><input type = "hidden" id = "use_time_hidden" name = "use_time"></li>
		<li>이용 인원</li>
		<li id = "use_person_count"><input type = "hidden" id = "use_person_count_hidden" name = "use_person_count"></li>
		<li>결제 예상 금액</li>
		<li><label id = "use_price"><input type = "hidden" id = "use_price_hidden" name = "use_price"></label>원</li>
		<li>
		<input type = "button" value = "결제하기" onclick = "javascript:reservation_click();">
		<input type = "button" value = "돌아가기" onclick = "javascript:reservation_back_click();">
		</li>
	</ul>
</div>
<div id = "hgContent">
	<h3>홈짐 소개</h3>
	${hgContent.hg_info }
	<hr>
	<h5>이용 요금(1시간 당) : ${hgContent.hg_price }</h5>
	<hr>
	<h5>보유 운동 기구</h5>
	<c:forEach var = "eqDTO" items = "${eqContent }">
		<div class = "eqList">
			사진 들어갈 영역(기구의 이름을 기준으로)<br>
			${eqDTO.eq_name }<br>
			${eqDTO.eq_count}
		</div>
	</c:forEach>
	<h5>예약 시 주의사항</h5>
	<table>
		<tr>
			<th>주의사항</th>
			<td>주의사항 내용</td>
		</tr>
		<tr>
			<th>예약정책</th>
			<td>주의사항 내용</td>
		</tr>
		<tr>
			<th>취소/환불 정책</th>
			<td>주의사항 내용</td>
		</tr>
	</table>
	<h3>오시는 길</h3>
	<div id="map" style="width:50%;height:350px;"></div>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    draggable: false,
	    level: 4 // 지도의 확대 레벨
	};  

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	function setZoomable() {
	    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
	    map.setZoomable(false);    
	}

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder.addressSearch('${hgContent.hg_faddr}', function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {

	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	}); 
	</script>
		<div id = "review_DIV">
		<h3>이용 후기</h3>
		<c:if test = "${empty reviewList }">
		<div>작성된 후기가 없습니다.</div>
		</c:if>
		<c:if test = "${!empty reviewList }">
			<c:forEach var = "dto" items="${reviewList }">
				작성자 : ${dto.rev_mem_id }/ 작성 날짜 : ${dto.rev_writedate } / 별점 : ${dto.rev_star }<br>
				제목 : ${dto.rev_sub }<br>
				${dto.rev_cont }
			</c:forEach>
		</c:if>
	</div>
</div>

</body>
</html>