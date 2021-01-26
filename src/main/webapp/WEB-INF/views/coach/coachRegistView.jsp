<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header2.jsp" %>
<article class="p-5">
<form action="coachJoin.do" method="post" enctype="multipart/form-data">
<div class="col-sm-3 col-md-offset-3">
<h3>코치정보 등록</h3>
<hr>
	<div class="form-group">
		<label>아이디</label> 
		<input type="text" class="form-control" id="coach_mem_id" name="coach_mem_id">
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
			name="coach_floc" id="coach_floc" type="text" />
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
	  	<option>모든유형</option>
	  	</select>
	</div>
	
	<div class="form-group">
	  <label for="cate_name">카테고리</label> 
	  <select name="cate_name">
	  	<option  selected="selected">퍼스널트레이닝</option>
	  	<option>필라테스</option>
	  	<option>요가</option>
	  	<option>다이어트</option>
	  	</select>
	</div>
	
	<div class="form-group">
		<label>사진등록</label>
		<ul id="fileUl">
			<li>올릴파일:<input type="file"  name="upload"></li>
		</ul>
		<div><input type="button" value="파일추가" onclick="plus();"></div>
		<div class="eheck_font"></div>
	</div>
	<script>
	//사진파일계속추가
	function plus(){
		var wrapul=document.getElementById("fileUl");	
		var newLi=document.createElement("li");
		newLi.innerHTML='올릴파일:<input type="file" name="upload">';
		wrapul.appendChild(newLi);
		
	}
   </script>

	<!-- 코치 정보 입력하기 -->
	<div><input type="submit" value="코치로 가입하기" class="btn btn-lg btn-primary"></div>

</div>

</form>
</article>
</body>
</html>