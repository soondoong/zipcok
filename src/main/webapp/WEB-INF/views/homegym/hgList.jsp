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
window.addEventListener('load', function() {
	var eq_options = '${keywordMap.eq_options}';
	var eq_options_split = eq_options.split(',');
	for(var i in eq_options_split){
		document.getElementById(eq_options_split[i]).checked = true;
	}
	});

function priceOption(){
	var left_price_span = document.getElementById('price').value;
	document.getElementById('price_value').innerText = left_price_span;
	document.getElementById('option_fm').submit();
}

function sendOption(){
	document.getElementById('option_fm').submit();
}
	
</script>
</head>
<body>
<%@include file="../header2.jsp" %>
	<!-- 상단 조건바 -->
	<form id = "option_fm" action = "HomeGymList.do" method = "post">
		<div id = "top_option">
			<h1>어떤 홈짐을 찾고 계신가요?</h1>
			<select name="top_option_location" onchange="javascript:sendOption();">
				<option value="전체" <c:if test="${keywordMap.location=='전체'}">selected="selected"</c:if>>----</option>
				<option value="강남구" <c:if test="${keywordMap.location=='강남구'}">selected="selected"</c:if>>강남구</option>
				<option value="강동구" <c:if test="${keywordMap.location=='강동구'}">selected="selected"</c:if>>강동구</option>
				<option value="강북구" <c:if test="${keywordMap.location=='강북구'}">selected="selected"</c:if>>강북구</option>
				<option value="강서구" <c:if test="${keywordMap.location=='강서구'}">selected="selected"</c:if>>강서구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='관악구'}">selected="selected"</c:if>>관악구</option>
				<option value="영등포구" <c:if test="${keywordMap.location=='영등포구'}">selected="selected"</c:if>>영등포구</option>
			</select>
			<input type="date" name="top_option_date" value="${keywordMap.date }" onchange="javascript:sendOption();">
			<input type="submit" value="검색하기">
		</div>
		<hr>
		<!-- 좌측 조건바 -->
		<div id = "left_option">
			<h4>검색 조건</h4>
			<hr>
			<div id = "eq_list">
				<h6>기구</h6>
				<input type = "checkbox" name = "left_option_eq" value = "eq1" id = "eq1" onclick = "javascript:sendOption();">기구 1
				<input type = "checkbox" name = "left_option_eq" value = "eq2" id = "eq2" onclick = "javascript:sendOption();">기구 2
				<input type = "checkbox" name = "left_option_eq" value = "eq3" id = "eq3" onclick = "javascript:sendOption();">기구 3
				<input type = "checkbox" name = "left_option_eq" value = "eq4" id = "eq4" onclick = "javascript:sendOption();">기구 4
				<input type = "checkbox" name = "left_option_eq" value = "eq5" id = "eq5" onclick = "javascript:sendOption();">기구 5
				<input type = "checkbox" name = "left_option_eq" value = "eq6" id = "eq6" onclick = "javascript:sendOption();">기구 6
				<input type = "checkbox" name = "left_option_eq" value = "eq7" id = "eq7" onclick = "javascript:sendOption();">기구 7
				<input type = "checkbox" name = "left_option_eq" value = "eq8" id = "eq8" onclick = "javascript:sendOption();">기구 8
				<input type = "checkbox" name = "left_option_eq" value = "eq9" id = "eq9" onclick = "javascript:sendOption();">기구 9
				<input type = "checkbox" name = "left_option_eq" value = "eq10" id = "eq10" onclick = "javascript:sendOption();">기구 10
			</div>
			<hr>
			<h6>가격</h6>
			<div>
				최저가 : <span id = "price_value">${keywordMap.price }</span>원 이상
			</div>
			<div>
			<input type="range" max="100000" step="1000" value="${keywordMap.price }" id="price" name = "left_opton_price" onchange="javascript:priceOption();">
			</div>
			<hr>
			<h6>수용 인원</h6>
			<div>
			<select name = "left_option_person_count" onchange = "javascript:sendOption();">
				<option value = "1" <c:if test="${keywordMap.person_count==1}">selected="selected"</c:if>>1</option>
				<option value = "2" <c:if test="${keywordMap.person_count==2}">selected="selected"</c:if>>2</option>
				<option value = "3" <c:if test="${keywordMap.person_count==3}">selected="selected"</c:if>>3</option>
				<option value = "4" <c:if test="${keywordMap.person_count==4}">selected="selected"</c:if>>4</option>
				<option value = "5" <c:if test="${keywordMap.person_count==5}">selected="selected"</c:if>>5</option>
				<option value = "6" <c:if test="${keywordMap.person_count==6}">selected="selected"</c:if>>6</option>
			</select><label>명 이상</label>
			</div>
			<hr>
		</div>
</form>
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
					<c:if test = "${empty eq_list }">
					<h1>등록된 기구가 없습니다.</h1>
					</c:if>
					<c:forEach var = "list" items="${eq_list}">
						<c:forEach var = "eq_dto" items = "${list }">
						${eq_dto.eq_name }
						</c:forEach>
					</c:forEach>			
					</div>
					<hr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
	</div>
	<h6>${pageStr }</h6>
</body>
</html>