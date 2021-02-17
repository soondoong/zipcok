<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../_include/head.jsp" %>
<body onload="selectCheck();">
<div class="memplus_wrap">
	<div class="memplus_title">
		<h4>수강생 추가</h4>
	</div>
	<form action="coachMyPageMemPlus.do">
	<input type="hidden" name="uc_comm_idx" value="${uc_comm_idx }">
	<div class="memplus_table">
		<table>
			<tr>
				<td>수강생 아이디</td>
				<td>
				<select name="uc_mem_id">
					<c:forEach var="dto" items="${paymentlist}" varStatus="i">
						<c:if test="${dto.pd_status eq '결제완료' }">
							<option value="${dto.pd_mem_id}">${dto.pd_mem_id}</option>
						</c:if>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="수강생 추가"></td>
			</tr>
		</table>
	</div>
	</form>
</div>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script>

	var usedNames = {};
	$("select > option").each(function () {
	  if(usedNames[this.text]) {
	     $(this).remove();
	 } else {
	     usedNames[this.text] = this.value;
	 }});

</script>
</body>
</html>