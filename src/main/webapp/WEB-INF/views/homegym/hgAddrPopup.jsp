<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function addrSend(){
		opener.document.getElementById('faddr').value = document.getElementById('sample4_roadAddress').value;
		opener.document.getElementById('saddr').value = document.getElementById('sample4_detailAddress').value;
		window.close();
	}
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            }
        }).open();
    }
</script>
</head>
<body>
<input type="text" id="sample4_postcode" placeholder="우편번호" readonly="readonly">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly">
<input type="text" id="sample4_detailAddress" placeholder="상세주소">
<input type="button" value = "확인" onclick = "javascript:addrSend();">
<input type="button" value = "취소" onclick = "javascript:window.close();">
</body>
</html>