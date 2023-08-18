<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<%@ include file="../Product/sexyheader.jsp" %>
<style>
#app{
	widows: 100%
}
#container{
  text-align: center; 
	width: auto;
	height: 1200px;
	
}
img.topimg{
margin-top:50px; 
    vertical-align: middle;
	width:auto;
	height: 800px;

}
 nav{
	widows: 1800px;
	height: 1500px;
	margin-bottom: 50px;

}
nav1{
	widows: 1800px;
	height: 800px;
	margin-bottom: 50px;

}

nav2{
widows: 1800px;
	height: 1800px;
	margin-bottom: 50px;
}

.sect2 {
margin :  0px auto;
	width: 1800px;
	height: 1500px;
	background: #f0f0f0;
}

.sect2 h2 {
	text-align: center;
	height: 102px;
	padding: 56px 0 56px 0;
	box-sizing: border-box;
}

.sect2 div {
	width: 307px;
	height: 438px;
	float: left;
	margin: 50px 39px 0 0;
	background: #F00;
	position: relative;
	overflow: hidden;
	
}

.sect2 div a {
	width: 307px;
	height: 438px;
	opacity: 0;
	color: #fff;
	font-size: 30pt;
	font-family: arial;
	font-weight: 550;
	position: absolute;
	top: 0;
	left: 0;
	padding-top: 85px;
	padding-left: 105px;
	box-sizing: border-box;
}


/*new item*/
.sect2 .Sbox1 {
	margin-left: 272px;
	background: url(img/homeimg/seson1.jpg);
}

.sect2 .Sbox2 {
	background: url(img/homeimg/seson2.jpg);
}

.sect2 .Sbox3 {
	background: url(img/homeimg/seson3.jpg);
}

.sect2 .Sbox4 {
	background: url(img/homeimg/seson4.jpg);
}
.sect2 .Sbox5 {
	margin-left: 272px;
	background: url(img/homeimg/seson1.jpg);
}

.sect2 .Sbox6 {
	background: url(img/homeimg/seson2.jpg);
}

.sect2 .Sbox7 {
	background: url(img/homeimg/seson3.jpg);
}

.sect2 .Sbox8 {
	background: url(img/homeimg/seson4.jpg);
}

.sect2 .Sbox1:hover {
	background: url(img/homeimg/seson1_hover.jpg);
}

.sect2 .Sbox2:hover {
	background: url(img/homeimg/seson2_hover.jpg);
}

.sect2 .Sbox3:hover {
	background: url(img/homeimg/seson3_hover.jpg);
}

.sect2 .Sbox4:hover {
	background: url(img/homeimg/seson4_hover.jpg);
}
.sect2 .Sbox5:hover {
	background: url(img/homeimg/seson1_hover.jpg);
}

.sect2 .Sbox6:hover {
	background: url(img/homeimg/seson2_hover.jpg);
}

.sect2 .Sbox7:hover {
	background: url(img/homeimg/seson3_hover.jpg);
}

.sect2 .Sbox8:hover {
	background: url(img/homeimg/seson4_hover.jpg);
}

.sect2 div:hover a {
	opacity: 1;
}


.sect3 {
margin :  0px auto;
	width: 1800px;
	height: 681px;
	background: #d0d0d0;

}
.sect3 h2 {
	text-align: center;
	height: 102px;
	padding: 56px 0 56px 0;
	box-sizing: border-box;
}
.sect3 ul.sale {
    display: flex; /* 가로 배치를 위해 Flexbox 사용 */
    
    padding: 100px; /* 기본 패딩 제거 */
}

.sect3 ul.sale li {
    flex: 1; /* 요소들의 가로 공간을 균등하게 나눔 */
    list-style: none; /* 기본 리스트 스타일 제거 */
    margin: 50px; /* 기본 마진 제거 */
    padding: 10px; /* 내부 여백 설정 */
    box-sizing: border-box; /* 패딩과 테두리를 요소 크기에 포함 */
}


</style>
<!-- Start HEAD section -->
<link href="../css/mainpageslideshow.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End HEAD section -->
</head>

<body>

	<div id="app">

		<div id="container">
		

			<nav id="slid">
				<div class="slideshow-container">
				
				<div class="mySlides fade">
				  <div class="numbertext">1 / 3</div>
				  <img class="topimg" src="img/homeimg/boynext.jpg" >
				  
				</div>
				
				<div class="mySlides fade">
				  <div class="numbertext">2 / 3</div>
				  <img class="topimg" src="img/homeimg/seventeen_main.jpg" >
				  

				</div>
				
				<div class="mySlides fade">
				  <div class="numbertext">3 / 3</div>
				  <img class="topimg" src="img/homeimg/promiss_main.jpg">
			
				</div>
				
				</div>
				<br>
				
				<div style="text-align:center">
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				</div>
				
			</nav>
			<nav id="nav2">
						<section class="sect2">
			<h2><a href="newitem.do">NEW ITEM</a></h2>
			<div class="Sbox1">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">아티스트</li>
					<li>제품 명</li>
					<li>가격</li>
				</ul>
			</div>


			<div class="Sbox2">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">아티스트</li>
					<li>제품 명</li>
					<li>가격</li>
				</ul>
			</div>

			<div class="Sbox3">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">아티스트</li>
					<li>제품 명</li>
					<li>가격</li>
				</ul>
			</div>

			<div class="Sbox4">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">아티스트</li>
					<li>제품 명</li>
					<li>가격</li>
				</ul>
			</div>
			


		</section>
</nav>
		<nav id="nav3">
			<section class="sect3">
			<h2>STORE</h2>
			<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 스토어!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->

			<ul class="sale">
				<li><a href="#"><img src="img/homeimg/sale1.jpg" alt="" />
						<p>
							아이템1 - 이름<br>8,000원</a></li>
				<li><a href="#"><img src="img/homeimg/sale2.jpg" alt="" />
						<p>
							아이템2 - 이름<br>8,000원
						</p></a></li>
				<li><a href="#"><img src="img/homeimg/sale3.jpg" alt="" />
						<p>
							아이템3 - 이름<br>7,000원
						</p></a></li>
				<li><a href="#"><img src="img/homeimg/sale4.jpg" alt="" />
						<p>
							아이템4 - 이름<br>5,500원</a></li>
			</ul>

		</section>
		
<nav>
</nav>

			<nav>
		
	<footer> <p>
				<br> 회사명 (주)VeryPeri Corp. 대표자명 윤나연
				 <br>주소 인천광역시 부평구 부평동 534-48 7층
				 대표번호 4444-4444 / 4zomotchamchi@veryperi.com 
				<br> VeriPeri의 모든 콘텐츠는 저작권의 보호를 받고 있습니다
			</p>
			<img src="img/homeimg/footerlogo.png" alt="" /></footer>
	
			
			</nav>
		</div>















		
	</div>
	
	
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		uId : "${sessionId}",

	}, 
	methods : {
		
	},
	created : function() {
		var self = this;

	}
});

var slideIndex = 0;

var colors = [ 'rgb(229, 143, 255)', ' rgb(143, 214, 255)', ' rgb(216, 255, 143)'];
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    var container = document.getElementById("container");
    
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    
    var bgColor = colors[slideIndex % colors.length]; // 배열의 인덱스로 배경색 선택
    container.style.backgroundColor = bgColor;
    
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>