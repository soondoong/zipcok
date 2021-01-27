<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.eq_options {
border:1px solid black;
font-size: 20px;
border-radius: 8px;
width:200px;
height:30px;
}
</style>
</head>
<body>
	<section>
		<article>
			<h1>어떤 홈짐을 찾고 계신가요?</h1>
			<select name="hgSearch_location" onchange="javascript">
				<option value="지역" selected>----</option>
				<option value="강남구">강남구</option>
				<option value="강동구">강동구</option>
				<option value="강북구">강북구</option>
				<option value="강서구">강서구</option>
				<option value="관악구">관악구</option>
				<option value="영등포구">영등포구</option>
			</select>
			<input type="date" id="hgSearch_date">
			
			<hr>
		</article>
		<article>
			<div>
				<h4>검색 조건</h4>
				<hr>
				<h6>기구</h6>
				<div></div>
				<input type = "checkbox" id = "eq_option01" name = "eq_option">
				<label class = "eq_options" for="eq_option01">기구 1</label>
				<input type = "checkbox" id = "eq_option02" name = "eq_option">
				<label class = "eq_options" for="eq_option02">기구 2</label>
				<input type = "checkbox" id = "eq_option03" name = "eq_option">
				<label class = "eq_options" for="eq_option03">기구 3</label>
				<input type = "checkbox" id = "eq_option04" name = "eq_option">
				<label class = "eq_options" for="eq_option04">기구 4</label>
				<input type = "checkbox" id = "eq_option05" name = "eq_option">
				<label class = "eq_options" for="eq_option05">기구 5</label>
				<input type = "checkbox" id = "eq_option06" name = "eq_option">
				<label class = "eq_options" for="eq_option06">기구 6</label>
				<input type = "checkbox" id = "eq_option07" name = "eq_option">
				<label class = "eq_options" for="eq_option07">기구 7</label>
				<input type = "checkbox" id = "eq_option08" name = "eq_option">
				<label class = "eq_options" for="eq_option08">기구 8</label>
				<input type = "checkbox" id = "eq_option09" name = "eq_option">
				<label class = "eq_options" for="eq_option09">기구 9</label>
				<input type = "checkbox" id = "eq_option10" name = "eq_option">
				<label class = "eq_options" for="eq_option10">기구 10</label>

				<hr>
				<h6>가격</h6>
				<div>
					최저가 : <span></span>원 이상
				</div>
				<div></div>
				<hr>
				<h6>수용 인원</h6>
				<div></div>
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
				<h6>${pageStr }</h6>
			</div>
		</article>
	</section>
</body>
</html>