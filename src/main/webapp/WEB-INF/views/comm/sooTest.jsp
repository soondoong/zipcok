<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bbs.*"%>
<%@page import="com.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="bdao" class="bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="cdao" class="com.ComDAO" scope="session"></jsp:useBean>
<%
	/*혹시 삭제된 게시글을 들어왔는지  유효성검사*/

String idx_s = request.getParameter("idx");
if (idx_s == null || idx_s == (" ")) {
	idx_s = "0";
}
Integer idx = Integer.parseInt(idx_s);
if (idx == 0) {
%>
<script>
    	window.alert('이미 삭제된 게시글이거나 잘못된 접근입니다.');
    	location.href='boardList.jsp';
    	</script>
<%
	}

/*글번호로 모든 정보가져와서 출력해줌*/
BbsDTO bdto = bdao.bbsContent(idx);

/*로그인한 사용자만 이용가능하게*/
String sessionId = (String) session.getAttribute("id");
if (sessionId == null) {
%>
<script>
    	window.alert('로그인한 사용자만 이용 가능한 서비스입니다.');
    	location.href='boardList.jsp';
    	</script>
<%
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/ykLayout.css">
<style>
@media only screen and (max-width : 1600px) {
	.community a { /*클릭한곳 색바꾸기*/
		color: #bd5734;
		font-weight: bold;
	}
	.contentimg {
		width: 100%;
		background-color: white;
		margin-bottom: 50px;
	}
	.tabcon {
		width: 900px;
		margin: 0px auto;
	}
	.tabcon td {
		font-size: 16px;
		height: 45px;
	}
	.tdsmall {
		text-align: center;
		width: 10%;
		border-bottom: 1px solid lightgray;
	}
	.tdsmall2 {
		text-align: center;
		font-weight: bold;
		width: 10%;
		border-bottom: 1px solid lightgray;
	}
	.tdsub {
		font-weight: bold;
		width: 70%;
		border-bottom: 1px solid lightgray;
	}
	.tddate {
		text-align: left;
		font-weight: bold;
		width: 20;
		border-bottom: 1px solid lightgray;
	}
	.tdid {
		text-align: left;
		font-weight: bold;
		width: 30;
		border-bottom: 1px solid lightgray;
	}
	.tdcon {
		text-align: center;
	}
	.tdimg {
		text-align: center;
	}
	.conimg {
		width: 600px;
	}
	section {
		text-align: center;
	}
	section article h1 {
		margin-top: 0;
		margin-bottom: 0;
		font-size: 26px;
	}
	div {
		text-align: center;
	}

	/*좋아요 기능부분*/
	.likeimg {
		text-align: center;
	}
	.likenum {
		color: white;
		position: relative;
		top: -53px;
	}
	.likemsg {
		position: relative;
		top: -64px;
	}
	.likeAtag {
		text-decoration: none;
		color: white;
	}
	.likeAtag:link {
		color: white;
		text-decoration: none;
	}
	.likeAtag:visited {
		color: white;
		text-decoration: none;
	}
	.likeAtag:hover {
		color: white;
		text-decoration: none;
	}

	/*댓글테이블 사이즈수정*/
	.tabcom {
		width: 900px;
		margin: 0px auto;
	}
	.comtd_input fieldset {
		width: 900px;
		height: 90px;
		border: 1px solid darkgray;
		border-radius: 5px;
	}
	.recomfield {
		width: 700px;
		border: 1px solid darkgray;
		border-radius: 5px;
		text-align: left;
		margin-left: 100px;
	}
	.recomfield div {
		text-align: left;
		font-size: 16px;
	}
	.comtd_id {
		font-size: 16px;
		width: 100%;
	}
	.comtd_id span {
		font-size: 12px;
		color: #bd5734;
	}
	.comtd_con {
		width: 20%;
		height: 35px;
	}
	.comtd_lev {
		width: 90px;
	}
	.comtd_date {
		width: 10%;
		font-size: 12px;
	}
	.comtd_re {
		width: 20%;
		text-align: left;
		font-size: 12px;
		color: lightgray;
	}
	.comtd_space {
		height: 20px;
	}
	.comsid_div {
		text-align: left;
		font-size: 16px;
	}
	.cominput {
		font-size: 16px;
		width: 750px;
		height: 50px;
		border: 0px;
	}
	.comtd_input {
		text-align: left;
	}
	.comtd_reinput {
		width: 10%;
	}
	.recominput {
		border: 0px;
		width: 550px;
		height: 60px;
	}
	.thcom {
		font-size: 16px;
		border-bottom: 1px solid lightgray;
	}
	.combt {
		border: 0px;
		font-size: 16px;
		background-color: Gainsboro;
		border-radius: 8px;
		width: 90px;
		height: 50px;
		position: relative;
		left: 30px;
		bottom: -3px;
	}
	.recombt {
		border: 0px;
		font-size: 15px;
		background-color: Gainsboro;
		border-radius: 4px;
		width: 60px;
		height: 30px;
		position: relative;
		left: 15px;
		bottom: -3px;
	}
	.recombt2 {
		border: 0px;
		font-size: 15px;
		background-color: Gainsboro;
		border-radius: 4px;
		width: 60px;
		height: 30px;
		position: relative;
		left: 20px;
		bottom: -3px;
	}
	.prev_table {
		margin: 0 auto;
		width: 900px;
		text-align: left;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
	}
	.prev_table td {
		height: 40px;
	}
	.nexttd {
		width: 20%;
		color: #bd5734;
	}

	/*메인이미지*/
	.fixedImg {
		position: fixed;
		width: 100%;
		z-index: -1;
	}
	.fixedImg_wrap {
		text-align: center;
		width: 100%;
		height: 330px;
		background-color: rgba(57, 60, 30, 0.65);
		position: relative;
		z-index: 1;
	}
	.fixedImg_wrap img {
		width: 60px;
		position: relative;
		top: 70px;
	}
	.fixedImg_wrap div {
		margin: 0 auto;
		color: white;
		position: relative;
	}
	.play {
		font-family: Lucida Bright;
		font-size: 35px;
		width: 250px;
		top: 100px;
	}
	.playtext {
		font-family: Modern;
		font-size: 14px;
		width: 180px;
		top: 120px;
	}
	.introimg_art img {
		width: 100%;
		height: 450px;
	}
}

@media only screen and (max-width : 1280px) {
	.community a { /*클릭한곳 색바꾸기*/
		color: #bd5734;
		font-weight: bold;
	}
	.contentimg {
		width: 100%;
		background-color: white;
		margin-bottom: 50px;
	}
	.tabcon {
		width: 800px;
		margin: 0px auto;
	}
	.tabcon td {
		font-size: 16px;
		height: 45px;
	}
	.tdsmall {
		text-align: center;
		width: 10%;
		border-bottom: 1px solid lightgray;
	}
	.tdsmall2 {
		text-align: center;
		font-weight: bold;
		width: 10%;
		border-bottom: 1px solid lightgray;
	}
	.tdsub {
		font-weight: bold;
		width: 70%;
		border-bottom: 1px solid lightgray;
	}
	.tddate {
		text-align: left;
		font-weight: bold;
		width: 20;
		border-bottom: 1px solid lightgray;
	}
	.tdid {
		text-align: left;
		font-weight: bold;
		width: 30;
		border-bottom: 1px solid lightgray;
	}
	.tdcon {
		text-align: center;
	}
	.tdimg {
		text-align: center;
	}
	.conimg {
		width: 600px;
	}
	section {
		text-align: center;
	}
	section article h1 {
		margin-top: 0;
		margin-bottom: 0;
		font-size: 26px;
	}
	div {
		text-align: center;
	}

	/*좋아요 기능부분*/
	.likeimg {
		text-align: center;
	}
	.likenum {
		color: white;
		position: relative;
		top: -53px;
	}
	.likemsg {
		position: relative;
		top: -64px;
	}
	.likeAtag {
		text-decoration: none;
		color: white;
	}
	.likeAtag:link {
		color: white;
		text-decoration: none;
	}
	.likeAtag:visited {
		color: white;
		text-decoration: none;
	}
	.likeAtag:hover {
		color: white;
		text-decoration: none;
	}

	/*댓글테이블 사이즈수정*/
	.tabcom {
		width: 700px;
		margin: 0px auto;
	}
	.comtd_input fieldset {
		width: 700px;
		height: 90px;
		border: 1px solid darkgray;
		border-radius: 5px;
	}
	.recomfield {
		width: 500px;
		border: 1px solid darkgray;
		border-radius: 5px;
		text-align: left;
		margin-left: 100px;
	}
	.recomfield div {
		text-align: left;
		font-size: 16px;
	}
	.comtd_id {
		font-size: 16px;
		width: 100%;
	}
	.comtd_id span {
		font-size: 12px;
		color: #bd5734;
	}
	.comtd_con {
		width: 20%;
		height: 35px;
	}
	.comtd_lev {
		width: 90px;
	}
	.comtd_date {
		width: 10%;
		font-size: 12px;
	}
	.comtd_re {
		width: 20%;
		text-align: left;
		font-size: 12px;
		color: lightgray;
	}
	.comtd_space {
		height: 20px;
	}
	.comsid_div {
		text-align: left;
		font-size: 16px;
	}
	.cominput {
		font-size: 16px;
		width: 550px;
		height: 50px;
		border: 0px;
	}
	.comtd_input {
		text-align: left;
	}
	.comtd_reinput {
		width: 10%;
	}
	.recominput {
		border: 0px;
		width: 350px;
		height: 30px;
	}
	.thcom {
		font-size: 16px;
		border-bottom: 1px solid lightgray;
	}
	.combt {
		border: 0px;
		font-size: 16px;
		background-color: Gainsboro;
		border-radius: 8px;
		width: 90px;
		height: 50px;
		position: relative;
		left: 30px;
		bottom: -3px;
	}
	.recombt {
		border: 0px;
		font-size: 15px;
		background-color: Gainsboro;
		border-radius: 4px;
		width: 60px;
		height: 30px;
		position: relative;
		left: 15px;
		bottom: -3px;
	}
	.recombt2 {
		border: 0px;
		font-size: 15px;
		background-color: Gainsboro;
		border-radius: 4px;
		width: 60px;
		height: 30px;
		position: relative;
		left: 20px;
		bottom: -3px;
	}
	.prev_table {
		margin: 0 auto;
		width: 800px;
		text-align: left;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
	}
	.prev_table td {
		height: 40px;
	}
	.nexttd {
		width: 20%;
		color: #bd5734;
	}

	/*메인이미지*/
	.fixedImg {
		position: fixed;
		width: 100%;
		z-index: -1;
	}
	.fixedImg_wrap {
		text-align: center;
		width: 100%;
		height: 330px;
		background-color: rgba(57, 60, 30, 0.65);
		position: relative;
		z-index: 1;
	}
	.fixedImg_wrap img {
		width: 60px;
		position: relative;
		top: 70px;
	}
	.fixedImg_wrap div {
		margin: 0 auto;
		color: white;
		position: relative;
	}
	.play {
		font-family: Lucida Bright;
		font-size: 35px;
		width: 250px;
		top: 100px;
	}
	.playtext {
		font-family: Modern;
		font-size: 14px;
		width: 180px;
		top: 120px;
	}
	.introimg_art img {
		width: 100%;
		height: 450px;
	}
}
</style>

<script>
/*댓글창 내용없이 등록하면 경고창뜨게*/
function comNullno(t){
	
	var com=t.com_bt.value;
	var recom=t.all.com_recontent.value;

	
	if(com==null || com==""){
		window.alert('내용을 입력해주세요!');
		return false;
	}
	return true;

}

/*대댓글 입력창 닫아주는 기능*/
function resetcom(cidx){
	 		
	document.getElementById(cidx).innerHTML='';
}



/*게시글 수정,삭제 버튼시 처리페이지 이동 기능*/
function btn_click(str){                             
    if(str=="update"){                                 
        fmup.action="boardUpdate.jsp";      
    } else if(str=="delete"){  
    	var result=window.confirm('정말 삭제하시겠습니까?');
    	if(result==true){ 
    		fmup.action="boardDelete.jsp"; 
    	}else{
    		location.reload();    		
    	}
         
    }  else{
    	
    }
}


/*게시글 답변 처리페이지 이동 기능*/
function goRewrite(){
	
location.href='boardReWrite.jsp?subject=<%=bdto.getBbs_subject()%>&ref=<%=bdto.getBbs_ref()%>&lev=<%=bdto.getBbs_lev()%>&sunbun=<%=bdto.getBbs_sunbun()%>';	
}



</script>

</head>
<body>
	<%@include file="/ykheader.jsp"%>
	<br>
	<br>
	<br>
	<!-- 메뉴바공간땜에 이거있어야됨 ㅋㅋ -->

	<script>
/*대댓글 입력창 열어주는 기능-include 이후에 해야 먹힘. header랑 연관됨*/
function showcom(cidx,cref){

document.getElementById(cidx).innerHTML="<fieldset class='recomfield'><div><%=sid%>
		</div>"
					+ "<input type='text'  name='com_recontent' class='recominput'><input  type='hidden'  name='hiddenref' value='"+cref+"'>"
					+ "<input type='submit' value='등록' class='recombt'>&nbsp;<input type='button' value='취소' onclick='resetcom("
					+ cidx + ");'  class='recombt2'></fieldset> ";

		}
	</script>


	<section>
		<article class="introimg_art">
			<div class="fixedImg">
				<img src="../img/3bbb.jpg">
			</div>
		</article>
	</section>
	<div class="fixedImg_wrap">
		<img src="../img/5b.png">
		<div class="play">Play YK Hotel</div>
		<div class="playtext">여행스토리를 들려주세요!</div>
	</div>

	<div style="background-color: white;">
		<br> <br> <br> <br>
	</div>

	<section style="background-color: white;">
		<article>
			<h1>여행이야기</h1>
		</article>

		<div style="background-color: white;">
			<br> <br> <br>
		</div>

		<form name="boardContent" action="boardUpdate.jsp">
			<table class="tabcon" cellspacing="0">
				<thead>
					<tr>
						<td class="tdsmall">제목</td>
						<td colspan="3" align="left" class="tdsub">&nbsp;&nbsp;<%=bdto.getBbs_subject()%></td>
						<td class="tdsmall">조회수</td>
						<td class="tdsmall2"><%=bdto.getBbs_readnum()%></td>

					</tr>
					<tr>
						<td class="tdsmall">아이디</td>
						<td class="tdid">&nbsp;&nbsp;<%=bdto.getBbs_id()%></td>
						<td class="tdsmall">작성일</td>
						<td class="tddate">&nbsp;&nbsp;<%=bdto.getBbs_writedate()%></td>
						<td class="tdsmall">좋아요</td>
						<td class="tdsmall2"><%=bdto.getBbs_likenum()%></td>
					</tr>

				</thead>


				<!-- 게시글좋아요 기능/나중에 쿠키심어서 하루에 1번만 좋아요가능하게! -->
				<tfoot align="center">
					<tr>
						<td class="likeimg" colspan="6"><a
							href="boardLikenum_ok.jsp?idx=<%=bdto.getBbs_idx()%>"
							class="likeAtag"> <img src="/semi/img/bh.jpg"
								style="width: 45px;">
						</a></td>
					</tr>
					<tr>
						<td class="likenum" colspan="6"><a
							href="boardLikenum_ok.jsp?idx=<%=bdto.getBbs_idx()%>"
							class="likeAtag"> <%=bdto.getBbs_likenum()%>
						</a></td>
					</tr>
					<tr>
						<td class="likemsg" colspan="6" style="font-size: 15px;">좋아요</td>
					</tr>
				</tfoot>

				<!-- 게시글 본문내용 -->
				<tbody>
					<tr>
						<td colspan="6"></td>
					</tr>

					<tr>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td colspan="6" class="tdimg">
							<%
								if (bdto.getBbs_imgname().equals("nono")) { //파일이름이 nono이면 사진파일을 올리지않았다는뜻. 사진띄우지않음

							} else { //사진파일을 업로드한 사용자는 사진띄워줌
							%> <img src="/semi/upload/<%=bdto.getBbs_imgname()%>"
							class="conimg"> <%
								}
							%> <br> <br> <br>
						</td>
					</tr>

					<tr>
						<td colspan="6" class="tdcon"><%=bdto.getBbs_content().replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;")%>
						</td>
					</tr>

					<!-- 그냥 미적으로 이쁘게 여유를준공간 -->
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>

	<%
		//총 댓글수
	int comCnt = cdao.getTotalcom(bdto.getBbs_idx());
	%>

	<!-- 댓글 보여주는 부분 -->
	<section style="background-color: white;">
		<article>
			<form name="commentForm" action="/semi/bbs/com/comWrite_ok.jsp"
				onsubmit="return comNullno(this);">
				<input type="hidden" name="hiddenbbsidx"
					value="<%=bdto.getBbs_idx()%>">

				<table class="tabcom">
					<thead>
						<tr>
							<th colspan="3" align="left" class="thcom">댓글(<%=comCnt%>)
							</th>
						</tr>
					</thead>

					<%
						/*댓글들을 담은 배열 출력*/
					ArrayList<ComDTO> carr = cdao.getcomList(bdto.getBbs_idx());
					if (carr == null || carr.size() == 0) {

					} else {
					%>

					<tbody>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>

						<%
							for (int i = 0; i < carr.size(); i++) {
							int cidx = carr.get(i).getCom_idx(); //댓글고유번호
							int cref = carr.get(i).getCom_ref(); //댓글참조번호
						%>

						<tr>
							<%
								/*lev값이 1이면 대댓글 , 0이면 원본댓글임.  대댓글은 들여쓰기를 해줌.*/
							if (carr.get(i).getCom_lev() > 0) {
							%>
							<td rowspan="4" class="comtd_lev"></td>
							<%
								}
							%>
							<th colspan="3" align="left" class="comtd_id">
								<%
									if (carr.get(i).getCom_id().equals(bdto.getBbs_id())) {
								%> <span>[글쓴이]</span> <%=carr.get(i).getCom_id()%> <%
 	} else {
 %> <%=carr.get(i).getCom_id()%> <%
 	}
 %>
							</th>
						</tr>


						<tr>
							<td colspan="3" align="left" class="comtd_con"><%=carr.get(i).getCom_content()%></td>
						</tr>
						<tr>

							<td align="left" colspan="2" class="comtd_date"><%=carr.get(i).getCom_writedate()%>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

								<a href="javascript:showcom(<%=cidx%>,<%=cref%>);">답글쓰기</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <%
 	/*로그인접속자랑 댓글작성자아이디가 같으면 삭제버튼 뜨게함*/
 if (sid.equals(carr.get(i).getCom_id())) {
 %> <a
								href="/semi/bbs/com/comDelete_ok.jsp?idx=<%=cidx%>&lev=<%=carr.get(i).getCom_lev()%>&ref=<%=carr.get(i).getCom_ref()%>">삭제</a>
								<%
									}
								%></td>
						</tr>
						<tr>
							<td class="comtd_space" colspan="3"></td>
						</tr>
						<tr>
							<td colspan="3" id="<%=cidx%>" class="comtd_reinput"></td>
						<tr>
							<%
								}

							}
							%>
						
						<tr>
							<td colspan="3" style="border-bottom: 1px solid lightgray;">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</tbody>

					<!-- 원본댓글 입력창 -->
					<tfoot>
						<tr>
							<td colspan="3" class="comtd_input">
								<fieldset>
									<div class="comsid_div"><%=sessionId%></div>
									<input type="text" name="com_content" class="cominput">
									<input type="submit" value="댓글쓰기" class="combt" id="">
								</fieldset>
							</td>
						</tr>
					</tfoot>

				</table>
			</form>
		</article>
	</section>



	<section style="background-color: white;">
		<br>
		<form name="fmup">
			<!-- 수정 및 삭제 시 넘겨줄 글고유번호와 파일이름값 -->
			<input type="hidden" name="idx" value="<%=bdto.getBbs_idx()%>">
			<input type="hidden" name="imgname"
				value="<%=bdto.getBbs_imgname()%>">

			<%
				//조건 1. 글쓴이아이디와 현재 접속자sessionId와 비교해서 맞으면 수정,삭제띄움.

			if (sessionId == null || !sessionId.equals(bdto.getBbs_id())) {
			%>
			<div style="background-color: white;">
				<input type="button" value="목록보기"
					onclick="location.href='/semi/bbs/boardList.jsp'"> <input
					type="button" value="답글달기" onclick="goRewrite();">
			</div>
			<% 
}else if(sessionId.equals(bdto.getBbs_id())){
%>
			<div>
				<input type="submit" value="수정하기" onclick="btn_click('update');">
				<input type="submit" value="삭제" onclick="btn_click('delete');">
				<input type="button" value="목록보기"
					onclick="location.href='/semi/bbs/boardList.jsp'"> <input
					type="button" value="답글달기" onclick="goRewrite();">
			</div>
			<% 
}
%>

		</form>
		<div>
			<br> <br>
		</div>
		<%
//이전글구하기
//1.현재글 rnum구하기
int thisrnum=bdao.findrownum(idx);
//2.이전글 다음글구하기
BbsDTO prev=bdao.bbsPrevAndNext(thisrnum-1);
BbsDTO next=bdao.bbsPrevAndNext(thisrnum+1);
String prev_msg=prev.getBbs_subject();
String next_msg=next.getBbs_subject();
if(prev_msg==null){prev_msg="이전글이 없습니다.";};
if(next_msg==null){next_msg="다음글이 없습니다.";};
%>

		<table class="prev_table">
			<tr>
				<td class="nexttd">[다음글]</td>
				<td>
					<%
if(next_msg.equals("다음글이 없습니다.")){ 
%> <%=next_msg %> <%
}else{
	%> <a href="boardContent.jsp?idx=<%=next.getBbs_idx()%>"><%=next_msg %></a>
					<%	
}

%>
				</td>
			</tr>
			<tr>
				<td class="nexttd">[이전글]</td>
				<td>
					<%
if(prev_msg.equals("이전글이 없습니다.")){ 
%> <%=prev_msg %> <%
}else{
	%> <a href="boardContent.jsp?idx=<%=prev.getBbs_idx()%>"><%=prev_msg %></a>
					<%	
}
%>
				</td>
			</tr>

		</table>

		<br> <br> <br> <br>
	</section>
	<%@include file="/ykfooter.jsp"%>
</body>
</html>