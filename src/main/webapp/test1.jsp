<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {font-family: Verdana, sans-serif; margin:0 ; }


</style>
<script>
var slideIndex = 1;
showSlides(slideIndex);



</script>
</head>
<body onload = "currentSlide(1)">
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 5</div>
  <img src="img/homegym/homegym_content_덤벨.jpg" style="width:100%">
  <div class="text">1</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 5</div>
  <img src="img/homegym/homegym_content_런닝머신.jpg" style="width:100%">
  <div class="text">2</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 5</div>
  <img src="img/homegym/homegym_content_레그 컬.jpg" style="width:100%">
  <div class="text">3</div>
</div>
<div class="mySlides fade">
  <div class="numbertext">4 / 5</div>
  <img src="img/homegym/homegym_content_렛 풀 다운.jpg" style="width:100%">
  <div class="text">4</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 5</div>
  <img src="img/homegym/homegym_content_스미스 머신.jpg" style="width:100%">
  <div class="text">5</div>
</div>


<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
   <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>
</body>
</html>