<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.HomeGymAddLabel {
	width:200px;
	text-align: right;
	vertical-align: top;
	}
	ul {
	list-style-type: none;
	}
	textarea {
	resize: none;
	}
</style>
</head>
<body>
	<%@include file="../header2.jsp"%>
	<h1>홈짐 등록하기</h1>
	<form name="HomeGymAddForm">
		<h5>기본 정보</h5>
		<ul>
					<li>
			<label class="HomeGymAddLabel">홈짐 아이디</label>
			<input type="text" name="hg_mem_id"placeholder="최대 10글자">
			</li>
			<li>
			<label class="HomeGymAddLabel">홈짐 공유자 닉네임</label>
			<input type="text" name="hg_nickname" readonly="readonly" placeholder="최대 10글자">
			<input type="button" value="중복 확인">
			<input type="hidden" id = "nickname_overlap" value="0">
			</li>
			<li><label class="HomeGymAddLabel"></label> ex)곰돌이 님의 홈짐</li>
			<li>
			<label class="HomeGymAddLabel">홈짐 주소</label>
			<input type = "text" name = "hg_faddr" readonly="readonly">
			<input type = "button" value = "주소 검색">
			</li>
			<li>
			<label class="HomeGymAddLabel">상세주소</label>
			<input type = "text" name = "hg_saddr" readonly="readonly">
			</li>
			<li>
			<label class="HomeGymAddLabel"></label>
			주소를 명확히 작성하셔야
			</li>
			<li>
			<label class="HomeGymAddLabel"></label>
			예약자가 찾아갈 때 혼선이 없습니다.
			</li>
			<li>
			<label class="HomeGymAddLabel"></label>
			상세 주소는 결제 완료 후 예약자 페이지에서 확인 가능합니다.
			</li>
			<li>
			<label class="HomeGymAddLabel">가까운 역</label>
			<select name = "hg_station">
			<option value = "역 1">역 1</option>
			<option value = "역 2">역 2</option>
			<option value = "역 3">역 3</option>
			<option value = "역 4">역 4</option>
			</select>
			</li>
			<li>
			<label class="HomeGymAddLabel">오시는 길</label>
			<textarea rows="5" cols="20" name = "hg_comeinfo"></textarea>
			</li>
			<li>
			<label class="HomeGymAddLabel">수용 인원</label>
			<select name = "hg_person_count">
			<option value = "1">1</option>
			<option value = "2">2</option>
			<option value = "3">3</option>
			<option value = "4">4</option>
			<option value = "5">5</option>
			</select>
			</li>
		</ul>
		<h5>보유 기구</h5>
		<ul>
			<li>
			<label class="HomeGymAddLabel">보유 운동 기구</label>
			<select name = "eq_name">
			<option value = "기구 1">기구 1</option>
			<option value = "기구 2">기구 2</option>
			<option value = "기구 3">기구 3</option>
			<option value = "기구 4">기구 4</option>
			<option value = "기구 5">기구 5</option>
			</select>
			<label class = "HomeGymAddLabel">보유 수</label>
			<select name = "eq_count">
			<option value = "1">1</option>
			<option value = "2">2</option>
			<option value = "3">3</option>
			<option value = "4">4</option>
			<option value = "5">5</option>
			</select>
			<input type = "button" value = "+">
			</li>
			<li>
			<label class="HomeGymAddLabel"></label>
			<span>운동기구 리스트 들어갈 영역</span>
			</li>
			<li>
			<label class="HomeGymAddLabel">기타 설명</label>
			<textarea rows="5" cols="20" name = "hg_info"></textarea>
			</li>
		</ul>
		<h5>소개 사진 등록</h5>
		<ul>
			<li>
			<label class = "HomeGymAddLabel">사진 등록하기</label>
			<input type = "file" name = "upload" multiple="multiple">
			</li>
			<li>
			<div id = "HomeGymAddImgDiv"></div>
			</li>
		</ul>
		<h5>예약 날짜</h5>
		<table>
			<tr>
				<th>시작일</th>
				<td><input type = "text" name = "hg_start_date"></td>
				<th>마감일</th>
				<td><input type = "text" name = "hg_end_date"></td>
			</tr>
			<tr>
				<th>불가능한 날짜</th>
				<td>
				<select name = "hg_not_date">
					<option value = "평일">평일</option>
					<option value = "주말">주말</option>
					<option value = "없음">없음</option>
				</select>
				</td>
				<td colspan = "2"></td>
			</tr>
		</table>
		<table border = "1" width="800" height = "400">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<ul>
			<li>
			<label class = "HomeGymAddLabel">예약 가능 시간</label>
			<select name = "hg_start_time">
				<option value = "9">09</option>
				<option value = "10">10</option>
				<option value = "11">11</option>
			</select>
			<label>부터</label>
			<select name = "hg_end_time">
				<option value = "18">18</option>
				<option value = "19">19</option>
				<option value = "20">20</option>
			</select>
			</li>
			<li>
			<label class = "HomeGymAddLabel">요금 설정/시간</label>
			<input type = "text" name = "hg_price">
			<input type = "button" value = "평균 요금 확인하기">
			<label class = "HomeGymAddLabel"> 평균 요금 : ----원</label>
			</li>
		</ul>
		<input type="submit" value="홈짐 등록 신청">
	</form>
</body>
</html>