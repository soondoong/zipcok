<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.topSearchWrap {background: #006be0; text-align: center; padding: 90px 0;border-radius: 0 0 30px 30px;}
		.topSearchWrap .searchDiv {display: inline-block;}
		.topSearchWrap .searchDiv > * {float: left;}
		.topSearchWrap .searchDiv select {width: 200px; height:50px; margin-right: 10px;}
		
		.result_contents_wrap {  max-width:1490px;padding: 30px; margin: 0 auto;}		
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
		.likeicon{ font-size:27px;font-weight:100;position:relative; top:10px; left:-68px; color: white;z-index: 100;display: inline-block;}
		.likeafter{color : #e86a82; }
		
		.nomalpaging {margin: 40px 0 0; text-align: center;}
		.nomalpaging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
		.nomalpaging a:not(:first-child) {margin-left: 5px;}
				

</style>
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<script>
function search(){
	
	var location=document.getElementById("location").value;
	var extype=document.getElementById("extype").value;
	var category=document.getElementById("category").value;
	var params="location="+location+"extype="+extype+"category="+category;
	sendRequest('searchCoachAjax.do',params,showResult,'GET');
	
}
</script>
</head>
<body>
<%@include file="../header2.jsp" %>
<!-- 상단 검색바 영역  -->
<form name="fm" action="searchCoach.do">
<div class="topSearchWrap">
		<div class="searchDiv">
		 	<select id="location" name="location">
		 		<option selected="selected">전체지역</option>
		 		<option>강서구</option>
		 		<option>마포구</option>
		 		<option>서대문구</option>
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
		 <button type="submit" class="btn btn-primary btn-lg">검색하기</button>
		</div>
</div>
</form>
<!-- 상단 검색바 영역  -->


<!-- 리스트 영역  -->
<div class="result_contents_wrap">
		<h3>나도 몸짱! 고강도 전신운동</h3>
  			<div class="contentsWrap">		
				<div class="listWrap">
					<c:forEach var="dto" items="${map.pt }">
					<a href="#" class="ia" id="${ dto.coach_mem_id }"><i class="far fa-heart likeicon"></i></a>				
							<div class="oneperson">
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
	<h3>나를 위한, 힐링의 시간</h3>
 <div class="contentsWrap">
	<div class="listWrap2">
		<c:forEach var="dto2" items="${map.yoga }">
<div class="oneperson">
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
	var login="${login.mem_id}";	
	if(login == null || login == ''){ //비로그인시
		alert('로그인한 회원만 가능한 서비스입니다');
	}else{ //로그인시
		
		var targetid= $(this).attr('id');	
		alert(targetid);	
	  if($(this).hasClass("toggleStyle")){ //좋아요취소시
             $(this).removeClass("toggleStyle");
             $(this).html('<i class="far fa-heart likeicon"></i>');
             
         }else{ //좋아요햇을시
        	 
             $(this).addClass("toggleStyle");
             $(this).html('<i class="fas fa-heart likeicon likeafter"></i>');
             
             
             /*ajax*/
 			$.ajax({
 				url: "/coachLikenum.do",
               type: "GET",
               data: {
                   like_mem_id: '${login.mem_id}',
                   like_target_id: targetid
               },
               success: function () {
 			        alert(targetid+"님께 좋아요를 보내셨습니다!");
               },
 			})
             
             //좋아요하면 insert 취소하면 delete            
             
         }
		
		
	}	
		
	
	});
		
});

		 
</script>
</body>
</html>