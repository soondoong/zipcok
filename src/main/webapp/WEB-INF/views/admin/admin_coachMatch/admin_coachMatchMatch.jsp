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
h3{margin-bottom:30px;}
a{cursor:pointer;}
.paging {margin: 40px 0 0; text-align: center;}
.paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
</style>		
		
   <div class="adminPage_wrap">
     <%@include file="../adminSideBar.jsp"%>
      <div class="container adminPage_contents">
         <div class="adminPage_main">
			<div><!-- 검색하는 부분 div -->
				<form action="#">
					<div>
						<h3 >코치매칭 상담내역 관리</h3>
					</div>
					
					<div>
						
						<ul class="test-inline">
							<li class="srchtitle">코치아이디</li>
							<li><input type="text" placeholder="아이디 입력" id="searchId" ></li>
							<li><input type="button" value="검색" onclick="show('','');"  id="searchbtn" class="btn btn-primary"></li>
						</ul>
					</div>
				</form>
			</div>
			
			
			<div><!-- 코치의 매칭된 회원내역  테이블 div -->
				<div>
					<h5 >회원 상담내역</h5>
				</div>
				<table  align="center" class="table table-hover" >
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
						<tr>
							<td colspan="7">검색 된 게시글이 없습니다.</td>												
						</tr>
					</tbody>
				</table>
				<div id="pagingpaging">
				</div>
				<hr>
			</div>
			<div><!-- 코치의 매칭된 회원 거래내역  테이블 div -->
		
			
			
				<div>
					<h3 style="margin-top:50px;">코치매칭 거래내역</h3>
						<div>
						
						<ul class="test-inline">
							<li class="srchtitle">코치아이디</li>
							<li><input type="text" placeholder="아이디 입력" id="searchPdId"></li>
							<li><input type="button" value="검색" id="searchPdbtn"  class="btn btn-primary"></li>
						</ul>
					</div>
					
				</div>	
				<div style="display:flex; justify-content:space-between;"> 
					<h5>매칭 결제내역</h5>
					<div style="display: flex; justify-content: flex-end;">
					<p style="font-size:17px;"><span style="margin-right:20px;">총 거래내역:</span><b id="sumpdcnt">0</b><span>건</span></p>
					<p style="font-size:17px;"><span style="margin:0 20px;">총 매출:</span><b id="sumprice">0</b><span>원</span></p>
					</div>
				</div>
				<table  align="center" class="table table-hover" id ="pdtable">
					<thead>
						<tr>
							<th>결제번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>결제일</th>
							<th>결제방법</th>
							<th>결제금액(원)</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody id="pdTbody">
						<tr>
							<td colspan="7">검색 된 게시글이 없습니다.</td>												
						</tr>
					</tbody>
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
   
   /*수연기능*/
   
     function Pdpageclick(temp){  //temp는 cp값
	
		  var id=$('#searchPdId').val();

			$.ajax({
			    type : 'post',
			    url : 'searchPdByid.do',
			    data :{

	                'mem_id' : id,
	            		'cp':temp

	         },

			    contentType : "application/x-www-form-urlencoded; charset=utf-8",
			    dataType : "json",
			    error: function(xhr, status, error){
			        alert(error);
			    },
			    success : function(data){  
			    	if(data.pdList.length<=0){
			    		$('#pdTbody').html('');
			    			$('#pdTbody').append("<tr><td colspan='7'>검색 된 게시글이 없습니다.</td></tr>");
			    	}else{
						    		$('#pdTbody').html('');
							    	var sumprice = 0; //총매출수
							    	var sumpdcnt = 0; //총내역수
										for(var i = 0; i<data.pdList.length; i++){
											
											$('#pdTbody').append("<tr>"+
													"<td>"+data.pdList[i].pd_idx+"</td>"+
													"<td>"+data.pdList[i].mem_name+"</td>"+
													"<td>"+data.pdList[i].pd_mem_id+"</td>"+
													"<td>"+data.pdList[i].pd_payment_date+"</td>"+
													"<td>"+data.pdList[i].pd_method+"</td>"+
													"<td>"+data.pdList[i].pd_price+"</td>"+
													"<td>"+data.pdList[i].pd_status+"</td>"+				
													"<tr>");
											 if(data.pdList[i].pd_status == '결제완료'){	
												sumprice +=Number(data.pdList[i].pd_price);
											 }
											 sumpdcnt++;
										}
								
								$('#sumprice').text(sumprice);
								$('#sumpdcnt').text(sumpdcnt);
							    /*페이징추가*/
							    $('.pdpaging').html('');
					  			var cpage=data.pageStr;
					  			$('#pdtable').after('<div class="paging pdpaging">'+cpage+'</div>');
						      
							        
			    	}
			    	
			    
			    }
		

			});
		   
		  
	  } 
   
   
   /*페이지에서검색시*/
   $('#searchPdbtn').on('click',function(){
	  var id=$('#searchPdId').val();

		$.ajax({
		    type : 'post',
		    url : 'searchPdByid.do',
		    data :{

                'mem_id' : id
            

         },

		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    error: function(xhr, status, error){
		        alert(error);
		    },
		    success : function(data){  
		    	if(data.pdList.length<=0){
		    		$('#pdTbody').html('');
		    			$('#pdTbody').append("<tr><td colspan='7'>검색 된 게시글이 없습니다.</td></tr>");
		    	}else{
					    		$('#pdTbody').html('');
					    	 	var sumprice = 0; //총매출수
						    	var sumpdcnt = 0; //총내역수
									for(var i = 0; i<data.pdList.length; i++){
										
										$('#pdTbody').append("<tr>"+
												"<td>"+data.pdList[i].pd_idx+"</td>"+
												"<td>"+data.pdList[i].mem_name+"</td>"+
												"<td>"+data.pdList[i].pd_mem_id+"</td>"+
												"<td>"+data.pdList[i].pd_payment_date+"</td>"+
												"<td>"+data.pdList[i].pd_method+"</td>"+
												"<td>"+data.pdList[i].pd_price+"</td>"+
												"<td>"+data.pdList[i].pd_status+"</td>"+				
												"<tr>");
										
										 if(data.pdList[i].pd_status == '결제완료'){	
												sumprice +=Number(data.pdList[i].pd_price);
											 }
										sumpdcnt++;
									}
							
									$('#sumprice').text(sumprice);
									$('#sumpdcnt').text(sumpdcnt);
						    /*페이징추가*/
						    $('.pdpaging').html('');
				  			var cpage=data.pageStr;
				  			$('#pdtable').after('<div class="paging pdpaging">'+cpage+'</div>');
					      
						        
		    	}
		    	
		    
		    }
	

		});
	   
   })
   
   
   </script>
<%@include file="../../_include/footer.jsp" %>