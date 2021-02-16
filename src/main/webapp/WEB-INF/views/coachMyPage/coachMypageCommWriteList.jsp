<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">

<script>
function coachMypageWriteList() {
	location.href='coachMypageWriteList.do?mem_id=${sessionScope.coachId}';
}
function coachMypageCommWriteList() {
	location.href='coachMypageCommWriteList.do?mem_id=${sessionScope.coachId}';
}
</script>
</head>
<body>
	<%@include file="../header2.jsp"%>
	<div class="mypage_wrap">
	<%@include file="./coachMypageSideMenu.jsp"%>
	<div class="mypage_contents">
         <div class="mypage_main writeMain">
	<br>
	<div id="toggle_tab" class="tab_style_01 mb50">
		<style>
		.writeMain{width:1000px;}
		.mypage_main .tab_style_01 ul {display: flex; }
		.mypage_main .tab_style_01 li {flex: 1 1 auto;}
		.mypage_main .tab_style_01 li button {display: block; width: 100%; background: #f7f7f7; line-height: 40px; text-align: center; border: none;}
		.mypage_main .tab_style_01 li.on button {background: #006be0; color: #ffffff;}
		.table { border-spacing: ''; table-layout: auto; text-align: center;} 
		.table th{font-weight: bold; border-color:#848282;}
		.revbtn{width:72px; height: 25px; }
		</style>		
			<ul>
				<li><button type="button" onclick="coachMypageWriteList()">F&A / 고객센터 작성글</button></li>
				<li class="on"><button type="button" onclick="coachMypageCommWriteList()">커뮤니티 작성글</button></li>
			</ul>
		</div>
<div class="mypage_main_table">
	<form action="coachMypageCommCheckDel.do" id="checkConfirm">
	<table class="table table-hover">
	<thead>
		<tr>
			<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick='selectAll(this)'/></th>
			<th>게시판</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="6"><span style="float: left;"><input type="submit" value="선택삭제" id="delbtn"></span><span>${pageStr }</span></td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					등록된 게시글이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td><input type="checkbox" name="checkRow" value="${dto.ex_group}" /></td>
			<td>${dto.ex_id }</td>
			<td>${dto.ex_head }</td>
			<td><a href="commDailyContent.do?ex_idx=${dto.ex_idx}" style="color : blue;">${dto.ex_subject }</a></td>
			<td>${dto.ex_content }</td>
			<td>${dto.ex_writedate }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
</div>
	</div>
	</div>
	</div>
	
<script>
//전체선택,해제
function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

$(function(){
	$('#delbtn').on('click',function(){
		var cbx=$("input[name='checkRow']:checked").length;
		if(!cbx>0){
			alert('하나 이상 선택해주세요.');
			return false;
		}else{
			return true;
		}
	});
});

</script>		

	   <%@include file="../_include/footer.jsp" %>
</body>
</html>