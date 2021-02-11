<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src = "	
http://openapi.seoul.go.kr:8088/sample/xml/SearchSTNBySubwayLineInfo/1/5/"></script>
<script>
window.addEventListener('load', function() {
	var today = getTimeStamp();
	$('#choice_date').attr('min', today);
	$('#choice_date').val(today);
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
.homegym_wrap .homegym_search_wrap .left_option select {width:80%;}
.homegym_wrap .homegym_search_wrap .left_option .left_option_person_count_label {height:40px; line-height:40px; vertical-align: middle;}
.homegym_wrap .homegym_search_wrap .eq_list {}
.homegym_wrap .homegym_search_wrap .eq_list label {display: inline-block; cursor: pointer; position: relative; padding: 0 0 0 24px;}
.homegym_wrap .homegym_search_wrap .eq_list label input[type=checkbox] {position: absolute; top: 0; left: 0; width: 1px; height: 1px; opacity: 0;}
.homegym_wrap .homegym_search_wrap .eq_list label span:before {display: block; content: ''; position: absolute; top: 4px; left: 0; width: 16px; height: 16px; background: #ffffff; border: 1px solid #333333;}
.homegym_wrap .homegym_search_wrap .eq_list label input[type=checkbox]:checked + span:before {background: #333333;}

.homegym_wrap .homegym_search_result {flex: 1 1 auto; padding: 30px;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_paging {margin: 40px 0 0; text-align: center;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_paging a:not(:first-child) {margin-left: 5px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item {display:flex; padding: 20px; width:800px;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_img {padding:10px; width : 150px; height: 150px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_img img { width:130px; height: 130px;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content {padding: 10px; width:610px; height: 150px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content .homegym_search_result_list_item_content_eqlist {display:flex; height:100px; vertical-align: middle;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content .homegym_search_result_list_item_content_eqlist .eqdiv { margin-right: 10px; background-color: #cccccc; margin-top:10px; padding:5px; height: 30px; border-radius: 8px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content .homegym_search_result_list_item_content_price {font-size:25px; font-weight:600; position: relative; left:435px; top: -85px; height:35px; width:150px; text-align:right; }

</style>
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
				<option value="관악구" <c:if test="${keywordMap.location=='광진구'}">selected</c:if>>광진구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='구로구'}">selected</c:if>>구로구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='금천구'}">selected</c:if>>금천구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='노원구'}">selected</c:if>>노원구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='도봉구'}">selected</c:if>>도봉구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='동대문구'}">selected</c:if>>동대문구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='동작구'}">selected</c:if>>동작구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='마포구'}">selected</c:if>>마포구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='서대문구'}">selected</c:if>>서대문구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='서초구'}">selected</c:if>>서초구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='성동구'}">selected</c:if>>성동구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='성북구'}">selected</c:if>>성북구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='송파구'}">selected</c:if>>송파구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='양천구'}">selected</c:if>>양천구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='영등포구'}">selected</c:if>>영등포구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='용산구'}">selected</c:if>>용산구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='은평구'}">selected</c:if>>은평구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='종로구'}">selected</c:if>>종로구</option>
				<option value="관악구" <c:if test="${keywordMap.location=='중구'}">selected</c:if>>중구</option>
				<option value="영등포구" <c:if test="${keywordMap.location=='중랑구'}">selected</c:if>>중랑구</option>
			</select>
			<input type="date" name="top_option_date" id = "choice_date" value="${keywordMap.date }" onchange="javascript:sendOption();">
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
					<label><input type = "checkbox" name = "left_option_eq" value = "armcurl" id = "armcurl" onclick = "javascript:sendOption();"><span>암 컬</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "chestpress" id = "chestpress" onclick = "javascript:sendOption();"><span>체스트 프레스</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "dumbbell" id = "dumbbell" onclick = "javascript:sendOption();"><span>덤벨</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "halfract" id = "halfract" onclick = "javascript:sendOption();"><span>하프 렉</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "latpulldown" id = "latpulldown" onclick = "javascript:sendOption();"><span>렛 풀 다운</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "legcurl" id = "legcurl" onclick = "javascript:sendOption();"><span>레그 컬</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "smithmachine" id = "smithmachine" onclick = "javascript:sendOption();"><span>스미스머신</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "pullup" id = "pullup" onclick = "javascript:sendOption();"><span>풀 업</span></label>
					<label><input type = "checkbox" name = "left_option_eq" value = "running" id = "running" onclick = "javascript:sendOption();"><span>런닝머신</span></label>
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
				</select>
				<label class ="left_option_person_count_label">명 이상</label>
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
									<h4>${dto.hg_nickname } 님의 홈짐</h4>
									<h5>${dto.hg_faddr } / ${dto.hg_station }</h5>
									<p>수용 가능 인원 : ${dto.hg_person_count }
									</p>
									<div class = "homegym_search_result_list_item_content_eqlist">
									<c:if test = "${empty dto.hg_eq_list }">
									<h6>등록된 기구가 없습니다.</h6>
									</c:if>
									<c:forEach var = "eq_list" items="${dto.hg_eq_list }">
										<div class = "homegym_search_result_list_item_option_${eq_list.eq_name } eqdiv">
											${eq_list.eq_name } : ${eq_list.eq_count }
										</div>
									</c:forEach>
										
									</div>
									<div class = "homegym_search_result_list_item_content_price">
										가격 : ${dto.hg_price }<br>
									</div>	
								</div>
							</div>
							<hr>
						</c:forEach>
					</c:otherwise>
				</c:choose>	
				<div class = "homegym_search_result_list_paging"><h6>${pageStr }</h6></div>
			</div>
		</div>
	</div>
	</form>
<%@include file="../_include/footer.jsp" %>