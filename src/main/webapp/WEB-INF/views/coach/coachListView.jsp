<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
		.topSearchWrap {
background-image: linear-gradient(to top, #006be0, #0070e1, #0074e1, #0579e1, #0f7de1);	
		text-align: center; padding: 90px 0;border-radius: 0 0 30px 30px;}
		.topSearchWrap .searchDiv {display: inline-block;}
		.topSearchWrap .searchDiv > * {float: left;}
		.topSearchWrap .searchDiv select {width: 200px; height:50px; margin-right: 10px; box-shadow: 3px 3px 5px #1f47a2;}
		.topSearchWrap .searchDiv .sbtn { box-shadow: 3px 3px 5px #1f47a2;}
		
		.result_contents_wrap {  max-width:1490px;padding: 30px; margin: 0 auto;}		
		.result_contents_wrap h3:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }	
		.result_contents_wrap h3{font-weight: 550; color:#12151d; margin-top:20px;}
		
		.result_contents_wrap .contentsWrap {flex: 1 1 auto; padding: 30px; max-width:1400px;}		
		.result_contents_wrap .contentsWrap .listWrap {overflow: hidden; margin: 0 -30px -30px 0;}
		.result_contents_wrap .contentsWrap .oneperson {float: left; width: 240px; margin: 0 30px 30px 0; border: 1px solid #dddddd;}
		.result_contents_wrap .contentsWrap .oneperson .image-container {display: flex;overflow: hidden; justify-content: center; align-items: center; width: 238px; height: 260px; background: center center no-repeat; background-size: cover !important; cursor: pointer;}
		.result_contents_wrap .contentsWrap .oneperson .image-container img {width:250px;height:270px;object-fit: cover;}
		.result_contents_wrap .contentsWrap .oneperson .desc {padding: 10px; background: white;}
		.result_contents_wrap .contentsWrap .oneperson .desc .member {margin-bottom: 8px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .greet {margin-bottom: 8px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade {overflow: hidden;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade .type {float: left; margin-right: 5px; background: #777777; color: #ffffff; border-radius: 10px; padding: 0 10px; line-height: 20px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade .star {float: left; margin-right: 5px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade img {height: 20px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade .join {float: left;}
		.likeicon{ font-size:27px;font-weight:100;position: absolute;color:white; margin: 10px 0 0 200px;}
		.likeafter{color : #FF6682; }
		
		.nomalpaging {margin: 40px 0 0; text-align: center;}
		.nomalpaging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
		.nomalpaging a:not(:first-child) {margin-left: 5px;}
				

</style>
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>

</head>
<body>
<%@include file="../header2.jsp" %>
<!-- 상단 검색바 영역  -->
<form name="fm" action="searchCoach.do">
<input type="hidden" name="sid" value="${sessionScope.sid }">
<div class="topSearchWrap">
		<div class="searchDiv">
		 	<select id="location" name="location">
		 		<option selected="selected">전체지역</option>
		 		<option>강남구</option>
		 		<option>강동구</option>
		 		<option>강북구</option>
		 		<option>강서구</option>
		 		<option>관악구</option>
		 		<option>광진구</option>
		 		<option>구로구</option>
		 		<option>금천구</option>
		 		<option>노원구</option>
		 		<option>도봉구</option>
		 		<option>동대문구</option>
		 		<option>동작구</option>
		 		<option>마포구</option>
		 		<option>서대문구</option>
		 		<option>서초구</option>
		 		<option>성동구</option>
		 		<option>성북구</option>
		 		<option>송파구</option>
		 		<option>양천구</option>
		 		<option>영등포구</option>
		 		<option>용산구</option>
		 		<option>은평구</option>
		 		<option>종로구</option>
		 		<option>중구</option>
		 		<option>중랑구</option>
		 	</select>
		 	
		 	<select id="extype" name="extype">
		 		<option selected="selected">전체</option>
				<option>대면</option>
		 		<option>비대면</option>
		 		<option>둘다</option>
		 	</select>
		 	
		 		<select id="category" name="category">
		 		<option selected="selected">모든카테고리</option>
		 		<option>퍼스널트레이닝</option>
		 		<option>필라테스</option>
		 		<option>요가</option>
		 		<option>다이어트</option>
		 	</select>
		 <button type="submit" class="btn btn-primary btn-lg sbtn">검색하기</button>
		</div>
</div>
</form>
<!-- 상단 검색바 영역  -->


<!-- 리스트 영역  -->
<div class="result_contents_wrap">
		<h3>&nbsp;나도 몸짱! 고강도 전신운동</h3>
		
  			<div class="contentsWrap">		
				<div class="listWrap">
					<c:forEach var="dto" items="${map.pt }">			
							<div class="oneperson">
							
								<c:if test="${dto.lknum ==0 }">
								<a href="#" class="ia" id="${ dto.coach_mem_id }"><i class="far fa-heart likeicon"></i></a>						
								</c:if>
								<c:if test="${dto.lknum ==1 }">
								<a href="#" class="ia toggleStyle" id="${ dto.coach_mem_id }"><i class="fas fa-heart likeicon likeafter"></i></a>						
								</c:if>
								
								<div class="image-container">
							       <a href="coachProfile.do?id=${ dto.coach_mem_id }">
							        <img src="/zipcok/upload/member/${dto.mfile_upload}" alt="">
							       </a>
							    </div>
							    <div class="desc">
							    <div class="member">
									    	<span class="category">${dto.cate_name }</span> <span>${dto.mem_name }</span> 
									    </div>
							    
							     <div class="greet">
							    <span><a href="coachProfile.do?id=${ dto.coach_mem_id }">${dto.coach_intro_sub}</a></span>
							    </div>
							    
							    <div class="grade">
							    	<span class="type">${dto.coach_ex_type }</span>
							    	<span class="star"><img src="img/coach/star.png">${dto.avg }</span>
							    	<span class="join">(${dto.starcnt }명 참여)</span>
							    </div>
							  </div>  
							</div>  
					
					</c:forEach>
					</div> 
			</div>
</div>
<div class="result_contents_wrap">	
	<h3>&nbsp;나를 위한, 힐링의 시간</h3>
 <div class="contentsWrap">
	<div class="listWrap2">
		<c:forEach var="dto2" items="${map.yoga }">
					<div class="oneperson">
					<c:if test="${dto2.lknum ==0 }">
					<a href="#" class="ia" id="${ dto.coach_mem_id }"><i class="far fa-heart likeicon"></i></a>						
					</c:if>
					<c:if test="${dto2.lknum ==1 }">
					<a href="#" class="ia toggleStyle" id="${ dto.coach_mem_id }"><i class="fas fa-heart likeicon likeafter"></i></a>						
					</c:if>
								<div class="image-container">
							       <a href="coachProfile.do?id=${ dto2.coach_mem_id }">
							        <img src="/zipcok/upload/member/${dto2.mfile_upload}" alt="">
							       </a>
							    </div>
							    <div class="desc">
							    <div class="member">
									    	<span class="category">${dto2.cate_name }</span> <span>${dto2.mem_name }</span> 
									    </div>
							    
							     <div class="greet">
							    <span><a href="coachProfile.do?id=${ dto2.coach_mem_id }">${dto2.coach_intro_sub}</a></span>
							    </div>
							    
							    <div class="grade">
							    	<span class="type">${dto2.coach_ex_type }</span>
							    	<span class="star"><img src="img/coach/star.png">${dto2.avg }</span>
							    	<span class="join">(${dto2.starcnt }명 참여)</span>
							    </div>
							  </div>  
							</div>  
		  

</c:forEach> 
		
	</div>
</div>
</div>
<!-- 리스트 영역  -->
<script type="text/javascript">
/*좋아요 토글*/
$(function(){
		
	$('.ia').on('click', function() {
	var sid="${sessionScope.sid}";	
			if(sid == null || sid == ''){ //비로그인이거나 코치일 시
				alert('회원만 가능한 서비스입니다');
			}else{ //로그인시				
				var targetid= $(this).attr('id');	
				//alert(targetid);	
			  if($(this).hasClass("toggleStyle")){ //좋아요취소시
		             $(this).removeClass("toggleStyle");
		             $(this).html('<i class="far fa-heart likeicon"></i>');
		             ajaxUnLike(sid,targetid);	     
		         }else{ //좋아요햇을시
		        	 
		             $(this).addClass("toggleStyle");
		             $(this).html('<i class="fas fa-heart likeicon likeafter"></i>');
		            
		        	ajaxLike(sid,targetid);	           
		             //좋아요하면 insert 취소하면 delete            
		             
		         }
			 
		
		
				
			}	
		
	
	});
		
});


/*ajax 좋아요*/
  function ajaxLike(login,targetid){		  
	  var params='like_mem_id='+login+"&"+'like_target_id='+targetid;	 
  	sendRequest("coachLikenum.do",params,likeplus,'GET');
  }
function likeplus(){
	  	if(XHR.readyState==4){
	  			if(XHR.status==200){
	  				var data=XHR.responseText;
	  				data=eval('('+data+')');
	  			    alert("좋아요 목록에 추가되었습니다");		
	  			}
	  	}
}

function ajaxUnLike(login,targetid){		  
	  var params='like_mem_id='+login+"&"+'like_target_id='+targetid;	 
	sendRequest("coachUnLike.do",params,likeminus,'GET');
}
function likeminus(){
	  	if(XHR.readyState==4){
	  			if(XHR.status==200){
	  				var data=XHR.responseText;
	  				data=eval('('+data+')');
	  			    alert("좋아요가 취소되었습니다");		
	  			}
	  	}
}
</script>

</body>
</html>