<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<script src="js/httpRequest.js"></script>
<style type="text/css">
.test-inline { display: flex;}
.pagingSP {margin: 40px 0 0; text-align: center;}
.pagingSP a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
</style>
</head>
<body>
<%@include file="../../header2.jsp" %>
<script>
function show(id,str){/*cp값, id값 으로 ajax 에 요청함*/
if(id ==null || id ==''){
	id=$('#searchId').val();
}
	  /*cp정의*/
	  var cp=str;
	  if(str==null || str == ''){
		  cp=1;
	  }
	  var params='req_receive_id='+id+'&cp='+cp;
		sendRequest('coachMatchingMemInfo.do',params,showResult,'GET');
}	  
			
		
		
function showResult(){/*꼰트롤러에서 받은 데이터들을 가져와서 테이블,페이징 생성함(지웠다가 다시 만들고)*/
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;
         data=eval('('+data+')');
         //리셋해주기
         if(data.reqMemList.length<=0){
        	$('.pagingSP').empty();
           	$('#matchtBody').html('');
               	$('#matchtBody').append("<tr><td colspan='7'>검색 된 게시글이 없습니다.</td></tr>");
            }else{
         var html='';
         for(var i=0;i<data.reqMemList.length;i++){
        	 
        	 html+='<tr>';
        	 html += '<td>'+data.reqMemList[i].req_idx+'</td>';
        	 html += '<td>'+data.reqMemList[i].mem_name+'</td>';
        	 html += '<td>'+data.reqMemList[i].mem_id+'</td>';
        	 html += '<td>'+data.reqMemList[i].mem_phone+'</td>';
        	 html += '<td>'+data.reqMemList[i].mem_email+'</td>';
        	 html += '<td>'+data.reqMemList[i].req_date+'</td>';
        	 html += '<td>'+data.reqMemList[i].req_status+'</td>';
        	 html += '</tr>';
        
         }
         
         $('#matchtBody').empty();
         $('#matchtBody').append(html);
         /*페이징추가*/
 			$('.pagingSP').empty();
 			var cpage=data.pageStr;
 			$('#pagingpaging').append('<div class="pagingSP">'+cpage+"</div>");
        }
      }
   }
}
</script>
<style>
		.table { border-spacing: ''; table-layout: auto; text-align: center;} 
		.table th{font-weight: bold; border-color:#848282;}
		a{cursor:pointer;}
</style>		
		
   <div class="adminPage_wrap">
     <%@include file="../adminSideBar.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
			<div><!-- 검색하는 부분 div -->
				<form action="#">
					<div>
						<h5>[코치매칭 내역 관리]</h5>
					</div>
					
					<div>
						<ul class="test-inline">
							<li>코치 검색</li>
							<li>아이디</li>
							<li><input type="text" id="searchId" ></li>
							<li><input type="button" value="검색" onclick="show('','');"></li>
						</ul>
					</div>
				</form>
			</div>
			
			
			<div><!-- 코치의 매칭된 회원내역  테이블 div -->
				<div>
					<h5>회원 상담내역</h5>
				</div>
				<table  align="center" class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>휴대폰번호</th>
							<th>이메일</th>
							<th>요청일</th>
							<th>상태</th>
						</tr>
					</thead>
					
		
					<tbody id="matchtBody">
					</tbody>
				</table>
				<div id="pagingpaging">
				</div>
				<hr>
			</div>
			<div><!-- 코치의 매칭된 회원 거래내역  테이블 div -->
				<div>
					<h5>구병모 코치 매칭 회원 거래내역</h5>
				</div>	
				<table   align="center" class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>소속 커뮤니티</th>
							<th>결제일</th>
							<th>가입일</th>
							<th>결제방법/번호</th>
							<th>결제금액</th>
							<th>상태</th>
							<th>영수증</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>구병모</td>
							<td>qudah123</td>
							<td>커뮤니티1</td>
							<td>2021.01.12</td>
							<td>2021.01.21</td>
							<td>신용카드/123</td>
							<td>50,000원</td>
							<td>대기중</td>
							<td><input type="button" value="영수증"></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="10">페이징 들어갈 자리</td>
						</tr>
					</tfoot>
				</table>
				<hr>
			</div>
         </div>
      </div>
   </div>
   <script>
   /*ajax로검색된 div내의 페이지를 클릭하면 호출되는 함수*/
	  function pageclick(temp){  //temp는 cp값
		var id=$('#searchId').val();
		  show(id,temp);
	  } 
   </script>
<%@include file="../../_include/footer.jsp" %>