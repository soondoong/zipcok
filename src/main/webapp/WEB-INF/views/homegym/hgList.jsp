<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<style>
.eq_options {
border:1px solid black;
font-size: 20px;
border-radius: 8px;
width:200px;
height:30px;
}
</style>
<script>

	/*버튼 클릭하면 active됨*/
	/*
	$('.eqBtn').click(function(){
		if( $(this).hasClass('active') ){
	  		$(this).removeClass('active');
	  	}else{
	  		$(this).addClass('active');
	  		color:blue;
	  	}
		showList();
	});
	*/
	function top_option(){
		var choice_location = document.getElementById('top_option_location').value;
		window.alert(choice_location);
		var choice_date = document.getElementById('top_option_date').value;
		if(choice_date=='') choice_date='0-0-0';
		window.alert(choice_date);
		var year = choice_date.slice(0, 4);
		var month = choice_date.slice(5, 7);
		var day = choice_date.slice(8, 10);
		var params = 'location='+choice_location+'&year='+year+'&month='+month+'&day='+day;
		var top_option_fm = document.getElementById('top_option_fm');
		top_option_fm.action = 'HomeGymList.do?'+params;
		top_option_fm.submit();
	}
	function showPrice(){
		var price_span = document.getElementById('price').value;
		document.getElementById('price_value').innerText=price_span;
	}
	/*
	function showList(str){
		var cp = str;
		if(str==null || str ==''){
			cp=1;
		}
		
	}
	*/
	
</script>
</head>
<body>
<%@include file="../header2.jsp" %>
	<!-- 상단 조건바 -->
	<form id = "top_option_fm" action = "HomeGymList.do">
		<div id = "top_option">
			<h1>어떤 홈짐을 찾고 계신가요?</h1>
			<select id="top_option_location">
				<option value="전체" selected>----</option>
				<option value="강남구">강남구</option>
				<option value="강동구">강동구</option>
				<option value="강북구">강북구</option>
				<option value="강서구">강서구</option>
				<option value="관악구">관악구</option>
				<option value="영등포구">영등포구</option>
			</select>
			<input type="date" id="top_option_date">
			<input type="button" value="검색하기" onclick = "javascript:top_option();">
		</div>
	</form>
			<hr>
		<!-- 좌측 조건바 -->
		<div>
			<h4>검색 조건</h4>
			<hr>
			<div id = "eq_list">
				<h6>기구</h6>
				<input type = "checkbox" name = "eq_options" value = "기구 1">기구 1
				<input type = "checkbox" name = "eq_options" value = "기구 2">기구 2
				<input type = "checkbox" name = "eq_options" value = "기구 3">기구 3
				<input type = "checkbox" name = "eq_options" value = "기구 4">기구 4
				<input type = "checkbox" name = "eq_options" value = "기구 5">기구 5
				<input type = "checkbox" name = "eq_options" value = "기구 6">기구 6
				<input type = "checkbox" name = "eq_options" value = "기구 7">기구 7
				<input type = "checkbox" name = "eq_options" value = "기구 8">기구 8
				<input type = "checkbox" name = "eq_options" value = "기구 9">기구 9
				<input type = "checkbox" name = "eq_options" value = "기구 10">기구 10
			</div>
			<hr>
			<h6>가격</h6>
			<div>
				최저가 : <span id = "price_value">10</span>원 이상
			</div>
			<div>
			<input type="range" min="1" max="100000" value="10" id="price" onchange="javascript:showPrice()">
			</div>
			<hr>
			<h6>수용 인원</h6>
			<div>
			</div>
		</div>

	<div>
		<c:set var="HomeGymList" value="${HomeGymList }" />
		<c:choose>
			<c:when test="${empty HomeGymList }">
				<div class="ListItem">등록된 홈짐이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${HomeGymList }">
					<div class="ListItem">${dto.hg_mem_id } / ${dto.hg_faddr }</div>
					<hr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
	</div>
	<h6>${pageStr }</h6>
</body>
</html>