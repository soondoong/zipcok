<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.topSearchWrap {background: #006be0; text-align: center; padding: 90px 0; border-radius: 0 0 30px 30px;}
		.topSearchWrap .searchDiv {display: inline-block;}
		.topSearchWrap .searchDiv > * {float: left;}
		.topSearchWrap .searchDiv select {width: 200px; height:50px;  margin-right: 10px;}
		
						
		.result_contents_wrap {  max-width:1490px;display: flex; padding: 30px; margin: 0 auto;}		
		.result_contents_wrap .leftWall {flex: 0 0 300px;}
		.result_contents_wrap .leftFilterDIV { padding: 20px;}
		.result_contents_wrap .contentsWrap {flex: 1 1 auto; padding: 30px; max-width:1150px;}		
		.result_contents_wrap .hgroup {margin-bottom: 40px;}
		.result_contents_wrap .hgroup .h5search {margin-top: 15px; font-size: 16px;}		
		.result_contents_wrap .contentsWrap .secondWrap {overflow: hidden; margin: 0 -30px -30px 0;}
		.result_contents_wrap .contentsWrap .oneperson {float: left; width: 240px; margin: 0 30px 30px 0; border: 1px solid #dddddd;}
		.result_contents_wrap .contentsWrap .oneperson .image-container {display: flex;overflow: hidden; justify-content: center; align-items: center; width: 238px; height: 260px; background: center center no-repeat; background-size: cover !important; cursor: pointer;}
		.result_contents_wrap .contentsWrap .oneperson .image-container img {width:250px;height:270px;object-fit: cover;}
		.result_contents_wrap .contentsWrap .oneperson .desc {padding: 10px; background: white;}
		.result_contents_wrap .contentsWrap .oneperson .desc .member {margin-bottom: 8px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .greet {margin-bottom: 8px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade {overflow: hidden;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade .type {float: left; margin-right: 5px; background: #777777; color: #ffffff; border-radius: 10px; padding: 0 10px; line-height: 20px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade .star {float: left; margin-right: 5px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade .star img {height: 20px;}
		.result_contents_wrap .contentsWrap .oneperson .desc .grade .join {float: left;}
		
		.nomalpaging {margin: 40px 0 0; text-align: center;}
		.nomalpaging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
		.nomalpaging a:not(:first-child) {margin-left: 5px;}
				
</style>
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
</head>
<body>
<%@include file="../header2.jsp" %>

<!-- 상단 검색바 영역  -->
<form name="fm" action="searchCoach.do">
	<div class="topSearchWrap">
		<div class="searchDiv">
		 	<select id="location" name="location">
		 		<option <c:if test="${keyword.location=='전체지역'}">selected="selected"</c:if>>전체지역</option>
		 		<option <c:if test="${keyword.location=='강서구'}">selected="selected"</c:if>>강서구</option>
		 		<option <c:if test="${keyword.location=='마포구'}">selected="selected"</c:if>>마포구</option>
		 		<option <c:if test="${keyword.location=='서대문구'}">selected="selected"</c:if>>서대문구</option>
		 	</select>
		 	
		 	<select id="extype" name="extype">
		 		<option <c:if test="${keyword.extype=='전체'}">selected="selected"</c:if>>전체</option>
		 		<option <c:if test="${keyword.extype=='대면'}">selected="selected"</c:if>>대면</option>
		 		<option <c:if test="${keyword.extype=='비대면'}">selected="selected"</c:if>>비대면</option>
		 		<option <c:if test="${keyword.extype=='둘다'}">selected="selected"</c:if>>둘다</option>
		 	</select>
		 	
		 	<select id="category" name="category">
		 		<option <c:if test="${keyword.category=='모든카테고리'}">selected="selected"</c:if>>모든카테고리</option>
		 		<option <c:if test="${keyword.category=='퍼스널트레이닝'}">selected="selected"</c:if>>퍼스널트레이닝</option>
		 		<option <c:if test="${keyword.category=='필라테스'}">selected="selected"</c:if>>필라테스</option>
		 		<option <c:if test="${keyword.category=='요가'}">selected="selected"</c:if>>요가</option>
		 		<option <c:if test="${keyword.category=='다이어트'}">selected="selected"</c:if>>다이어트</option>
		 	</select>
		 	
		 			 <button type="submit" class="btn btn-primary btn-lg">검색하기</button>
		</div>
	</div>
</form>
<!-- 상단 검색바 영역  -->

<div class="result_contents_wrap">
<!-- 좌측검색필터  -->

	<div class="leftWall">
		<div class="card leftFilterDIV">
		<h4>검색필터</h4><br>
			<hr>
			<div class="m-3 gender"> 
			<p class="fp">성별</p>
			<button type="button" class="btn btn-outline-primary sexBtn sexBtn1">남자</button>
		    <button type="button" class="btn btn-outline-primary sexBtn sexBtn2" >여자</button>
			</div>
				<hr>
			<div class="m-3"> 
			<p class="fp">경력</p>
			<label>0 ~ </label><label id="yearVal">3</label>년 이상
			<br>
			 <input type="range" min="1" max="5" id="yearRange" onmouseup ="yearValue(this);" onchange="showList()">
			</div>
		</div>	
		
	</div>
	
	<!-- 좌측검색필터  -->
	<!-- 리스트 영역  -->
	
	<div class="contentsWrap">
		<div class="hgroup">
			<h3>검색된 리스트</h3>
			<h5 class="h5search">${keyword.location}&nbsp;&gt;&nbsp;${keyword.extype }&nbsp;&gt;&nbsp;${keyword.category }</h5>
		</div>
		
		<div class="secondWrap">
			<c:forEach var="dto" items="${list}">
		
			<div class="oneperson">
				<div class="image-container">
				<a href="coachProfile.do?id=${dto.coach_mem_id}">
				<img src="/zipcok/upload/member/${dto.mfile_upload}" alt="">
				</a>
				</div>
				<div class="desc">
				    <div class="member">
				    	<span class="category">${dto.cate_name }</span> <span>${dto.mem_name }</span> 
				    </div>
				    <div class="greet">
				    	<span><a href="coachProfile.do?id=${dto.coach_mem_id}">${dto.coach_intro_sub}</a></span>
				    </div>
				    <div class="grade">
				    	<span class="type">${dto.coach_ex_type }</span>
				    	<span class="star"><img src="img/coach/star.png" alt="">${dto.avg}</span>
				    	<span class="join">(${dto.starcnt }명 참여)</span>
				    </div>
			    </div>
			</div>  <!-- oneperson -->
				
			</c:forEach>
		</div><!-- secondWrap -->	
		
		<div class="nomalpaging">
			${pageStr}
		</div>			
		
		
		<!-- ajax검색된 리스트영역 -->
		<div class="ajaxDIV">    
	    </div>
		<!-- ajax검색된 리스트영역 -->
		
	</div><!-- contentsWrap -->
</div><!-- class : result_contents_wrap -->

<script>


	/*버튼 클릭하면 active됨*/
	$('.sexBtn').click(function(){
	
	  if( $(this).hasClass('active') ){
	  	$(this).removeClass('active');
	  }else{
	  	 $(this).addClass('active');
	  }
	  showList();
	});


	/*별점 드래그한대로 숫자들어감*/
	function yearValue(t){
	var yearVal=document.getElementById("yearVal");
	yearVal.innerText = t.value;
	}


	
	  /*필터검색에따라 ajax통신*/
	  function showList(str){
		  
		  /*cp정의*/
		  var cp=str;
		  if(str==null || str == ''){
			  cp=1;
		  }
		  
		/*성별값 정의*/
		var gender;
		if(  $('.sexBtn1').hasClass('active') && !$('.sexBtn2').hasClass('active') ){ //남자만 클릭되어잇다면
			 gender='남';
		}else if(  $('.sexBtn2').hasClass('active') && !$('.sexBtn1').hasClass('active')){ //여자만 클릭되어잇다면
			 gender='여';
		}else{
			 gender='전체';
		}
		
		 /*경력값 정의*/
		 var yearVal=document.getElementById("yearRange").value; 
		 	
		 var keywords='location='+'${keyword.location}'+'&'+'extype='+'${keyword.extype}'+'&'+'category='+'${keyword.category}';
		  var params='gender='+gender+"&"+'yearVal='+yearVal+"&"+'cp='+cp+"&"+keywords; //보낼파라미터
		 // alert(params);
	  	sendRequest("searchAjax.do",params,shwR,'GET');
	  }

	  
	  function shwR(){
	  	if(XHR.readyState==4){
	  			if(XHR.status==200){
	  				var data=XHR.responseText;
	  				data=eval('('+data+')');
	  				var cList=data.listAjax;
	  				var str='총 코치수'+cList.length+'명\n';
	  				//alert(str);
	  				$('.secondWrap').css('display','none');
	  				$('.ajaxDIV').html('');
	  		 	for(var i=0;i<cList.length;i++){
	  		 	
	  					var dto=cList[i];
	$('.ajaxDIV').append('<div class="oneperson"><div class="image-container"><img src="/zipcok/upload/member/'+dto.mfile_upload+'"></div>'+	  					
								'<div><span class="category">'+dto.cate_name+'</span>&nbsp; <span>'+dto.mem_name+'</span></div>'+
									'<div><span><a href="coachProfile.do?id='+dto.coach_mem_id+'">'+dto.coach_intro_sub+'</a></span></div>'+
										' <div><span class="extype">'+dto.coach_ex_type+'</span>&nbsp; <span><img src="img/coach/star.png" class="starIMG">'+dto.avg+'</span>'+
										'&nbsp; <span>('+dto.starcnt+'명 참여)</span></div></div>');						    

	$('.ajaxDIV').css('display','block');
	  					
	  				}
	  		 	
	  		 	/*페이징추가*/
	  			var cpage=data.pageStrAjax;
	  			$('.ajaxDIV').append('<div class="paging">'+cpage+'</div>');
	  		}
	  	}
	  	
	  	
	  }

	  
	  /*ajax로검색된 div내의 페이지를 클릭하면 호출되는 함수*/
	  function pageclick(temp){  //temp는 cp값
	
		  showList(temp);
	  } 
</script>


<!-- 리스트 영역  -->

<%@include file="../_include/footer.jsp" %>

