<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="k" %>
<c:set var="list" value="${list}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<style type="text/css">
.test-inline {
   display: inline-flex;
}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
</style>
<script>
function onchangePlaceholder(){
	var searchTypeC = document.getElementById('searchTypeC').value;
	if(searchTypeC != '전체'){
		var searchTypePlaceholder = document.getElementById('searchTextC');
		searchTypePlaceholder.removeAttribute('placeholder');
	}else if(searchTypeC == '전체'){
		var searchTypePlaceholder = document.getElementById('searchTextC');
		searchTypePlaceholder.setAttribute('placeholder','홈짐 이름');
	}
}
</script>
</head>
<body>
<%@include file="../../header2.jsp" %>
   <div class="adminPage_wrap">
     <%@include file="../adminSideBar.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
         <br>	
            <h3>홈짐 조회</h3>
            <form action="adminHomeGymSearch.do">
                  <ul class="test-inline">
                     <li>
                     	<select id="searchTypeC" name="searchType" onchange="javascript:onchangePlaceholder();">
                     		<option <c:if test="${searchType=='전체'}">selected="selected"</c:if> >전체</option>
                     		<option <c:if test="${searchType=='아이디'}">selected="selected"</c:if> >아이디</option>
                     		<option <c:if test="${searchType=='닉네임'}">selected="selected"</c:if> >닉네임</option>
                     	</select>
                     </li>
                     <li><input type="text" id="searchTextC" name="searchText" placeholder="홈짐이름"></li>
                     <li><input type="submit" value="검색"></li>
                  </ul>
            </form>
            <br>
            <div>
               <ul   class="test-inline">
                  <li>등록된 홈짐 수 : ${k:length(list)}</li>
               </ul>
            </div>
			
            <div><!-- 회원목록부분 테이블 div -->
               <table border="1" cellspacing="0">
                  <thead>
                     <tr>
                        <th>번호</th>
                        <th>홈짐이름</th>
                        <th>공유자아이디</th>
                        <th>등록일</th>
                        <th>정보수정일</th>
                        <th>결제계좌정보</th>
                        <th>상태</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty list}">
                  	<tr>
                  		<td colspan="7" align="center">등록된 홈짐정보가 없습니다</td>
                  	</tr>
                  </c:if>
                  
                  <c:forEach var="dto" items="${list}">
                     <tr>
                        <td>${dto.rnum}</td>
                        <td>${dto.hg_nickname}</td>
                        <td>${dto.hg_mem_id}</td>
                        <td>${dto.hg_regist_date}</td>
                        <td>${dto.hg_price}</td>
                        <td>${dto.hg_faddr}</td>
                        <td>
                        	<c:if test="${dto.hg_status==1}">활성</c:if>
                        	<c:if test="${dto.hg_status==0}">비활성</c:if>
                        </td>
                     </tr>
                  </c:forEach>
                  </tbody>
               </table>
               <div class="paging">
	               <c:if test="${!empty list }">
	               ${pageStr}
	               </c:if>
	           </div>
            </div>
			<h3>홈짐 정보 관리</h3>
			<from>
				<ul>
					<li>홈짐 번호 : 1</li>
					<li>회원 번호 : 1</li>
					<li>홈짐 공유자 닉네임 : 곰돌이 <input type="button" value="수정"></li>
					<li>홈짐 공유자 아이디 : gomdol </li>
					<li>회원 번호 : 1</li>
					<li>홈짐 등록일 : 2021.02.11</li>
					<li>주소 : 신촌을못가</li>
					<li>보유기구
						<ul>
							<li>&nbsp;&nbsp;&nbsp;리스트 항목 1 <input type="button" value="수정"></li>
							<li>&nbsp;&nbsp;&nbsp;리스트 항목 2 <input type="button" value="수정"></li>
						</ul>
					</li>
					<li>결제계좌정보 : 농협 구병모 3020526821541 <input type="button" value="수정"></li>
					<li>홈짐 평점 : 3.8 <input type="button" value="수정"></li>
					<li>홈짐 상태 : 활성화 <input type="button" value="수정"></li>
				</ul>
				<div align="center"><input type="button" value="홈짐 삭제하기"></div>
			</from>
			<br><br>
			
            <div><!-- 회원목록부분 테이블 div -->
            <h3>홈짐 후기 관리</h3>
               <table border="1" cellspacing="0">
                  <thead>
                     <tr>
                        <th>번호</th>
                        <th>예약자</th>
                        <th>등록일</th>
                        <th>평점</th>
                        <th>내용</th>
                        <th>관리</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>1</td>
                        <td>김둘리</td>
                        <td>2021.02.22</td>
                        <td>3.8</td>
                        <td><input type="button" value="보기"></td>
                        <td><input type="button" value="삭제"></td>
                     </tr>
                  </tbody>
                  <tfoot>
                     <tr>
                        <td colspan="6" align="center">페이징 들어갈 자리</td>
                     </tr>
                  </tfoot>

               </table>
            </div>
            
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>