<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f0e5f2abca3d4fd875382e01cfd5ab6&libraries=services"></script>
<script src="js/httpRequest.js"></script>
<c:if test = "${hg_check }">
	<script>
		window.alert('등록된 홈짐 정보가 있습니다.');
		location.href='myHomeGymCheck.do?mem_id=${sessionScope.sid==null?sessionScope.coachid:sessionScope.sid }';
	</script>
</c:if>
<script>
	var count = 0;
	

	
	window.addEventListener('load', function() {
		var today = getTimeStamp();
		$('#start_date').attr('min', today);
		$('#end_date').attr('min', today);
		$('#start_date').val(today);
		$("#date_div").datepicker( "option", "minDate", today );
		
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
			showMonthAfterYear: true,
			changeMonth:true,
			changeYear:true,
			yearSuffix:'년'
		});
	});
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

	function addEq(){
		
		var eq_name = document.getElementById('eq_name_temp').value; 
		var eq_count = document.getElementById('eq_count_temp').value;
		var eq_div = document.createElement('div');
		eq_div.setAttribute('id', count);
		eq_div.setAttribute('class', 'eq_add_list');
		var eq_text = document.createElement('span');
		eq_text.innerText = eq_name + ' : ' + eq_count;
		var eq_name_check = document.createElement('input');
		eq_name_check.setAttribute('type', 'checkbox');
		eq_name_check.setAttribute('name', 'eq_name');
		eq_name_check.setAttribute('value', eq_name);
		eq_name_check.setAttribute('checked', true);
		eq_name_check.setAttribute('style', 'display:none;')
		var eq_count_check = document.createElement('input');
		eq_count_check.setAttribute('type', 'checkbox');
		eq_count_check.setAttribute('name', 'eq_count');
		eq_count_check.setAttribute('value', eq_count);
		eq_count_check.setAttribute('checked', true);
		eq_count_check.setAttribute('style', 'display:none;')
		var eq_delete_bt = document.createElement('input');
		eq_delete_bt.setAttribute('type','button');
		eq_delete_bt.setAttribute('value','삭제');
		eq_delete_bt.setAttribute('class', 'btn btn-primary btn-lg sbtn');
		eq_delete_bt.setAttribute('onclick','javascript:ListItemDelete('+count+')');
		eq_div.appendChild(eq_text);
		eq_div.appendChild(eq_name_check);
		eq_div.appendChild(eq_count_check);
		eq_div.appendChild(eq_delete_bt);
		document.getElementById('eq_List').appendChild(eq_div);
		count++;		
	}
	function plus(){
		var Li=document.getElementById('imgItem');
		var plusli = document.createElement('input');
		plusli.setAttribute('type','file');
		plusli.setAttribute('name','upload');
		Li.appendChild(plusli);
	}
	
	function ListItemDelete(count){
		document.getElementById(count).remove();
	}
	function addrPopupOpen(){
		window.open('HomeGymAddrPopup.do', 'addrPopup', 'width=300, height=400, left=30%, top=30%');
	}
	function addSubmit() {
		var nicknameCheck = document.getElementById('nickname_overlap').value;
		if(nicknameCheck=='0'){
			window.alert('닉네임 중복 체크를 해주세요.');
			return;
		}
		if(document.getElementById('eq_List').innerHTML=='보유중인 운동 기구를 추가해주세요.'){
			window.alert('보유중인 기구를 등록해주세요.');
			return;
		}

	    var fileCheck = document.getElementsByName("upload");
	    for(var i = 0 ; i < fileCheck.length; i++){
	    	window.alert(fileCheck[i].value);
	    	if(!fileCheck[i].value){
	    		window.alert('첨부하려는 파일을 다시 확인해주세요.');
	    		return;
	    	}
	    }
		document.getElementById('addForm').submit();
	}
	function start_change(){
		var result = document.getElementById('start_date').value;
		$("#date_div").datepicker( "option", "minDate", result );
		document.getElementById('end_date').setAttribute('min', result);
	}
	function end_change(){
		var start_result = document.getElementById('start_date').value;
		var end_result = document.getElementById('end_date').value;
		if(start_result>end_result){
			window.alert('종료 날짜는 시작 날짜보다 빠를 수 없습니다.');
			end_result += start_result + 1;
			return;
		}
		
		$("#date_div").datepicker( "option", "maxDate", end_result );
	}
	function not_change(){
		var result = document.getElementById('not_date').value;
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
	function nicknameCheck(){
		var hg_nickname = document.getElementById('hg_nickname').value;
		if(hg_nickname==''){
			var checkText = document.getElementById('nicknameCheckText');
			checkText.innerHTML = '닉네임을 입력해주세요.';
			return;
		}
		var params = 'hg_nickname='+hg_nickname;
		sendRequest('HomeGymNickNameCheck.do', params, nicknameCheck_rq, 'GET');
	}
	function nicknameCheck_rq(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				data = eval('('+data+')');
				data = data.hg_NickNameCheck;
				var checkText = document.getElementById('nicknameCheckText');
				if(data=='1'){
					checkText.innerHTML = '이미 있는 닉네임입니다.';
					document.getElementById('nickname_overlap').value = '0';
				}else if(data=='0'){
					checkText.innerHTML = '사용 가능한 닉네임입니다.';
					document.getElementById('nickname_overlap').value = '1';
				}
			}
		}
	}
	function avgPrice(){
		sendRequest('avgPrice.do', null, avgPrice_rq, 'GET');
	}
	function avgPrice_rq(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				data = eval('('+data+')');
				data = data.avgPrice;
				document.getElementById('price').innerText = data;
			}
		}
	}
	function end_time_click(){
		var start_time = document.getElementById('start_time').value;
		if(start_time == '-'){
			window.alert('시작 시간을 먼저 선택해주세요');
			return;
		}
	}
	function time_check(){
		var start_time = document.getElementById('start_time').value;
		var end_time = document.getElementById('end_time').value;
		if(end_time == '-'){
			window.alert('종료 시간을 선택해주세요');
			return;
		}
		var time_dv = end_time - start_time;
		if(time_dv<1){
			window.alert('종료 시간은 시작시간보다 커여합니다.');
			document.getElementById('end_time')[0].selected = true;
			return;
		}
	}
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                stationSelectOptionAdd(roadAddr);
           		
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("faddr").value = roadAddr;                
            }
        }).open();

    }
    function stationSelectOptionAdd(addr){
    	document.getElementById('map').style.display = 'block';
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    draggable: false,
		    level: 5 // 지도의 확대 레벨
		};  

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
        //주소-좌표 변환 객체를 생성합니다
    	var geocoder = new kakao.maps.services.Geocoder();

    	//주소로 좌표를 검색합니다
    	geocoder.addressSearch(addr, function(result, status) {

    	// 정상적으로 검색이 완료됐으면 
    	 if (status === kakao.maps.services.Status.OK) {

    	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    	    map.setCenter(coords);
    		// 장소 검색 객체를 생성합니다
           	var ps = new kakao.maps.services.Places(map); 
			//document.getElementById('map').style.display='none';
           	// 카테고리로 은행을 검색합니다
           	ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 
			
           	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
           	function placesSearchCB (data, status, pagination) {
           	    if (status === kakao.maps.services.Status.OK) {
       				var stationSelect = document.getElementById('stationSelect');
       				while ( stationSelect.hasChildNodes() ) { stationSelect.removeChild( stationSelect.firstChild ); }
           	        for (var i=0; i<data.length; i++) {
           	            var optionTag = document.createElement('option');
           	            optionTag.setAttribute('value', data[i].place_name);
           	            optionTag.innerText = data[i].place_name;
           	            stationSelect.appendChild(optionTag);
           	        }
           	    }else{
           	    	var stationSelect = document.getElementById('stationSelect');
       				while ( stationSelect.hasChildNodes() ) { stationSelect.removeChild( stationSelect.firstChild ); }
       	            var optionTag = document.createElement('option');
       	            optionTag.setAttribute('value', '조회된 주변 역 없음.');
       	            optionTag.innerText = '조회된 주변 역 없음';
       	            stationSelect.appendChild(optionTag);
           	    }
           	}
    	 }
    	});
    }
</script>
<style>
.homegymAddArea .HomeGymAddLabel {width: 200px; height:40px; line-height:40px; text-align: right; vertical-align: center;}
textarea {resize: none;}
.homegymAddArea #nicknameCheckText {text-align: center;}
#date_div {width:800px; height:300; z-index: 1; margin-bottom: 30px;}
.ui-datepicker {width:800px; height:300px; top:30px; z-index: 2; }
.ui-datepicker .ui-datepicker-title {line-height: 41px; vertical-align: middle; }
.ui-datepicker select.ui-datepicker-year {width:25%;}
.ui-datepicker select.ui-datepicker-month {width:25%;}
.ui-datepicker td {height:40px;}
.ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {height:35px; }
#block_data_div{ position: absolute; height:300px; width : 800px; }
.homegymAddArea #HomeGymAddImgDiv {margin-top: 20px;}
.homegymAddArea {width: 50%; margin:auto; }
.homegymAddArea .commonInfo {margin: 10px auto;}
.homegymAddArea .eqInfo {margin: 10px auto;}
.homegymAddArea .eqInfo .eq_List {padding-left: 200px; font-size: 20px; font-weight: 200;}
.homegymAddArea .eqInfo .eq_List .eq_add_list {font-size: 20px; font-weight: 200; vertical-align: middle; margin-bottom: 10px;}
.homegymAddArea .eqInfo .eq_List .eq_add_list span {font-size: 20px; font-weight: 200; vertical-align: middle;}
.homegymAddArea .eqInfo .eq_List .eq_add_list input[type=button] {margin-left: 20px;}

.homegymAddArea .imgInfo {margin: 10px auto;}
.homegymAddArea .dateInfo {margin: 10px auto;}
.homegymAddArea input[type=text] {width: 200px; }
.homegymAddArea select {width: 200px; size:landscape;}
.homegymAddArea input[type=date] {width: 200px; }
.homegymAddArea textarea {width: 300px; height:150px; }
.homegymAddArea .dateInfo {margin-bottom: 30px; }
.homegymAddArea .dateInfo th {width: 200px;}
.homegymAddArea .button_div {text-align: center; margin: 30px 0px;}

#map {position:absolute; width: 400px; height: 200px; top:100%; display:none;}
</style>
<div class = "homegymAddArea">
	<h1>홈짐 등록하기</h1>
	<form name="HomeGymAddForm" id="addForm" action="HomeGymAdd.do"
		method="post" enctype="multipart/form-data">
		<h5>기본 정보</h5>
		<ul class = "commonInfo">
			<li>
				<label class="HomeGymAddLabel">홈짐 공유자 닉네임</label>
				<input type="hidden" name="hg_mem_id" value = "${sessionScope.sid==null?sessionScope.coachid:sessionScope.sid }">
				<input type="text" name="hg_nickname" id = "hg_nickname" placeholder="최대 10글자" required="required">
				<input type="button" class = "btn btn-primary btn-lg sbtn" value="중복 확인" onclick = "javascript:nicknameCheck();">
				<span id = "nicknameCheckText"></span><input type="hidden" id="nickname_overlap" value="0">
			</li>
			<li>
				<label class="HomeGymAddLabel"></label> ex)곰돌이 님의 홈짐</li>
			<li>
				<label class="HomeGymAddLabel">도로명 주소</label>
				<input type="text" name="hg_faddr" id = "faddr" readonly="readonly" required="required">
				<input type="button" class = "btn btn-primary btn-lg sbtn" value="주소 검색" onclick="sample4_execDaumPostcode()">
			</li>
			<li>
				<label class="HomeGymAddLabel">상세주소</label>
				<input type="text" name="hg_saddr"id = "saddr" required="required" >
			</li>
			<li>
				<label class="HomeGymAddLabel"></label> 주소를 명확히 작성하셔야<br>
				<label class="HomeGymAddLabel"></label> 예약자가 찾아갈 때 혼선이 없습니다.<br>
				<label class="HomeGymAddLabel"></label> 상세 주소는 결제 완료 후 예약자 페이지에서 확인 가능합니다.<br>
			</li>
			<li>
				<div id = "map"></div>
			</li>
			<li>
				<label class="HomeGymAddLabel">가까운 역</label>
				<select id = "stationSelect" required="required"></select>
			</li>
			<li>
				<label class="HomeGymAddLabel">오시는 길</label>
				<textarea rows="5" cols="20" name="hg_comeinfo" required="required"></textarea>
			</li>
			<li>
				<label class="HomeGymAddLabel">수용 인원</label>
				<select	name="hg_person_count">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select>
			</li>
		</ul>
		<h5>보유 기구</h5>
		<ul class = "eqInfo">
			<li>
				<label class="HomeGymAddLabel">보유 운동 기구</label>
				<select	name="eq_name_temp" id = "eq_name_temp">
						<option value="armcurl">암 컬</option>
						<option value="chestpress">체스트 프레스</option>
						<option value="dumbbell">덤벨</option>
						<option value="halfract">하프 렉</option>
						<option value="latpulldown">렛 풀 다운</option>
						<option value="legcurl">레그 컬</option>
						<option value="smithmachine">스미스머신</option>
						<option value="pullup">풀업</option>
						<option value="running">런닝머신</option>
				</select>
			</li>
			<li>
				<label class="HomeGymAddLabel">보유 수</label>
				<select name="eq_count_temp" id = "eq_count_temp">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select>
				<input type="button" class = "btn btn-primary btn-lg sbtn" value="추가" onclick = "javascript:addEq();">
			</li>
			<li>
				<div class = "eq_List" id = "eq_List">보유중인 운동 기구를 추가해주세요.</div>
			</li>
			<li>
				<label class="HomeGymAddLabel">기타 설명</label>
				<textarea rows="5" cols="20" name="hg_info"></textarea>
			</li>
		</ul>
		<h5>소개 사진 등록</h5>
		<ul class = "imgInfo">
			<li><label class="HomeGymAddLabel">사진 등록하기</label></li>
			<li id = "imgItem"><input type="file" name="upload"></li>
			<li>
				<div id="HomeGymAddImgDiv">
				<input type="button" value="파일추가" onclick="plus();">
				</div>
			</li>
		</ul>
		<h5>예약 날짜</h5>
		<table class = "dateInfo">
			<tr>
				<th>시작일</th>
				<td>
				<input type="date" id="start_date" name="hg_start_date" onchange="javascript:start_change();">
				</td>
			</tr>
			<tr>
				<th>마감일</th>
				<td>
				<input type="date" id="end_date" name="hg_end_date" onchange="javascript:end_change();">
				</td>
			</tr>
			<tr>
				<th>불가능한 날짜</th>
				<td><select name="hg_not_date" id = "not_date" onchange = "not_change();">
						<option value="없음" selected>없음</option>
						<option value="평일">평일</option>
						<option value="주말">주말</option>
				</select>
				</td>
				<td colspan="2"></td>
			</tr>
		</table>
		<div id = "date_div">
		<div id = "block_data_div"></div><!-- 달력 클릭 못하게 덮는 용도 -->
		</div>
		
		<ul class = "timeInfo">
			<li>
			<label>예약 가능 시간</label>
			</li>
			<li>
			<label class= "HomeGymAddLabel"></label>
			<select name="hg_start_time" id = "start_time">
					<option value="-">시간을 선택해주세요</option>
					<option value="0">00:00</option>
					<option value="1">01:00</option>
					<option value="2">02:00</option>
					<option value="3">03:00</option>
					<option value="4">04:00</option>
					<option value="5">05:00</option>
					<option value="6">06:00</option>
					<option value="7">07:00</option>
					<option value="8">08:00</option>
					<option value="9">09:00</option>
					<option value="10">10:00</option>
					<option value="11">11:00</option>
					<option value="12">12:00</option>
					<option value="13">13:00</option>
					<option value="14">14:00</option>
					<option value="15">15:00</option>
					<option value="16">16:00</option>
					<option value="17">17:00</option>
					<option value="18">18:00</option>
					<option value="19">19:00</option>
					<option value="20">20:00</option>
					<option value="21">21:00</option>
					<option value="22">22:00</option>
					<option value="23">23:00</option>
			</select>
			<select name="hg_end_time" id = "end_time" onclick="javascript:end_time_click();" onchange="javascript:time_check();">
					<option value="-">시간을 선택해주세요</option>
					<option value="0">00:00</option>
					<option value="1">01:00</option>
					<option value="2">02:00</option>
					<option value="3">03:00</option>
					<option value="4">04:00</option>
					<option value="5">05:00</option>
					<option value="6">06:00</option>
					<option value="7">07:00</option>
					<option value="8">08:00</option>
					<option value="9">09:00</option>
					<option value="10">10:00</option>
					<option value="11">11:00</option>
					<option value="12">12:00</option>
					<option value="13">13:00</option>
					<option value="14">14:00</option>
					<option value="15">15:00</option>
					<option value="16">16:00</option>
					<option value="17">17:00</option>
					<option value="18">18:00</option>
					<option value="19">19:00</option>
					<option value="20">20:00</option>
					<option value="21">21:00</option>
					<option value="22">22:00</option>
					<option value="23">23:00</option>
			</select>
			</li>
			<li>
			<label>요금 설정/시간</label>
			<input type="text" name="hg_price"> 
			<input type="button" class = "btn btn-primary btn-lg sbtn" value="평균 요금 확인하기" onclick = "javascript:avgPrice();">
			<label class="HomeGymAddLabel">평균 요금 : <span id = "price">----</span>원</label>
			</li>
		</ul>
		<div class = "button_div">
			<input type="button" class = "btn btn-primary btn-lg sbtn" value="홈짐 등록 신청" onclick="javascript:addSubmit();">
			<input type="button" class = "btn btn-primary btn-lg sbtn" value="돌아가기" onclick="javascript:location.href='index.do'">
		</div>
	</form>
</div>
<%@include file="../_include/footer.jsp" %>