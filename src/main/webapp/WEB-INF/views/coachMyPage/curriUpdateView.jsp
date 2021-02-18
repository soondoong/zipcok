<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">

<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<style>
.mypage_contents .reupload{position: relative; top:-77px; left:359px; background-color: #b7b7b7; 
font-size:23px; text-align: center; padding:12px;color:white; border-radius: 50%;}
#file{display:none;}
.titlee{ color:#12151d; margin-bottom:20px;}
.titlee:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }
.titlee hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}

/*일반프로필 css*/
.pfDIV{ height:360px; margin-top:30px;}
.nomalInfo{ padding: 0 0 50px 40px;}
.nomalInfo div{width: 500px; padding: 15px 0; font-size: 19px; border-bottom:1px solid #e4e4e4;}
.nomalInfo div span{ font-weight: 550; padding-right: 50px;}
.rebtn{width:50px; margin:4px 0 0 10px; height:20px; font-size: 12px; border: 0px; border-radius: 5px; background-color: #e4e4e4;}

/*코치프로필 css*/
.coachInfo{width:500px;flex-direction: row; margin-left:100px;}

/*커리큘럼수정*/
	.allcurriWrap{display:flex; padding:50px;}
	.nocurriWrap{display:flex; width:400px; margin-top:20px;}
	.catenameDiv .catename{font-size:20px;font-weight: bold;} 
	.currimore{cursor: pointer;margin-right: 20px;}
	.currimore .curriP {padding-left:20px;font-size:18px;color:#20208a;}
	.showinputs{display:none;}
	.showinputs input{ width: 300px;}
	.showinputs textarea{ width: 300px; height: 100px;}
    .showinputs ol,li{ list-style: decimal;}
    .showinputs li{ margin-top:15px;}
</style>


</head>
<body>
<%@include file="../header2.jsp"%>

<c:set var="dto" value="${resultMap.coachDTO }"/>
<c:set var="file" value="${resultMap.coachFileList }"/>
<c:set var="curri" value="${resultMap.curriList }"/>
<c:set var="review" value="${resultMap.reviewList }"/>
<c:set var="oneList" value="${oneCurriList}"/>
<c:set var="twoList" value="${twoCurriList }"/>	
<c:set var="mdto" value="${mdto }"></c:set>
<c:set var="catelist" value="${catelist }"/>
<div class="mypage_wrap">	
<%@include file="./coachMypageSideMenu.jsp"%>
<!-- 프로필 본문-->

<div class="mypage_contents">	
	<div class="mypage_main coachmypage_main">		
	<div class="nomalAllWrap">
		<h2  class="titlee">&nbsp;기본 프로필</h2>
		<p>회원프로필사진은 코치프로필 사진으로 사용됩니다</p>
		 <hr>	
		 
		<form id="uploadForm" enctype="multipart/form-data" method="POST" action="profileImgReUpload.do">
			<div class="pfDIV">
			<!-- 프로필사진 수정 -->
				<div class="profileIMG">
					<!-- 프로필사진 수정 -->
					<img src="/zipcok/upload/member/${dto.mfile_upload }" >
				</div>				
				<a href="#" id="a-upload"><i class="fas fa-camera reupload" ></i></a>
					<input type="file" id="file" name="upload" onchange="changeValue(this)" accept="image/gif, image/jpeg, image/png"/>
					<input type="hidden" name="id" value="${login.mem_id }">				
			</div>	
							
		</form>
			
		<!-- 프로필사진 수정 -->
						
<!-- 일반프로필 시작 -->
<div class="nomalInfo">
		<div class="name">
			<span>이름</span>${mdto.mem_name }<input type="hidden" name="mem_name" value="${mdto.mem_name }">
		</div>
		
		<div>		
			<span id="birth">생년월일</span>${mdto.mem_birth }<input type="hidden" name="mem_birth" value="${mdto.mem_birth }">
		</div>
	
		<div>		
			<span>아이디</span>${mdto.mem_id }<input type="hidden" name="mem_id" value="${mdto.mem_id }">
		</div>
		
		<div>		
			<span>비밀번호</span>****<input type="hidden" name="mem_pwd"value="${mdto.mem_pwd }">
			<input type="button" value="수정"  class="rebtn" onclick="coachMypagePwdUpdate()">
		</div>
		 
		<div>		
			<span>주소</span><input type="button"value="수정" class="rebtn" onclick="coachMypageAddrUpdate()">
			<p>${mdto.mem_addr } <br>${mdto.mem_detailaddr }</p>
				<input type="hidden" name="mem_zipcode" value="${mdto.mem_zipcode }">
				<input type="hidden" name="mem_addr" value="${mdto.mem_addr }">
				<input type="hidden" name="mem_detailaddr"value="${mdto.mem_detailaddr }">
			
			
		</div>
		
		<div>		
			<span>이메일</span>${mdto.mem_email } <input type="hidden"
				name="mem_email" value="${mdto.mem_email }"> <input type="button" value="수정" class="rebtn" onclick="coachMypageEmailUpdate()">
		</div>
		
		<div>			
			<span>전화번호</span>${mdto.mem_phone } <input type="hidden"
				name="mem_phone" value="${mdto.mem_phone }"><input type="button" value="수정"  class="rebtn" onclick="coachMypagePhoneUpdate()">
		</div>
		
		<div style="text-align: right;">
		<a href="#" >[회원탈퇴]</a> <!-- memberDeleteForm.do?mem_id=${sessionScope.sid}'  --> 
		</div>
		
	</div>
</div><!-- nomalAllWrap -->
<!-- 일반프로필영역 끝 -->


	<!-- 코치소개 영역 -->

		<div class="coachInfo">	
            <h2  class="titlee" >&nbsp;코치 프로필</h2>
            <p>센스있는 프로필일수록 매칭성공률이 높습니다!</p>
			<hr>			
		
	<style>
	.ptitle{font-size:20px; font-weight: 550;margin:0 0 10px 0; display: inline-block;}
	.coachdetails{margin:60px 0 0 30px;}
	.crebtn{margin: 4px 0 0 30px;}
	.currititle{font-size:18px; font-weight: 400;}
	</style>				
						
			<div class="coachdetails">
					<div style="display: inline-block;">
						<p class="ptitle">활동지역</p><input type="button"value="수정" class="rebtn crebtn" onclick="">
						<p>${dto.coach_floc }</p>
					</div>
					
					<div style="display: inline-block; margin-left:50px;">
						<p class="ptitle">강의유형</p><input type="button"value="수정" class="rebtn crebtn" onclick="">	
						<p>${dto.coach_ex_type}</p>
					</div>	
					
					<div style="margin-top:30px;">
						<p class="ptitle">소개글 제목</p><input type="button"value="수정" class="rebtn crebtn" onclick="">
						<p>${dto.coach_intro_sub }</p>
					</div>
					<div  style="margin-top:30px;">
						<p class="ptitle">소개글</p><input type="button"value="수정" class="rebtn crebtn" onclick="">
						<p>${dto.coach_intro_cont }</p>			
					</div>	
									
					<div style="margin-top:30px;">	 
						<span class="ptitle">받은 별점 평균</span>
						<img src="img/coach/star.png"  style="width:30px;margin-left:20px;" ><span  style="font-size:20px;">${dto.avg }	</span>
					</div>
					
					<div style="margin-top:30px;">	 
						<p class="ptitle">카테고리</p><input type="button"value="수정" class="rebtn crebtn" onclick="cateUpdate();">
						<p>${dto.cate_name }</p>	
					</div>
					
					
			<!-- 커리큘럼영역 -->
			<div  style="margin-top:30px;">
					<p class="ptitle"><span>커리큘럼</span></p><input type="button"value="${empty curri?'등록':'수정'}" style="${empty curri?'background-color:#257cda;color:white;':''}" class="rebtn crebtn" onclick="curriRewrite();">				
					<c:if test="${empty curri}">
						<div class="nocurriWrap">
							<div class="catenameDiv">
								<p class="catename">${c.cate_name }</p>
							</div>
							<div class="currimore"  id="${c.cate_name }">							
								<span class="curriP">커리큘럼 추가하기</span>
								<i class="fas fa-plus-square plusbtn"></i>
							</div>
				     	</div>	
					</c:if>			
					 
					<table style="margin-top:20px;">
					<tr>
					<td style="width:360px; text-align: left;">
					<c:if test="${!empty oneList}">
						<div  style="width:360px; height:300px;" >
							<p class="currititle">${oneList.get(0).curri_catename}</p>
						<ul>					
						<c:forEach var="one" items="${oneList }">
							<li style="margin-left:10px;"><p style="font-weight:bold;">${one.curri_name }</p><p style="margin-left:10px;">${one.curri_content }</p></li>
						</c:forEach>
							</ul>
						</div>
					</c:if>
					</td>
								
					<td style="width:360px; text-align: left;">
					<c:if test="${!empty twoList}">
						<div style="width:360px; height:300px;" >
							<p class="currititle">${twoList.get(0).curri_catename}</p>
						<ul>
						<c:forEach var="two" items="${twoList }">
							<li style="margin-left:10px;">
								<p style="font-weight:bold;">${two.curri_name }</p>
								<p style="margin-left:10px;">${two.curri_content }</p>
							</li>		
						</c:forEach>
							</ul>
						</div>
					</c:if>
					</td>
					</tr>
					
					</table>
			</div>	<!-- 커리큘럼영역 -->	
							
						<div style="margin-top:30px;">
							<p class="ptitle">준비물</p>
							<p>${dto.coach_mat }</p>
						</div>		
						
						
					</div>
				</div><!-- coach_info -->
<!-- 코치소개 영역 끝 -->	
			
		</div><!-- mypage_main -->
	</div><!-- mypage_contents -->	
</div>
<!-- 프로필 본문-->		
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
/*커리큘럼수정*/
function curriRewrite(){
	location.href='curriReWrite.do';
}
/*카테고리수정*/
function cateUpdate(){
	window.open('categoryUpdate.do?mem_id=${login.mem_id}','cateUpdate','left=200, top=100, width=400, height=200');	
}

/*프사수정=============*/
$(function () { //사진수정버튼

			$('#a-upload').click(function (e) {
			e.preventDefault();
			$('#file').click();
			 });
			 
});
function changeValue(obj){ //사진선택하면
	var fileValue = $("#file").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
   var result=confirm(fileName+"사진으로 변경하시겠습니까?");
	if(result){		
		  $('#uploadForm').submit();
	}
/*프사수정===============*/	

}



</script>



 <%@include file="../_include/footer.jsp" %>

</body>
</html>