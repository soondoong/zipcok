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
	<form id = "top_option_fm" action = "HomeGymList.do" method = "post">
		<div id = "top_option">
			<h1>어떤 홈짐을 찾고 계신가요?</h1>
			<select name="top_option_location">
				<option value="전체" <c:if test="${keywordMap.location=='전체'}">selected="selected"</c:if>>----</option>
				<option value="강남구" <c:if test="${keywordMap.location=='강남구'}">selected="selected"</c:if>>강남구</option>
				<option value="강동구" <c:if test="${keywordMap.location=='강동구'}">selected="selected"</c:if>>강동구</option>
				<option value="강북구" <c:if test="${keywordMap.location=='강북구'}">selected="selected"</c:if>>강북구</option>
				<option value="강서구" <c:if test="${keywordMap.location=='강서구'}">selected="selected"</c:if>>강서구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='관악구'}">selected="selected"</c:if>>관악구</option>
				<option value="영등포구" <c:if test="${keywordMap.location=='영등포구'}">selected="selected"</c:if>>영등포구</option>
			</select>
			<input type="date" name="top_option_date" value="${keywordMap.date }">
			<input type="submit" value="검색하기">
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
			<select id = "person_count">
				<option value = "1">1</option>
				<option value = "2">2</option>
				<option value = "3">3</option>
				<option value = "4">4</option>
				<option value = "5">5</option>
				<option value = "6">6</option>
			</select><label>명 이상</label>
			</div>
			<hr>
		</div>

	<div>
		<h6>게시글 수 : ${totalCnt }</h6>
		<hr>
		<c:set var="HomeGymList" value="${HomeGymList }" />
		<c:choose>
			<c:when test="${empty HomeGymList }">
				<div class="ListItem">등록된 홈짐이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${HomeGymList }">
					<div class="ListItem">
					시작일:${dto.hg_start_date_year }-${dto.hg_start_date_month }-${dto.hg_start_date_day }
					<br>종료일:${dto.hg_end_date_year }-${dto.hg_end_date_month }-${dto.hg_end_date_day }
					<br>아이디 : ${dto.hg_mem_id } / 닉네임 : ${dto.hg_nickname }
					<br>주소 :  ${dto.hg_faddr } / 상세 주소 : ${dto.hg_saddr }
					<br>가격 : ${dto.hg_price } / 수용 인원 : ${dto.hg_person_count }
					<br>장비 리스트 : 					
					</div>
					<hr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
	</div>
	<h6>${pageStr }</h6>
</body>
</html>