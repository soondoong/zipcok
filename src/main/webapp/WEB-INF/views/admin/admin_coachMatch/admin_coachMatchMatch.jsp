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
        	 
        	 html+="<tr>";
        	 html += "<td><a href='#' onclick='chating("+data.reqMemList[i].req_idx+")'>"+data.reqMemList[i].req_idx+"</a></td>";
        	 html += "<td>"+data.reqMemList[i].mem_name+"</td>";
        	 html += "<td>"+data.reqMemList[i].mem_id+"</td>";
        	 html += "<td>"+data.reqMemList[i].mem_phone+"</td>";
        	 html += "<td>"+data.reqMemList[i].mem_email+"</td>";
        	 html += "<td>"+data.reqMemList[i].req_date+"</td>";
        	 html += "<td>"+data.reqMemList[i].req_status+"</td>";
        	 html += "</tr>";
        
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
							<th>요청서번호</th>
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
					<h3 style="margin-top:50px;">채팅방 메세지내역</h3>
			
				</div>	
				<div style="display:flex; justify-content:space-between; align-items: middle;"> 
					<h5>채팅방 번호:&nbsp;<span id="chatnum"></span></h5>
					<h5>상담요청서 번호:&nbsp;<span id="reqnum"></span></h5>
					<div style="display: flex; justify-content: flex-end;">
					<p style="font-size:17px;"><span style="margin-right:20px;">총 메시지:</span><b id="summsg">0</b><span>건</span></p>
					<p style="font-size:17px;"><span style="margin:0 20px;">총 결제요청서:</span><b id="sumpdcnt">0</b><span>건</span></p>
					<select name="sunseo" style="width:150px; margin:0 0 15px 15px;"onchange="sunseoChange()">
							<option>최신순
							<option>오래된순
						</select>
					</div>
				</div>
				<table  align="center" class="table table-hover" id ="pdtable">
					<thead>
						<tr>
							<th>메시지번호</th>
							<th>보낸이아이디</th>
							<th>받는이아이디</th>
							<th>내용</th>
							<th>전송일</th>
							<th>타입</th>
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

   function sunseoChange(){
	   
	   var reqidx = $('#reqnum').text();
	   chating(reqidx);
   }
   
   
   
   
   
   
   
   
   
   
   /*요청서번호 클릭시*/
   function chating(reqidx){
	   var sunseo = $("select[name='sunseo']").val() ;

	   $.ajax({
		    type : 'post',
		    url : 'searchMessages.do',
		    data :{

               'req_idx' : reqidx,
               'sunseo' : sunseo
           

        },

		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    error: function(xhr, status, error){
		      
		    },
		    success : function(data){  
		    	if(data.MsgList.length<=0){
		    		$('#pdTbody').html('');
		    			$('#pdTbody').append("<tr><td colspan='7'>검색 된 메시지가 없습니다.</td></tr>");
		    	}else{
					    		$('#pdTbody').html('');
					    		$('#chatnum').text(data.MsgList[0].msg_croom_idx);
					    		$('#reqnum').text(data.MsgList[0].msg_req_idx); 
					    	 	var summsg = 0; //총 메시지 수
						    	var sumpdcnt = 0; //총결제요청서 수
									for(var i = 0; i<data.MsgList.length; i++){
										
										$('#pdTbody').append("<tr>"+
												"<td>"+data.MsgList[i].msg_idx+"</td>"+
												"<td>"+data.MsgList[i].msg_sender+"</td>"+
												"<td>"+data.MsgList[i].msg_receiver+"</td>"+
												"<td>"+data.MsgList[i].msg_content+"</td>"+
												"<td>"+data.MsgList[i].msg_sendtime+"</td>"+
												"<td>"+data.MsgList[i].msg_type+"</td>"+
												"<tr>");
											summsg ++;
											if(data.MsgList[i].msg_type=='결제요청서'){
												sumpdcnt++;
											}
									}
							
							$('#summsg').text(summsg);
							$('#sumpdcnt').text(sumpdcnt);
						    /*페이징추가*/
						    $('.pdpaging').html('');
				  			var cpage=data.pageStr;
				  			$('#pdtable').after('<div class="paging pdpaging">'+cpage+'</div>');
					      
						        
		    	}
		    	
		    
		    }
	

		});
	   
	   
   }
   
   
   
   
   
   function msgpageclick(temp){  //temp는 cp값
		
	   var sunseo = $("select[name='sunseo']").val() ;
	   var reqidx = $('#reqnum').text();
		
		
	   $.ajax({
		    type : 'post',
		    url : 'searchMessages.do',
		    data :{

              'req_idx' : reqidx,
              'sunseo' : sunseo,
          		'cp' : temp

       },

		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    error: function(xhr, status, error){
		      
		    },
		    success : function(data){  
		    	if(data.MsgList.length<=0){
		    		$('#pdTbody').html('');
		    			$('#pdTbody').append("<tr><td colspan='7'>검색 된 메시지가 없습니다.</td></tr>");
		    	}else{
					    		$('#pdTbody').html('');
					    		$('#chatnum').text(data.MsgList[0].msg_croom_idx);
					    		$('#reqnum').text(data.MsgList[0].msg_req_idx); 
					    	 	var summsg = 0; //총 메시지 수
						    	var sumpdcnt = 0; //총결제요청서 수
									for(var i = 0; i<data.MsgList.length; i++){
										
										$('#pdTbody').append("<tr>"+
												"<td>"+data.MsgList[i].msg_idx+"</td>"+
												"<td>"+data.MsgList[i].msg_sender+"</td>"+
												"<td>"+data.MsgList[i].msg_receiver+"</td>"+
												"<td>"+data.MsgList[i].msg_content+"</td>"+
												"<td>"+data.MsgList[i].msg_sendtime+"</td>"+
												"<td>"+data.MsgList[i].msg_type+"</td>"+
												"<tr>");
											summsg ++;
											if(data.MsgList[i].msg_type=='결제요청서'){
												sumpdcnt++;
											}
									}
							
							$('#summsg').text(summsg);
							$('#sumpdcnt').text(sumpdcnt);
						    /*페이징추가*/
						    $('.pdpaging').html('');
				  			var cpage=data.pageStr;
				  			$('#pdtable').after('<div class="paging pdpaging">'+cpage+'</div>');
					      
						        
		    	}
		    	
		    
		    }
	

		});
		   
		  
 } 
   
   
   
   
   
   
   

   </script>
<%@include file="../../_include/footer.jsp" %>