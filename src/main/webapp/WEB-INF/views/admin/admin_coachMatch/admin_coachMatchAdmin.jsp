<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
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
         var coachProfileDiv=document.getElementById('coachProfileLayer');
         coachProfileDiv.style.display='';
         document.getElementById('coach_joindatetext').value=data.dto2.joindate;
         document.getElementById('coach_changetext').value=data.dto2.change;
         document.getElementById('coach_floctext').value=data.coachdto.coach_floc;
         document.getElementById('coach_intro_subtext').value=data.coachdto.coach_intro_sub;
         document.getElementById('coach_intro_conttext').value=data.coachdto.coach_intro_cont;
         document.getElementById('coach_mattext').value=data.coachdto.coach_mat;
         document.getElementById('coach_ex_typetext').value=data.coachdto.coach_ex_type;
         document.getElementById('coach_yeartext').value=data.coachdto.coach_year;
      }
   }
}
</script>
<!-- 제이슨 부분 -->
<style type="text/css">
.test_inline{
	display: inline-flex;
}
</style>
</head>
<body>
<%@include file="../../header2.jsp" %>
	<div class="adminPage_wrap">
		<%@include file="../adminSideMenu.jsp"%>
		<div class="container adminPage_contents">
			<div class="adminPage_main">
				<div>
				<h3>코치관리</h3>
				</div>
				<div>
					<form action="admin_coachMatchAdminSearch.do">
					<ul class="test_inline">
						<li>코치 검색</li>
						<li>
							<select name="choice">
								<option <c:if test="${selectoption=='전체'}">selected="selected"</c:if> >전체</option>
								<option <c:if test="${selectoption=='번호'}">selected="selected"</c:if> >번호</option>
								<option <c:if test="${selectoption=='id'}">selected="selected"</c:if> >id</option>
								<option <c:if test="${selectoption=='이름'}">selected="selected"</c:if> >이름</option>
							</select>
						</li>
						<li><input type="radio" name="mem_gender" value="남">남자 <input type="radio" name="mem_gender" value="여">여자</li>
						<li><input type="text" name="searchText"></li>
						<li><input type="submit"  value="검색"></li>
					</ul>
					</form>
				</div>
				<div><!--  테이블 div -->
					<table border="1" cellspacing="0">
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
							
								<td><a href="javascript:show('${dto.mem_id}')">${dto.mem_id}</a></td>
								<td>${dto.mem_phone}</td>
								<td>${dto.mem_email }</td>
								<td>${dto.mem_birth }</td>
								<td>${dto.mem_joindate}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty List}">
						<tr>
							<td colspan="7">등록된 코치가 없습니다</td>
						</tr>
						</c:if>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">${pageStr }</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div id="coachProfileLayer"><!-- 코치의 세부정보 부분 div -->
				<div>
					<ul class="test_inline">
						<li><img alt="profileImg" src="img/notice/01.png" style="width:30px; height:30px;"></li>
						<li><h2>코치이름</h2></li>
						<li>
							<ul>
								<li><input type="text" id="coach_joindatetext" readonly="readonly"></li>
								<li><input type="text" id="coach_changetext" readonly="readonly"></li>
							</ul>
						</li>
					</ul>
				</div>
				<form>
					<ul>
						<li>
							<h5>활동지역</h5>
							
							<ul>
								<li><input type="text" id="coach_floctext" readonly="readonly"></li>
							</ul>	
							<input type="button" value="활동지역 수정">
						</li>
						<li>
							<h5>소개글</h5>
							
							<ul>
								<li><input type="text" id="coach_intro_subtext" readonly="readonly"></li>
								<li><input type="text" id="coach_intro_conttext" readonly="readonly"></li>
							</ul>
							<input type="button" value="소개글 수정">
						</li>
						<li>
							<h5>카테고리</h5>
							
							<ul>
								<li>필라테스 <a href="#">커리큘럼 작성</a> <a href="#">미리보기</a></li>
								<li>요가 <a href="#">커리큘럼 작성</a> <a href="#">미리보기</a></li>
								<li>헬스 <a href="#">커리큘럼 작성</a> <a href="#">미리보기</a></li>
							</ul>
							<input type="button" value="카테고리 수정">
						</li>
						<li>
							<h5>준비물</h5>
							
							<ul>
								<li><input type="text" id="coach_mattext" readonly="readonly"></li>
							</ul>
							<input type="button" value="준비물 수정">
						</li>
						<li>
							<h5>강의유형</h5>
							
							<ul>
								<li><input type="text" id="coach_ex_typetext" readonly="readonly"></li>
							</ul>
							<input type="button" value="강의유형 수정">
						</li>
						<li>
							<h5>경력</h5>
							<ul>
								<li><input type="text" id="coach_yeartext" readonly="readonly"></li>
							</ul>
							<input type="button" value="경력 수정">
						</li>
						<li>
							<h5>코치 소개 사진</h5>
							<ul class="test_inline">
								<li><input type="button" value="수정하기"></li>
								<li><input type="button" value="사진추가"></li>
							</ul>
						</li>
						<li>
							<ul class="test_inline">
								<li>사진</li>
								<li>사진</li>
								<li>사진</li>
								<li>사진</li>
								<li>사진</li>
							</ul>
						</li>
					</ul>
					<input type="submit" value="저장하기">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>