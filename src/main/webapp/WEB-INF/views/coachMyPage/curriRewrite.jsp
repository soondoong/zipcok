<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../_include/head.jsp" %>
<link href="assets/css/mypage.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<script>
	$(function(){
		$('.currimore').on('click',function(){
			var ww = document.getElementById($(this).attr('id')+"1");
				if($(ww).hasClass('toggle')){
					ww.style.display='none';
					$(ww).removeClass('toggle');
				}else{
					$(ww).addClass('toggle');
					ww.style.display='block';			
				}			
						
				var input1= $(this).attr('id')+"11";
				var textarea1= $(this).attr('id')+"12";
				var input2=$(this).attr('id')+"21";
				var textarea2= $(this).attr('id')+"22";
				var input3= $(this).attr('id')+"31";
				var textarea3= $(this).attr('id')+"32";
					
								
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
		
});
	
	
	</script>	
<body>
<c:set var="dto" value="${resultMap.coachDTO }"/>
<c:set var="file" value="${resultMap.coachFileList }"/>
<c:set var="curri" value="${resultMap.curriList }"/>
<c:set var="review" value="${resultMap.reviewList }"/>
<c:set var="oneList" value="${oneCurriList}"/>
<c:set var="twoList" value="${twoCurriList }"/>	
<c:set var="mdto" value="${mdto }"></c:set>
<c:set var="catelist" value="${catelist }"/>
	<style>
	.ptitle{font-size:20px; font-weight: 550;margin:0 0 10px 0; display: inline-block;}
	.coachdetails{margin:60px 0 0 30px;}
	.rebtn{width:50px; margin:4px 0 0 10px; height:40px; font-size: 12px; border: 0px; border-radius: 5px; background-color: #e4e4e4;}
	.crebtn{margin: 4px 0 0 30px;}
	.okbtn{width: 100px; height: 30px; font-weight:bold; font-size:15px; color:white;background-color:#257cd6;}
	.currititle{font-size:18px; font-weight: 400; display: inline-block; }
	.plusbtn,.minusbtn{font-size:22px; color: #257cd6; margin:5px 0 0 5px; cursor: pointer;}
	.plusbtn span{font-size:15px;  }

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
						
					
			<!-- 커리큘럼영역 -->
	
	
					<p class="ptitle"><span>커리큘럼</span></p>		
					
					<!-- 등록된커리큘럼이 없는경우 -->		
					<c:if test="${empty curri}">
	<form id="nodataform" action="nodataCurriInsert.do">					
	<div class="allcurriWrap">		  
			<c:forEach var="c" items="${catelist }">
			<div class="plzWrap">			
				<div class="nocurriWrap">
						<div class="catenameDiv">
							<p class="catename">${c.cate_name }</p>
						</div>
						<div class="currimore"  id="${c.cate_name }">							
							<span class="curriP">커리큘럼 추가하기</span>
							<i class="fas fa-plus-square plusbtn"></i>
						</div>
				</div>	
					<div  class="showinputs" id="${c.cate_name }1">
						<ol>
							<li>
								<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
								<input type="hidden" name="curri_order" value="1">
								<input type="text" name="curri_name" id="${c.cate_name }11" placeholder="운동제목"><br>
								<textarea name="curri_content"  id="${c.cate_name }12" placeholder="간단한 설명을 적어주세요(최대100자)"></textarea>
							
							<li>
								<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
								<input type="hidden" name="curri_order" value="2">	
								<input type="text" name="curri_name" id="${c.cate_name }21" placeholder="운동제목"><br>
								<textarea name="curri_content"  id="${c.cate_name }22"placeholder="간단한 설명을 적어주세요(최대100자)"></textarea>
						    </li>	
						    <li>	
						    	<input type="hidden" name="curri_mem_id" value="${login.mem_id }">
								<input type="hidden" name="curri_order" value="3">
						    	<input type="text" name="curri_name" id="${c.cate_name }31" placeholder="운동제목"><br>
								<textarea name="curri_content"  id="${c.cate_name }32" placeholder="간단한 설명을 적어주세요(최대100자)"></textarea>
							</li>	
						</ol>					
				 </div>
			</div>							
			</c:forEach>	
		</div><!-- allcurriWrap -->															
						<div class="lastDIV">
							<input type="submit" value="수정완료" class="rebtn crebtn okbtn nodataOKbtn">
						</div>
				</form>		
					</c:if>			
					 <!-- 등록된커리큘럼이 없는경우 -->					 
				 
					 
					 
					 
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
			
		
	
							
</body>
</html>