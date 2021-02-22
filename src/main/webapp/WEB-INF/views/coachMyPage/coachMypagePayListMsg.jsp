<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
window.alert('${msg}');
location.href='${gourl}';
window.self.close();
opener.location.reload();
</script>