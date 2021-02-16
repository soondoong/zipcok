<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${check}'=='true'){
		location.href = '${goPage}';
	}else if('${check}'=='false'){
		window.alert('등록된 홈짐이 없습니다.')
		location.href='${goPage}';
	}
</script>