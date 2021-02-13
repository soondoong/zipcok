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
.mypage_wrap .mypage_contents .homegym_main {width:800px;}
.mypage_wrap .mypage_contents .homegym_main .normalAllWrap .commonInfo {display:flex; margin-bottom: 20px;}
.mypage_wrap .mypage_contents .homegym_main .normalAllWrap .commonInfo .homegymImg {margin-right:30px;}
.mypage_wrap .mypage_contents .homegym_main .normalAllWrap .commonInfo .homegymImg img {width:200px; height:100px;}
.mypage_wrap .mypage_contents .homegym_main .normalAllWrap .normalInfo .normalInfo_text {font-size: 20px;}
.mypage_wrap .mypage_contents .homegym_main .normalAllWrap .normalInfo .mapArea div {width:600px; height:400px;}

.mypage_wrap .mypage_contents .homegym_main .normalAllWrap .homegymImgs {display:flex;}
.mypage_wrap .mypage_contents .homegym_main .normalAllWrap .homegymImgs .img-items {margin-right:10px;}
.mypage_wrap .mypage_contents .homegym_main .normalAllWrap .homegymImgs .img-items img {width:50px; height:50px;}

#date_div {width:800px; height:300; z-index: 1; margin-bottom: 30px;}
.ui-datepicker {width:800px; height:300px; top:30px; z-index: 2; }
.ui-datepicker .ui-datepicker-title {line-height: 41px; vertical-align: middle; }
.ui-datepicker select.ui-datepicker-year {width:25%;}
.ui-datepicker select.ui-datepicker-month {width:25%;}
.ui-datepicker td {height:40px;}
.ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {height:35px; }
#block_date_div{ position: relative; height:245px; width : 800px; top: -275px;}
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
			changeMonth:true,
			changeYear:true,
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
	var station_div = document.getElementById('station');
	station_div.innerHTML = '<input type = "text" id = ""';
}
function mypageHomeGymPerson_countChangeForm(){
	
}
function mypageHomeGymEquipementListChangeForm(){
	
}
function mypageHomeGymReservationInfoChangeForm(){
	
}
function mypageHomeGymPriceChangeForm(){
	
}
</script>
</head>
<body>
	<div class="mypage_wrap">
		<%@include file="./mypageSideMenu.jsp"%>

		<div class="mypage_contents">
			<div class="homegym_main">
				<div class="normalAllWrap">
					<h2 class="titlee">&nbsp;내 홈짐 보기</h2>
					<hr>
					<div class="commonInfo">
						<div class="homegymImg">
							<img src="/zipcok/img/homegym/common_homegym_img.jpg">
						</div>
						<div>
							<h3>${hgContent.hg_nickname } 네 홈짐</h3>
							<input type = "hidden" id = "hg_mem_id" value = "${hgContent.hg_mem_id }">
							<h5>좋아요 수 : ${like_count }</h5>
							<span>홈짐 검색 활성화 : <input id = "hg_status" type = "checkbox" <c:if test = "${hgContent.hg_status == '1' }">checked = "checked"</c:if> onchange = "javascript:status_change();">
							</span>
						</div>
					</div>
					<div class = "homegymImgs">
					<c:forEach var = "img" items="${imgContent }">
						<div class = "img-items"><img src = "upload/homegymInfo/${img.mfile_upload }"></div>
					</c:forEach>
					</div>
					<div class="normalInfo">
						<p class = "normalInfo_text">홈짐 위치 <a onclick = "javascript:mypageHomeGymAddrUpdate();">수정</a></p>
						<div class="location">
							<div class = "normalInfo_text">${hgContent.hg_faddr } ${hgContent.hg_saddr }</div>
						</div>
						<p class = "normalInfo_text">가까운 역</p>
						<div class="station">
							<div class = "normalInfo_text" id = "station_div">${hgContent.hg_station }   <a onclick = "javascript:mypageHomeGymStationChangeForm();">수정</a></div>
						</div>
						<div class = "mapArea">
							<div id="map"></div>
						</div>
						<p class = "normalInfo_text">수용 인원</p>
						<div class = "person_count">
							<div class = "normalInfo_text" id = "person_count">${hgContent.hg_person_count } <a onclick = "javascript:mypageHomeGymPerson_countChangeForm();">수정</a></div>
						</div>
						<div class = "eq_list">
							<p class = "normalInfo_text">보유 기구</p>
							<div id = "eq_list">
							<input type = "button" value = "기구 목록 수정">
								<ul>
								<c:forEach var = "list" items = "${eqContent }">
									<li>${list.eq_name } : ${list.eq_count } EA</li>
								</c:forEach>
								</ul>
							</div>
						</div>
						<div class = "reserInfo" id = "reserInfo">
							<div class = "normalInfo_text" id = "reser_date">예약 가능 날짜 : ${hgContent.hg_start_date } ~ ${hgContent.hg_end_date }/불가능한 날짜 : ${hgContent.hg_not_date }</div>
							<div class = "normalInfo_text" id = "reser_time">예약 가능 시간 : ${hgContent.hg_start_time }시 ~ ${hgContent.hg_end_time }시</div>
						</div>
						<div id = "date_div"></div>
						<p>
						<div class = "price" id = "price">
							<div class = "normalInfo_text">대여비용(시간당) : ${hgContent.hg_price } 원</div>
						</div>
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
			<!--nomalAllWrap-->
		</div>
	</div>
	<%@include file="../_include/footer.jsp"%>
</body>
</html>