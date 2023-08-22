<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<%@ include file="../Product/sexyheader.jsp" %>
<%@ include file="footer.jsp" %>
<style>

#footer {
  position: fixed;
  bottom: -450px;
  left: 0;
  width: 100%;
 
  padding: 20px; /* 필요한 여백 조정 */
}
.slidetext {
	font-size:2em;

	}
.dot {
    width: 12px;
    height: 12px;
    margin: 10px 5px; /* 세로 위치를 조정할 때 여기의 첫 번째 값 조절 */
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
    position: absolute; /* 도트를 절대 위치로 설정 */
    bottom: 20px; /* 이미지 슬라이드 밑에 여백을 조절 */
  /*   left: 50%; /* 가로 위치 중앙에 정렬 */ */
  /*   transform: translateX(-50%); /* 가로 위치를 중앙으로 정렬 */ */
}

#app{
	widows: 100%
	}
	
	#footer{
	  justify-content:flex-end;
	  margin-bottom:0;
	}

#container{
	margin: 50px;
  	justify-content:center;
	width: auto;
	height: 1200px;
	
	}
	
img.topimg{
	margin-top:100px;
	margin-bottom:100px;
    vertical-align: middle;
	width:auto;
	height: 800px;
	position: absolute;
    left: 50%; /* 요소의 좌측 위치를 중앙으로 이동 */
    transform: translateX(-50%); 
	}
	
/*  nav{
	widows: 1800px;
	height: 1500px;
	margin-bottom: 50px;
 */
 #nav1, #nav2, #nav3 {
    position: relative; /* 위치 속성을 설정합니다. */
    z-index: 1; /* 아래로 쌓이도록 설정합니다. */
}

#nav1{
	margin-top:500px;
	margin-bottom:500px;
	padding:70px;
	widows: 1800px;
	height:1500px;
	margin-bottom: 50px;
	}

#nav2{
widows: 1800px;
	height: 1800px;
	margin-top: 50px;
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
	position: relative;
	/* overflow: hidden; */
	
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
	
}

.sect2 .Sbox1:hover {
	
}

.sect2 div:hover a {
	opacity: 1;
	}
	
/*SUP*/
.sect2 div .sub {
	position: absolute;
	bottom: -300px;
	width: 307px;
	height: 206px;
	background: rgba(255, 255, 255, 0.7);
	color: #000;
	line-height: 25pt;
	font-family: arial;
	font-size: 15pt;
	text-align: left;
	padding-left: 11px;
	box-sizing: border-box;
	opacity: 0;
	transition: all 1s;
}

.sect2 div:hover .sub {
	position: absolute;
	bottom: 0;
	opacity: 1;
}

.sect2 div .sub .sname {
	font-size: 23pt;
	font-weight: bold;
	padding: 50px 0 20px 0;
	box-sizing: border-box;
	text-align: left;
}

.sect2 div:nth-child(4) {
	margin-left: 0;
}



</style>
<!-- Start HEAD section -->
<link href="../css/mainpageslideshow.css" rel="stylesheet" type="text/css">

<!-- End HEAD section -->
</head>

<body>

	<div id="app">

		<div id="container">
		
			<nav id="nav1">
			
				<div class="slideshow-container">
				
					<div class="mySlides fade">
					
						<div class="slidetext">BND</div>
				 			<img class="topimg" src="img/homeimg/boynext.jpg" >
				  
					</div>
				
						<div class="mySlides fade">
						  <div class="slidetext">Seventeen</div>
				 		 <img class="topimg" src="img/homeimg/seventeen_main.jpg" >
				  
						</div>
				
					<div class="mySlides fade">
						<div class="slidetext">fromis9</div>
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
        <h2><a href="newitem.do">NEW ARRIVAL</a></h2>
        <div class="Sbox1" style="width: 1000px; height: 2000px;">
          <p class="more"><a href="#">More1</a></p>
          <div v-for="item in list" class="productList">
            <span><img :src="item.path" class="pImg" style="width: 300px; height: 500px;"></span>
            <div>{{ item.pName }}</div>
            <div>
              <ul class="sub">
                <li class="sname">{{item.artist}}</li>
                <li>{{item.category}}</li>
                <li>{{item.price}}</li>
                
                
                
								</ul>
							</div>
                    </div>
                </div>
                
               	</section>
			</nav>
		
                
             <!--    
				<div class="Sbox1">
					<p class="more">
					<a href="#">More</a>
					</p>
					<ul class="sub">
						<li class="sname">0</li>
						<li>1</li>
						<li>2</li>
					</ul>
				</div> -->
	
		
                
		
	
		
		
		<nav id="nav3">
			
			<section class="sect2">
				<h2><a href="newitem.do">BEST ITEM</a></h2>
				<div class="Sbox1">
					<p class="more">
						<a href="#">More</a>
					</p>
					<ul class="sub">
						<li class="sname">0</li>
						<li>1</li>
						<li>2</li>
					</ul>
				</div>
	
			<div class="Sbox2">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">0</li>
					<li>1</li>
					<li>2</li>
				</ul>
			</div>

			<div class="Sbox3">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">0</li>
					<li>1</li>
					<li>2</li>
				</ul>
			</div>

			<div class="Sbox4">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">0</li>
					<li>1</li>
					<li>2</li>
				</ul>
			</div>
			</section>
		
		</nav>
		<nav>
		
		
		
		</nav>

	</div> <!-- 콘테이너 div -->
		
</div> <!-- app div -->
			
	
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		uId : "${sessionId}",
		list : [],
		info : {}
	}, 
	methods : {
		fnGetList : function() { // 사용자 정보 불러오기 이름 , 별명 (닉네임)
            var self = this;
            var nparmap = {uId : self.uId};            
            $.ajax({
               url : "/home3.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {                  
                  self.list = data.list;
                  console.log(self.list)
                 
                  
               }
          });
	},
	 // productView 메서드 추가
    productView: function(item) {
      console.log("Clicked product:", item);
      // 클릭한 제품 정보를 활용한 동작 추가
    }
  },
	created : function() {
		var self = this;
		self.fnGetList();

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
    
    var bgColor = colors[slideIndex % colors.length];
    container.style.backgroundColor = bgColor;
    
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}
</script>