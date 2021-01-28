<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/httpRequest.js"></script>
<style>
html, body {
    margin: 0;
    width: 100%;
    height: 100%;
}

.blueBackground{
background-color:   #3978df;
width:100%;
height: 190px;
}
.section1{
position: relative;
}
.searchDiv{
 position: relative;
 top: 40%;
text-align:center;
line-height: 1;
}
.contentsWrap{
position: relative;
width:80%;
margin-top:40px;
margin:0 auto;
float:left;
}
.secondWrap{
position: relative;
margin:0 auto;
}
.listWrap::after{
content:"";
display: block;
clear: both;
}
.oneperson{
margin:0 20px 0 20px;
float:left;
}

.image-container img{
width:250px;
height:270px;
object-fit: cover;

}
.image-container{
   overflow: hidden;
   display: flex;
   align-items: center;
   justify-content: center;
   width: 230px;
   height:270px;
   margin-bottom:15px;
}
.extype{
text-align:center;
display:inline-block;
width:50px;
background-color: gray;
color:white;
border-radius: 20%;
font-size: 0.8rem;
}
.category{
font-size: 0.8rem;
}
.h5search{
margin-bottom: 30px;
}
.paging,.nomalpaging{
position:relative;
width:100px;
margin:0 auto;
}

.paging a,.nomalpaging a{
font-size:1.6rem;
padding-right:20px;
}
.gender{
position: relative;
z-index:30;
}

.leftFilterDIV{
	margin: 0 60px 0 0;
    padding: 30px;
    width:270px;
    height:500px;
    position:relative;
    float: left;
    top:30px;
    left:30px;
}
.leftWall{
    width:20%;
    height: 100%;
    position:relative;
    float: left;
    top:0px;
    left:0px;
    background-color: white;
}

.fp{
	font-family: "nanumsquare-b";
    font-size: 18px;
    font-weight:bold;
    line-height: 16px;
    color: #444444;
}
#starRange{
position: relative;
z-index:30;
}
.starIMG{
 width:29px;
padding:0 8px 0 4px;
 }
.ajaxDIV{     /*ajax 사용시 보이게함*/
display:none;
}
</style>



</head>
<body>
<%@include file="../header2.jsp" %>
<!-- 상단 검색바 영역  -->
<form name="fm" action="searchCoach.do">
<div class="topSearchWrap">
	<div class="blueBackground">

	
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
		 	
		 	<input type="submit" value="검색하기">
		</div>
	</div>
</div>
</form>
<!-- 상단 검색바 영역  -->

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

<div class="contentsWrap">

		<h3 class=" mt-5">검색된 리스트</h3>
		<h5 class="h5search">${keyword.location}&nbsp;&gt;&nbsp;${keyword.extype }&nbsp;&gt;&nbsp;${keyword.category }</h5>
	
<div class="secondWrap">
	<c:forEach var="dto" items="${list}">

	<div class="oneperson">
		
			<div class="image-container">
		        <img src="/zipcok/upload/member/${dto.mfile_upload}" alt="">		  
		    </div>
		    
		    <div>
		    <span class="category">${dto.cate_name }</span>&nbsp; <span>${dto.mem_name }</span> 
		    </div>
		    
		     <div>
		    <span><a href="coachProfile.do?id=${dto.coach_mem_id}">${dto.coach_intro_sub}</a></span>
		    </div>
		    
		    <div>
		    	<span class="extype">${dto.coach_ex_type }</span>&nbsp; <span>
		    	<img src="img/coach/star.png" class="starIMG">${dto.avg }</span>&nbsp; <span>(${dto.starcnt }명 참여)</span>
		    </div>
	</div>  <!-- oneperson -->
		
	</c:forEach>
		
				<div class="nomalpaging">
				${pageStr}
				</div>
				
				
	</div><!-- secondWrap -->			


<!-- ajax검색된 리스트영역 -->
	<div class="ajaxDIV">    
    </div>
<!-- ajax검색된 리스트영역 -->

</div><!-- contentsWrap -->



<!-- 리스트 영역  -->


</body>
</html>