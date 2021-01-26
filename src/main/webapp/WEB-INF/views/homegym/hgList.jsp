<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../header2.jsp"%>
	<section>
		<article>
			<h1>어떤 홈짐을 찾고 계신가요?</h1>
			<div id="calendar"></div>
			<select name="hgSearch_location">
				<option value="">강남구</option>
				<option value="">강동구</option>
				<option value="">강북구</option>
				<option value="">강서구</option>
				<option value="">관악구</option>
			</select> <input type="text" id="hgSearch_date" readonly="readonly"> <span>와</span>
			<input type="button" value="검색" onclick="location.href='#'">
			<hr>
		</article>
		<article>
			<div>
				<h4>검색 조건</h4>
				<hr>
				<h6>기구</h6>
				<div>기구 Item</div>
				<div>기구 Item</div>
				<div>기구 Item</div>
				<div>기구 Item</div>
				<div>기구 Item</div>
				<div>기구 Item</div>
				<div>기구 Item</div>
				<div>기구 Item</div>
				<div>기구 Item</div>
				<div>기구 Item</div>
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
			<div></div>
			<div>
				<c:set var="HomeGymList" value="${HomeGymList }" />
				<c:choose>
					<c:when test="${empty HomeGymList }">
						<div class="ListItem">등록된 홈짐이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${HomeGymList }">
							<div class="ListItem">${dto.hg_mem_id }</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<h6>page 영역</h6>
			</div>
		</article>
	</section>
</body>
</html>