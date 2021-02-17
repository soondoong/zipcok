<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<style type="text/css">
.test-inline {
	
       display: flex;
}
.comtab{width: 18%}
</style>
</head>
<body>
<%@include file="../../header2.jsp" %>
<style>
.table { border-spacing: ''; table-layout: auto; text-align: center; margin-bottom:70px;} 
.table th{font-weight: bold; border-color:#848282;}
a{cursor:pointer;}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
</style>
   <div class="adminPage_wrap">
      <%@include file="../adminSideBar.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
         	<div>
				<h5>[커뮤니티 관리]</h5>
			</div>
			<div>
				<form name="adminCommSearchList" action="admin_coachMatchCommunityList.do">
					<ul class="test-inline">
						<li>커뮤니티 검색</li>
						<li><select><option>커뮤니티 이름</option></select></li>
						<li><input type="text" name="com_name"></li>
						<li><input type="submit" value="검색하기"  id="searchbtn" class="btn btn-primary"></li>
					</ul>
				</form>
			</div>
			<div>
				<ul	class="test-inline">
					<li>총 커뮤니티 수: ${allCommCount }</li>
					<li>&nbsp;&nbsp;</li>
					<li>검색 커뮤니티 수: ${searchCommCount }</li>
				</ul>
			</div>
			<div><!-- 검색결과  테이블 div -->
				<form name="adminCommSearch" action="admin_coachMatchCommunitySubmit.do">
				<input type="hidden" name="com_name" value="${com_name}">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>선택</th>
							<th>코드</th>
							<th>커뮤니티 이름</th>
							<th>코치</th>
							<th>소속 회원 수</th>
							<th>개설일</th>
							<th>최근 활동일</th>
							<th>커뮤니티 가기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${commInfo}">
							<tr>
							<c:choose>
								<c:when test="${dto.com_idx eq com_idx }">
									<td><input type="radio" name="com_idx" value="${dto.com_idx }" checked="checked"></td>
								</c:when>
								<c:when test="${dto.com_idx ne com_idx }">
									<td><input type="radio" name="com_idx" value="${dto.com_idx }"></td>
								</c:when>
							</c:choose>
								
								<td>${dto.com_idx }</td>
								<td>${dto.com_name }</td>
								<td>${dto.com_coach_name }</td>
								<td>${dto.com_mem_sum }</td>
								<td>${dto.com_opendate }</td>
								<td>${dto.com_actdate }</td>
								<td><input type="button" value="가기"></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8" align="right"><input type="submit" value="내역보기"></td>
						</tr>
					</tfoot>
				</table>
				</form>
				<hr>
			</div>
			<div><!-- 커뮤니티 코치정보  테이블 div -->
				<div>
					<h5>커뮤니티 코치정보</h5>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>휴대폰번호</th>
							<th>이메일</th>
							<th>관리 회원 수</th>
							<th>가입일</th>
							<th>코치 정보</th>
						</tr>
					</thead>
					<tbody>
						
							<tr>
								<td>${coach.mem_idx }</td>
								<td>${coach.mem_name}</td>
								<td>${coach.mem_id}</td>
								<td>${coach.mem_phone}</td>
								<td>${coach.mem_email}</td>
								<td>${mem_sum }</td>
								<td>${coach.mem_joindate}</td>
								<td><input type="button" value="가기" onclick="location.href='http://localhost:9090/zipcok/admin_coachMatchAdminSearch.do?choice=id&searchText=${coach.mem_id}'"></td>
							</tr>
						
					</tbody>
				</table>
				<hr>
			</div>
			<div><!-- 커뮤니티 코치정보  테이블 div -->
				<div>
					<h5>커뮤니티 회원정보</h5>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>휴대폰번호</th>
							<th class="comtab">이메일</th>
							<th class="comtab">소속 커뮤니티</th>
							<th class="comtab">활동 시작일</th>
							<th>회원관리보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto3" items="${commMembers}" varStatus="i">
							<tr>
								<td>${dto3.mem_idx }</td>
								<td>${dto3.mem_name }</td>
								<td>${dto3.mem_id }</td>
								<td>${dto3.mem_phone }</td>
								<td>${dto3.mem_email }</td>
								
								<c:forEach var="commListdto" items="${commList}" varStatus="c">
									<c:if test="${i.index eq c.index }">
										<td>
										<select>
										<c:forEach var="bb" items="${c.current }" >
										<option>${bb}</option>
										</c:forEach>
										</select>
										</td>
									</c:if>
								</c:forEach>
								
								<c:forEach var="startList" items="${startDate}" varStatus="j">
									<c:if test="${i.index eq j.index }">
										<td>${j.current }</td>
									</c:if>
								</c:forEach>
								
								<td><input type="button" value="가기" onclick="location.href='http://localhost:9090/zipcok/adminMemberListAction.do?type=전체&name=${dto3.mem_name}'"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
			</div>
			<div><!-- 커뮤니티 게시판정보 테이블 div -->
				<div>
					<h5>커뮤니티 게시판정보</h5>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>게시판</th>
							<th>총 게시물 수</th>
							<th>댓글 수</th>
							<th>일일 평균 게시글</th>
							<th>최근 작성일</th>
							<th>활동 회원 수</th>
							<th>게시판 가기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>일일 운동 게시판</td>
							<td>${allBbsCount }</td>
							<td>${allRepleCount }</td>
							<td>${bbsAvgCount }</td>
							<td>${act_date }</td>
							<td>${act_mem_count }</td>
							<td><input type="button" value="가기"></td>
						</tr>
					</tbody>
				</table>
				<hr>
			</div>
         </div>
      </div>
   </div>

<%@include file="../../_include/footer.jsp" %>