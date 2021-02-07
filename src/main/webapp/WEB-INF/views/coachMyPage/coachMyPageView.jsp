<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">
<style>
.profileIMG { width:500px; height:500px;  border-radius: 50%; overflow: hidden; margin-bottom: 50px;}
.profileIMG img { width:500px; height:500px; object-fit: cover;}
</style>

<script>
function coachMypagePwdUpdate(){
	location.href='coachMypagePwdUpdateForm.do';
}
function coachMypageAddrUpdate(){
	window.open('coachMypageAddrUpdateForm.do?mem_id=${sessionScope.coachId}','addrUpdate','width=550,height=300');
}
function coachMypageEmailUpdate(){
	window.open('coachMypageEmailUpdateForm.do?mem_id=${sessionScope.coachId}','emailUpdate','width=550,height=300');
}
function coachMypagePhoneUpdate(){
	window.open('coachMypagePhoneUpdateForm.do?mem_id=${sessionScope.coachId}','emailUpdate','width=550,height=300');
}
</script>

</head>
<body>
<%@include file="../header2.jsp"%>
<%@include file="./coachMypageSideMenu.jsp"%>
<c:set var="dto" value="${resultMap.coachDTO }"/>
<c:set var="file" value="${resultMap.coachFileList }"/>
<c:set var="curri" value="${resultMap.curriList }"/>
<c:set var="review" value="${resultMap.reviewList }"/>
<c:set var="oneList" value="${oneCurriList}"/>
<c:set var="twoList" value="${twoCurriList }"/>	
<c:set var="mdto" value="${mdto }"></c:set>
	
<!-- 프로필 본문-->
<div class="container mt-3" style="margin-left: 250px; padding: 1px 16px;">		
		
	<div class="profileIMG">
	<img src="/zipcok/upload/member/${dto.mfile_upload }" >
	</div>
	<!-- 코치소개 영역 -->		
			<div>
			<span style="font-size:2rem; font-weight: 600;">${dto.mem_name}코치</span>	 
			<span style="font-size:1.3rem; font-weight: 300;"><img src="img/coach/star.png" class="starIMG">${dto.avg }</span>	
			</div>
				
			<div>
			<h1>${dto.coach_intro_sub }</h1>
			<br><br>
			
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">활동지역</span>
			<span>${dto.coach_floc }</span>
			<br>
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">강의유형</span>
			<span>${dto.coach_ex_type}</span>
			<br>
			<br><br>
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">소개</span>
			<p>${dto.coach_intro_cont }</p>
			<br>
			
			<!-- 커리큘럼영역 -->
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">커리큘럼</span>
			
			<c:if test="${empty curri}">
			<div>등록 된 커리큘럼이 없습니다.</div>
			</c:if>
			
			 
			<table style="margin-top:20px;">
			<tr>
			<td style="width:360px; text-align: left;">
			<c:if test="${!empty oneList}">
				<div  style="width:360px; height:300px;" >
					<p style="font-size:1.1rem; font-weight: 400;margin:0 0 50px 0;">${oneList.get(0).curri_catename}</p>
				<ul>					
				<c:forEach var="one" items="${oneList }">
					<li><p>${one.curri_name }</p><p>${one.curri_content }</p></li>
				</c:forEach>
					</ul>
				</div>
			</c:if>
			</td>
			
			
			
			<td style="width:360px; text-align: left;">
			<c:if test="${!empty twoList}">
				<div style="width:360px; height:300px;" >
					<p style="font-size:1.1rem; font-weight: 400;margin:0 0 50px 0;">${twoList.get(0).curri_catename}</p>
				<ul>
				<c:forEach var="two" items="${twoList }">
					<li><p>${two.curri_name }</p><p>${two.curri_content }</p></li>		
				</c:forEach>
					</ul>
				</div>
			</c:if>
			</td>
			</tr>
			
			</table>
			<!-- 커리큘럼영역 -->
			
			
			<br>
			<span style="font-size:1.3rem; font-weight: 500;margin:0 60px 0 0;">준비물</span>
			<p>${dto.coach_mat }</p>
			<br>
			
			</div>
			
		<div>
			<label style="font-size:1.0rem; font-weight: 400; margin:40px 10px 0 0;">
			<span style="font-size:1.3rem; font-weight: 500;margin:0 25px 0 0;">
			이름 :</span>${mdto.mem_name }<input type="hidden"
				name="mem_name" value="${mdto.mem_name }"></label>
		</div>
		
		<div>
			<label style="font-size:1.0rem; font-weight: 400; margin:18px 10px 0 0;">
			<span style="font-size:1.3rem; font-weight: 500;margin:0 25px 0 0;">
			생년월일 :</span>${mdto.mem_birth }<input type="hidden"
				name="mem_birth" value="${mdto.mem_birth }"></label>
		</div>
	
		<div>
			<label style="font-size:1.0rem; font-weight: 400; margin:18px 10px 0 0;">
			<span style="font-size:1.3rem; font-weight: 500;margin:0 25px 0 0;">
			아이디 :</span>${mdto.mem_id }<input type="hidden" name="mem_id"
				value="${mdto.mem_id }"></label>
		</div>
		
		<div>
			<label style="font-size:1.0rem; font-weight: 400; margin:18px 10px 0 0;">
			<span style="font-size:1.3rem; font-weight: 500;margin:0 25px 0 0;">
			비밀번호 :</span>****<input type="hidden" name="mem_pwd"
				value="${mdto.mem_pwd }"></label> <input type="button" value="수정하기" onclick="coachMypagePwdUpdate()">
		</div>
		
		<div>
			<label style="font-size:1.0rem; font-weight: 400; margin:18px 10px 0 0;">
			<span style="font-size:1.3rem; font-weight: 500;margin:0 25px 0 0;">
			주소 :</span>${mdto.mem_addr } ${mdto.mem_detailaddr }
				<input type="hidden" name="mem_zipcode" value="${mdto.mem_zipcode }">
				<input type="hidden" name="mem_addr" value="${mdto.mem_addr }">
				<input type="hidden" name="mem_detailaddr"value="${mdto.mem_detailaddr }">
			</label>
			<input type="button"value="수정하기" onclick="coachMypageAddrUpdate()">
		</div>
		
		<div>
			<label style="font-size:1.0rem; font-weight: 400; margin:18px 10px 0 0;">
			<span style="font-size:1.3rem; font-weight: 500;margin:0 25px 0 0;">
			이메일 :</span>${mdto.mem_email } <input type="hidden"
				name="mem_email" value="${mdto.mem_email }"></label> <input
				type="button" value="수정하기" onclick="coachMypageEmailUpdate()">
		</div>
		
		<div>
			<label style="font-size:1.0rem; font-weight: 400; margin:18px 10px 0 0;">
			<span style="font-size:1.3rem; font-weight: 500;margin:0 25px 0 0;">
			전화번호 :</span>${mdto.mem_phone } <input type="hidden"
				name="mem_phone" value="${mdto.mem_phone }"></label> <input
				type="button" value="수정하기" onclick="coachMypagePhoneUpdate()">
		</div>
		
		<div style="margin:18px 10px 0 0;">
		<a href="#">[회원탈퇴]</a> <!-- memberDeleteForm.do?mem_id=${sessionScope.sid}'  --> 
		</div>
		<br><br>
	
</div>	
	
<!-- 프로필 본문-->		
</body>
</html>