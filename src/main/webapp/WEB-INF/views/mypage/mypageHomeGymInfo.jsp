<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<%@include file="../header2.jsp"%>
<style>
.titlee {font-weight: 550;color: #12151d;margin-bottom: 20px;}
.titlee:before {content: "";display: inline-block;background-color: #257cda;width: 11px;height: 41px;}
.titlee hr {border-top: 1px solid #d1d1d4;margin-bottom: 30px;}

</style>
<script src="https://kit.fontawesome.com/802041d611.js"	crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f0e5f2abca3d4fd875382e01cfd5ab6&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
window.addEventListener('load', function() {
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
	
	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();
	
	$(function() {
		$('#date_div').datepicker({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			minDate: '${hgContent.hg_start_date}',
			maxDate: '${hgContent.hg_end_date}',
			showMonthAfterYear: true,
			changeMonth:false,
			changeYear:false,
			yearSuffix:'년'
		});
	});
});
function status_change(){
	var status = document.getElementById('hg_status').checked;
	var hg_mem_id = document.getElementById('hg_mem_id').value;
	var status_param = status==true?'1':'0';
	var params = 'hg_mem_id='+hg_mem_id+'&hg_status='+status_param;
	sendRequest('changeStatus.do', params, status_change_rq, 'GET');
}
function status_change_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var status = data.hg_status;
			if(status>0){
				window.alert('홈짐 검색 상태가 변경되었습니다.');
			}
		}
	}
}
function mypageHomeGymAddrUpdate() {
	window.open('mypageHomeGymAddrUpdateForm.do?hg_mem_id=${hgContent.hg_mem_id}',
			'addrUpdate', 'width=550,height=300');
}
function mypageHomeGymStationChangeForm(){
	var station_div = document.getElementById('hg_station_span');
	station_div.innerHTML = '<input type = "text" id = "hg_station" value = "${hgContent.hg_station}">';
	station_div.innerHTML += '<input type = "button" value = "수정 완료" class = "rebtn" onclick = "javascript:mypageHomeGymStationChange();">';
	station_div.innerHTML += '<input type = "button" value = "수정 취소" class = "rebtn" onclick = "javascript:StationUpdateCancel();">';
}
function mypageHomeGymStationChange(){
	var hg_mem_id = document.getElementById('hg_mem_id').value;
	var hg_station = document.getElementById('hg_station').value.trim();
	if(hg_station==null || hg_station.length == 0){
		window.alert('입력된 역 정보를 다시 확인해주세요.');
		return;
	}
	var params = 'hg_mem_id='+hg_mem_id+'&hg_station='+hg_station;
	sendRequest('changeStation.do', params, mypageHomeGymStationChange_rq, 'GET');
}
function mypageHomeGymStationChange_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var result = data.change_result;
			var station = data.change_station;
			if(result>0){
				window.alert('홈짐 검색 상태가 변경되었습니다.');
				document.getElementById('hg_station_span').innerHTML = station;
			}
		}
	}
}
function StationUpdateCancel(){
	document.getElementById('hg_station_span').innerHTML = '${hgContent.hg_station}';
}
function mypageHomeGymPerson_countChangeForm(){
	var station_div = document.getElementById('hg_person_count_span');
	station_div.innerHTML = '<input type = "text" id = "hg_person_count" value = "${hgContent.hg_person_count}">';
	station_div.innerHTML += '<input type = "button" value = "수정 완료" class = "rebtn" onclick = "javascript:mypageHomeGymPerson_countChange();">';
	station_div.innerHTML += '<input type = "button" value = "수정 취소" class = "rebtn" onclick = "javascript:person_countUpdateCancel();">';

}
function mypageHomeGymPerson_countChange(){
	var hg_mem_id = document.getElementById('hg_mem_id').value;
	var hg_person_count= document.getElementById('hg_person_count').value.trim();
	if(hg_person_count==null || hg_person_count == 0){
		window.alert('입력된 수용 인원 정보를 다시 확인해주세요.');
		return;
	}
	var params = 'hg_mem_id='+hg_mem_id+'&hg_person_count='+hg_person_count;
	sendRequest('changePerson_count.do', params, mypageHomeGymPerson_countChange_rq, 'GET');
}
function mypageHomeGymPerson_countChange_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var result = data.change_result;
			var person_count = data.change_person_count;
			if(result>0){
				window.alert('홈짐 검색 상태가 변경되었습니다.');
				document.getElementById('hg_person_count_span').innerHTML = person_count;
			}
		}
	}
}
function person_countUpdateCancel(){
	document.getElementById('hg_person_count_span').innerHTML = '${hgContent.hg_person_count}';
}
function mypageHomeGymEquipementListChangeForm(){
	var eq_list = document.getElementById('eq_list');
	eq_list.innerHTML = '';	
	eq_list.innerHTML += '<select style = "width:200px;"	name="eq_name_temp" id = "eq_name_temp">'
		+'<option value="armcurl">암 컬</option>'
		+'<option value="chestpress">체스트 프레스</option>'
		+'<option value="dumbbell">덤벨</option>'
		+'<option value="halfract">하프 렉</option>'
		+'<option value="latpulldown">렛 풀 다운</option>'
		+'<option value="legcurl">레그 컬</option>'
		+'<option value="smithmachine">스미스머신</option>'
		+'<option value="pullup">풀업</option>'
		+'<option value="running">런닝머신</option>'
		+'</select>';
	eq_list.innerHTML += '<select style = "width:200px;" name="eq_count_temp" id = "eq_count_temp">'
		+'<option value="1">1</option>'
		+'<option value="2">2</option>'
		+'<option value="3">3</option>'
		+'<option value="4">4</option>'
		+'<option value="5">5</option>'
		+'</select>';
	eq_list.innerHTML += '<input type = "button" value = "추가" class = "rebtn" onclick = "javascript:eq_add();">';
	eq_list.innerHTML += '<div id = "eq_list_items">';
		eq_list.innerHTML += '<c:forEach var = "dto" items = "${eqContent}">';
			eq_list.innerHTML += '<div id = "${dto.eq_name}">';
				eq_list.innerHTML += '<span class = "dateName">${dto.eq_name} : </span> <input type ="hidden" name = "eq_name"  value = "${dto.eq_name}">';
				eq_list.innerHTML += '<span class = "dateName">${dto.eq_count} EA</span> <input type ="hidden" name = "eq_count"  value = "${dto.eq_name}">';
				eq_list.innerHTML += '<input type = "button" value = "삭제" class = "rebtn" onclick = "javascript:mypageEq_itemDelete("${dto.eq_name}");"><br>';	
			eq_list.innerHTML += '</div>';
		eq_list.innerHTML += '</c:forEach>';
	eq_list.innerHTML += '</div>';
	eq_list.innerHTML += '<input type = "button" value = "수정 완료" class = "rebtn" onclick = "">'
	eq_list.innerHTML += '<input type = "button" value = "수정 취소" class = "rebtn" onclick = "">'
}
function eq_add(){
	var eq_name = document.getElementById('eq_name_temp').value;
	var eq_count = document.getElementById('eq_count_temp').value;
	var eq_list_items = document.getElementById('eq_list_items');
	var eq_name_div = document.createElement('div');
	eq_name_div.setAttribute('id', eq_name);
	var eq_name_span = document.createElement('span');
	eq_name_span.setAttribute('class', 'dateName');
	eq_name_span.innerText = eq_name+' : ';
	var eq_name_hidden = document.createElement('input');
	eq_name_hidden.setAttribute('type', 'hidden');
	eq_name_hidden.setAttribute('value', eq_name);
	eq_name_hidden.setAttribute('name', 'eq_name');
	var eq_count_span = document.createElement('span');
	eq_count_span.setAttribute('class', 'dateName');
	eq_count_span.innerText = eq_count+'EA';
	var eq_count_hidden = document.createElement('input');
	eq_count_hidden.setAttribute('type', 'hidden');
	eq_count_hidden.setAttribute('value', eq_count);
	eq_count_hidden.setAttribute('name', 'eq_count');
	var eq_delete_btn = document.createElement('input');
	eq_delete_btn.setAttribute('type', 'button');
	eq_delete_btn.setAttribute('class', 'rebtn');
	eq_delete_btn.setAttribute('value', '삭제');
	eq_delete_btn.setAttribute('onclick', 'javascript:mypageEq_itemDelete('+eq_name+')');
	eq_name_div.appendChild(eq_name_span);
	eq_name_div.appendChild(eq_name_hidden);
	eq_name_div.appendChild(eq_count_span);
	eq_name_div.appendChild(eq_count_hidden);
	eq_name_div.appendChild(eq_delete_btn);
	eq_list_items.appendChild(eq_name_div);
	
}
function mypageEq_itemDelete(eq_name){
	var eq_mem_id = document.getElementById('hg_mem_id').value;
	var params = 'eq_mem_id='+eq_mem_id+'&eq_name='+eq_name;
	sendRequest('DeleteEq_items.do', params, mypageEq_itemDelete_rq, 'GET');	
}

function mypageEq_itemDelete_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var result = data.change_result;
			var eq_name = data.change_eq_name;
			if(result>0){
				window.alert('홈짐 검색 상태가 변경되었습니다.');
				document.getElementById(eq_name).remove();
			}
		}
	}
}

function mypageHomeGymReservationInfoChangeForm(){
	
}
function mypageHomeGymPriceChangeForm(){
	var station_div = document.getElementById('hg_price_span');
	station_div.innerHTML = '<input type = "text" id = "hg_price" value = "${hgContent.hg_price}">';
	station_div.innerHTML += '<input type = "button" value = "수정 완료" class = "rebtn" onclick = "javascript:mypageHomeGymPriceChange();">';
	station_div.innerHTML += '<input type = "button" value = "수정 취소" class = "rebtn" onclick = "javascript:priceUpdateCancel();">';

}
function mypageHomeGymPriceChange(){
	var hg_mem_id = document.getElementById('hg_mem_id').value;
	var hg_price= document.getElementById('hg_price').value.trim();
	if(hg_price==null || hg_price == 0){
		window.alert('입력된 수용 인원 정보를 다시 확인해주세요.');
		return;
	}
	var params = 'hg_mem_id='+hg_mem_id+'&hg_price='+hg_price;
	sendRequest('changePrice.do', params, mypageHomeGymPriceChange_rq, 'GET');
}
function mypageHomeGymPriceChange_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var result = data.change_result;
			var price = data.change_price;
			if(result>0){
				window.alert('홈짐 검색 상태가 변경되었습니다.');
				document.getElementById('hg_price_span').innerHTML = price;
			}
		}
	}
}
function person_countUpdateCancel(){
	document.getElementById('hg_price_span').innerHTML = '${hgContent.hg_price}';
}
</script>
</head>
<body>
<style>
.homegym_main { padding: 10px 0 0 60px;}
.homegym_main .profileIMG {overflow: hidden; width: 100px; height: 75px; margin: 0 auto 50px;}
.homegym_main .profileIMG img {width:75px; height:75px;}
.homegym_main .profile_info {padding: 0 0 0 100px;}
/*일반프로필 css*/
.hgDIV{ margin:15px 0px; display:flex;}
.hgDIV .hgLeftDIV {margin-right:50px;}
.hgIMG{ height:310px; margin:15px 0px;}
.hgIMG .hgMainIMG {height:200px; margin-bottom: 10px;}
.hgIMG .hgMainIMG img {width: 500px; height:200px;}
.hgIMG .hgSubIMG {height:100px;}
.hgIMG .hgSubIMG img {width: 100px; height:100px;}
.hgLeftDIV .infoDIV{width: 600px; border-bottom:1px solid #e4e4e4;}
.hgRightDIV .infoDIV{width: 600px; border-bottom:1px solid #e4e4e4;}
.hgLeftDIV .infoDIV .dateName{font-size:20px;}
.hgRightDIV .infoDIV .dateName{font-size:20px;}
.hgLeftDIV .infoDIV .labelName{font-size:25px; font-weight: 550; padding-right: 50px;}
.hgRightDIV .infoDIV .labelName{font-size:25px; font-weight: 550; padding-right: 50px;}
.rebtn{width:50px; margin:4px 0 0 10px; height:20px; font-size: 12px; border: 0px; border-radius: 5px; background-color: #e4e4e4;}
.okbtn{width: 100px; margin:0; height: 30px; font-weight:bold; font-size:15px;  border: 0px; border-radius: 5px; color:white;background-color:#257cd6;}
</style>
	<div class="mypage_wrap">
		<%@include file="./mypageSideMenu.jsp"%>
		<div class="mypage_contents">
			<div class="homegym_main">
				<div class="nomalAllWrap">
					<h2 class="titlee">&nbsp;내 홈짐 보기</h2>
					<hr>
					<div class="hgDIV">
						<div class = "hgLeftDIV">
							<div class="profileInfo infoDIV">
								<h3>${hgContent.hg_nickname } 님의 홈짐</h3>
								<input type = "hidden" id = "hg_mem_id" value = "${hgContent.hg_mem_id }">
								<h6>좋아요 수 : ${like_count }</h6>
								<span>홈짐 검색 활성화 : <input id = "hg_status" type = "checkbox" <c:if test = "${hgContent.hg_status == '1' }">checked = "checked"</c:if> onchange = "javascript:status_change();">								</span>
							</div>
							<div class = "hgIMG infoDIV">
								<div class = "hgMainIMG"><img src = "upload/homegymInfo/${imgContent[0].mfile_upload }"></div>
								<div class = "hgSubIMG">
								<c:forEach var = "img" items="${imgContent }">
									<img src = "upload/homegymInfo/${img.mfile_upload }">
								</c:forEach>
								</div>
							</div>
							<div class="normalInfo">
								<div class="location infoDIV">
									<span class = "labelName">홈짐 위치</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymAddrUpdate();"><br>
									<span class = "dateName" id = "hg_location_span">${hgContent.hg_faddr }<br>${hgContent.hg_saddr }</span>
								</div>
								<div class="station infoDIV">
									<span class = "labelName">가까운 역</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymStationChangeForm();"><br>
									<span class = "dateName"  id = "hg_station_span">${hgContent.hg_station }</span>
								</div>
								<div class = "mapArea">
									<div id="map"></div>
								</div>
							</div>
						</div>
						<div class = "hgRightDIV">
							<div class="person_count infoDIV">
								<span class = "labelName">수용 인원</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymPerson_countChangeForm();"><br>
								<span class = "dateName"  id = "hg_person_count_span">${hgContent.hg_person_count }</span>
							</div>
							<div class = "eq_list infoDIV">
								<span class = "labelName">보유 기구</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymEquipementListChangeForm();">
								<div id = "eq_list">
									<ul>
									<c:forEach var = "list" items = "${eqContent }">
										<li class = "showList dateName">${list.eq_name } : ${list.eq_count } EA</li>
									</c:forEach>
									</ul>
								</div>
							</div>
							<div class = "reserInfo infoDIV" id = "reserInfo">
								<span class = "labelName">예약 가능 날짜/불가능한 날짜</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymUseDateChangeForm();"><br>
								<span class = "dateName" >${hgContent.hg_start_date } ~ ${hgContent.hg_end_date } / ${hgContent.hg_not_date }</span><br>
								<span class = "labelName">예약 가능 시간</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymUseTimeChangeForm();"><br>
								<span class = "dateName" >${hgContent.hg_start_time }:00 ~ ${hgContent.hg_end_time }:00</span>
							</div>
							<div class = "date infoDIV" id = "date_div"></div>
							<div class="price infoDIV">
								<span class = "labelName">대여 비용</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymPriceChangeForm();"><br>
								<span class = "dateName"  id = "hg_price_span">${hgContent.hg_price }</span>
							</div>
							<div id = "reviewArea">
								<h3>이용 후기</h3>
								<c:if test = "${empty reviewContent }">
									<div>작성된 후기가 없습니다.</div>
								</c:if>
								<c:if test = "${!empty reviewContent }">
									<c:forEach var = "dto" items="${reviewContent }">
										작성자 : ${dto.rev_mem_id }/ 작성 날짜 : ${dto.rev_writedate } / 별점 : ${dto.rev_star }<br>
										제목 : ${dto.rev_sub }<br>
										${dto.rev_cont }
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--nomalAllWrap-->
		</div>
	</div>

	<%@include file="../_include/footer.jsp"%>
</body>
</html>