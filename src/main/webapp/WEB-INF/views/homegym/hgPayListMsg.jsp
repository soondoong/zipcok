<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if(${pd_result}>0 && ${reser_result}>0){

		window.alert('결제가 정상적으로 처리되었습니다.\n자세한 주소 정보는 결제 내역에서 확인 가능합니다.');

		location.href='${goPage}';	
	}
</script>