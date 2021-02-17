<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f0e5f2abca3d4fd875382e01cfd5ab6&libraries=services&libraries=services"></script>
<script>
window.addEventListener('load', function() {
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${homegym.hg_faddr}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">홈짐 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
});
function selfClose(){
	window.self.close();
}
</script>
<style>
body {width:800px; height:450px; margin:30px; border:1px solid gray; border-radius: 10px; padding:20px;}
.locationDIV {width:750px; height:400px; display:flex; margin:0px auto;}
.locationDIV #map{width:600px; height:400px; margin-right: 50px;}
.locationDIV .locationInfo input[type=button]{position: absolute; left:80%; top:80%;}
</style>
<body>
	<div>
		<h3>${homegym.hg_nickname }님의홈짐</h3>
		<div class="locationDIV">
			<div id="map"></div>
			<div class="locationInfo">
				<h3>홈짐 주소</h3>
				<p>${homegym.hg_faddr }</p>
				<p>${homegym.hg_saddr }</p>
				<h3>오시는 길</h3>
				<p>${homegym.hg_comeinfo }</p>
				<input type = "button" value = "닫기" onclick = "javascript:selfClose();">
			</div>
		</div>
	</div>
</body>
</html>