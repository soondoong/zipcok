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
.titlee{font-weight: 550; color:#12151d; margin-bottom:20px;}
.titlee:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }
.titlee hr{border-top:1px solid #d1d1d4;margin-bottom: 30px;}

/*일반프로필 css*/
.pfDIV{ height:360px; margin-top:30px;}
.nomalInfo{ padding: 0 0 50px 40px;}
.nomalInfo div{width: 500px; padding: 15px 0; font-size: 19px; border-bottom:1px solid #e4e4e4;}
.nomalInfo div span{ font-weight: 550; padding-right: 50px;}
.rebtn{width:50px; margin:4px 0 0 10px; height:20px; font-size: 12px; border: 0px; border-radius: 5px; background-color: #e4e4e4;}
.okbtn{width: 100px; margin:0; height: 30px; font-weight:bold; font-size:15px;  border: 0px; border-radius: 5px; color:white;background-color:#257cd6;}
/*코치프로필 css*/
.coachInfo{width:500px;flex-direction: row; margin-left:100px;}
/*커리큘럼css*/
    .nocurriWrap{display:flex; width:400px; margin-top:20px;}
	.catenameDiv .catename{font-size:17px;font-weight: bold;} 
	.currimore{cursor: pointer;margin-right: 10px;}
	.currimore .curriP {padding-left:20px;font-size:18px;color:#20208a;}
	.showinputs{display:none;}
	.showinputs input{ width: 300px;}
	.showinputs textarea{ width: 300px; height: 100px;}
    .showinputs ol,.showinputs li{ list-style: decimal;width: 300px; }
    .showinputs li{ margin-top:15px;}
    .plusbtn,.minusbtn{font-size:20px; color: #257cd6; margin:5px 0 0 5px; cursor: pointer;}
	.minusbtn{font-size:21px; margin-left:3px; color:#ce0c0c;}
	.plusbtn span{font-size:15px;  }
	.currititle{display:inline-block;}
	.curriesInputAll{display:block; border:0px;  border-radius: 5px; padding: 0 15px; width: 300px; font-weight: 400; font-size: 14px;}
	.curriOneDIV .curri_name_input{margin:13px 0 12px 0; font-size: 17px; font-weight:bold; }
	.curriOneDIV .curri_content_input{margin:0 0 25px 0; font-size: 14px; width: 300px; }
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
	.coachdetails{margin:30px 0 0 30px;}
	.crebtn{margin: 4px 0 0 30px;}
	.currititle{font-size:18px; font-weight: 400;}
	</style>				
						
			<div class="coachdetails">
					<div>
						<p class="ptitle">결제계좌정보</p><input type="button"value="수정" class="rebtn crebtn" onclick="">
						<p>${accdto.pa_bankname }&nbsp;${accdto.pa_no }&nbsp;${accdto.pa_username }</p>
					</div>
					<div>
						<p class="ptitle">활동지역</p><input type="button"value="수정" class="rebtn crebtn" onclick="">
						<p>${dto.coach_floc }</p>
					</div>
					
					<div >
						<p class="ptitle">강의유형</p><input type="button"value="수정" class="rebtn crebtn" onclick="">	
						<p>${dto.coach_ex_type}</p>
					</div>	
					
					<div style="margin-top:30px;">
						<p class="ptitle">소개글 제목</p><span class="subspan"><input type="button"value="수정" class="rebtn crebtn" onclick="subrewrite()"></span>
						<p><input type="text" id="sub" value="${dto.coach_intro_sub }" readonly="readonly"></p>
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
					<p class="ptitle"><span>커리큘럼</span></p>			
			
			<c:forEach var="c" items="${catelist }">
			<form name="${c.cate_name }form">
				<div class="nocurriWrap">
						<div class="catenameDiv">
							<p class="catename">${c.cate_name }</p>
						</div>
						<div class="currimore"  id="${c.cate_name }">	
					<c:if test="${c.cate_name ne oneList.get(0).curri_catename && c.cate_name ne twoList.get(0).curri_catename }">						
						<span class="curriP">커리큘럼 추가하기</span>
					</c:if>
					<c:if test="${c.cate_name eq oneList.get(0).curri_catename ||  c.cate_name eq twoList.get(0).curri_catename }">			
							<span class="curriP">커리큘럼 수정하기</span>
					</c:if>	
							<i class="fas fa-plus-square plusbtn"></i>
						</div>
					<c:if test="${c.cate_name eq oneList.get(0).curri_catename ||  c.cate_name eq twoList.get(0).curri_catename }">			
						<i class="fas fa-minus-square minusbtn" onclick="thisCurriDelete('${c.cate_name }')"></i>
					</c:if>
				</div>				
					<div  class="showinputs" id="${c.cate_name }1">
						<ol>
							<li>
								<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
								<input type="hidden" name="curri_catename" value="${c.cate_name }">
								<input type="hidden" name="curri_order" value="1">
								<input type="text" name="curri_name" id="${c.cate_name }11" placeholder="운동제목" 
								value="${c.cate_name eq oneList.get(0).curri_catename?oneList.get(0).curri_name:twoList.get(0).curri_name}"><br>
								<textarea name="curri_content"  id="${c.cate_name }12" placeholder="간단한 설명을 적어주세요(최대100자)">
								${c.cate_name eq oneList.get(0).curri_catename?oneList.get(0).curri_content:twoList.get(0).curri_content}</textarea>
							
							<li>
								<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
								<input type="hidden" name="curri_catename" value="${c.cate_name }">
								<input type="hidden" name="curri_order" value="2">	
								<input type="text" name="curri_name" id="${c.cate_name }21" placeholder="운동제목"
								value="${c.cate_name eq oneList.get(0).curri_catename?oneList.get(1).curri_name:twoList.get(1).curri_name}"><br>
								<textarea name="curri_content"  id="${c.cate_name }22"placeholder="간단한 설명을 적어주세요(최대100자)">
								${c.cate_name eq oneList.get(0).curri_catename?oneList.get(1).curri_content:twoList.get(1).curri_content}</textarea>
						    </li>	
						    <li>	
						    	<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
						    	<input type="hidden" name="curri_catename" value="${c.cate_name }">
								<input type="hidden" name="curri_order" value="3">
						    	<input type="text" name="curri_name" id="${c.cate_name }31" placeholder="운동제목"
						    	value="${c.cate_name eq oneList.get(0).curri_catename?oneList.get(2).curri_name:twoList.get(2).curri_name}"><br>
								<textarea name="curri_content"  id="${c.cate_name }32" placeholder="간단한 설명을 적어주세요(최대100자)">
								${c.cate_name eq oneList.get(0).curri_catename?oneList.get(2).curri_content:twoList.get(2).curri_content}</textarea>
							</li>	
						</ol>	
					<c:if test="${c.cate_name ne oneList.get(0).curri_catename && c.cate_name ne twoList.get(0).curri_catename  }">
					<input type="button" value="등록완료" class="okbtn nodataOKbtn" name="${c.cate_name }form">
					</c:if>
					<c:if test="${c.cate_name eq oneList.get(0).curri_catename || c.cate_name eq twoList.get(0).curri_catename  }">
					<input type="button" value="수정완료" class="okbtn nodataOKbtn" name="${c.cate_name }form">
					</c:if>							
				 </div>
			</form>							
			</c:forEach>	
				
			
								
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
function thisCurriDelete(str){
	var result=confirm('등록하신 커리큘럼을 삭제하시겠습니까?');
	if(result){
		location.href='DeleteCurri.do?cate_name='+str;
	}
	
}

/*카테고리수정*/
function cateUpdate(){
	window.open('categoryUpdate.do?mem_id=${login.mem_id}','cateUpdate','left=200, top=100, width=400, height=200');	
}
$(function () { 
function subrewrite(){
	$('#sub').attr('readonly',false);
	$('.subspan').html('');
	$('.subspan').html("<input type='button'   value='수정완료' class='rebtn crebtn' >");
	
	
}
function gosubmit() {
	$('#폼아이이넣엉').attr("action", "어쩌구.do").submit();
};
});

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
<script>
	$(function(){
		var input1= '';
		var textarea1='';  
		var input2='';
		var textarea2= '';
		var input3='';
		var textarea3= '';
			
		
		/*커리큘럼 toggle*/
		$('.currimore').on('click',function(){
			var ww = document.getElementById($(this).attr('id')+"1");
				if($(ww).hasClass('toggle')){
					ww.style.display='none';
					$(ww).removeClass('toggle');
				}else{
					$(ww).addClass('toggle');
					ww.style.display='block';			
				}			
						
				 input1= $(this).attr('id')+"11";
				 textarea1= $(this).attr('id')+"12";
				 input2=$(this).attr('id')+"21";
				textarea2= $(this).attr('id')+"22";
				input3= $(this).attr('id')+"31";
				 textarea3= $(this).attr('id')+"32";
					
	
				$('#'+textarea1).on('focus',function(){
							if($('#'+input1).val()==''){
								$('#'+input1).focus();
							}
				    });
					
				$('#'+input2).on('focus',function(){
					if($('#'+input1).val()==''){
						$('#'+input1).focus();
					}
				});
				
				$('#'+input3).on('focus',function(){
					if($('#'+input1).val()==''){
						$('#'+input1).focus();
					}else if($('#'+input2).val()==''){
						$('#'+input2).focus();
					}
				});
				
					$('#'+textarea2).on('focus',function(){
						if($('#'+input1).val()==''){
							$('#'+input1).focus();
						}else if($('#'+textarea1).val()==''){
							$('#'+textarea1).focus();
						}else if($('#'+input2).val()==''){
							$('#'+input2).focus();
						}
					  });	
						$('#'+textarea3).on('focus',function(){
							if($('#'+input1).val()==''){
								$('#'+input1).focus();
							}else if($('#'+textarea1).val()==''){
								$('#'+textarea1).focus();
							}else if($('#'+input2).val()==''){
								$('#'+input2).focus();
							}else if($('#'+textarea2).val()==''){
								$('#'+textarea2).focus();
							}else if($('#'+input3).val()==''){
								$('#'+input3).focus();
							}	
			  		  });
				
		});
		
		/*커리큘럼 등록기능*/
		$('.nodataOKbtn').on('click',function(){
			
					var formname=$(this).attr('name');
					if( $('#'+input1).val()=='' || $('#'+input2).val()=='' ||  $('#'+input3).val()==''|| $('#'+textarea1).val()=='' || $('#'+textarea2).val()=='' || $('#'+textarea3).val()==''){			
						alert('내용을 모두 작성해주세요');
						return false;
					}else{
						
							if($(this).val() == '등록완료'){			
								$('form[name='+formname+']').attr('action','NodataCurriInsert.do').submit();												
							}else{
								$('form[name='+formname+']').attr('action','DataCurriInsert.do').submit();			
							}
						
						
					}	
		});
		
		
		
});
	
	
	</script>	


 <%@include file="../_include/footer.jsp" %>

</body>
</html>