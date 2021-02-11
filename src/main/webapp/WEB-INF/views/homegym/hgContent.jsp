<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f0e5f2abca3d4fd875382e01cfd5ab6&libraries=services"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
window.addEventListener('load', function() {
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
});

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
	var start_ex = use_start_time;
	var end_ex = use_end_time;
	if(use_start_time < 10){
		start_ex = '0'+use_start_time;
	}
	if(use_end_time < 10){
		end_ex = '0'+use_end_time;
	}
	start_ex +=':00';
	end_ex +=':00';
	
	document.getElementById('reservationInfo').style.display = 'none';
	document.getElementById('reservationInfo_click').style.display = 'block';
	
	document.getElementById('use_date').innerHTML=use_date;
	document.getElementById('use_time').innerHTML=start_ex+'-'+end_ex+'/'+use_time+'시간';
	document.getElementById('use_person_count').innerHTML=use_person_count;
	document.getElementById('use_price').innerHTML=use_price+'<input type = "hidden" name = "reser_price" id = "choice_price" value = "'+use_price+'">';
}
function reservation_back_click(){
	document.getElementById('reservationInfo').style.display = 'block';
	document.getElementById('reservationInfo_click').style.display = 'none';
}
function reservation_ajax(){
	var hg_mem_id = document.getElementById('hg_mem_id').value;
	var use_date = document.getElementById('choice_date').value;
	var use_start_time = document.getElementById('choice_start_time').value
	var use_end_time = document.getElementById('choice_end_time').value;
	var use_person_count = document.getElementById('choice_person_count').value;
	var use_price = document.getElementById('choice_price').value;
	var params = 'hg_mem_id='+hg_mem_id+'&reser_date='+use_date+'&reser_start_time='+use_start_time+'&reser_end_time='+use_end_time+'&reser_person_count='+use_person_count+'&reser_price='+use_price;
	sendRequest('HomeGymReservation.do', params, reservation_callback, 'GET');
}
function reservation_callback(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
  			data=eval('('+data+')');
  			var msg = data.msg;
  			var check = data.check;
  			var idx = data.this_idx;
  			if(check){
  				location.href = 'HomeGymPayPage.do?reser_idx='+idx;
  			}
		}
	}
}
</script>
<style>
.top_info{background-color:#0099ff; width:100%; height:75px; color: white; margin-bottom: 20px;}
.top_contentArea{width:80%; height:50%; display:flex; margin:auto;}
.top_contentArea .top_contentArea_img{width:500px; height:500px; margin-right: 100px; }
.top_contentArea .top_contentArea_img img {width:350px; height:350px; }
.top_contentArea .top_contentArea_reservationArea {width: 500px; height:500px;}
.top_contentArea .top_contentArea_reservationArea li {height:40px;}
.top_contentArea .top_contentArea_reservationArea select {width:49%;}
.top_contentArea .top_contentArea_reservationArea #reservationInfo_click{ display:none;}
.bottom_contentArea .hgContent {width: 80%; margin: auto;}
.bottom_contentArea .eqlistArea {width: 80%; margin: auto;}
.bottom_contentArea .eqlistArea .eqlistArea_list{display:flex;}
.bottom_contentArea .eqlistArea .eqlistArea_list img {width:50px; height:50px;}
.bottom_contentArea .reserNoticeArea {width: 80%; margin: auto;}
.bottom_contentArea .mapArea {width: 80%; margin: auto;}
.bottom_contentArea .reviewArea {width: 80%; margin: auto;}
</style>
<div class = "top_info">
	<h4>${hgContent.hg_nickname } 님의 홈짐</h4>
	<h5>${hgContent.hg_faddr }/${hgContent.hg_station }</h5>
</div>
<div class = "top_contentArea">
	<div class = "top_contentArea_img">
		<c:forEach var = "img" items = "${imgContent }">
		<img src = "upload/homegymInfo/${img.mfile_upload }">
		</c:forEach>
	</div>
	<div class = "top_contentArea_reservationArea">
		<p>${hgContent.hg_nickname }님의 홈짐</p>
		<input type = "hidden" id = "hg_mem_id" value = "${hgContent.hg_mem_id }">
		<ul id = "reservationInfo">
			<li>이용 일자</li>
			<li><input id = "choice_date" name = "reser_date" type = "date"></li>
			<li>이용 시간</li>
			<li><select id = "choice_start_time" name = "reser_start_time"><option value = "">시작 시간</option></select>-
				<select id = "choice_end_time" name = "reser_end_time" onclick = "javascript:end_time_click();" onchange = "javscript:price_result();"><option value = "">종료 시간</option></select></li>
			<li>이용 인원</li>
			<li><select id = "choice_person_count" name = "reser_person_count"></select></li>
			<li>결제 예상 금액</li>
			<li><label id = "expect_price">${hgContent.hg_price }</label>원</li>
			<li><input type = "button" class = "btn btn-primary btn-lg sbtn" value = "예약 상세 보기" onclick = "javascript:reservation();"></li>
		</ul>
		<ul id = "reservationInfo_click">
			<li>이용 일자</li>
			<li id = "use_date"></li>
			<li>이용 시간</li>
			<li id = "use_time"></li>
			<li>이용 인원</li>
			<li id = "use_person_count"></li>
			<li>결제 예상 금액</li>
			<li><label id = "use_price"></label>원</li>
			<li>
			<input type = "button" class = "btn btn-primary btn-lg sbtn" value = "예약하기" onclick = "javascript:reservation_ajax();">
			<input type = "button" class = "btn btn-primary btn-lg sbtn" value = "돌아가기" onclick = "javascript:reservation_back_click();">
			</li>
		</ul>
	</div>
</div>
<div class = "bottom_contentArea">
	<div class = "hgContent">
		<h3>홈짐 소개</h3>
		${hgContent.hg_info }
		<hr>
		<h5>이용 요금(1시간 당) : ${hgContent.hg_price }</h5>
		<hr>
	</div>
	<div class ="eqlistArea">
		<h5>보유 운동 기구</h5>
		<div class = "eqlistArea_list">
		<c:forEach var = "eqDTO" items = "${eqContent }">
			<div class = "eqList">
				<img src = "img/homegym/${eqDTO.eq_name }.jpg">
				<p>${eqDTO.eq_name }</p>
				<p>${eqDTO.eq_count}</p>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class = "reserNoticeArea">
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
	</div>
	<div class = "mapArea">
		<h3>지도</h3>
		<div id="map" style="width:50%;height:350px;"></div>
	</div>
	<div id = "reviewArea">
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