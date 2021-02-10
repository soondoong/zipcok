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
.eq_options {border:1px solid black;font-size: 20px;border-radius: 8px;width:200px;height:30px;}
.ListItem{border:1px solid black;}
.top_search_wrap {padding: 100px 0;background-image: linear-gradient(to top, #006be0, #0070e1, #0074e1, #0579e1, #0f7de1); text-align: center;}
.top_search_wrap .top_search_inner {display: inline-block;}
.top_search_wrap select {width: 200px; height: 40px;}
.top_search_wrap input[type=date] {width: 200px; height: 40px;}
.top_search_wrap input[type=submit] {width: 150px; height: 40px;}
.homegym_wrap {display: flex;}
.homegym_wrap .homegym_search_wrap {flex: 0 0 300px;}
.homegym_wrap .homegym_search_wrap .left_option {padding: 30px;}
.homegym_wrap .homegym_search_wrap .eq_list {}
.homegym_wrap .homegym_search_wrap .eq_list label {display: inline-block; cursor: pointer; position: relative; padding: 0 0 0 24px;}
.homegym_wrap .homegym_search_wrap .eq_list label input[type=checkbox] {position: absolute; top: 0; left: 0; width: 1px; height: 1px; opacity: 0;}
.homegym_wrap .homegym_search_wrap .eq_list label span:before {display: block; content: ''; position: absolute; top: 4px; left: 0; width: 16px; height: 16px; background: #ffffff; border: 1px solid #333333;}
.homegym_wrap .homegym_search_wrap .eq_list label input[type=checkbox]:checked + span:before {background: #333333;}

.homegym_wrap .homegym_search_result {flex: 1 1 auto; padding: 30px;}
</style>
<script>
window.addEventListener('load', function() {
	var eq_options = '${keywordMap.eq_options}';
	if(eq_options != ''){
		var eq_options_split = eq_options.split(',');
		for(var i in eq_options_split){
			document.getElementById(eq_options_split[i]).checked = true;
			var option_list = document.getElementsByClassName('homegym_search_result_list_item_option_'+eq_options_split[i]);
			for(var j = 0 ; j < option_list.length ; j ++ ){
				var option_class = option_list.item(j);
				option_class.style.color = 'write';
				option_class.style.backgroundColor = '#0099ff';
			}
		}
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
function ContentEnter(id){
	if('${sessionScope.sid}'=='' && '${sessionScope.coachId}'==''){
		window.alert('로그인이 필요한 페이지 입니다.');
		location.href='loginForm.do';
		return;
	}
	location.href = 'HomeGymContent.do?hg_mem_id='+id;
}
</script>
</head>
<body>
<%@include file="../header2.jsp" %>

	<!-- 상단 조건바 -->
	<form id = "option_fm" action = "HomeGymList.do" method = "post">
	<div class="top_search_wrap">
		<div class="top_search_inner">
			<select name="top_option_location" onchange="javascript:sendOption();">
				<option value="전체" <c:if test="${keywordMap.location=='전체'}">selected</c:if>>----</option>
				<option value="강남구" <c:if test="${keywordMap.location=='강남구'}">selected</c:if>>강남구</option>
				<option value="강동구" <c:if test="${keywordMap.location=='강동구'}">selected</c:if>>강동구</option>
				<option value="강북구" <c:if test="${keywordMap.location=='강북구'}">selected</c:if>>강북구</option>
				<option value="강서구" <c:if test="${keywordMap.location=='강서구'}">selected</c:if>>강서구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='관악구'}">selected</c:if>>관악구</option>
				<option value="영등포구" <c:if test="${keywordMap.location=='영등포구'}">selected</c:if>>영등포구</option>
			</select>
			<input type="date" name="top_option_date" value="${keywordMap.date }" onchange="javascript:sendOption();">
			<input type="submit" value="검색하기">
		</div>
	</div>
	
	<div class="homegym_wrap">
		<div class="homegym_search_wrap">
			
			<!-- 좌측 조건바 -->
			<div id = "left_option" class="left_option">
				<h4>검색 조건</h4>
				<hr>
				<div id = "eq_list" class="eq_list">
					<h6>기구</h6>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq1" id = "eq1" onclick = "javascript:sendOption();"><span>기구 1</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq2" id = "eq2" onclick = "javascript:sendOption();"><span>기구 2</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq3" id = "eq3" onclick = "javascript:sendOption();"><span>기구 3</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq4" id = "eq4" onclick = "javascript:sendOption();"><span>기구 4</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq5" id = "eq5" onclick = "javascript:sendOption();"><span>기구 5</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq6" id = "eq6" onclick = "javascript:sendOption();"><span>기구 6</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq7" id = "eq7" onclick = "javascript:sendOption();"><span>기구 7</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq8" id = "eq8" onclick = "javascript:sendOption();"><span>기구 8</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq9" id = "eq9" onclick = "javascript:sendOption();"><span>기구 9</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "eq10" id = "eq10" onclick = "javascript:sendOption();"><span>기구 10</span></label>
				</div>
				<hr>
				<h6>가격</h6>
				<div>
					최저가 : <span id = "price_value">${keywordMap.price }</span>원 이상
				</div>
				<div>
				<input type="range" max="10000" step="1000" value="${keywordMap.price }" id="price" name = "left_opton_price" onchange="javascript:priceOption();">
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
		</div>
		<div class="homegym_search_result">
			<h1>어떤 홈짐을 찾고 계신가요?</h1>
			<div class="homegym_search_result_list">
				<hr>
				<c:set var="HomeGymList" value="${HomeGymList }" />
				<c:choose>
					<c:when test="${empty HomeGymList }">
						<div class="homegym_search_result_list_item">등록된 홈짐이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${HomeGymList }">
							<div class="homegym_search_result_list_item" onclick = "javascript:ContentEnter('${dto.hg_mem_id}');">
								<div class = "homegym_search_result_list_item_img"><img src = "upload/homegymInfo/${dto.hg_upload }"></div>
								<div class = "homegym_search_result_list_item_content">
									${dto.hg_nickname } 님의 홈짐<br>
									
									<div class = "homegym_search_result_list_item_content_eqlist">
									<c:if test = "${empty dto.hg_eq_list }">
									<h6>등록된 기구가 없습니다.</h6>
									</c:if>
									<c:forEach var = "eq_list" items="${dto.hg_eq_list }">
										<div class = "homegym_search_result_list_item_option_${eq_list.eq_name }">
											${eq_list.eq_name } : ${eq_list.eq_count }
										</div>
									</c:forEach>
										<div class = "homegym_search_result_list_item_content_price">
										가격 : ${dto.hg_price }<br>
										</div>		
									</div>
								</div>
							</div>
							<hr>
						</c:forEach>
					</c:otherwise>
				</c:choose>	
				<style>
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item {display:flex; border:1px solid gray; padding: 20px; width:800px;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_img {padding:10px; width : 150px; height: 150px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_img img { width:130px; height: 130px;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content {padding: 10px; width:610px; height: 150px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content .homegym_search_result_list_item_content_eqlist {display:flex; border: 1px solid gary; height:100px; vertical-align: middle;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content .homegym_search_result_list_item_content_eqlist div { margin-right: 10px; background-color: #cccccc; margin-top:10px; padding:5px; height: 30px; border-radius: 8px;}

</style>
			</div>
			<h6>${pageStr }</h6>
		</div>
	</div>
	</form>
</body>
</html>