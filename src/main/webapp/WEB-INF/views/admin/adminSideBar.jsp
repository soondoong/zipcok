<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">  
<header>
<div class="adminPage_sidebar">
	<nav class="navigation">
		<ul class="mainmenu">
			<li class="adminTitleLi"><b style="font-size: 22px;">메인 관리</b></li>
			<li name="Mng" class="active"><a href="#"><i class="bi bi-people-fill booticon"></i>회원 관리</a>
				<ul class="submenu" >
					<li class="submenuList"><a href="admin_memberList.do">회원 정보 관리</a></li>
					<li class="submenuList"><a href="admin_delMemberList.do">탈퇴 회원</a></li>
				</ul>
			</li>
			<li name="Mng" class="active"><a href="#"><i class="bi bi-chat-dots-fill booticon"></i>코치매칭 관리</a>
				<ul class="submenu" >
					<li class="submenuList"><a href="admin_coachMatchAdmin.do">코치 정보 관리</a></li>
					<li class="submenuList"><a href="admin_coachMatchMatch.do">매칭내역 관리</a></li>
					<li class="submenuList"><a href="admin_coachMatchCancel.do">결제 관리</a></li>
					<li class="submenuList"><a href="admin_coachMatchCommunity.do">커뮤니티 관리</a></li>
				</ul>
			</li>
			<li name="Mng" class="active"><a href="#"><i class="bi bi-house-door-fill booticon"></i>홈짐 관리</a>
				<ul class="submenu">
					<li class="submenuList"><a href="admin_homeGymAdmin.do">홈짐 정보 관리</a></li>
					<li class="submenuList"><a href="admin_homeGymReservation.do">예약 조회</a></li>
				</ul>
			</li>		
			<li class="adminTitleLi"><b style="font-size: 22px;margin-top:20px; ">통계 관리</b></li>
			<li name="Mng" class="active"><a href="#"><i class="bi bi-graph-up booticon"></i>매출 통계</a>
				<ul class="submenu">
					<li class="submenuList"><a href="admin_statHomegymSales.do">홈짐 매출 통계</a></li>
					<li class="submenuList"><a href="admin_statCoachSales.do">코치 매출 통계</a></li>
				</ul>
			</li>
			<li name="Mng" class="active" ><a href="#"><i class="bi bi-journal-arrow-up booticon"></i>등록자 통계</a>
				<ul class="submenu" >
					<li class="submenuList"><a href="admin_statMemberRegist.do">회원 등록 통계</a></li>
					<li class="submenuList"><a href="admin_statCoachRegist.do">코치 등록 통계</a></li>
					<li class="submenuList"><a href="admin_statHomegymRegist.do">홈짐 등록 통계</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>
<script>
$("li[name='Mng']").on('click',function(e){
	
	if($(this).hasClass('active')){
		$(this).removeClass('active');		
	}else{	
		$(this).addClass('active');		
	}
	
});

</script>
</header>