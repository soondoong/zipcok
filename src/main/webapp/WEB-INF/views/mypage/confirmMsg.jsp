<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var con_test = confirm(${msg});
if(con_test == true){
  document.write("확인을 누르셨군요");
}
else if(con_test == false){
  document.write("취소를 누르셨군요.");
}
</script>