<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../_include/head.jsp" %>

<script>
	//사진파일계속추가
	function plus(){
		var wrapul=document.getElementById("fileUl");	
		var newli=document.createElement("li");
		newli.innerHTML='올릴파일:<input type="file" name="upload">';
		wrapul.appendChild(newli);
		
	}
	function filedel(bfile_idx){
		url="commFileDelte.do?bfile_idx="+bfile_idx;
		location.href=url;
	}
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
<%@include file="../header2.jsp" %>

<style>
		.community_wrap {display: flex; min-height: calc(100vh - 92px);}
		.community_wrap .community_sidebar {flex: 0 0 250px; background-color: #ccc;}
		.community_wrap .community_sidebar ul {padding: 0; margin:  0;}
		.community_wrap .community_sidebar ul li.sidemenuli a {display: block; color: #000; padding: 8px 15px 8px 15px; font-weight: bold;}
		.community_wrap .community_sidebar ul li.sidemenuli a.comm {background-color: tomato; color: #fff;}
		.community_wrap .community_sidebar ul li.sidemenuli a:hover:not(.comm) {background-color: #333; color: #fff;}
</style>

<div class="community_wrap">
	<%@include file="./commSideMenu.jsp" %>
	<div id="contents">
		<form name="dailyUpdate" action="commDailyUpdate.do" method="post">
		<input type="hidden" name="ex_idx" value="${dto.ex_idx}">
		
		<style>
			.white_talbe_01 {border-top: 1px solid #333333;}
			.white_talbe_01 tbody tr th {width: 200px; padding: 10px 20px; background: #f7f7f7; border-bottom: 1px solid #dddddd;}
			.white_talbe_01 tbody tr td {padding: 10px 20px; border-bottom: 1px solid #dddddd;}
		</style>
		
		<div class="white_talbe_01">
			<table>
				<tr>
					<td>제목</td>
					<td colspan="2"><input type="text" name="ex_subject" value="${dto.ex_subject}"></td>
				</tr>
				<tr>
					<td>오늘의 운동 :</td>
					<td><input type="text" name="ex_name" value="${dto.ex_name}"></td>
				</tr>
				<tr>
					<td>오늘의 소비 칼로리 :</td>
					<td><input type="text" name="ex_cal" value="${dto.ex_cal}"></td>
					<td><input type="button" value="수정"></td>
				</tr>
				<tr>
					<td><textarea name="ex_content" placeholder="내용을 입력해주세요" style="height: 300px; white-space: pre-line;">${dto.ex_content}</textarea></td>
				</tr>
				<tr>
					<td><input type="reset" value="처음부터 쓰기"></td>
					<td><input type="submit" value="수정"></td>
				</tr>
			</table>
				<div class="form-group">
					<div id="fileList">
						<ul class="imgul">
						<c:set var="filelist" value="${filelist}"/>
						<c:if test="${empty filelist}">
							
								<li colspan="3">등록된 사진이 없습니다.</li>
								<input type="hidden" id="deltype" name="del_yn" value="N">
								<input type="hidden" name="files">
							
						</c:if>
						<c:forEach varStatus="i" var="filelist" items="${filelist}">
						<li class="imgtd" id="${filelist.bfile_rename}li">
						<img id="${filelist.bfile_rename}" src="/zipcok/upload/comm/${filelist.bfile_rename}" style="whidth:100px; height: 100px;">
						<input type="button"  onclick="javascript:delimg('${filelist.bfile_rename}','${i.getIndex()}')" value="사진삭제">
						<input type="hidden" id="deltype${i.getIndex()}" name="del_yn" value="N">
						<input type="hidden" name="files" value="${filelist.bfile_rename}">
						</li>				
						</c:forEach>
						</ul>
					</div>
					<ul id="fileUl">
						<li>파일:<input type="file" name="upload"></li>
					</ul>
						<div>
							<input type="button" value="파일추가" class="btn1 c1" onclick="plus();">
						</div>
				</div>
		</div>	
		</form>
	</div>
</div>
<%@include file="../_include/footer.jsp" %>