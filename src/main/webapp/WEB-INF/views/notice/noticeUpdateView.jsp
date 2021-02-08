<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../_include/head.jsp" %>
<style>
.white_talbe_01 {
   border-top: 1px solid #333333;
}

.white_talbe_01 tbody tr th {
   width: 200px;
   padding: 10px 20px;
   background: #f7f7f7;
   border-bottom: 1px solid #dddddd;
}

.white_talbe_01 tbody tr td {
   padding: 10px 20px;
   border-bottom: 1px solid #dddddd;

}
.imgul li {display: inline;}
</style>
<%@include file="../header2.jsp" %>

<c:set var="list" value="${list }"/>
<c:set var="dto" value="${dto}"></c:set>
<script>


/*id와 file의 idx를 받아와서 del_yn을 y로 바꿔주는 자바스크립트*/
function delimg(id,idx){
var result=confirm('업로드된 사진을 삭제하시겠습니까?');
	if(result){
		document.getElementById('deltype'+idx).value='Y';
		var li=document.getElementById(id+'li');
		li.style.display='none';	
	}	
}




</script>



<div id="container">

	<div class="page_top_visual">
		<div class="common_page_title">
			<h2 class="page_title">공지사항</h2>
			<p class="page_text">수정할 부분을 다시 작성해 주세요</p>
		</div>
	</div>
	<div id="contents">
	<form action="noticeUpdate.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>카테고리 유형</th>
					<td><select name="bbs_category">
							<option>홈짐</option>
							<option>코치 매칭</option>
							<option>결제</option>
							<option>기타</option>
					</select></td>
				</tr>
				<input type="hidden" name="bbs_idx" value="${dto.bbs_idx}">
				
				<tr>
					<th>제목</th>

					<td><input type="text" name="bbs_subject"
						value="${dto.bbs_subject}"></td>
				</tr>
					<hr>
				
				<tr>
					<td colspan="3"><textarea rows="6" cols="70" name="bbs_content" placeholder="내용을 입력해주세요"
							style="white-space: pre-line; width: 600px; height: 200px;">${dto.bbs_content } </textarea></td>
				</tr>
			</table>
				<div class="form-group">
					<label>사진등록</label>
					<ul id="fileUl">
						<li>올릴파일:<input type="file" name="upload" accept="image/gif, image/jpeg, image/png"></li>
					</ul>
					<div>
						<input type="button" value="사진추가" class="btn1 c1" onclick="plus();">
					</div>
				</div>
				
				<script>
				//사진파일계속추가
					function plus(){
						var wrapul=document.getElementById("fileUl");	
						var newli=document.createElement("li");
						newli.innerHTML='올릴파일:<input type="file" name="upload" accept="image/gif, image/jpeg, image/png">';
						wrapul.appendChild(newli);
						
					}
				</script>
			<div>
				<ul class="imgul">
					<c:if test="${empty list}">
						
							<li colspan="3">등록된 사진이 없습니다.</li>
							<input type="hidden" id="deltype" name="del_yn" value="N">
							<input type="hidden" name="files">
						
					</c:if>
					<c:forEach varStatus="i" var="List" items="${list}">
					
					<li class="imgtd" id="${List.zfile_upload}li">
					<img id="${List.zfile_upload}"
					src="/zipcok/upload/notice/${List.zfile_upload}" style="whidth:100px; height: 100px;">
					<input type="button"  onclick="javascript:delimg('${List.zfile_upload}','${i.getIndex()}')" value="사진삭제">
					<input type="hidden" id="deltype${i.getIndex()}" name="del_yn" value="N">
					<input type="hidden" name="files" value="${List.zfile_upload}">
					</li>				
					</c:forEach>
					
				</ul>
			</div>
			<div class="table_list_bottom">
				<div class="btn_left_box">
					<a href="noticeList.do" class="btn1 c2">목록보기</a>
				</div>
				<div class="btn_right_box">
					<input type="submit" value="수정하기" class="btn1 c1"> <input
						type="reset" value="다시작성" class="btn1 c1">
				</div>
			</div>
		</form>
	</div>

</div>



<%@include file="../_include/footer.jsp"%>