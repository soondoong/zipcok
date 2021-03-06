<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.showdiv{
position:relative; 
width:400px;
height:450px;
z-index:100;
background-color:white;
}

.closeDiv{
position: relative;
width:30px;
margin:0;
padding:0;
top:-23px;
left:340px;
}
textarea{
height:100px;
}
</style> 


			<form name="requestForm" id="requestForm" action="sendRequestForm.do"  method = "get" >
			<div id="showDiv" class="showdiv card" > 
				<div class="card-body">
				<input type="hidden" name="req_mem_id" value="${sessionScope.sid }">
				<input type="hidden" name="req_receive_id" value="${dto.coach_mem_id }">
				<input type="hidden" name="req_type" value="${dto.coach_ex_type }">
		
	            <div class="closeDiv" >
	            	<a href="javascript:close();" style="font-size:2.4rem;" >&times;</a>
	            </div>
	            <h3 style="position:relative; top:-30px; margin-top:0;text-align: center;">상담요청서 작성</h3>
			
		         <div >
		            <label>희망 카테고리를 선택해주세요</label>
		            
		            <div style="display: flex;" id="radioDIV"> 
		        
				            <div class="form-check">
							  <input class="form-check-input" type="radio" name="req_category" id="cate1" value="" checked>
							  <label class="form-check-label" id="cate1label" for="cate1">						  
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="req_category" id="cate2" value="" >
							  <label class="form-check-label" id="cate2label" for="cate2">
							  </label>
							</div>
					
					</div>
		        </div>
	           
	            <div>
	            <label>희망 시작일을 선택해주세요</label>
	          	 <input type="date" name="req_start_date" id="startDate" min="">
	            </div>
	            
	            <div>
	           <label>문의 내용을 간단히 적어주세요(최대 60자)</label>
	           	<textarea rows="5" cols="50" id="requestText" 
	           	onkeyup="lengthLimit();" name="req_cont" required="required"></textarea>
	            </div>
	            
	             <div >
	            	<input type="submit" class="btn btn-primary" style="width:100%;" value="요청서 전송하기">
	             </div>
			  	</div>	 			
		    </div>
	        </form>    
<script>

/*요청서 카테고리띄우기*/
$(document).ready(function(){
	 
	var c='${dto.cate_name}' ;

	var array = c.split("/");
	if(array.length>1){
		$("#cate1").val(array[0]);
		$("#cate1label").text(array[0]);
		$("#cate2").val(array[1]);
		$("#cate2label").text(array[1]);
	}else{
		$("#radioDIV").html("<div class='form-check'>"+
		"<input class='form-check-input' type='radio' name='req_category' id='cate1' value='"+c+"' checked>"+
		  "<label class='form-check-label' id='cate1label' for='cate1'>	"+c+		  
		  "</label></div>");
	}
 

});
</script>	        