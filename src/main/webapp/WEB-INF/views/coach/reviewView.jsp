<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
    
    <c:set var="sumReview" value="${resultMap.reviewList.size()}"/>
    
		<p style="font-size:1.9rem; font-weight: 600;">회원님들의 후기</p>
		<p><span><img src="img/coach/star/star5.jpg" style="width:90px; margin:0 20px 0 0;">(후기 ${sumReview})</span></p>
			
			<c:if test="${empty review}">
			<div>작성 된 후기가 없습니다.</div>
			</c:if>
			
			<c:if test="${!empty review}">
			<table  width="800px" cellspacing="0" class="mt-3">
			<tbody>
				<c:forEach var="r" items="${ review }">
					
				<tr>
				<td style="border-top:1px solid lightgray; padding-top:10px;">
				
				<div>
				<div style="position:relative; float:left;"><img src="img/coach/noimg.png" style="width:50px; margin-right:10px;"></div>
				<p style="font-size:1.2rem; font-weight:600; margin:0 0 0 10px;">${r.rev_mem_id }</p>
				<span><img src="img/coach/star/star${r.rev_star }.jpg" style="width:80px; margin:0 20px 0 0;"></span>
				<span style="font-size:0.9rem;">${r.rev_writedate}</span>
				</div>

				</td>
				</tr>
			
				<tr>
				<td><span style="font-size:1rem; font-weight:500;">${r.rev_sub }</span></td>
				</tr>
				<tr>
				<td><p style="font-size:0.9rem;">${r.rev_cont }</p></td>
				</tr>
				
				</c:forEach>
				</tbody>
			</table>
			</c:if>
		
			
			