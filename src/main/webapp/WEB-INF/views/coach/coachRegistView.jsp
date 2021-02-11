<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
//우편번호 찾기 버튼 클릭시 발생 이벤트
function execPostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
         
            document.getElementById('coach_floc').value = fullRoadAddr;

            //document.getElementById('mem_detailaddr').value = data.jibunAddress; 
        }
     }).open();
 }
 
 /*체크박스 두개만 가능하게하기*/
$(function(){
	
	//카테고리 두가지까지 제한
	  $('.cate').click(function(){
	  if($(".cate:checked").length >2){  alert('최대 두 가지 선택가능합니다.'); $(this).prop('checked', false); }
	  });	

	//가입버튼눌럿을때 제한조건
	$('.coachJoinbtn').on('click',function(){
		
		 var uploadFiles= $('input[type=file]');
		//카테고리 하나라도 선택하지않으면
				  if($(".cate:checked").length <1){  
					  alert('카테고리를 선택해주세요.'); 
						return false;			
				  }else{
						  var is_empty = false;
						  $('form').find('input[type=file]').each(function(){
						      if(!$(this).val()) {
						          is_empty = true;
						      }
						  });
						   
						  if(is_empty) {
							  alert('사진을 업로드해주세요'); 
						  }else{						  
							  $('#joinform').submit(); //등록해라....제발
						  }
						  			  		  
				  }
		
		
		  
	  });
		
	
	
});
 


</script>
</head>
<body>
<%@include file="../header2.jsp" %>

 <c:choose>
         <c:when test = "${empty sessionScope.sid && empty sessionScope.coachId }">
           <script>
			alert('로그인 후 이용가능 합니다!');
			location.href='index.do';
			</script>
         </c:when>
         <c:when test = "${!empty sessionScope.coachId }">
           <script>
			alert('이미 코치로 등록되어있습니다!');
			location.href='index.do';
			</script>
         </c:when>
</c:choose>


<article class="p-5">
<form action="coachJoin.do" method="post" enctype="multipart/form-data" id="joinform">
<div class="col-sm-4 col-md-offset-3">
<h3>코치정보 등록</h3>
<hr>
	<div class="form-group">
		<label>아이디</label> 
		<input type="text" class="form-control" id="coach_mem_id" name="coach_mem_id"
		value="${sessionScope.sid }" readonly="readonly">
		<div class="eheck_font"></div>
	</div>
	
	<div class="form-group">
		<label>소개글 제목</label>
		<input type="text" class="form-control" id="coach_intro_sub" name="coach_intro_sub">
		<label>소개글</label> 
		<textarea rows="10" cols="10" class="form-control" 
		id="coach_intro_cont" name="coach_intro_cont"></textarea>
		<div class="eheck_font"></div>
	</div>

	<div class="form-group">
	<label>활동지역</label> 
		<input class="form-control" style="top: 5px;" placeholder="활동지역 주소"
			name="coach_floc" id="coach_floc" type="text" readonly="readonly"/>
					<button type="button" class="btn btn-default"
						style="background-color: cornflowerblue; color: white; line-height: 1.20;"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 주소 찾기
					</button>
	</div>

	<div class="form-group">
		<input class="form-control" placeholder="상세주소"
			name="coach_sloc" id="coach_sloc" type="text" />
	</div>

	
	<div class="form-group">
	  <label for="coach_year">경력</label> 
	  <input type="number" value="1" min="0" max="100" 
	  name="coach_year" id="coach_year" />
	</div>
	
	<div class="form-group">
	  <label>강의유형</label> 
	  	<select name="coach_ex_type">
	  	<option selected="selected">대면</option>
	  	<option>비대면</option>
	  	<option>둘다</option>
	  	</select>
	</div>
	
	<div class="form-group">
	  <label for="cate_name">카테고리</label> 
	  	<div>
	    <div class="form-check form-check-inline">
		  <input class="form-check-input cate"
		   name="cate_name" type="checkbox" value="퍼스널트레이닝" checked="checked">
		  <label class="form-check-label" for="inlineCheckbox1">퍼스널트레이닝</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input cate" 
		   name="cate_name" type="checkbox" value="필라테스">
		  <label class="form-check-label" >필라테스</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input cate"  
		  name="cate_name" type="checkbox" value="다이어트">
		  <label class="form-check-label">다이어트</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input cate" 
		  name="cate_name" type="checkbox" value="요가">
		  <label class="form-check-label">요가</label>
		</div>
	</div>
</div>
	
	
	<div class="form-group">
		<label>소개 사진등록(최대 6장)</label>
		<ul id="fileUl">
			<li>올릴파일:<input type="file"  name="upload" accept="image/gif, image/jpeg, image/png"></li>
		</ul>
		<div><input type="button" value="파일추가" onclick="plus();" style="float:right;"></div>
		<div class="eheck_font" style="clear: both;"></div>
	</div>
	<script>
	//사진파일계속추가
	function plus(){
		var wrapul=document.getElementById("fileUl");	
		var newLi=document.createElement("li");
		if($('input[type=file]').length >5){
            //그리고 해당 아이템은 6개 이상 생성할수 없도록 제한
                alert("6장 이상 사진을 추가 하실 수 없습니다.");
         }else{
        	 newLi.innerHTML='올릴파일:<input type="file" name="upload" accept="image/gif, image/jpeg, image/png">';
 	  		wrapul.appendChild(newLi);
         }
	
	
	}
   </script>

	<!-- 코치 정보 입력하기 -->
	<div><input type="button" value="코치로 가입하기" class="btn btn-lg btn-primary coachJoinbtn"></div>

</div>

</form>
</article>
</body>
</html>