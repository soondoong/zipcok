<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.secondWrap{
padding:50px 100px 0px 100px;
}
</style>

</head>
<body>
<%@include file="../header2.jsp" %>
<c:set var="dto" value="${resultMap.coachDTO }"/>
<section>
	<article class="secondWrap">
		<h2>${dto.mem_name}코치프로필입니다</h2>	 
		<div>
			
		
		</div>
	</article>
</section>
</body>
</html>