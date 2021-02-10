<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../_include/head.jsp" %>
<link href="assets/css/mypage.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<body>
<c:set var="dto" value="${resultMap.coachDTO }"/>
<c:set var="file" value="${resultMap.coachFileList }"/>
<c:set var="curri" value="${resultMap.curriList }"/>
<c:set var="review" value="${resultMap.reviewList }"/>
<c:set var="oneList" value="${oneCurriList}"/>
<c:set var="twoList" value="${twoCurriList }"/>	
<c:set var="mdto" value="${mdto }"></c:set>

	<style>
	.ptitle{font-size:20px; font-weight: 550;margin:0 0 10px 0; display: inline-block;}
	.coachdetails{margin:60px 0 0 30px;}
	.rebtn{width:50px; margin:4px 0 0 10px; height:20px; font-size: 12px; border: 0px; border-radius: 5px; background-color: #e4e4e4;}
	.crebtn{margin: 4px 0 0 30px;}
	.okbtn{width: 100px; height: 30px; font-weight:bold; font-size:15px; color:white;background-color:#257cd6;}
	.currititle{font-size:18px; font-weight: 400; display: inline-block; }
	.plusbtn,.minusbtn{font-size:20px; color: #257cd6; margin:0 0 0 10px; cursor: pointer;}
	.plusbtn span{font-size:15px;  }
	.lastDIV{position: absolute; width:100px;left:35%; bottom: 30px;}
	</style>				
						
					
			<!-- 커리큘럼영역 -->
		<form>
			<div  style="width:600px;padding:50px;">
					<p class="ptitle"><span>커리큘럼</span></p>				
					<c:if test="${empty curri}">
					<div>등록 된 커리큘럼이 없습니다.<input type="button"value="등록" class="rebtn crebtn" onclick=""></div>
					<div class="lastDIV">
						<input type="button" value="수정완료" class="rebtn crebtn okbtn"  onclick="">
					</div>
					</c:if>			
					 				 
					 
					<table style="margin-top:20px;">
					<tr>
					<td style="width:270px; text-align: left;">
					<c:if test="${!empty oneList}">
						<div  style="width:360px; height:300px;" >
							<p class="currititle">${oneList.get(0).curri_catename}</p>
							<i class="fas fa-plus-square plusbtn" id="onecurriPLUS"><span>항목추가</span></i>
						<ul>					
						<c:forEach var="one" items="${oneList }">
							<li style="margin-left:10px;" name="onecurri">
								<p style="font-weight:bold;">${one.curri_name }<i class="fas fa-minus-square minusbtn"></i></p>
								<p style="margin-left:10px;">${one.curri_content }</p>
							</li>
						</c:forEach>
							</ul>
						</div>
					
					</c:if>
					</td>
								
					<td style="width:270px; text-align: left;">
					<c:if test="${!empty twoList}">
						<div style="width:360px; height:300px;" >
							<p class="currititle">${twoList.get(0).curri_catename}</p>
							<i class="fas fa-plus-square plusbtn"><span>항목추가</span></i>
						<ul>
						<c:forEach var="two" items="${twoList }">
							<li style="margin-left:10px;">
								<p style="font-weight:bold;">${two.curri_name }<i class="fas fa-minus-square minusbtn"></i></p>
								<p style="margin-left:10px;">${two.curri_content }</p>
							</li>		
						</c:forEach>
							</ul>
						</div>
					</c:if>
					</td>
					</tr>
					
					</table>
			</div><!-- 커리큘럼영역 -->	
		</form>
	
							
</body>
</html>