<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/mypage.css" rel="stylesheet">

<style>
.mypage_contents .reupload {
	position: relative;
	top: -77px;
	left: 359px;
	background-color: #b7b7b7;
	font-size: 23px;
	text-align: center;
	padding: 12px;
	color: white;
	border-radius: 50%;
}

#file {
	display: none;
}

.titlee {
	font-weight: 550;
	color: #12151d;
	margin-bottom: 20px;
}

.titlee:before {
	content: "";
	display: inline-block;
	background-color: #257cda;
	width: 11px;
	height: 41px;
}

.titlee hr {
	border-top: 1px solid #d1d1d4;
	margin-bottom: 30px;
}

/*일반프로필 css*/
.pfDIV {
	height: 360px;
	margin-top: 30px;
}

.nomalInfo {
	padding: 0 0 50px 40px;
}

.nomalInfo div {
	width: 500px;
	padding: 15px 0;
	font-size: 19px;
	border-bottom: 1px solid #e4e4e4;
}

.nomalInfo div span {
	font-weight: 550;
	padding-right: 50px;
}

.rebtn {
	width: 50px;
	margin: 4px 0 0 10px;
	height: 20px;
	font-size: 12px;
	border: 0px;
	border-radius: 5px;
	background-color: #e4e4e4;
}
</style>

<script src="https://kit.fontawesome.com/802041d611.js"
	crossorigin="anonymous"></script>
<script>
	function mypagePwdUpdate() {
		location.href = 'mypagePwdUpdateForm.do';
	}
	function mypageAddrUpdate() {
		window.open('mypageAddrUpdateForm.do?mem_id=${sessionScope.sid}',
				'addrUpdate', 'width=550,height=300');
	}
	function mypageEmailUpdate() {
		window.open('mypageEmailUpdateForm.do?mem_id=${sessionScope.sid}',
				'emailUpdate', 'width=550,height=300');
	}
	function mypagePhoneUpdate() {
		window.open('mypagePhoneUpdateForm.do?mem_id=${sessionScope.sid}',
				'emailUpdate', 'width=550,height=300');
	}
</script>

</head>
<body>
	<%@include file="../header2.jsp"%>

	<div class="mypage_wrap">
		<%@include file="./mypageSideMenu.jsp"%>

		<div class="mypage_contents">
			<div class="mypage_main">
				<div class="nomalAllWrap">
					<h2 class="titlee">&nbsp;기본 프로필</h2>
					<hr>

					<form id="uploadForm" enctype="multipart/form-data" method="POST"
						action="moProfileImgReUpload.do">
						<div class="pfDIV">
							<div class="profileIMG">
								<img src="/zipcok/upload/member/${cdto.mfile_upload}">
							</div>
							<!-- 프로필사진 수정 -->
							<a href="#" id="a-upload"><i class="fas fa-camera reupload"></i></a>
							<input type="file" id="file" name="upload"
								onchange="changeValue(this)"
								accept="image/gif, image/jpeg, image/png" /> <input
								type="hidden" name="id" value="${login.mem_id }">
						</div>
					</form>
					<!-- 프로필사진 수정 -->
					<script type="text/javascript">
						$(function() { //사진수정버튼

							$('#a-upload').click(function(e) {
								e.preventDefault();
								$('#file').click();
							});
						});
						function changeValue(obj) { //사진선택하면
							var fileValue = $("#file").val().split("\\");
							var fileName = fileValue[fileValue.length - 1]; // 파일명
							var result = confirm(fileName + "사진으로 변경하시겠습니까?");
							if (result) {
								$('#uploadForm').submit();
							}

						}
					</script>

					<div class="nomalInfo">
						<div class="name">
							<span>이름</span>${dto.mem_name }<input type="hidden"
								name="mem_name" value="${dto.mem_name }">
						</div>
						<div>
							<span>생년월일</span>${dto.mem_birth }<input type="hidden"
								name="mem_birth" value="${dto.mem_birth }">
						</div>
						<div>
							<span>아이디</span>${dto.mem_id }<input type="hidden"
								name="mem_id" value="${dto.mem_id }">
						</div>
						<div>
							<span>비밀번호</span>****<input type="hidden" name="mem_pwd"
								value="${dto.mem_pwd }"><input type="button"
								value="수정" class="rebtn" onclick="mypagePwdUpdate()">
						</div>
						<div>
							<span>주소</span><input type="button" value="수정" class="rebtn" onclick="mypageAddrUpdate()">
							<p>${dto.mem_addr }<br>${dto.mem_detailaddr }</p>
							<input type="hidden" name="mem_zipcode" value="${dto.mem_zipcode }">
							<input type="hidden" name="mem_addr" value="${dto.mem_addr }">
							<input type="hidden" name="mem_detailaddr"value="${dto.mem_detailaddr }">
								
						</div>
						<div>
							<span>이메일</span>${dto.mem_email } <input type="hidden"
								name="mem_email" value="${dto.mem_email }"><input
								type="button" value="수정" class="rebtn" onclick="mypageEmailUpdate()">
						</div>
						<div>
							<span>전화번호</span>${dto.mem_phone } <input type="hidden"
								name="mem_phone" value="${dto.mem_phone }"><input
								type="button" value="수정" class="rebtn" onclick="mypagePhoneUpdate()">
						</div>
						<div style="text-align: right;">
							<a href="#">[회원탈퇴]</a>
							<!-- memberDeleteForm.do?mem_id=${sessionScope.sid}'  -->
						</div>
					</div>

				</div>
			</div>
			<!--nomalAllWrap-->
		</div>
	</div>
	<%@include file="../_include/footer.jsp"%>
</body>
</html>