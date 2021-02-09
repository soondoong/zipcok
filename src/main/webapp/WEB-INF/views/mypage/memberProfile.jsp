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
.mypage_contents .reupload{position: relative; top:-77px; left:359px; background-color: #b7b7b7; 
font-size:23px; text-align: center; padding:12px;color:white; border-radius: 50%;}
#file{display:none;}
</style>

<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<script>
function mypagePwdUpdate(){
   location.href='mypagePwdUpdateForm.do';
}
function mypageAddrUpdate(){
   window.open('mypageAddrUpdateForm.do?mem_id=${sessionScope.sid}','addrUpdate','width=550,height=300');
}
function mypageEmailUpdate(){
   window.open('mypageEmailUpdateForm.do?mem_id=${sessionScope.sid}','emailUpdate','width=550,height=300');
}
function mypagePhoneUpdate(){
   window.open('mypagePhoneUpdateForm.do?mem_id=${sessionScope.sid}','emailUpdate','width=550,height=300');
}
</script>

</head>
<body>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp"%>
   
   <div class="mypage_wrap">
      <%@include file="./mypageSideMenu.jsp" %>
      
      <div class="mypage_contents">
         <div class="mypage_main">
            <br>
            <div class="profileIMG">
                <img src="/zipcok/upload/member/${cdto.mfile_upload}">
            </div>
            <!-- 프로필사진 수정 -->
            <a href="#" id="a-upload"><i class="fas fa-camera reupload" ></i></a>
         <form id="uploadForm" enctype="multipart/form-data" method="POST" action="moProfileImgReUpload.do">
         <input type="file" id="file" name="upload" onchange="changeValue(this)" accept="image/gif, image/jpeg, image/png"/>
         <input type="hidden" name="id" value="${login.mem_id }">      
         </form>
         <!-- 프로필사진 수정 -->
<script type="text/javascript">
$(function () { //사진수정버튼

         $('#a-upload').click(function (e) {
         e.preventDefault();
         $('#file').click();
          });
});
function changeValue(obj){ //사진선택하면
   var fileValue = $("#file").val().split("\\");
   var fileName = fileValue[fileValue.length-1]; // 파일명
   var result=confirm(fileName+"사진으로 변경하시겠습니까?");
   if(result){      
        $('#uploadForm').submit();
   }
   

}
</script>    
         
            <div>
               <div><b>${sessionScope.sname } 님의 프로필입니다.</b></div>
               <br>
               <div>
                  <label>이름 : ${dto.mem_name }<input type="hidden"
                     name="mem_name" value="${dto.mem_name }"></label>
               </div>
               <div>
                  <label>생년월일 : ${dto.mem_birth }<input type="hidden"
                     name="mem_birth" value="${dto.mem_birth }"></label>
               </div>
               <div>
                  <label>아이디 : ${dto.mem_id }<input type="hidden" name="mem_id"
                     value="${dto.mem_id }"></label>
               </div>
               <div>
                  <label>비밀번호 : ****<input type="hidden" name="mem_pwd"
                     value="${dto.mem_pwd }"></label> <input type="button" value="수정하기" onclick="mypagePwdUpdate()">
               </div>
               <div>
                  <label>주소 : ${dto.mem_addr } ${dto.mem_detailaddr }
                     <input type="hidden" name="mem_zipcode" value="${dto.mem_zipcode }">
                     <input type="hidden" name="mem_addr" value="${dto.mem_addr }">
                     <input type="hidden" name="mem_detailaddr"value="${dto.mem_detailaddr }">
                  </label>
                  <input type="button"value="수정하기" onclick="mypageAddrUpdate()">
               </div>
               <div>
                  <label>이메일 : ${dto.mem_email } <input type="hidden"
                     name="mem_email" value="${dto.mem_email }"></label> <input
                     type="button" value="수정하기" onclick="mypageEmailUpdate()">
               </div>
               <div>
                  <label>전화번호 : ${dto.mem_phone } <input type="hidden"
                     name="mem_phone" value="${dto.mem_phone }"></label> <input
                     type="button" value="수정하기" onclick="mypagePhoneUpdate()">
               </div>
               <div>
                  <a href="#">[회원탈퇴]</a> <!-- memberDeleteForm.do?mem_id=${sessionScope.sid}'  --> 
               </div>
            </div>

         </div>
      </div>
   </div>
   <%@include file="../_include/footer.jsp" %>
</body>
</html>