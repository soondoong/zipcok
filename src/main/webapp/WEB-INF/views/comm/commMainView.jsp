<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/comm/commDailyMainLayout.css">
</head>
<body>
<c:set var="coach_name" value="${coach_name}"></c:set>
<%@include file="../header2.jsp" %>

	<style>
			.community_wrap {display: flex; min-height: calc(100vh - 92px);}
			.community_wrap .community_sidebar {flex: 0 0 250px; background-color: #ccc;}
			.community_wrap .community_sidebar ul {padding: 0; margin:  0;}
			.community_wrap .community_sidebar ul li.sidemenuli a {display: block; color: #000; padding: 8px 15px 8px 15px; font-weight: bold;}
			.community_wrap .community_sidebar ul li.sidemenuli a.comm {background-color: tomato; color: #fff;}
			.community_wrap .community_sidebar ul li.sidemenuli a:hover:not(.comm) {background-color: #333; color: #fff;}
			.community_wrap .com_main {display: block;}
			.community_wrap .com_main .com_top {background-color: #ccc; height: 150px; padding: 15px;}
			.cal_top{text-align: center; font-size: 30px;}
			.cal{text-align: center;}
			
			.day{width:100px; height:30px; font-weight: bold; font-size:15px; font-weight:bold;	text-align: center;}
			.sat{color:#529dbc;}
			.sun{color:red;}
			.today_button_div{float: right;}
			.today_button{width: 100px; height:30px;}
			.calendar{width:80%; margin:auto;}
			.navigation{margin-top:100px; margin-bottom:30px; text-align: center; font-size: 25px; vertical-align: middle;}
			.calendar_body{width:100%; background-color: #FFFFFF; border:1px solid white; margin-bottom: 50px; border-collapse: collapse;}
			.calendar_body .today{border:1px solid white; height:120px;	background-color:#c9c9c9; text-align: left; vertical-align: top;}
			.calendar_body .date{font-weight: bold; font-size: 15px; padding-left: 3px;	padding-top: 3px;}
			.calendar_body .sat_day{border:1px solid white;	height:120px; background-color:#EFEFEF;	text-align:left; vertical-align: top;}
			.calendar_body .sat_day .sat{color: #529dbc; font-weight: bold; font-size: 15px; padding-left: 3px; padding-top: 3px; }
			.calendar_body .sun_day{border:1px solid white; height:120px; background-color:#EFEFEF; text-align: left; vertical-align: top;}
			.calendar_body .sun_day .sun{color: red; font-weight: bold; font-size: 15px; padding-left: 3px; padding-top: 3px; }
			.calendar_body .normal_day{border:1px solid white; height:120px; background-color:#EFEFEF; vertical-align: top; text-align: left;}
			.before_after_month{margin: 10px; font-weight: bold;}
			.before_after_year{font-weight: bold;}
			.this_month{margin: 10px;}
	</style>	

	<div class="community_wrap">
	<%@include file="./commSideMenu.jsp" %>
		<div class="com_main">
			<div class="com_top">
			<h1>${com_name}</h1>
			<h3>코치 : ${coach_name} 코치</h3>
			<c:set var="dto" value="${recentCnt}" />
			</div>
			
			
			<!-- <div class="calendar">
				<div class="cal_top">
		        	<a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
		       		<span id="cal_top_year"></span>
		       		<span id="cal_top_month"></span>
		        	<a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
			    </div>
			    <div id="cal_tab" class="cal">
			    </div>
			</div> -->
			
			<div class="calendar" >

				<!--날짜 네비게이션  -->
				<div class="navigation">
					<a class="before_after_year" href="commMain.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}&com_idx=${com_idx}">
						&lt;&lt;
					<!-- 이전해 -->
					</a> 
					<a class="before_after_month" href="commMain.do?year=${today_info.before_year}&month=${today_info.before_month}&com_idx=${com_idx}">
						&lt;
					<!-- 이전달 -->
					</a> 
					<span class="this_month">
						&nbsp;${today_info.search_year}. 
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span>
					<a class="before_after_month" href="commMain.do?year=${today_info.after_year}&month=${today_info.after_month}&com_idx=${com_idx}">
					<!-- 다음달 -->
						&gt;
					</a> 
					<a class="before_after_year" href="commMain.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}&com_idx=${com_idx}">
						<!-- 다음해 -->
						&gt;&gt;
					</a>
				</div>
			
			<!-- <div class="today_button_div"> -->
			<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
			<!-- </div> -->
			<table class="calendar_body">
			
			<thead>
				<tr bgcolor="#CECECE">
					<td class="day sun" >
						일
					</td>
					<td class="day" >
						월
					</td>
					<td class="day" >
						화
					</td>
					<td class="day" >
						수
					</td>
					<td class="day" >
						목
					</td>
					<td class="day" >
						금
					</td>
					<td class="day sat" >
						토
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
						<c:choose>
							<c:when test="${dateList.value=='today' and date_status.index%7!=0}">
								<td class="today">
									<div>
										<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
											<c:forEach var="dto4" items="${getDayGroup}" begin="0" end="1">
												<c:if test="${datetest eq dto4}">
												 운동함
												</c:if>
											</c:forEach>
									</div>
									<div class="date">
										${dateList.date}
									</div>
									<div class="todayContent">
										<c:choose>
											<c:when test="${dateList.month eq 1 }">
												<c:set var="monthtest" value="0${dateList.month+1}" />
											</c:when>
										</c:choose>
											
										<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
										<c:forEach var="dto2" items="${dayContent}">
											<c:if test="${dto2.ex_writedate eq datetest}">
												<a href="commDailyContent.do?ex_idx=${dto2.ex_idx}">${dto2.ex_name}/${dto2.ex_cal }cal</a>
											</c:if>
										</c:forEach>
									</div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div>
										<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
											<c:forEach var="dto4" items="${getDayGroup}" begin="0" end="1">
												<c:if test="${datetest eq dto4}">
												 운동함
												</c:if>
											</c:forEach>
									</div>
									
									<div class="sat">
										${dateList.date}
									</div>
									<div>
										<c:choose>
											<c:when test="${dateList.month eq 1 }">
												<c:set var="monthtest" value="0${dateList.month+1}" />
											</c:when>
										</c:choose>
											
										<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
										<c:forEach var="dto2" items="${dayContent}">
											<c:if test="${dto2.ex_writedate eq datetest}">
												<a href="commDailyContent.do?ex_idx=${dto2.ex_idx}">${dto2.ex_name}/${dto2.ex_cal }cal</a>
											</c:if>
										</c:forEach>
									</div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==0}">
								</tr>
								<tr>	
									<td class="sun_day">
										<div>
										<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
											<c:forEach var="dto4" items="${getDayGroup}">
												<c:if test="${datetest eq dto4}">
												 운동함
												</c:if>
											</c:forEach>
										</div>
										
										<div class="sun">
											${dateList.date}
										</div>
										
										<div>
											<c:choose>
											<c:when test="${dateList.month eq 1 }">
												<c:set var="monthtest" value="0${dateList.month+1}" />
											</c:when>
											</c:choose>
											<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
											<c:forEach var="dto2" items="${dayContent}">
												<c:if test="${dto2.ex_writedate eq datetest}">
													<a href="commDailyContent.do?ex_idx=${dto2.ex_idx}">${dto2.ex_name}/${dto2.ex_cal }cal</a>
												</c:if>
											</c:forEach>
										</div>
									</td>
							</c:when>
							<c:when test="${date_status.index%7==0 and dateList.value=='today'}">
								</tr>
								<tr>	
									<td class="today">
										<div>
										<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
											<c:forEach var="dto4" items="${getDayGroup}" begin="0" end="1">
												<c:if test="${datetest eq dto4}">
												 운동함
												</c:if>
											</c:forEach>
										</div>
										<div class="date">
											${dateList.date}
										</div>
										<div>
											<c:choose>
											<c:when test="${dateList.month eq 1 }">
												<c:set var="monthtest" value="0${dateList.month+1}" />
											</c:when>
											</c:choose>
											<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
											<c:forEach var="dto2" items="${dayContent}">
												<c:if test="${dto2.ex_writedate eq datetest}">
													<a href="commDailyContent.do?ex_idx=${dto2.ex_idx}">${dto2.ex_name}/${dto2.ex_cal }cal</a>
												</c:if>
											</c:forEach>
										</div>
									</td>
							</c:when>
							<c:otherwise>
								<td class="normal_day">
									<div>
										<c:set var="datetest" value="${dateList.year}-${monthtest}-${dateList.date}" />
											<c:forEach var="dto4" items="${getDayGroup}" begin="0" end="1">
												<c:if test="${datetest eq dto4}">
												 운동함
												</c:if>
											</c:forEach>
									</div>
									<div class="date">
										${dateList.date}
									</div>
									<div>
										<c:choose>
											<c:when test="${dateList.month eq 1 }">
												<c:set var="monthtest" value="0${dateList.month+1}" />
											</c:when>
										</c:choose>
										
										<c:forEach var="dto2" items="${dayContent}">
											<c:if test="${dto2.ex_writedate eq datetest}">
												<a href="commDailyContent.do?ex_idx=${dto2.ex_idx}">${dto2.ex_name}/${dto2.ex_cal }cal</a>
											</c:if>
										</c:forEach>	
									</div>
								</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tbody>
			</table>
			</div>
			
			
			<h3>함께 운동을 하는 운동 메이트들입니다!!</h3>
			<div class="commMember_Wrap">
				<div class="commMember_List">
					<c:forEach var="commMember" items="${memberlist}">
						<div class="member">
							<div class="member_pic">
								<img src="/zipcok/upload/member/${commMember.mfile_upload}" style="width:10%;">
							</div>
							<div class="member_name">
								${commMember.mem_name}
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>


</body>
</html>