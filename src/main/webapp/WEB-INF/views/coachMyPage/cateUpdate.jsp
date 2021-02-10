<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../_include/head.jsp" %>
<link href="assets/css/mypage.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<style>
	.ptitle{font-size:25px; font-weight: 550;margin:0 0 10px 0; display: inline-block;}
	.rebtn{width:50px; margin:4px 0 0 10px; height:20px; font-size: 12px; border: 0px; border-radius: 5px; background-color: #e4e4e4;}
	.crebtn{margin: 4px 0 0 30px;}
	.okbtn{width: 100px; height: 30px; font-weight:bold; font-size:15px; color:white;background-color:#257cd6;}
	.plusbtn,.minusbtn{font-size:20px; color: #257cd6; margin:0 0 0 10px; cursor: pointer;}
	.plusbtn span{font-size:15px;  }
	.lastDIV{position: absolute; width:100px;left:35%; bottom: 30px;}
	.cate_wrap{width:500px; padding: 30px 0 0 50px;}
	.catecbx{margin-top: 30px;}
	.cate_label{ font-size: 16px;}
	
	</style>	
<body>
<c:set var="list" value="${catelist }"/>
<form id="cateform" action="categoryUpdateOK.do">
<input type="hidden" name="mem_id" value="${login.mem_id }"> 
<div class="cate_wrap">
	<div style="margin-top:30px;">	 
		<p class="ptitle">카테고리</p>
			
				 
				  <div class="catecbx">
					    <div class="form-check form-check-inline ">
							  <input class="form-check-input cate"
							   name="cate_name" type="checkbox" value="퍼스널트레이닝">
							  <label class="form-check-label cate_label" for="inlineCheckbox1">퍼스널트레이닝</label>
						</div>
						<div class="form-check form-check-inline">
							  <input class="form-check-input cate" 
							   name="cate_name" type="checkbox" value="필라테스">
							  <label class="form-check-label cate_label" >필라테스</label>
						</div>
						<div class="form-check form-check-inline">
							  <input class="form-check-input cate"  
							  name="cate_name" type="checkbox" value="다이어트">
							  <label class="form-check-label cate_label">다이어트</label>
						</div>
						<div class="form-check form-check-inline">
							  <input class="form-check-input cate" 
							  name="cate_name" type="checkbox" value="요가">
							  <label class="form-check-label cate_label">요가</label>
						</div>
				</div>
			
	</div>
	
					<div class="lastDIV">
						<input type="submit" value="수정완료" class="rebtn crebtn okbtn"  onclick="">
					</div>
</div>
</form>
<script>
/*현재 카테고리 미리체크해두기*/
$(function(){ 
		var cate1 = '${list[0].cate_name}';
		var cate2 = '${list[1].cate_name}';
		 $('input:checkbox[name="cate_name"]').each(function() {
				if($(this).val()==cate1 || $(this).val()==cate2){
						this.checked = true;		
			 	 }
		});
	 
	 /*체크박스 두개만 가능하게하기*/
		  $('.cate').click(function(){
		  if($(".cate:checked").length >2){  alert('최대 두 가지 선택가능합니다.'); $(this).prop('checked', false); }
		  });	

		//가입버튼눌럿을때 제한조건
		$('#cateform').submit(function(){
			
			//카테고리 하나라도 선택하지않으면		
			  if($(".cate:checked").length <1){  
				  alert('카테고리를 선택해주세요.'); 
					return false;			
			  }else{
				  var result = confirm('기존 카테고리와 연관된 데이터가 모두 수정됩니다. 수정하시겠습니까?');
				  if(result){
					  return true;
				  }else{
					  return false;
				  }
			  }
			  
		  });
			 
	 
});


	

</script>

</body>
</html>