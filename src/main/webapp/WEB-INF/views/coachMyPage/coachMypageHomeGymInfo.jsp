<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="assets/css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<%@include file="../header2.jsp"%>
<style>
.titlee {font-weight: 550;color: #12151d;margin-bottom: 20px;}
.titlee:before {content: "";display: inline-block;background-color: #257cda;width: 11px;height: 41px;}
.titlee hr {border-top: 1px solid #d1d1d4;margin-bottom: 30px;}
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
.hgLeftDIV .mapArea {height:300px;}
.hgRightDIV .infoDIV{width: 600px; border-bottom:1px solid #e4e4e4;}
.hgRightDIV .reser_input{width: 180px;}
.hgLeftDIV .infoDIV .dateName{font-size:20px;}
.hgRightDIV .infoDIV .dateName{font-size:20px;}
.hgLeftDIV .infoDIV .labelName{font-size:25px; font-weight: 550; padding-right: 50px;}
.hgRightDIV .infoDIV .labelName{font-size:25px; font-weight: 550; padding-right: 50px;}
.hgRightDIV .infoDIV .labelName{font-size:25px; font-weight: 550; padding-right: 50px;}
.hgRightDIV .reviewArea table{border:1px solid gray; width:600px; margin:0px auto;}
.rebtn{width:50px; margin:4px 0 0 10px; height:20px; font-size: 12px; border: 0px; border-radius: 5px; background-color: #e4e4e4;}
.okbtn{width: 100px; margin:0; height: 30px; font-weight:bold; font-size:15px;  border: 0px; border-radius: 5px; color:white;background-color:#257cd6;}
</style>
<script src="https://kit.fontawesome.com/802041d611.js"	crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f0e5f2abca3d4fd875382e01cfd5ab6&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
var count = 100;
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
			beforeShowDay: disableSomeDay,
			showMonthAfterYear: true,
			changeMonth:false,
			changeYear:false,
			yearSuffix:'년'
		});
	});
});
function disableSomeDay(date){
	var result = '${hgContent.hg_not_date}';
	var noWeekend = jQuery.datepicker.noWeekends(date);
	if(result=='없음'){
		return [true];
	}else if(result=='평일'){
		return noWeekend[0] ? [false]:[true];
	}else if(result=='주말'){
		return noWeekend[0] ? [true]:noWeekend;
	}
}
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
				window.alert('홈짐 정보가 변경되었습니다.');
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
				window.alert('홈짐 정보가 변경되었습니다.');
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
				window.alert('홈짐 정보가 변경되었습니다.');
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
	eq_list.innerHTML += '기구명<select style = "width:200px;"	name="eq_name_temp" id = "eq_name_temp">'
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
	eq_list.innerHTML += '수량<select style = "width:200px;" name="eq_count_temp" id = "eq_count_temp">'
		+'<option value="1">1</option>'
		+'<option value="2">2</option>'
		+'<option value="3">3</option>'
		+'<option value="4">4</option>'
		+'<option value="5">5</option>'
		+'</select>';
	eq_list.innerHTML += '<input type = "button" value = "추가" class = "rebtn" onclick = "javascript:mypageEq_add();">';
		eq_list.innerHTML += '<div id = "eq_list_items">'
								+ '<c:forEach varStatus = "s" var = "dto" items = "${eqContent}">'
									+ '<div id = "eq_item_div_${s.index}">'
										+ '<span class = "dateName">${dto.eq_name} : </span> <input type ="hidden" name = "eq_name"  value = "${dto.eq_name}">'
										+ '<span class = "dateName">${dto.eq_count} EA</span> <input type ="hidden" name = "eq_count"  value = "${dto.eq_count}">'
										+ '<input type = "button" value = "삭제" class = "rebtn" onclick = "javascript:mypageEq_itemDelete(\'eq_item_div_${s.index}\');"><br>'	
									+ '</div>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<input type = "submit"" value = "수정 완료" class = "rebtn" onclick = "javascript:eq_listUpdate();">'
							+ '<input type = "button" value = "수정 취소" class = "rebtn" onclick = "javascript:eq_listUpdateCancel();">'
}
function mypageEq_add(){
	var eq_name = document.getElementById('eq_name_temp').value; 
	var eq_count = document.getElementById('eq_count_temp').value;
	var eq_div = document.createElement('div');
	eq_div.setAttribute('id', 'eq_item_div_'+count);
	var eq_name_span = document.createElement('span');
	eq_name_span.setAttribute('class', 'dateName');
	eq_name_span.innerText = eq_name+' : ';
	var eq_count_span = document.createElement('span');
	eq_count_span.setAttribute('class', 'dateName');
	eq_count_span.innerText = eq_count+' EA';
	var eq_name_hidden = document.createElement('input');
	eq_name_hidden.setAttribute('type', 'hidden');
	eq_name_hidden.setAttribute('name', 'eq_name');
	eq_name_hidden.setAttribute('value', eq_name);
	var eq_count_hidden = document.createElement('input');
	eq_count_hidden.setAttribute('type', 'hidden');
	eq_count_hidden.setAttribute('name', 'eq_count');
	eq_count_hidden.setAttribute('value', eq_count);
	var eq_delete_bt = document.createElement('input');
	eq_delete_bt.setAttribute('type','button');
	eq_delete_bt.setAttribute('value','삭제');
	eq_delete_bt.setAttribute('class', 'rebtn');
	eq_delete_bt.setAttribute('onclick','javascript:mypageEq_itemDelete("eq_item_div_'+count+'")');
	eq_div.appendChild(eq_name_span);
	eq_div.appendChild(eq_name_hidden);
	eq_div.appendChild(eq_count_span);
	eq_div.appendChild(eq_count_hidden);
	eq_div.appendChild(eq_delete_bt);
	document.getElementById('eq_list_items').appendChild(eq_div);
	count++;		
}
function mypageEq_itemDelete(eq_name){
	var obj = document.getElementById(eq_name);
	obj.parentNode.removeChild(obj);
}
function eq_listUpdateCancel(){
	var eq_list = document.getElementById('eq_list');
	eq_list.innerHTML = '';
	eq_list.innerHTML += '<ul>'
		+ '<c:forEach var = "list" items = "${eqContent }">'
		+ '<li class = "showList dateName">${list.eq_name } : ${list.eq_count } EA</li>'
		+ '</c:forEach>'
	+ '</ul>';
}
function eq_listUpdate(){
	var mem_id = document.getElementById('hg_mem_id').value;
	var eq_name_list = document.getElementsByName('eq_name');
	var eq_count_list = document.getElementsByName('eq_count');
	var params = 'mem_id='+mem_id;
	for(var i = 0 ; i < eq_name_list.length ; i ++){
		params += '&eq_name='+eq_name_list[i].value;
		params += '&eq_count='+eq_count_list[i].value;
	}
	sendRequest('mypageEqListUpdate.do', params, eq_listUpdate_rq, 'GET');
}
function eq_listUpdate_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var result = data.change_result;
			var eq_list = data.change_eqlist;
			if(result>0){
				window.alert('홈짐 정보가 변경되었습니다.');
				var eq_list_div = document.getElementById('eq_list');
				while ( eq_list_div.hasChildNodes() ) { eq_list_div.removeChild( eq_list_div.firstChild ); }
				var eq_list_div_ul = document.createElement('ul');
				for(var i = 0 ; i < eq_list.length; i++){
					var eq_list_div_ul_li = document.createElement('li');
					eq_list_div_ul_li.setAttribute('class', 'showList dateName');
					eq_list_div_ul_li.innerText = eq_list[i].eq_name + ' : ' + eq_list[i].eq_count + ' EA';
					eq_list_div_ul.appendChild(eq_list_div_ul_li);
				}
				eq_list_div.appendChild(eq_list_div_ul);
			}
		}
	}
}
function mypageHomeGymUseDateChangeForm(start_date, end_date, not_date){
	var today = getTimeStamp();
	var date_span = document.getElementById('reser_date');
	while ( date_span.hasChildNodes() ) { date_span.removeChild( date_span.firstChild ); }
	var change_start_date = document.createElement('input');
	change_start_date.setAttribute('class', 'reser_input');
	change_start_date.setAttribute('type', 'date');
	change_start_date.setAttribute('id', 'choice_start_date');
	if(start_date<today){
		change_start_date.setAttribute('min', today);
		change_start_date.setAttribute('value', start_date);
	}else{
		change_start_date.setAttribute('min', start_date);		
		change_start_date.setAttribute('value', start_date);
	}
	var change_end_date = document.createElement('input');
	change_end_date.setAttribute('type', 'date');
	change_end_date.setAttribute('class', 'reser_input');
	change_end_date.setAttribute('id', 'choice_end_date');
	change_end_date.setAttribute('value',end_date);
	
	var change_not_date = document.createElement('select');
	change_not_date.setAttribute('id', 'choice_not_date');
	change_not_date.setAttribute('class', 'reser_input');
	var change_not_date_option1 = document.createElement('option');
	change_not_date_option1.setAttribute('value', '평일');
	change_not_date_option1.innerText = '평일';
	var change_not_date_option2 = document.createElement('option');
	change_not_date_option2.setAttribute('value', '주말');
	change_not_date_option2.innerText = '주말';
	var change_not_date_option3 = document.createElement('option');
	change_not_date_option3.setAttribute('value', '없음');
	change_not_date_option3.innerText = '없음';
	if(not_date=='평일'){	change_not_date_option1.setAttribute('selected', true);}
	else if(not_date=='주말'){change_not_date_option2.setAttribute('selected', true);}
	else if(not_date=='없음'){change_not_date_option3.setAttribute('selected', true);}
	change_not_date.appendChild(change_not_date_option1);
	change_not_date.appendChild(change_not_date_option2);
	change_not_date.appendChild(change_not_date_option3);
	
	var change_date_btn = document.createElement('input');
	change_date_btn.setAttribute('type', 'button');
	change_date_btn.setAttribute('class', 'rebtn');
	change_date_btn.setAttribute('value', '수정 완료');
	change_date_btn.setAttribute('onclick', 'javascript:useDateUpdate();');
	
	var cancel_date_btn = document.createElement('input');
	cancel_date_btn.setAttribute('type', 'button');
	cancel_date_btn.setAttribute('class', 'rebtn');
	cancel_date_btn.setAttribute('value', '수정 취소');
	cancel_date_btn.setAttribute('onclick', 'javascript:useDateUpdateCancel();');
	
	date_span.appendChild(change_start_date);
	date_span.appendChild(document.createTextNode(' ~ '));
	date_span.appendChild(change_end_date);
	date_span.appendChild(document.createTextNode(' / '));
	date_span.appendChild(change_not_date);
	date_span.innerHTML += '<br>';
	date_span.appendChild(change_date_btn);
	date_span.appendChild(cancel_date_btn);
}
function useDateUpdate(){
	var mem_id = document.getElementById('hg_mem_id').value;
	var choice_start_date = document.getElementById('choice_start_date').value;
	var choice_end_date = document.getElementById('choice_end_date').value;
	var choice_not_date = document.getElementById('choice_not_date').value;
	window.alert(choice_start_date);
	window.alert(choice_end_date);
	window.alert(choice_not_date);
	var params = 'hg_mem_id='+mem_id+'&choice_start_date='+choice_start_date+'&choice_end_date='+choice_end_date+'&choice_not_date='+choice_not_date;
	sendRequest('mypageUseDateUpdate.do', params, useDateUpdate_rq, 'GET');
}
function useDateUpdate_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var result = data.change_result;
			var start_date = data.change_start_date;
			var end_date = data.change_end_date;
			var not_date = data.change_not_date;
			if(result>0){
				window.alert('홈짐 정보가 변경되었습니다.');
				var reser_date = document.getElementById('reser_date');
				reser_date.innerText = start_date + ' ~ ' + end_date + ' / ' + not_date;
				$("#date_div").datepicker( "option", "minDate", start_date );
				$("#date_div").datepicker( "option", "maxDate", end_date );
				not_change(not_date);
			}
		}
	}
}
function not_change(result){
	$("#date_div").datepicker( "option", "beforeShowDay", disableSomeDay );

	function disableSomeDay(date){
		var noWeekend = jQuery.datepicker.noWeekends(date);
		if(result=='없음'){
			return [true];
		}else if(result=='평일'){
			return noWeekend[0] ? [false]:[true];
		}else if(result=='주말'){
			return noWeekend[0] ? [true]:noWeekend;
		}
	}
}
function useDateUpdateCancel(){
	var reser_date = document.getElementById('reser_date');
	reser_date.innerText = '${hgContent.hg_start_date } ~ ${hgContent.hg_end_date } / ${hgContent.hg_not_date }';
}
function getTimeStamp() {

    var d = new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);

    return s;
}

function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}
function mypageHomeGymUseTimeChangeForm(start_time, end_time){
	var time_span = document.getElementById('reser_time');
	while ( time_span.hasChildNodes() ) { time_span.removeChild( time_span.firstChild ); }
	var start_select = document.createElement('select');
	start_select.setAttribute('id', 'choice_start_time');
	start_select.setAttribute('class', 'reser_input');
	var end_select = document.createElement('select');
	end_select.setAttribute('id', 'choice_end_time');
	end_select.setAttribute('class', 'reser_input');
	for(var i = 1 ; i <= 23; i++){
		var start_option = document.createElement('option');
		start_option.setAttribute('value', i);
		if(start_time==i){
			start_option.setAttribute('selected', true);
		}
		var end_option = document.createElement('option');
		end_option.setAttribute('value', i);
		if(end_time==i){
			end_option.setAttribute('selected', true);
		}
		if(start_time<10){
			start_option.innerText = '0'+i+':00';
		}else{
			start_option.innerText = i+':00';
		}
		if(end_time<10){
			end_option.innerText = '0'+i+':00'
		}else{
			end_option.innerText = i+':00';
		}
		start_select.appendChild(start_option);
		end_select.appendChild(end_option);
	}
	var time_update_btn = document.createElement('input');
	time_update_btn.setAttribute('type', 'button');
	time_update_btn.setAttribute('value', '수정 완료');
	time_update_btn.setAttribute('class', 'rebtn');
	time_update_btn.setAttribute('onclick', 'javascript:useTimeUpdate();');

	var time_update_cancel_btn = document.createElement('input');
	time_update_cancel_btn.setAttribute('type', 'button');
	time_update_cancel_btn.setAttribute('value', '수정 취소');
	time_update_cancel_btn.setAttribute('class', 'rebtn');
	time_update_cancel_btn.setAttribute('onclick', 'javascript:useTimeUpdateCancel();');
	
	time_span.appendChild(start_select);
	time_span.appendChild(document.createTextNode(' ~ '));
	time_span.appendChild(end_select);
	time_span.innerHTML += '<br>';
	time_span.appendChild(time_update_btn);
	time_span.appendChild(time_update_cancel_btn);
}
function useTimeUpdate(){
	var mem_id = document.getElementById('hg_mem_id').value;
	var start_time = document.getElementById('choice_start_time').value;
	var end_time = document.getElementById('choice_end_time').value;
	var params = 'hg_mem_id='+mem_id+'&choice_start_time='+start_time+'&choice_end_time='+end_time;
	sendRequest('mypageUseTimeUpdate.do', params, useTimeUpdate_rq, 'GET');
}
function useTimeUpdate_rq(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data=eval('('+data+')');
			var result = data.change_result;
			var start_time = data.change_start_time;
			var end_time = data.change_end_time;
			if(result>0){
				window.alert('홈짐 정보가 변경되었습니다.');
				var reser_time = document.getElementById('reser_time');
				if(start_time<10){
					start_time = '0'+start_time;
				}
				if(end_time<10){
					end_time = '0'+end_time;
				}
				reser_time.innerText = start_time + ':00 ~ ' + end_time + ':00';
			}
		}
	}
}
function useTimeUpdateCancel(){
	var start_time = '${hgContent.hg_start_time}';
	var end_time = '${hgContent.hg_end_time}';
	if(start_time<10){
		start_time = '0'+start_time;
	}
	if(end_time<10){
		end_time = '0'+end_time;
	}
	document.getElementById('reser_time').innerText = '${hgContent.hg_start_time }:00 ~ ${hgContent.hg_end_time }:00';
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
				window.alert('홈짐 정보가 변경되었습니다.');
				document.getElementById('hg_price_span').innerHTML = price;
			}
		}
	}
}
function priceUpdateCancel(){
	document.getElementById('hg_price_span').innerHTML = '${hgContent.hg_price}';
}
</script>
</head>
<body>
	<div class="mypage_wrap">
		<%@include file="./coachMypageSideMenu.jsp"%>
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
								<div id = "map" class = "mapArea infoDIV"></div>
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
								<span class = "labelName">예약 가능 날짜/불가능한 날짜</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymUseDateChangeForm('${hgContent.hg_start_date}','${hgContent.hg_end_date }','${hgContent.hg_not_date }');"><br>
								<span class = "dateName" id = "reser_date">${hgContent.hg_start_date } ~ ${hgContent.hg_end_date } / ${hgContent.hg_not_date }</span><br>
								<span class = "labelName">예약 가능 시간</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymUseTimeChangeForm(${hgContent.hg_start_time}, ${hgContent.hg_end_time });"><br>
								<span class = "dateName" id = "reser_time">${hgContent.hg_start_time }:00 ~ ${hgContent.hg_end_time }:00</span>
							</div>
							<div class = "date infoDIV" id = "date_div"></div>
							<div class="price infoDIV">
								<span class = "labelName">대여 비용</span><input type = "button" value = "수정" class = "rebtn" onclick = "javascript:mypageHomeGymPriceChangeForm();"><br>
								<span class = "dateName"  id = "hg_price_span">${hgContent.hg_price }</span>
							</div>
							<div class = "reviewArea">
								<h3>이용 후기</h3>
								<c:if test = "${empty reviewContent }">
									<div>작성된 후기가 없습니다.</div>
								</c:if>
								<c:if test = "${!empty reviewContent }">
									<div>${star_avg }</div>
									<table>
										<thead>
											<tr>
												<th>별점</th>
												<th>제목</th>
												<th>내용</th>
												<th>작성자</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var = "dto" items="${reviewContent }">
											<tr>
												<td>${dto.rev_star }</td>
												<td>${dto.rev_sub }</td>
												<td>${dto.rev_cont }</td>
												<td>${dto.rev_mem_id }</td>
												<td>${dto.rev_writedate }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
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