<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">

<style type="text/css">
.test_inline{
	display: inline-flex;
}
</style>
<script>
/* selectBox onchange 될 때 플레이스홀더 값 변경하는 함수*/
function placeholder(){
	var selectOptionC = document.getElementById('selectOptionC').value;
	if(selectOptionC!='전체'){
		var searchTextPlaceholder = document.getElementById('searchTextPlaceholder');
		searchTextPlaceholder.removeAttribute('placeholder');
	}else if(selectOptionC=='전체'){
		var searchTextPlaceholder = document.getElementById('searchTextPlaceholder');
		searchTextPlaceholder.setAttribute('placeholder','id 입력');
	}
	
}
</script>
</head>
<body>
<%@include file="../../header2.jsp" %>
<style>
.table { border-spacing: ''; table-layout: auto; text-align: center; margin-bottom:70px;} 
.table th{font-weight: bold; border-color:#848282;}
a{cursor:pointer;}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}

.cmtablea,.cmtablea:link{color:blue;}
</style>
	<div class="adminPage_wrap">
		<%@include file="../adminSideBar.jsp"%>
		<div class="container adminPage_contents">
			<div class="adminPage_main">
				<div>
				<h3>코치관리</h3>
				</div>
				<div>
					<form action="admin_coachMatchAdminSearch.do">
					<ul class="test_inline">
						<li class="srchtitle">검색 조건</li>
						<li>
							<select id="selectOptionC" onchange="javascript:placeholder();" name="choice">
								<option <c:if test="${selectoption=='전체'}">selected="selected"</c:if> >전체</option>
								<option <c:if test="${selectoption=='번호'}">selected="selected"</c:if> >번호</option>
								<option <c:if test="${selectoption=='id'}">selected="selected"</c:if> >id</option>
								<option <c:if test="${selectoption=='이름'}">selected="selected"</c:if> >이름</option>
							</select>
						</li>

						<li class="coach_li_radio"><input type="radio" name="mem_gender" value="남" class="coach_radiobtn">남자 <input type="radio" name="mem_gender" class="coach_radiobtn" value="여">여자</li>
						<li><input type="text" id="searchTextPlaceholder" name="searchText" placeholder="아이디 입력"></li>
						<li><input type="submit"  value="검색"   id="searchbtn" class="btn btn-primary" ></li>

					</ul>
					</form>
				</div>
				<div><!--  테이블 div -->
					<table class="table table-hover ">
						<thead>
							<tr>
								<th>회원번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>휴대폰번호</th>
								<th>이메일</th>
								<th>생년월일</th>
								<th>가입일</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="dto" items="${List}">
							<tr>
								<td>${dto.mem_idx}</td>
								<td>${dto.mem_name}</td>
							
								<td>
								<a class="cmtablea" href="javascript:show('${dto.mem_id}')">${dto.mem_id}</a>
								<input type = "hidden" id="coachId" name="coachidText" value = "${dto.mem_id }">
								</td>
								<td>${dto.mem_phone}</td>
								<td>${dto.mem_email }</td>
								<td>${dto.mem_birth }</td>
								<td>${dto.mem_joindate}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty List}">
							<tr>
								<td colspan="7" align="center">등록된 코치가 없습니다</td>
							</tr>
						</c:if>
						</tbody>
						<c:if test="${!empty List}">
						<tfoot>
							<tr>
								<td colspan="7" align="center" class="paging">${pageStr }</td>
							</tr>
						</tfoot>
						</c:if>
					</table>
				</div>

				<h3>코치정보</h3>	

				
					<div id="contentLayer"><!-- 코치의 세부정보 부분 div -->
						<form id="coachUpdateForm">
							<table  class="coach_adminTable">
								<tr>					
									<td>
										이름<input type="text"  id="coachNameLi" readonly="readonly">
									</td>
									<td>
										회원가입일<input type="text" id="coach_joindatetext" readonly="readonly">
									</td>
								</tr>
								<tr>
									<td>
										활동지역<input type="text" id="coach_floctext" readonly="readonly">
										<p id="flocUpdateP" class="flocUpdatePClass"></p>
									</td>
									<td >
										코치전환일<input type="text" id="coach_changetext" readonly="readonly">
										<p id="coachChangeP" class="coachChangePClass"></p>
									</td>
								</tr>
							
								<tr>
									<td colspan="2">
											<label  class="coach_subtitle">소개글</label >
											<input type="text" id="coach_intro_subtext" class="coach_intro_subtextClass" name="coach_intro_sub" readonly="readonly">
											<input type="text" id="coach_intro_conttext" style="height: 150px " class="coach_intro_conttextClass" name="coach_intro_cont" readonly="readonly">
											<p id="introUpdateP" class="introUpdatePClass"></p>
									</td>
								</tr>
								<tr>
									<td >
										카테고리<input type="text" id="coach_category" readonly="readonly">
										<p id="categoryP"></p>
									</td>
									<td >
										준비물<input type="text" id="coach_mattext" readonly="readonly">
										<p id="matUpdateP" class="matUpdatePClass"></p>
									</td>
								</tr>
								
								<tr>
									<td>
										수업유형<input type="text" id="coach_ex_typetext" readonly="readonly">
										<p id="extypeUpdateP" class="extypeUpdatePClass"></p>
									</td>
									<td >
										경력<input type="number" min="0" max="100" id="coach_yeartext" readonly="readonly">
										<p id="yearUpdateP" class="yearUpdatePClass"></p>
									</td>
								</tr>
								<tr>
									<td  colspan="2">
										<label  class="coach_subtitle">코치 소개 사진</label >
										<ul class="test_inline">
											<li><input type="button" value="수정하기"></li>
											<li><input type="button" value="사진추가"></li>
										</ul>
									</td>
								</tr>
							</table>
						</form>
					</div>
				









				
			</div>
		</div>
	</div>
	<!-- 제이슨 부분 -->
<script src="js/httpRequest.js"></script>
<script>
function show(id){
   var params='coach_mem_id='+id;
   sendRequest('adminCoachProfile.do',params,showResult,'GET');
}
function showResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;
         data=eval('('+data+')');
         var coachProfileDiv=document.getElementById('contentLayer');
         coachProfileDiv.style.display='';
         document.getElementById('coach_joindatetext').value=data.dto2.joindate;
         document.getElementById('coach_changetext').value=data.dto2.change;
         document.getElementById('coach_floctext').value=data.coachdto.coach_floc;
         document.getElementById('coach_intro_subtext').value=data.coachdto.coach_intro_sub;
         document.getElementById('coach_intro_conttext').value=data.coachdto.coach_intro_cont;
         document.getElementById('coach_mattext').value=data.coachdto.coach_mat;
         document.getElementById('coach_ex_typetext').value=data.coachdto.coach_ex_type;
         document.getElementById('coach_yeartext').value=data.coachdto.coach_year;
         document.getElementById('coachNameLi').value=data.dto3.mem_name;
         document.getElementById('introUpdateP').innerHTML="<input type='button' value='소개글 수정' name='introReset' onclick='javascript:introUpdateGo();'>";
         document.getElementById('matUpdateP').innerHTML="<input type='button' value='준비물 수정' name='matReset' onclick='javascript:matUpdateGo();'>";
         document.getElementById('extypeUpdateP').innerHTML="<input type='button' value='강의유형 수정' name='extypeReset' onclick='javascript:extypeUpdateGo();'>";
         document.getElementById('yearUpdateP').innerHTML="<input type='button' value='경력 수정' name='yearReset' onclick='javascript:yearUpdateGo();'>";
         document.getElementById('flocUpdateP').innerHTML="<input type='button' value='활동지역 수정' name='flocReset' onclick='javascript:flocUpdateGo();'>";
       /*수연추가카테고리*/
       	$('#coach_category').val(data.coachmap.coachDTO.cate_name);
       	$('#categoryP').html("<input type='button' value='카테고리 수정'  onclick=\"cateUpdatePopup('"+data.dto3.mem_id+"')\">");
         
         $('#coach_intro_subtext').attr("readonly",true);
         $('#coach_intro_conttext').attr("readonly",true);
         $('#coach_mattext').attr("readonly",true);
         $('#coach_yeartext').attr("readonly",true);
      }
   }
}

</script>

<script>
//활동지역 수정버튼누를때 팝업창 열기
function flocUpdateGo(){
	var id = document.getElementById('coachId').value;
	window.open('flocUpdatePopup.do?coachidText='+id,'floc','width=550,height=300');
}
//소개글수정 버튼누를때 수정완료버튼 생기고 리드온리 풀리는 함수
function introUpdateGo(){
	$('#coach_intro_subtext').attr('readonly',false);
	$('#coach_intro_conttext').attr('readonly',false);
	$('#introUpdateP').html('');
	$('#introUpdateP').html("<input type='button' value='수정완료' onclick='introUpdateSubmitAjax()' name='btnintrogo'>");
}
//소개글수정 수정완료버튼누를때 파람넘겨주는 함수
function introUpdateSubmitAjax(){
	var params='coach_intro_sub='+$('#coach_intro_subtext').val()+'&coach_intro_cont='+$('#coach_intro_conttext').val()+"&coach_mem_id="+$('#coachId').val();
	sendRequest('introUpdateSubmitAjax.do',params,showResultIntroAjax,'GET');
}
////////수연 카테고리수정/////
function cateUpdateGo(){

	$('#categoryP').html('');
	$('#categoryP').html("<input type='button' value='수정완료' onclick='javascript:cateUpdatePopup();' name='btnintrogo'>");

}
function cateUpdatePopup(id){
	window.open('categoryUpdate.do?mem_id='+id,'cateUpdate','left=200, top=100, width=450, height=260');	
}

////////////////////////////////////////////////////////////////////////////////////////
//준비물수정 버튼누를때 수정완료버튼 생기고 리드온리 풀리는 함수
function matUpdateGo(){
	$('#coach_mattext').attr('readonly',false);
	$('#matUpdateP').html('');
	$('#matUpdateP').html("<input type='button' value='수정완료' onclick='javascript:matUpdateSubmitAjax();' name='btnintrogo'>");
}
//준비물수정 수정버튼 누를때 파람넘겨주는 함수
function matUpdateSubmitAjax(){
	var params = 'coach_mat='+$('#coach_mattext').val()+'&coach_mem_id='+$('#coachId').val();
	sendRequest('matUpdateSubmitAjax.do',params,showResultIntroAjax,'GET');
}

////////////////////////////////////////////////////////////////////////////////////////
//강의유형 수정 버튼누를때 수정완료버튼 생기고 리드온리 풀리는 함수
function extypeUpdateGo(){
	$('#coach_ex_typetext').attr('readonly',false);
	$('#extypeUpdateP').html('');
	$('#extypeUpdateP').html("<input type='button' value='수정완료' onclick='javascript:extypeUpdateSubmitAjax();' name='btnintrogo'>");
}
//강의유형 수정 수정버튼 누를때 파람넘겨주는 함수
function extypeUpdateSubmitAjax(){
	var params = 'coach_ex_type='+$('#coach_ex_typetext').val()+'&coach_mem_id='+$('#coachId').val();
	sendRequest('extypeUpdateSubmitAjax.do',params,showResultIntroAjax,'GET');
}
	
////////////////////////////////////////////////////////////////////////////////////////
//경력 수정 버튼누를때 수정완료버튼 생기고 리드온리 풀리는 함수
function yearUpdateGo(){
	$('#coach_yeartext').attr('readonly',false);
	$('#yearUpdateP').html('');
	$('#yearUpdateP').html("<input type='button' value='수정완료' onclick='javascript:yearUpdateSubmitAjax();' name='btnintrogo'>");
}
//경력 수정 수정버튼 누를때 파람넘겨주는 함수
function yearUpdateSubmitAjax(){
	var params = 'coach_year='+$('#coach_yeartext').val()+'&coach_mem_id='+$('#coachId').val();
	sendRequest('yearUpdateSubmitAjax.do',params,showResultIntroAjax,'GET');
}
////////////////////////////////////////////////////////////////////////////////////////
//수정되고 넘어왔을때 다시 mem_id로 show 돌려주는 함수
function showResultIntroAjax(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
			alert(data.msg);
			show(data.mem_id);
		}
	}
}

$(function(){
	/*다시모든걸 리셋해야함*/
	$('#coachId').on('click',function(){
		if($('input[name=introReset]').val()== '수정완료'){
			$('.introUpdatePClass').html("<input type='button' value='소개글 수정' name='introReset' onclick='javascript:introUpdateGo();'>");

			$('input[type=text]').attr('readonly',true);
		}
	});
		
});
</script>


<!-- 제이슨 부분 -->
</body>
</html>