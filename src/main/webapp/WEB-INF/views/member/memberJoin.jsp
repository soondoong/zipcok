<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function SetEmailTail(emailValue) {
  var email = document.all("mem_email")    // 사용자 입력
  var emailTail = document.all("mem_email2") // Select box
  
  if ( emailValue == "notSelected" )
   return;
  else if ( emailValue == "etc" ) {
   emailTail.readOnly = false;
   emailTail.value = "";
   emailTail.focus();
  } else {
   emailTail.readOnly = true;
   emailTail.value = emailValue;
  }
 }

function check_pwd(){
	 
    var pw = document.getElementById('mem_pwd').value;


    if(pw.length < 6 || pw.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('mem_pwd').value='';
    }


    if(document.getElementById('mem_pwd').value !='' && document.getElementById('mem_pwd2').value!=''){
        if(document.getElementById('mem_pwd').value==document.getElementById('mem_pwd2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}

</script>
</head>
<body>
<%@include file="../header2.jsp" %>
<br><br><br>
<h2>회원가입</h2>
<hr>
<br>
<h6>기본 정보 입력</h6>
<hr>
<form action="memberJoin.do">
<ul>
	<li><input type="text" name="mem_name" placeholder="이름"></li>
	<li><input type="text" name="mem_birth" placeholder="생년월일 / 예)19940811"></li>
	<li>
	<input type="text" name="mem_id" placeholder="아이디">
	<input type="button" value="중복확인" readonly="readonly"></li>
	<li>
	<input type="password" name="mem_pwd" id="mem_pwd" onchange="check_pwd()" placeholder="비밀번호">
	<label>(비밀번호는 6자 이상 16자 이하로 사용가능합니다.)</label><br>
	<input type="password" name="mem_pwd2" id="mem_pwd2" onchange="check_pwd()" placeholder="비밀번호확인">
	<span id="check"></span>
	</li>
	<li>
	<input type="text" name="mem_email" placeholder="이메일">
    @
	<input type="text" name="mem_email2" ReadOnly="true">
	<select name="emailCheck"
	onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
    <option value="notSelected" >::선택하세요::</option>
    <option value="etc">직접입력</option>
    <option value="naver.com">naver.com</option>
    <option value="nate.com">nate.com</option>
    <option value="hanmail.net">hanmail.net</option>
    <option value="paran.com">paran.com</option>    
    <option value="gmail.com">gmail.com</option>
   </select>
   </li>
   <li>
   <input type="text" name="mem_faddr" placeholder="주소"><input type="button" value="주소찾기">
   <br>
   <input type="text" name="mem_saddr" placeholder="상세주소">
   </li>
   <li>
   <input type="radio" name="mem_sex" value="남자" checked="checked">남자 &nbsp;
   <input type="radio" name="mem_sex" value="여자">여자
   </li>
</ul>
<br>
<h6>휴대전화 인증</h6>
<hr>
<ul>
	<li>
	<input type="text" name="mem_tel" placeholder="예) 01012345678">
	<input type="button" value="인증번호 전송"><br>
	<label>-를 제외한 숫자만 입력해주세요.</label><br>
	<input type="text" name="telok"><input type="button" value="인증">
	</li>
</ul>
<input type="submit" value="회원가입">
</form>
</body>
</html>