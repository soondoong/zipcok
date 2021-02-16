<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/admin.css" rel="stylesheet">
<style type="text/css">
.test-inline { display: flex;}
</style>
</head>
<body>
<%@include file="../../header2.jsp" %>
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
							<li>성별</li>
							<li><select><option>남자</option></select></li>
							<li>지역</li>
							<li><select><option>강서구</option></select></li>
						</ul>
					</div>
					<div>
						<ul class="test-inline">
							<li>코치 검색</li>
							<li><select><option>회원번호</option></select></li>
							<li><input type="text" ></li>
							<li><input type="button" value="검색"></li>
						</ul>
					</div>
				</form>
			</div>
			<div>
				<ul>
					<li>총 코치수: </li>
					<li>검색 코치수: </li>
				</ul>
			</div>
			<div><!-- 검색결과  테이블 div -->
				<table  align="center" class="table table-hover">
					<thead>
						<tr>
							<th>코치번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>카테고리</th>
							<th>이메일</th>
							<th>관리 회원 수</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>구병모</td>
							<td><a href="javascript:show();">son123</a></td>
							<td>123456789</td>
							<td>a@naver.com</td>
							<td>50</td>
							<td>2021.01.12</td>
							<td>2021.01.21</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8">페이징 들어갈 자리</td>
						</tr>
					</tfoot>
				</table>
				<hr>
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
					<script src="js/httpRequest.js"></script>
					<script>
					function show(){
						var params='req_receive_id=son123';
						sendRequest('coachMatchingMemInfo.do',params,showResult,'GET');
					}
					function showResult(){
					   if(XHR.readyState==4){
					      if(XHR.status==200){
					         var data=XHR.responseText;
					         data=eval('('+data+')');
					         window.alert(data.memList.length);
					         //리셋해주기
					         var html='';
					         	
					         for(var i=0;i<data.reqList.length;i++){
					        	 
					        	 html+='<tr>';
					        	 html += '<td>'+data.reqList[i].req_idx+'</td>';
					        	 html += '<td>'+data.memList[i].mem_name+'</td>';
					        	 html += '<td>'+data.memList[i].mem_id+'</td>';
					        	 html += '<td>'+data.memList[i].mem_phone+'</td>';
					        	 html += '<td>'+data.memList[i].mem_email+'</td>';
					        	 html += '<td>'+data.reqList[i].req_date+'</td>';
					        	 html += '<td>'+data.reqList[i].req_status+'</td>';
					        	 html += '</tr>';
					        	 
					        	 
					        	 
					        	 /*
					        	 $('#matchtBody').write('<tr>'+
					        	 '<td>'+data.reqList[i].req_idx+'</td>'+
					        	 '<td>'+data.memList[i].mem_name+'</td>'+
					        	 '<td>'+data.memList[i].mem_id+'</td>'+
					        	 '<td>'+data.memList[i].mem_phone+'</td>'+
					        	 '<td>'+data.memList[i].mem_email+'</td>'+
					        	 '<td>'+data.reqList[i].req_date+'</td>'+
					        	 '<td>'+data.reqList[i].req_status+'</td>'+
					        	 
					        	 '</tr>');*/
					        	 
					        	 
					        	 
					        	 
					        	/*document.getElementById('req_number').innerHTML=data.reqList[i].req_idx;
					        	document.getElementById('memba_name').innerHTML=data.memList[i].mem_name;
					        	document.getElementById('memba_id').innerHTML=data.memList[i].mem_id;
					        	document.getElementById('memba_phone').innerHTML=data.memList[i].mem_phone;
					        	document.getElementById('memba_email').innerHTML=data.memList[i].mem_email;
					        	document.getElementById('req_callDate').innerHTML=data.ReqList[i].req_idx;
					        	document.getElementById('req_statNow').innerHTML=data.ReqList[i].req_idx;
					        	 */
					         }
					         $('#matchtBody').empty();
					         $('#matchtBody').append(html);
					         
					      }
					   }
					}

					</script>
					<tbody id="matchtBody">
						 <tr>
							<td id="req_number">1</td>
							<td id="memba_name">박수연</td>
							<td id="memba_id">soo</td>
							<td id="memba_phone">123456789</td>
							<td id="memba_email">a@naver.com</td>
							<td id="req_callDate">2021.01.21</td>
							<td id="req_statNow">상담중</td> <!-- 대기중 상담중 결제완료-->
						</tr> 
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7">페이징 들어갈 자리</td>
						</tr>
					</tfoot>
				</table>
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
<%@include file="../../_include/footer.jsp" %>