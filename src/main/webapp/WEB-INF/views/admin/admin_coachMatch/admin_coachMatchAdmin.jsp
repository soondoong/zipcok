<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<ul class="test_inline">
						<li>코치 검색</li>
						<li><select><option>번호</option></select></li>
						<li><input type="radio" value="남자">남자 <input type="radio" value="여자">여자</li>
						<li><input type="text"></li>
						<li><input type="button" value="검색"></li>
					</ul>
				</div>
				<div>
					<ul class="test_inline">
						<li><img alt="profileImg" src="img/notice/01.png" style="width:30px; height:30px;"></li>
						<li><h2>홍승표 코치</h2></li>
						<li>
							<ul>
								<li>가입일 : 2021-01-14</li>
								<li>최근 로그인 : 2021-01-14</li>
							</ul>
						</li>
					</ul>
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
								<th>관리 회원 수</th>
								<th>가입일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>구병모</td>
								<td><a href="#">qudah123</a></td>
								<td>123456789</td>
								<td>a@naver.com</td>
								<td>2021.01.12</td>
								<td>2021.01.21</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">페이징 들어갈 자리</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div><!-- 코치의 세부정보 부분 div -->
					<ul>
						<li>
							<h5>활동지역</h5>
							<ul>
								<li>경기도 안산시 범죄도시</li>
							</ul>	
						</li>
						<li>
							<h5>소개글</h5>
							<ul>
								<li>소개글 제목</li>
								<li>소개글  내용소개글  내용소개글  내용소개글  내용소개글  내용소개글  내용소개글  내용소개글  내용소개글  내용소개글  내용</li>
							</ul>
						</li>
						<li>
							<h5>카테고리</h5>
							<ul>
								<li>필라테스 <a href="#">커리큘럼 작성</a> <a href="#">미리보기</a></li>
								<li>요가 <a href="#">커리큘럼 작성</a> <a href="#">미리보기</a></li>
								<li>헬스 <a href="#">커리큘럼 작성</a> <a href="#">미리보기</a></li>
							</ul>
						</li>
						<li>
							<h5>준비물</h5>
							<ul>
								<li>필라테스 : 매트</li>
								<li>요가 : 매트</li>
								<li>헬스 : 개인 수건</li>
							</ul>
						</li>
						<li>
							<h5>강의유형</h5>
							<ul>
								<li>대면 / 비대면</li>
							</ul>
						</li>
						<li><h5>경력</h5></li>
						<li><h5>코치 소개 사진</h5></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>