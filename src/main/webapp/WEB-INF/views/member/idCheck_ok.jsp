<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
window.alert('${msg}');
opener.document.memberJoin.mem_id.value='${mem_id}';
window.self.close();
</script>