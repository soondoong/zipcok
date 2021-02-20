<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<link href="css/jqueryui/jquery-ui.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f0e5f2abca3d4fd875382e01cfd5ab6&libraries=services"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
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
	mapContainer.style.width = '900px';
	mapContainer.style.height = '400px';
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
});


	$(function() {
		var start_date = '${hgContent.hg_start_date}'.substring(0, 10);
		var end_date = '${hgContent.hg_end_date}'.substring(0, 10);
		$('#choice_date').datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					beforeShowDay : function(date) {
						var result = '${hgContent.hg_not_date}';
						var noWeekend = jQuery.datepicker.noWeekends(date);
						if (result == '없음') {
							return [ true ];
						} else if (result == '평일') {
							return noWeekend[0] ? [ false ] : [ true ];
						} else if (result == '주말') {
							return noWeekend[0] ? [ true ] : noWeekend;
						}
					},
					minDate : start_date,
					maxDate : end_date,
					yearSuffix : '년'
				});
	});
	function end_time_click() {
		var start_time = document.getElementById('choice_start_time').value;
		if (start_time == '') {
			window.alert('시작 시간을 먼저 선택해주세요');
			return;
		}
	}
	function time_price_result() {
		var homegym_price = ${hgContent.hg_price}	;
		var start_time = document.getElementById('choice_start_time').value;
		var end_time = document.getElementById('choice_end_time').value;
		var person_count = document.getElementById('choice_person_count').value;
		var reservation_time = end_time - start_time;
		if (reservation_time < 1) {
			window.alert('종료 시간은 시작시간보다 커여합니다.');
			document.getElementById('choice_end_time')[0].selected = true;
			return;
		}

		var recent_price = document.getElementById('expect_price');
		recent_price.innerText = homegym_price * reservation_time
				* person_count;
	}
	function person_count_price_result() {
		var homegym_price = '${hgContent.hg_price}';
		var start_time = document.getElementById('choice_start_time').value;
		var end_time = document.getElementById('choice_end_time').value;
		var reservation_time = end_time - start_time;
		var person_count = document.getElementById('choice_person_count').value;
		var recent_price = document.getElementById('expect_price');

		recent_price.innerText = homegym_price * person_count
				* reservation_time;
	}
	function reservation() {
		if ('${sessionScope.sid}' == '' && '${sessionScope.coachId}' == '') {
			window.alert('로그인이 필요한 페이지 입니다.');
			location.href = 'loginForm.do';
			return;
		}
		if ('${login.mem_id}' == '${hgContent.hg_mem_id}') {
			window.alert('자신의 홈짐은 예약하실 수 없습니다.');
			return;
		}
		var use_date = document.getElementById('choice_date').value;
		var use_start_time = document.getElementById('choice_start_time').value
		var use_end_time = document.getElementById('choice_end_time').value;
		var use_person_count = document.getElementById('choice_person_count').value;
		var use_price = document.getElementById('expect_price').innerText;
		var use_time = use_end_time - use_start_time;
		if (use_date == '' || use_start_time == '' || use_end_time == '') {
			window.alert('옵션을 확인해주세요.');
			return;
		}
		var start_ex = use_start_time;
		var end_ex = use_end_time;
		if (use_start_time < 10) {
			start_ex = '0' + use_start_time;
		}
		if (use_end_time < 10) {
			end_ex = '0' + use_end_time;
		}
		start_ex += ':00';
		end_ex += ':00';

		document.getElementById('reservationInfo').style.display = 'none';
		document.getElementById('reservationInfo_click').style.display = 'block';

		document.getElementById('use_date').innerHTML = use_date;
		document.getElementById('use_time').innerHTML = start_ex + '-' + end_ex
				+ '/' + use_time + '시간';
		document.getElementById('use_person_count').innerHTML = use_person_count;
		document.getElementById('use_price').innerHTML = use_price
				+ '<input type = "hidden" name = "reser_price" id = "choice_price" value = "'+use_price+'">';
	}
	function reservation_back_click() {
		document.getElementById('reservationInfo').style.display = 'block';
		document.getElementById('reservationInfo_click').style.display = 'none';
	}
	function reservation_ajax() {
		var hg_mem_id = document.getElementById('hg_mem_id').value;
		var use_date = document.getElementById('choice_date').value;
		var use_start_time = document.getElementById('choice_start_time').value
		var use_end_time = document.getElementById('choice_end_time').value;
		var use_person_count = document.getElementById('choice_person_count').value;
		var use_price = document.getElementById('choice_price').value;
		var params = 'hg_mem_id=' + hg_mem_id + '&reser_date=' + use_date
				+ '&reser_start_time=' + use_start_time + '&reser_end_time='
				+ use_end_time + '&reser_person_count=' + use_person_count
				+ '&reser_price=' + use_price;
		location.href = 'HomeGymReservation.do?' + params;
	}
	function reservation_callback() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				data = eval('(' + data + ')');
				var msg = data.msg;
				var check = data.check;
				var idx = data.this_idx;
				if (check) {
					location.href = 'HomeGymPayPage.do?reser_idx=' + idx;
				}
			}
		}
	}
	$(document)
			.on(
					'click',
					'.ia',
					function() {
						var userid = '${login.mem_id}';
						if (userid == null || userid == '') { //비로그인시
							alert('회원만 가능한 서비스입니다');
						} else { //로그인시				
							var targetid = $(this).attr('id');
							if(userid==targetid){
								window.alert('자기 자신은 좋아요를 클릭하실 수 없습니다.' );
								return;
							}
							//alert(targetid);	
							if ($(this).hasClass("toggleStyle")) { //좋아요취소시
								$(this).removeClass("toggleStyle");
								$(this)
										.html(
												'<i class="far fa-heart likeicon"></i>');
								ajaxUnLike(userid, targetid);
							} else { //좋아요햇을시

								$(this).addClass("toggleStyle");
								$(this)
										.html(
												'<i class="fas fa-heart likeicon likeafter"></i>');

								ajaxLike(userid, targetid);
								//좋아요하면 insert 취소하면 delete            

							}
						}
					});

	function ajaxLike(userid, targetid) {
		var params = 'user_id=' + userid + '&target_id=' + targetid;
		sendRequest('HomegymLikeOn.do', params, ajaxLike_rq, 'GET');
	}
	function ajaxUnLike(userid, targetid) {
		var params = 'user_id=' + userid + '&target_id=' + targetid;
		sendRequest('HomegymLikeOff.do', params, ajaxUnLike_rq, 'GET');
	}
	function ajaxLike_rq() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				data = eval('(' + data + ')');
				alert("좋아요 목록에 추가되었습니다");
			}
		}
	}
	function ajaxUnLike_rq() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				data = eval('(' + data + ')');
				alert("좋아요 목록에서 삭제되었습니다");
			}
		}
	}
	$(document).ready(function() {
		
		// 기존 css에서 div 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#sidebox").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			
			 $("#sidebox").css('top', newPosition);
		

			 
				/* 애니메이션
			$("#sidebox").stop().animate({
				"top" : newPosition
			}, 500);	 */

		}).scroll();

	});
</script>
<style>
.top_info{height:100px; margin:50px 100px 20px 100px; display: flex;}
.top_info .top_info_left {background-color:#0099ff; width:90px; height:90px; color: white; margin-bottom: 20px; padding:10px; z-index: 99;}
.top_info .top_info_left h3{margin:0px auto;}
.top_info .top_info_right {margin-left: 50px; margin-top:10px;}
.top_info .top_info_left img {width:70px; height:20px;}
.top_contentArea {width:1000px; height:550px; margin:50px 100px 0px 200px;}
.top_contentArea .top_contentImg {width:900px; height:500px;}
.top_contentArea .top_contentImg .carousel-item img {width:900px; height:500px; object-fit:fill;}
.top_contentArea .remoteArea {width: 400px; height:500px; font-size:20px; position: absolute; top:150px; right:50px;}
.top_contentArea .remoteArea li {height:40px;}
.top_contentArea .remoteArea select {width:150px;}
.top_contentArea .remoteArea .reser_select {width:150px; font-size:15px;}
.top_contentArea .remoteArea input[type=text] {width:263px;}
.top_contentArea .remoteArea .expect_price_span {color:red;}
.top_contentArea .remoteArea #reservationInfo_click{ display:none;}	
.top_contentArea .remoteArea .card .card-title {font-size: 30px; font-weight: 600;}
.top_contentArea .remoteArea .card .card-body .likeArea {margin-left: 20px; margin-top:10px;}
.bottom_contentArea {width:1000px; margin:50px 100px 0px 100px;}
.bottom_contentArea .hgContent p {font-size: 15px;}
.bottom_contentArea .hgContent label {color:red; }
.bottom_contentArea .eqlistArea .eqlistArea_list{display:flex; text-align: center; margin-bottom: 50px; justify-content: space-around;}
.bottom_contentArea .eqlistArea .eqlistArea_list .eqList{border:1px solid gray; border-radius: 8px;}
.bottom_contentArea .eqlistArea .eqlistArea_list p {font-size: 15px; font-weight: 200;}
.bottom_contentArea .reserNoticeArea {font-size:20px;}
.bottom_contentArea .reserNoticeArea table {border:3px double gray; border-radius: 6px;}
.bottom_contentArea .reserNoticeArea table th {width:150px; vertical-align: top; border:3px double gray; border-radius: 6px;}
.bottom_contentArea .reserNoticeArea table td {border:3px double gray; border-radius: 6px;}
.bottom_contentArea .mapArea {width:900px; height:450px; margin-bottom: 50px;}
.bottom_contentArea .mapArea #map {margin:0px auto;}
.bottom_contentArea .reviewArea {margin-bottom:30px;}
.bottom_contentArea .reviewArea table { min-height: 300px;}
.bottom_contentArea .reviewArea .contetn_reivew_paging {margin: 40px 0 0; text-align: center;}
.bottom_contentArea .reviewArea .contetn_reivew_paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
.bottom_contentArea .reviewArea .contetn_reivew_paging a:not(:first-child) {margin-left: 5px;}
.likeicon{ font-size:25px;font-weight:100;position: absolute;color:white;}
.likeafter{color : #FF6682; }
</style>

<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<div class = "top_info">
	<div class = "top_info_left">
	<h3>${star_avg }</h3>
	<c:if test = "${star_avg>=0 && star_avg<=1 }">
	<img src = "img/coach/star/pngstar1.png">
	</c:if>
	<c:if test = "${star_avg>1 && star_avg<=2 }">
	<img src = "img/coach/star/pngstar2.png">
	</c:if>
	<c:if test = "${star_avg>3 && star_avg<=4 }">
	<img src = "img/coach/star/pngstar3.png">
	</c:if>
	<c:if test = "${star_avg>4 && star_avg<=5 }">
	<img src = "img/coach/star/pngstar4.png">
	</c:if>
	<c:if test = "${star_avg>5 }">
	<img src = "img/coach/star/pngstar5.png">
	</c:if>
	</div>
	
	<div class = "top_info_right">
		<h4>${hgContent.hg_nickname } 님의 홈짐</h4>
		<h5>${hgContent.hg_faddr }/${hgContent.hg_station }</h5>
	</div>
</div>
<div class = "top_contentArea">
	<div class = "top_contentImg">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<c:forEach items = "${imgContent }" varStatus="i">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i.index }" aria-label="Slide ${i.count }" <c:if test = '${i.index==0 }'>class="active" aria-current="true"</c:if>></button>
				</c:forEach>
			</div>
			<div class="carousel-inner">
				<c:forEach var = "img" items = "${imgContent }" varStatus="x">
				<div class="carousel-item <c:if test = '${x.index==0 }'>active</c:if>">
					<img src="upload/homegymInfo/${img.mfile_upload }" class="d-block w-100">
				</div>
				</c:forEach>
	  		</div>
	  		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"  data-bs-slide="prev">
	    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    		<span class="visually-hidden">Previous</span>
	  		</button>
	  		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"  data-bs-slide="next">
	    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    		<span class="visually-hidden">Next</span>
	  		</button>
		</div>
	</div>
	<div class = "remoteArea" id = "sidebox">
		<div class="card">
			<div class="card-body">
				<label class="card-title">${hgContent.hg_nickname }님의 홈짐</label>
				<span class = "likeArea">
					<c:if test="${like_result ==0 }">
						<a href="#" class="ia" id="${ hgContent.hg_mem_id }"><i class="far fa-heart likeicon"></i></a>						
					</c:if>
					<c:if test="${like_result ==1 }">
						<a href="#" class="ia toggleStyle" id="${ hgContent.hg_mem_id }"><i class="fas fa-heart likeicon likeafter"></i></a>						
					</c:if>	
				</span>
				<input type = "hidden" id = "hg_mem_id" value = "${hgContent.hg_mem_id }">
				<div class = "card-text">
					<ul id = "reservationInfo">
						<li>이용 일자</li>
						<li><input type = "text" id = "choice_date" name = "reser_date" class = "date_input" placeholder="예약 날짜를 선택해주세요"></li>
						<li>이용 시간</li>
						<li><select class = "reser_select" id = "choice_start_time" name = "reser_start_time"><option value = "">시작 시간</option></select>-
							<select class = "reser_select" id = "choice_end_time" name = "reser_end_time" onclick = "javascript:end_time_click();" onchange = "javscript:time_price_result();"><option value = "">종료 시간</option></select></li>
						<li>이용 인원</li>
						<li><select id = "choice_person_count" name = "reser_person_count" onchange = "javscript:person_count_price_result();"></select></li>
						<li>결제 예상 금액</li>
						<li><span class = "expect_price_span"><label id = "expect_price">${hgContent.hg_price }</label>원</span></li>
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
						<li><span class = "expect_price_span"><label id = "use_price"></label>원</span></li>
						<li>
						<input type = "button" class = "btn btn-primary btn-lg sbtn" value = "예약하기" onclick = "javascript:reservation_ajax();">
						<input type = "button" class = "btn btn-primary btn-lg sbtn" value = "돌아가기" onclick = "javascript:reservation_back_click();">
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class = "bottom_contentArea">
	<div class = "hgContent">
		<h3>홈짐 소개</h3>
		<p>${hgContent.hg_info }</p>
		<hr>
		<h3>이용 요금(1시간 당) : <label>${hgContent.hg_price } 원</label></h3>
		<hr>
	</div>
	<div class ="eqlistArea">
		<h3>보유 운동 기구</h3>
		<div class = "eqlistArea_list">
		<c:forEach var = "eqDTO" items = "${eqContent }">
			<div class = "eqList">
				<p>기구 아이콘 들어갈 영역</p>
				<hr>
				<p>${eqDTO.eq_name }</p>
				<p>${eqDTO.eq_count}</p>
			</div>
		</c:forEach>
		</div>
		<hr>
	</div>
	<div class = "reserNoticeArea">
		<h3>예약 시 주의사항</h3>
		<table> 
			<tr>
				<th>주의사항</th>
				<td>
				<p>
				실내 흡연 금지<br>
				건물 내외 벽에 무단으로 유인물 부착 금지<br>
				건물 내 음식물 반입 금지<br>
				각종 충전기 및 젠더 제공<br>
				개인 수건 지참
				</p>
				</td>
			</tr>
			<tr>
				<th>예약정책</th>
				<td>
				<p>
				전액 선납시 예약 확정<br>
				선납 불가시 카드 게런티 작성(신청접수 후 48H 이내 게런티 미회신 시<br>가예약 자동 취소<br>
				결제 링크(카드결제/계좌이체/카카오페이), 방문 현금 결제
				</p>
				</td>
			</tr>
			<tr>
				<th>취소/환불 정책</th>
				<td>
				예약 후~사용 5일전 : 전액 반환<br>
				사용 4일전 ~ 예약 당일 : 총 합계 금액의 100% 부과
				</td>
			</tr>
		</table>
		<hr>
	</div>
	<div class = "mapArea">
		<h3>오시는 길</h3>
		<div id="map"></div>
	</div>
	<hr>
	<div class = "reviewArea">
		<h3>이용 후기</h3>
		<c:if test="${empty reviewList}">
		<div>작성 된 후기가 없습니다.</div>
		</c:if>
		<c:if test="${!empty reviewList}">
		<table  width="900px" cellspacing="0" class="mt-3">
			<tbody>
				<c:forEach var="r" items="${ reviewList }">
				<tr>
				<td style="border-top:1px solid lightgray; padding-top:10px;">
				
				<div>
				<div style="position:relative; float:left;"><img src="img/coach/noimg.png" style="width:50px; margin-right:10px;"></div>
				<p style="font-size:1.2rem; font-weight:600; margin:0 0 0 10px;">${r.rev_mem_id }</p>
				<span><img src="img/coach/star/star${r.rev_star }.jpg" style="width:80px; margin:0 20px 0 0;"></span>
				<span style="font-size:0.9rem;">${r.rev_writedate}</span>
				</div>
	
				</td>
				</tr>
			
				<tr>
				<td><span style="font-size:1rem; font-weight:500;">${r.rev_sub }</span></td>
				</tr>
				<tr>
				<td><p style="font-size:0.9rem;">${r.rev_cont }</p></td>
				</tr>
				
				</c:forEach>
			</tbody>
		</table>
		</c:if>
	</div>
</div>
<%@include file="../_include/footer.jsp" %>