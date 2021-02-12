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
.test-inline {
   display: inline-flex;
}
</style>

<!-- 제이슨 부분 -->
<script src="js/httpRequest.js"></script>
<script>
function show(id){
	var params='mem_id='+id;
	sendRequest('adminMemberManage.do',params,showResult,'GET');
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=eval('('+data+')');
					var contentDiv=document.getElementById('contentLayer');
					contentDiv.style.display='';
					document.getElementById('idxTd').value=data.dto2.mem_idx;
					document.getElementById('nameTd').value=data.dto2.mem_name;
					document.getElementById('idTd').value=data.dto2.mem_id;
					document.getElementById('pwdTd').value=data.dto2.mem_pwd;
					document.getElementById('phoneTd').value=data.dto2.mem_phone;
					document.getElementById('typeTd').value=data.dto2.mem_type;
		}
	}
}
</script>

<!-- 제이슨 부분 -->



</head>
<body>
<%@include file="../../header2.jsp" %>

	<div class="adminPage_wrap">
		<%@include file="../adminSideMenu.jsp"%>
		<div class="container adminPage_contents">
			<div class="adminPage_main">
			<br>
				<div>
					<h3>회원목록</h3>
				</div>
				<div>
					<form action="adminMemberListAction.do">
						<ul class="test-inline">
							<li>조건 검색&nbsp;&nbsp;&nbsp;</li>
							<li>등급 : </li>
							<li>
							<select name="type">
							<option <c:if test="${keyword.keywordType=='전체'}">selected="selected"</c:if>>전체</option>
							<option <c:if test="${keyword.keywordType=='일반회원'}">selected="selected"</c:if>>일반회원</option>
							<option <c:if test="${keyword.keywordType=='코치회원'}">selected="selected"</c:if>>코치회원</option>
							</select>
							</li>
							<li><input type="text" placeholder="고객명" name="name" value="${keyword.keywordName }"></li>
							<li><input type="submit" value="검색"></li>
						</ul>
					</form>
				</div>
				<br>
				

				<div>	
				<!-- 회원목록부분 테이블 div -->
					<table border="1" cellspacing="0">
						<thead>
							<tr>
								<th>회원번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>휴대폰번호</th>
								<th>이메일</th>
								<th>가입일</th>
								<th>정보수정일</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="7" align="center">
								검색된 회원이 없습니다.
								</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td><a href="javascript:show('${dto.mem_id}')" class="memidx"style="color: blue">${dto.mem_idx }</a></td>
								<td>${dto.mem_name }</td>
								<td>${dto.mem_id }</td>
								<td>${dto.mem_phone }</td>
								<td>${dto.mem_email }</td>
								<td>${dto.mem_joindate }</td>
								<td>${dto.mem_change }</td>
							</tr>
						</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7" align="center">${pageStr }</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<br>
				
					
					<div id="contentLayer">
					<form id="updateOkPwd">
						<h3>회원관리</h3>
						<table>
						<tbody>
							<tr>
								<td>회원번호<input type="text" name="mem_idx" id="idxTd" readonly="readonly" style="background-color : whitesmoke;" ></td>
								<td>아이디<input type="text" name="mem_id" id="idTd" readonly="readonly" style="background-color : whitesmoke;"></td>
							</tr>
							<tr>
								<td>
								비밀번호<input type="password" name="mem_pwd" id="pwdTd" readonly="readonly" style="background-color : whitesmoke;">
								<p class="updateGoGoPwd"><input type="button" value="수정"  name="btnpwdgogo" onclick="pwdUpdateGoGo();"></p>
								</td>
								<td>
								이름<input type="text" name="mem_name" id="nameTd" readonly="readonly" style="background-color : whitesmoke;">
								<input type="button" value="수정">
								</td>
							</tr>
							<tr>
								<td>
								휴대폰번호<input type="text" name="mem_phone" id="phoneTd" readonly="readonly" style="background-color : whitesmoke;">
								<input type="button" value="수정">
								</td>
								<td>
								회원등급<input type="text" name="mem_type" id="typeTd" readonly="readonly" style="background-color : whitesmoke;">
								<input type="button" value="수정">
								</td>
							</tr>
						</tbody>
						</table>
						</form>
					</div>
					<br>
				
					
					<!-- 
					<div>
						<ul class="test-inline">
							<li>검색 조건</li>
							<li><select><option>홈짐대여</option></select></li>
							<li><input type="button" value="검색"></li>
						</ul>
					</div>
					<div>
					<table border="1" cellspacing="0">
						<thead>
							<tr>
								<th>홈짐공유자id</th>
								<th>공유자입장평가</th>
								<th>홈짐대여자id</th>
								<th>대여자입장평가</th>
								<th>결제일</th>
								<th>이용완료일</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>qudah</td>
								<td>4점</td>
								<td>tmdvy</td>
								<td>5점</td>
								<td>2021.01.12</td>
								<td>2021.01.21</td>
								<td><input type="button" value="수정"></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">페이징 들어갈 자리</td>
							</tr>
						</tfoot>
					</table>
				</div>
				 -->
			</div>
		</div>
   </div>
   
 <script>

	function pwdUpdateGoGo(){
	   $('#pwdTd').attr('readonly',false);
	   $('.updateGoGoPwd').html('');
	   $('.updateGoGoPwd').html("<input type='button' onclick='pwdUpdateSubmit();' name='btnpwdgogo' value='수정완료'>");
	}
	
	function pwdUpdateSubmit() {
	   $('#updateOkPwd').attr("action", "adminMemberPwdUpdate.do").submit();
	};
	
$(function(){
		/*다시모든걸 리셋해야함*/
		$('.memidx').on('click',function(){
			if($('input[name=btnpwdgogo]').val()== '수정완료'){
				$('.updateGoGoPwd').html("<input type='button' value='수정' name='btnpwdgogo' onclick='pwdUpdateGoGo();'>");
				
				
				$('input[type=text]').attr('readonly',true);
				$('input[type=password]').attr('readonly',true);
			}
		});
			
});
	
</script> 

<%@include file="../../_include/footer.jsp" %>