<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
</head>
<body>
	<%@include file="../../header2.jsp"%>
<style type="text/css">
.test-inline {
   display: inline-flex;
}
.table { border-spacing: ''; table-layout: auto; text-align: center;} 
.table th{font-weight: bold; border-color:#848282;}
</style>
	<div class="adminPage_wrap">
		<%@include file="../adminSideMenu.jsp"%>
		<div class="container adminPage_contents">
			<div class="adminPage_main">
				<br>
				<div>
					<h3>탈퇴 회원</h3>
					<br>
				</div>
				<div>
					<form action="adminDelMemberListAction.do">
						<ul class="test-inline">
							<li>조건 검색&nbsp;</li>
							<li>
							<select name="type">
									<option <c:if test="${keyword.keywordType=='전체'}">selected="selected"</c:if>>전체</option>
									<option <c:if test="${keyword.keywordType=='회원이름'}">selected="selected"</c:if>>회원이름</option>
									<option <c:if test="${keyword.keywordType=='회원아이디'}">selected="selected"</c:if>>회원아이디</option>
							</select>
							</li>
							<li><input type="text" name="searchContent" placeholder="내용을 입력해주세요."></li>
							<li><input type="submit" value="검색"></li>
						</ul>
					</form>
				</div>

				<div>
				<form action="adminDelMemberDate.do">
					<ul class="test-inline">
						<li>조건 검색&nbsp;</li>
						<li><input type="date" id="start_date" name="start_date" onchange="javascript:start_change();"
						value="${keyword.keywordStart }" required="required"></li>~
						<li><input type="date" id="end_date" name="end_date" onchange="javascript:end_change();"
						value="${keyword.keywordEnd }" required="required"></li>
					</ul>
					<input type="submit" value="검색">
				</form>
				</div>
				<br><br>
				<div>
					<!-- 회원목록부분 테이블 div -->
					<table class="table" class="table table-hover">
						<thead style="background-color : whitesmoke;">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>회원등급</th>
								<th>탈퇴일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5" align="center">검색된 탈퇴회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.mem_idx }</td>
									<td>${dto.mem_name }</td>
									<td>${dto.mem_id }</td>
									<td>${dto.mem_type }</td>
									<td>${dto.mem_outdate }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5" align="center">${pageStr }</td>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
		</div>
	</div>
	

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="js/httpRequest.js"></script>	
<script>
	var count = 0;
	

	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();

	$(function() {
		$('#date_div').datepicker({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			changeMonth:true,
			changeYear:true,
			yearSuffix:'년'
		});
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
	
</script>

	<%@include file="../../_include/footer.jsp"%>