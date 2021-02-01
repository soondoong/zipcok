<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/httpRequest.js"></script>
<style>
.HomeGymAddLabel {
	width: 200px;
	text-align: right;
	vertical-align: top;
}

ul {
	list-style-type: none;
}

textarea {
	resize: none;
}
#date_div {
width:600px;
height:300;
z-index: 1;
}
.ui-datepicker {
width:600px;
height:270px;
top:30px;
z-index: 2;
}
#block_data_div{
position: absolute;
height:270px;
width : 600px;

}
</style>
<script>
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
	var count = 0;
	function addEq(){
		
		var eq_name = document.getElementById('eq_name_temp').value; 
		var eq_count = document.getElementById('eq_count_temp').value;
		var eq_div = document.createElement('div');
		eq_div.setAttribute("id", count);
		var eq_text = document.createTextNode(eq_name + ":" + eq_count);
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
		eq_delete_bt.setAttribute('value','-');
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
		Li.innerHTML += '<br><input type="file" name="upload">';		
	}
	
	function ListItemDelete(count){
		document.getElementById(count).remove();
	}
	function addrPopupOpen(){
		window.open('HomeGymAddrPopup.do', 'addrPopup', 'width=300, height=400, left=30%, top=30%');
	}
	function addSubmit() {
		var start_date = document.getElementById('start_date').value;
		var start_year = start_date.slice(0, 4);
		var start_month = start_date.slice(5, 7);
		var start_day = start_date.slice(8, 10);
		document.getElementById('start_year').value = start_year;
		document.getElementById('start_month').value = start_month;
		document.getElementById('start_day').value = start_day;
		var end_date = document.getElementById('end_date').value;
		var end_year = end_date.slice(0, 4);
		var end_month = end_date.slice(5, 7);
		var end_day = end_date.slice(8, 10);
		document.getElementById('end_year').value = end_year;
		document.getElementById('end_month').value = end_month;
		document.getElementById('end_day').value = end_day;
		var hg_nickname = document.getElementById('hg_nickname').value;
		var nicknameCheck = document.getElementById('nickname_overlap').value;
		if(nicknameCheck=='0'){
			window.alert('닉네임 중복 체크를 해주세요.');
			return;
		}
		document.getElementById('addForm').submit();
	}
	function start_change(){
		var result = document.getElementById('start_date').value;
		$("#date_div").datepicker( "option", "minDate", result );
	}
	function end_change(){
		var result = document.getElementById('end_date').value;
		$("#date_div").datepicker( "option", "maxDate", result );
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
</script>
</head>
<body>
	<h1>홈짐 등록하기</h1>
	<form name="HomeGymAddForm" id="addForm" action="HomeGymAdd.do"
		method="post" enctype="multipart/form-data">
		<h5>기본 정보</h5>
		<ul>
			<li><label class="HomeGymAddLabel">홈짐 아이디</label>
			<input type="text" name="hg_mem_id" placeholder="최대 10글자">
			<input type="text" name="eq_mem_id" placeholder="최대 10글자">
			</li>
			<li>
			<label class="HomeGymAddLabel">홈짐 공유자 닉네임</label>
			<input type="text" name="hg_nickname" id = "hg_nickname" placeholder="최대 10글자">
			<input type="button" value="중복 확인" onclick = "javascript:nicknameCheck();">
			<br><span id = "nicknameCheckText"></span>
			<input type="hidden" id="nickname_overlap" value="0">
			</li>
			<li>
			<label class="HomeGymAddLabel"></label> ex)곰돌이 님의 홈짐</li>
			<li>
			<label class="HomeGymAddLabel">홈짐 주소</label>
			<input type="text" name="hg_faddr" id = "faddr" readonly="readonly">
			<input type="button"value="주소 검색" onclick="javascript:addrPopupOpen();">
			</li>
			<li>
			<label class="HomeGymAddLabel">상세주소</label>
			<input type="text" name="hg_saddr"id = "saddr" readonly="readonly">
			</li>
			<li><label class="HomeGymAddLabel"></label> 주소를 명확히 작성하셔야</li>
			<li><label class="HomeGymAddLabel"></label> 예약자가 찾아갈 때 혼선이 없습니다.</li>
			<li><label class="HomeGymAddLabel"></label> 상세 주소는 결제 완료 후 예약자 페이지에서 확인 가능합니다.</li>
			<li>
			<label class="HomeGymAddLabel">가까운 역</label>
			<select	name="hg_station">
					<option value="역 1">역 1</option>
					<option value="역 2">역 2</option>
					<option value="역 3">역 3</option>
					<option value="역 4">역 4</option>
			</select>
			</li>
			<li>
			<label class="HomeGymAddLabel">오시는 길</label>
			<textarea rows="5" cols="20" name="hg_comeinfo"></textarea>
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
		<ul>
			<li>
			<label class="HomeGymAddLabel">보유 운동 기구</label>
			<select	name="eq_name_temp" id = "eq_name_temp">
					<option value="eq 1">기구 1</option>
					<option value="eq 2">기구 2</option>
					<option value="eq 3">기구 3</option>
					<option value="eq 4">기구 4</option>
					<option value="eq 5">기구 5</option>
			</select>
			<label class="HomeGymAddLabel">보유 수</label>
			<select name="eq_count_temp" id = "eq_count_temp">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
			</select>
			<input type="button" value="+" onclick = "javascript:addEq();">
			</li>
			<li>
			<label class="HomeGymAddLabel"></label>
			<div id = "eq_List">보유중인 운동 기구를 추가해주세요.</div>
			</li>
			<li><label class="HomeGymAddLabel">기타 설명</label> <textarea
					rows="5" cols="20" name="hg_info"></textarea></li>
		</ul>
		<h5>소개 사진 등록</h5>
		<ul>
			<li id = "imgItem"><label class="HomeGymAddLabel">사진 등록하기</label><br>
			<input type="file" name="upload">
			</li>
			<li>
				<div id="HomeGymAddImgDiv">
				<input type="button" value="파일추가" onclick="plus();">
				</div>
			</li>
		</ul>
		<h5>예약 날짜</h5>
		<table>
			<tr>
				<th>시작일</th>
				<td>
				<input type="date" id="start_date" name="hg_start_date" onchange="javascript:start_change();">
				<input type="hidden" id="start_year" name="hg_start_date_year">
				<input type="hidden" id="start_month" name="hg_start_date_month">
				<input type="hidden" id="start_day" name="hg_start_date_day">
				</td>
				<th>마감일</th>
				<td>
				<input type="date" id="end_date" name="hg_end_date" onchange="javascript:end_change();">
				<input type="hidden" id="end_year" name="hg_end_date_year">
				<input type="hidden" id="end_month" name="hg_end_date_month">
				<input type="hidden" id="end_day" name="hg_end_date_day">
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
		
		<ul>
			<li>
			<label class="HomeGymAddLabel">예약 가능 시간</label>
			<select name="hg_start_time">
					<option value="9">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
			</select>
			<label>부터</label>
			<select name="hg_end_time">
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
			</select>
			</li>
			<li>
			<label class="HomeGymAddLabel">요금 설정/시간</label>
			<input type="text" name="hg_price">
			<input type="button" value="평균 요금 확인하기" onclick = "javascript:avgPrice();">
			<label class="HomeGymAddLabel">평균 요금 : <span id = "price">----</span>원</label>
			</li>
		</ul>
		<input type="button" value="홈짐 등록 신청" onclick="javascript:addSubmit();">
	</form>
</body>
</html>