<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
	display: block; 
	margin: 0px auto;
	height: 800px;
	 z-index: 9999;
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
    display: flex; /* 占쏙옙占쏙옙 占쏙옙치占쏙옙 占쏙옙占쏙옙 Flexbox 占쏙옙占� */
    
    padding: 100px; /* 占썩본 占싻듸옙 占쏙옙占쏙옙 */
}

.sect3 ul.sale li {
    flex: 1; /* 占쏙옙撚占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌌듸옙占싹곤옙 占쏙옙占쏙옙 */
    list-style: none; /* 占썩본 占쏙옙占쏙옙트 占쏙옙타占쏙옙 占쏙옙占쏙옙 */
    margin: 50px; /* 占썩본 占쏙옙占쏙옙 占쏙옙占쏙옙 */
    padding: 10px; /* 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 */
    box-sizing: border-box; /* 占싻듸옙占쏙옙 占쌓두몌옙占쏙옙 占쏙옙占� 크占썩에 占쏙옙占쏙옙 */
}

</style>
<!-- Start HEAD section -->
<link href="../css/mainpageslideshow.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End HEAD section -->
</head>


<body>

	<div id="app">
			<nav id="slid">
				
				<div class="slideshow-container">
					<div class="mySlides fade">
				  	<div class="numbertext">1 / 3</div>
				  	<img class="topimg" src="img/homeimg/boynext.jpg" href="www.naver.com" >
				</div>
				
				<div class="mySlides fade">
					<div class="numbertext">2 / 3</div>
				 	<img class="topimg" src="img/homeimg/seventeen_main.jpg" >
				</div>
							
				<div class="mySlides fade">
					<div class="numbertext">3 / 3</div>
					<img class="topimg" src="img/homeimg/promiss_main.jpg">
			 	</div>
			 	
				<br>
				
				<div style="text-align:center">
					<span class="dot"></span> 
					<span class="dot"></span> 
					<span class="dot"></span> 
				</div>
				
			</nav>
			</div>
				
<footer> 
	<p>������ �명�� ��諛�</p>
</footer>
	
	
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
    
    var bgColor = colors[slideIndex % colors.length]; // 占썼열占쏙옙 占싸듸옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
    container.style.backgroundColor = bgColor;
    
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>