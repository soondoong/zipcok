<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="./_include/head.jsp" %>
<%@include file="./header2.jsp" %>
	 <!-- ======= Hero Section ======= -->
	 <section id="hero" class="d-flex jumboimg align-items-center" >
	   <div class="container" data-aos="zoom-out" data-aos-delay="100">
	     <h1 class="text-center" style="color:#2a3036;">여러분의 홈짐을 공유하세요.</h1>
	     <p class="herosub text-center"   style="color:#001233">집콕헬스에서는 서로의 홈짐을 공유하고 원하는 운동에 맞는 코치님을 만날 수 있습니다.</p>
	        <p class="text-center"><button class="btn btn-primary btn-lg btn-search" 
	        onclick="location.href='HomeGymList.do' " >홈짐 검색으로</button></p>
	   </div>
	 </section>
	 <!-- End Hero -->
	 
	<section style="display: flex;">
		<div style="width:66%; height: 450px; padding:120px 150px;">
			<strong style="font-size:23px; color:#3c7ab9;">EVERYDAY HAPPY</strong>
			<h2 style="margin-top:15px;line-height: 1.4;">다양한 카테고리의 운동을<br>
			원하는 수업형태의 클래스로 만나보세요!</h2>
			<p style="color:#b6b8c3;margin-top:20px;">필라테스, 맨몸운동, 요가 등 다양한 분야의 코치들과<br>
			상담 후 집, 회사, 공원 등 원하는 장소에서 시작하세요.
			</p>
		</div >
		<div  style="width:34%; padding:70px 30px;">
		<img src="img/main/162.jpg" style="width:300px; height:300px; object-fit:cover; " >
		</div>
	</section>
	
	
	<style>
	.eximgdiv{ display: flex; overflow: hidden;}
	.eximgdiv img{width:290px;}
	</style>
	
		<section >
		<div  class="eximgdiv">
			<img src="img/main/main4.png" >
			<img src="img/main/lp_category_card_gray3x.png" >
			<img src="img/main/lp_category_card_ivory3x.png" >
			<img src="img/main/main1.png"  >
			<img src="img/main/main4.png" >
			<img src="img/main/lp_category_card_gray3x.png" >
		</div>
	</section>
<%@include file="_include/footer.jsp" %>