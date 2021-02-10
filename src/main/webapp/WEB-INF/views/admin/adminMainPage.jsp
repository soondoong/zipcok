<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
</head>
<body>
<%@include file="../header2.jsp" %>
 <div class="adminPage_wrap">
      <%@include file="./adminSideMenu.jsp" %>
      <div class="adminPage_contents">
         <div class="adminPage_main">
		<div>
				관리자 페이지
		</div>
		</div>
	</div>
</div>
<%@include file="../_include/footer.jsp" %>
</body>
</html>