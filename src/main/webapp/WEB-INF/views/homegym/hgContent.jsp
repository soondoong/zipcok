<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch' href='https://cdn.jsdelivr.net/jquery.slick/1.5.9/slick.css'>
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f0e5f2abca3d4fd875382e01cfd5ab6&libraries=services"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
	mapContainer.style.width = '800px';
	mapContainer.style.height = '300px';
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
function time_price_result(){
	var homegym_price = ${hgContent.hg_price};
	var start_time = document.getElementById('choice_start_time').value;
	var end_time = document.getElementById('choice_end_time').value;
	var person_count = document.getElementById('choice_person_count').value;
	var reservation_time = end_time - start_time;
	if(reservation_time<1){
		window.alert('종료 시간은 시작시간보다 커여합니다.');
		document.getElementById('choice_end_time')[0].selected = true;
		return;
	}

	var recent_price = document.getElementById('expect_price');
	recent_price.innerText = homegym_price * reservation_time * person_count;
}
function person_count_price_result(){
	var person_count = document.getElementById('choice_person_count').value;
	var recent_price = document.getElementById('expect_price');
	recent_price.innerText = recent_price.innerText * person_count;
}
function reservation(){
	if('${sessionScope.sid}'=='' && '${sessionScope.coachId}'==''){
		window.alert('로그인이 필요한 페이지 입니다.');
		location.href='loginForm.do';
		return;
	}
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
	location.href = 'HomeGymReservation.do?'+params;
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
$(document).on('click','.ia', function() {
	var userid='${login.mem_id}';
		if(userid ==null || userid == ''){ //비로그인시
			alert('회원만 가능한 서비스입니다');
		}else{ //로그인시				
			var targetid= $(this).attr('id');	
			//alert(targetid);	
		  if($(this).hasClass("toggleStyle")){ //좋아요취소시
	             $(this).removeClass("toggleStyle");
	             $(this).html('<i class="far fa-heart likeicon"></i>');
	             ajaxUnLike(userid,targetid);	     
	         }else{ //좋아요햇을시
	        	 
	             $(this).addClass("toggleStyle");
	             $(this).html('<i class="fas fa-heart likeicon likeafter"></i>');
	            
	        	ajaxLike(userid,targetid);	           
	             //좋아요하면 insert 취소하면 delete            
	             
	         }			 	
		}	
});

function ajaxLike(userid, targetid){
	var params = 'user_id='+userid+'&target_id='+targetid;
	sendRequest('HomegymLikeOn.do', params, ajaxLike_rq, 'GET');
}
function ajaxUnLike(userid, targetid){
	var params = 'user_id='+userid+'&target_id='+targetid;
	sendRequest('HomegymLikeOff.do', params, ajaxUnLike_rq, 'GET');
}
function ajaxLike_rq(){
  	if(XHR.readyState==4){
  			if(XHR.status==200){
  				var data=XHR.responseText;
  				data=eval('('+data+')');
  			    alert("좋아요 목록에 추가되었습니다");	
  			}
  	}
}
function ajaxUnLike_rq(){
  	if(XHR.readyState==4){
  			if(XHR.status==200){
  				var data=XHR.responseText;
  				data=eval('('+data+')');
  			    alert("좋아요 목록에서 삭제되었습니다");	
  			}
  	}
}
</script>
<style>
.top_info{background-color:#0099ff; width:1600px; height:75px; color: white; margin-bottom: 20px; padding-left: 40px; padding-top: 10px;}
.top_info .top_info_like {position: relative; left:-25px; top:-60px; z-index: 1; }
.top_contentArea {width:1600px; height:500px; display:flex; margin:auto;}
.top_contentArea .top_contentArea_img_slide_single {width:700px; height: 350px; margin: 30px auto 1px; overflow: hidden;}
.top_contentArea .top_contentArea_img_slide_single img {width: 100%;	min-height: 100%;}
.top_contentArea .top_contentArea_reservationArea {width: 700px; height:500px; font-size:20px;}
.top_contentArea .top_contentArea_reservationArea li {height:40px;}
.top_contentArea .top_contentArea_reservationArea select {width:240px;}
.top_contentArea .top_contentArea_reservationArea input[type=date] {width:240px;}
.top_contentArea .top_contentArea_reservationArea .expect_price_span {color:red;}
.top_contentArea .top_contentArea_reservationArea #reservationInfo_click{ display:none;}
.bottom_contentArea {width:1200px; margin:0px auto;}
.bottom_contentArea .hgContent p {font-size: 20px;}
.bottom_contentArea .hgContent label {color:red; }
.bottom_contentArea .eqlistArea {text-align: center;}
.bottom_contentArea .eqlistArea h {text-align: center;}
.bottom_contentArea .eqlistArea .eqlistArea_list{display:flex; text-align: center; margin-bottom: 50px;}
.bottom_contentArea .eqlistArea .eqlistArea_list .eqList{border:1px solid gray; border-radius: 8px; margin-right: 5px;}
.bottom_contentArea .eqlistArea .eqlistArea_list p {font-size: 25px; font-weight: 300;}
.bottom_contentArea .eqlistArea .eqlistArea_list img {width:200px; height:100px;}
.bottom_contentArea .reserNoticeArea {font-size:20px;}
.bottom_contentArea .reserNoticeArea table {width:1200px; border:3px double gray; border-radius: 6px;}
.bottom_contentArea .reserNoticeArea table th {width:300px; vertical-align: top;}
.bottom_contentArea .reserNoticeArea h3 {text-align:center;}
.bottom_contentArea .mapArea {text-align:center; width:800px; height:400px; margin:0px auto;}
.bottom_contentArea .reviewArea {text-align:center; min-height: 400px; }
.bottom_contentArea .reviewArea table {width:1200px;}

</style>
<div class = "top_info">
	<h4>${hgContent.hg_nickname } 님의 홈짐</h4>
	<h5>${hgContent.hg_faddr }/${hgContent.hg_station }</h5>
	<div class = "top_info_like">
		<c:if test="${like_result ==0 }">
			<a href="#" class="ia" id="${ hgContent.hg_mem_id }"><i class="far fa-heart likeicon"></i></a>						
		</c:if>
		<c:if test="${like_result ==1 }">
			<a href="#" class="ia toggleStyle" id="${ hgContent.hg_mem_id }"><i class="fas fa-heart likeicon likeafter"></i></a>						
		</c:if>	
	</div>
</div>
<div class = "top_contentArea">
	<div class = "top_contentArea_img_slide_single">
		<c:forEach var = "img" items = "${imgContent }">
		<div class = "item"><img src = "upload/homegymInfo/${img.mfile_upload }"></div>
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
				<select id = "choice_end_time" name = "reser_end_time" onclick = "javascript:end_time_click();" onchange = "javscript:time_price_result();"><option value = "">종료 시간</option></select></li>
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
				<img src = "img/homegym/homegym_content_${eqDTO.eq_name }.jpg">
				<hr>
				<p>${eqDTO.eq_name }</p>
				<p>${eqDTO.eq_count}</p>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class = "reserNoticeArea">
		<h3>예약 시 주의사항</h3>
		<table> 
			<tr>
				<th>주의사항</th>
				<td>
				<p>
				예약 방식에는 (i) 신청과 동시에 예약확정&바로결제 유형, (ii) 공유자 예약 승인 후 결제 유형, (iii) 공유쟈 예약 승인 유형이 있습니다.<br>
				이 중 공유자 예약 승인 유형의 홈짐은 “회사”에서 게스트가 예약만 할 수 있도록 지원할 뿐이므로 대금 지불 등 구체적인 절차는 게스트회원이 해당 호스트회원과 직접 연락하여 처리하여야 하고, 본 정책이 적용되지 않습니다.</p>
				</td>
			</tr>
			<tr>
				<th>예약정책</th>
				<td>
				<p>
				1) 스페이스클라우드의 최저결제금액은 1,000원 입니다. 단, 부분 환불시 부분 환불 요율에 따라 1,000원 미만 500원 이상의 결제가 가능합니다.<br>
				2) 5,000원 미만의 금액에 대해서는 전체 취소, 전체 환불만 가능합니다.
				</p>
				</td>
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
	<div class = "reviewArea">
		<h3>이용 후기 / 평균 별점 : ${star_avg }</h3>
		<c:if test = "${empty reviewList }">
			<div>작성된 후기가 없습니다.</div>
		</c:if>
		<c:if test = "${!empty reviewList }">
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
					<c:forEach var="dto" items="${reviewList }">
						<tr>
							<td style="border-top: 1px solid lightgray; padding-top: 10px;">
								<div style="position: relative; float: left;">
									<img src="img/coach/noimg.png" style="width: 50px; margin-right: 10px;">
									<span><img src="img/coach/star/star${dto.rev_star }.jpg" style="width: 80px; margin: 0 20px 0 0;"></span>
								</div>
							</td>
							<td><span style="font-size: 1rem; font-weight: 500;">${dto.rev_sub }</span></td>
							<td><p style="font-size: 0.9rem;">${dto.rev_cont }</p></td>
							<td><p style="font-size: 1.2rem; font-weight: 600; margin: 0 0 0 10px;">${dto.rev_mem_id }</p></td>
							<td><span style="font-size: 0.9rem;">${dto.rev_writedate}</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</div>
<%@include file="../_include/footer.jsp" %>