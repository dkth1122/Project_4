<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<%@ include file="../Product/sexyheader.jsp" %>
<%@ include file="footer.jsp" %>
<style>


* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}
/* 
.ex1 a i {
    display: block;
    width: 100px;
    height: 100px;
    text-align: center;
    line-height: 100px;
    font-size: 2rem;
    color: #fff;
    background-color: #333;
}

.ex1 a i:hover {
    text-shadow: 0 0 10px #f54;
}

.ex2 a {
    display: block;
    width: 200px;
    height: 60px;
    border-radius: 10px;
    text-align: center;
    color: #fff;
    font-weight: bold;
    font-size: 2rem;
    line-height: 60px;
    background-color: #333;
}

.ex2 a:hover {
    text-shadow: 0 0 5px #ff0;
}
 */

#footer {
  position: fixed;
  bottom: -100px;
  left: 0;
  width: 100%;
  padding: 20px; 
	}
.slidetext {
	font-size:2em;

	}
.dot {
    width: 12px;
    height: 12px;
    margin: 10px 5px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
    position: absolute; 
    bottom: 20px;
  /*   left: 50%; 
  /*   transform: translateX(-50%);  */
}

#app{
	widows: 100%
	}
	
	#footer{
	  justify-content:flex-end;
	  margin-bottom:0;
	}

#container-color{
	margin-top: 60px;
  	justify-content:center;
	width: auto;
	height:900px;
	
	}
	
img.topimg{
	/* margin-top:100px;
	margin-bottom:100px; */
    vertical-align: middle;
	width:auto;
	height: 650px;
	position: absolute;
    left: 50%; 
    transform: translateX(-50%); 
	align-items: center;
	}
	

 #nav1, #nav2, #nav3, #nav4 {
    position: relative; 
    z-index: 1; 
}

#nav1{
	margin-top:-60px;
	margin-bottom:500px;
	padding:130px;
	width: 100%;
	height:1000px;
	margin-bottom: 50px;
	}

#nav2{
	widows: 1800px;
	height: 1800px;
	margin-top: 50px;
	margin-bottom: 50px;
	float:left;
}
#nav3{
	widows: 1800px;
	height: 1800px;
	margin-top: 50px;
	margin-bottom: 50px;
	float:left;
	}

#nav4{
	widows: 1800px;
	height: 800px;
	margin-top: 80px;
	margin-bottom: 300px;
	float:left;
	} 


 .Sbox1 {
 	
 	border:6px solid orange;
 	background-color:orange;
    vertical-align: middle;
	width:1500px;
	height: 1650px;
	position: absolute;
    left: 50%; 
    transform: translateX(-50%); 
	align-items: center;
	flex-wrap: wrap;
	padding:50px;
} 


.productList {
  border:5px solid blue;
 height:400px;
  width: 300px;
  position : relative;
  text-align: center;
   box-shadow:  0 10px 20px  rgba(0, 0, 0, 0.5); 
}

.productList-container {
  border:1px solid red;
  content-align: center;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  width: 100%;
  margin: 0 -10px;
   left: 50%; 
    transform: translateX(-50%); 
}

.productList:hover .sub {
	position: absolute;
	bottom: 0px;
	opacity: 1;
} 

.sect2 {
	padding: 50px;
	widows: 1800px;
	height: 1800px;
	background: #f0f0f0;
	display: flex;
 	flex-wrap: wrap;
  	width: 100%; 
  	length: 1000px;
}

.sect2name {
	font-size:70px;
	margin-top:0px;
	height: 100px;
	width:300px;
	display: relative; 
	width: 100%;
	justify-content: center;
	text-align: center; 
	text-shadow: 0 0 .1em, 0 0 .3em skyblue; 
}

.sect2 div {
	float: left;
	margin-right:10px;
	margin:20px;
	
}


 
.sect2 div:hover a {
	opacity: 1;
	
}

.sect2 div .sub {
	position: absolute;
	bottom: -100px;
	width: 300px;
	height: 250px;
	background: rgba(98,144,198, 0.7);
	text-shadow: 0 5px 5px  rgba(199,225,50, 1);
	color:black;
	line-height: 25pt;
	font-family: arial;
	font-size: 15pt;
	text-align: left;
	padding-left: 11px;
	box-sizing: border-box;
	opacity: 0;
	transition: all 1s;
}



.sect2 div .sub .sname {
	font-size: 23pt;
	font-weight: bold;
	padding: 50px 0 20px 0;
	box-sizing: border-box;
	text-align: left;
}




.sect3 {
	padding: 50px;
	widows: 1800px;
	height: 1800px;
	background: #f0f0f0;
	display: flex;
 	flex-wrap: wrap;
  	width: 100%; 
  	length: 1000px;
  
}

.sect3name {
	font-size:70px;
	margin-top:0px;
	height: 100px;
	width:300px;
	display: relative; 
	width: 100%;
	justify-content: center;
	text-align: center; 
	text-shadow: 0 0 .1em, 0 0 .3em red; 
}

.sect3 div {
	float: left;
	margin-right:10px;
	margin:20px;
	
}


 
.sect3 div:hover a {
	opacity: 1;
}

.sect3 div .sub {
	position: absolute;
	bottom: -100px;
	width: 300px;
	height: 250px;
	background: rgba(98,144,198, 0.7);
	text-shadow: 0 5px 5px  rgba(199,225,50, 1);
	color:black;
	line-height: 25pt;
	font-family: arial;
	font-size: 15pt;
	text-align: left;
	padding-left: 11px;
	box-sizing: border-box;
	opacity: 0;
	transition: all 1s;
	}



.sect3 div .sub .sname {
	font-size: 23pt;
	font-weight: bold;
	padding: 50px 0 20px 0;
	box-sizing: border-box;
	text-align: left;
color: yellow;
 text-decoration: none;
 transition: 1s;
}





		


.ostimg {
    display: flex;
    justify-content: center;
    align-items: center;
   position: absolute;
right: 50%;
transform: translate(50%, -50%);
	width: 1665px;
	margin: 0 auto;
	margin-top: 240px;
}

.ostimg>div {
	width: 208px;
	height: 208px;
	float: left;
	margin-left: 103px;
	border-radius: 100%;
	background: #900;
	border: 5px solid #d4dafa;
}

.ostimg>div:first-child {
	margin-left: 0;
}

.ostimg .img1 {
	background: url(img/homeimg/ost1.png);
}

.ostimg .img2 {
	background: url(img/homeimg/lsf_album.jpg);
	background-size: contain;
}

.ostimg .img3 {
	background: url(img/homeimg/bts_album.gif);
	background-size: contain;
	width: 370px;
	height: 370px;
	margin-top: -100px;
}

.ostimg .img4 {
	background: url(img/homeimg/ost4.png);
}

.ostimg .img5 {
	background: url(img/homeimg/ost5.png);
}

/*SECT1- animation*/
.ostimg .img1 {
	animation: Sback 32s 4s infinite;
	transition: all 2s;
}

.ostimg .img2 {
	animation: Lback 32s 4s infinite;
	transition: all 2s;
}

.ostimg .img3 {
	animation: Hback 32s 4s infinite, Hrotate 6.6s 4s infinite;
}

.ostimg .img4 {
	animation: Dback 32s 4s infinite;
	transition: all 2s;
}

.ostimg .img5 {
	animation: Iback 32s 4s infinite;
	transition: all 2s;
}

/*SECT1- animation2*/
.sect1 .ost {
	width: 572px;
	height: 88px;
	background: no-repeat;
	margin-left: 300px;
display:block;
	top: 74px;
	animation: ostname 32s 4s infinite;
	transition: all 2s;
}
.sect1 {
  flex-wrap: wrap;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 680px; 
  background-color: #f0f0f0;
  position: relative;
}

</style>
<!-- Start HEAD section -->
<link href="../css/mainpageslideshow.css" rel="stylesheet" type="text/css">

<!-- End HEAD section -->
</head>

<body>

	<div id="app">

		<div id="container-color">
		
			<nav id="nav1">
			
				<div class="slideshow-container">
				
					<div class="mySlides fade">		
						<div class="slidetext"></div>
				 		<img class="topimg" src="img/homeimg/boynext.jpg" >
				  
					</div>
				
						<div class="mySlides fade">
						  <div class="slidetext"></div>
				 		 <img class="topimg" src="img/homeimg/seventeen_main.jpg" >
				  
						</div>
				
					<div class="mySlides fade">
						<div class="slidetext"></div>
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
   
     <div class="Sbox1">
     <div class="sect2name"><a href="newitem.do">NEW ARRIVAL</a></div>
    <!--   <p class="more"><a href="#">MORE</a></p> -->
     
       <div v-for="(item, index) in list" class="productList" :key="index" style="border:0; margin-bottom:50px;" >
          <img :src="item.path" class="productList" style="margin : 0px;">
          <div style="font-weight :bold; font-size:18px; ">{{ item.pName }}</div>
          
            <ul class="sub">
              <li class="sname">{{item.artist}}</li>
              <li>{{item.category}}</li>
              <li>{{item.price}}</li>
            </ul>
           
          </div>
        </div>
      </section>
	</nav>
		
		
		<nav id="nav3">
		
		  <section class="sect3">
		      <div class="Sbox1">
      <div class="sect3name" style="font-shadow:0 0 50px; rgb(255,255,255, 0.5)"><a href="newitem.do">BEST ITEM</a></div>
         
         <div v-for="(zz, index) in best" class="productList" :key="index" style="border:0; margin-bottom:50px;" >
         <img :src="zz.path" class="productList" style="margin :0px;"  >
          <div style= "font-weight :bold; font-size:18px;">{{ zz.pName }}</div>
          
            <ul class="sub">
              <li class="sname">{{zz.artist}}</li>
              <li>{{zz.category}}</li>
              <li>{{zz.price}}</li>
            </ul>
           
          </div>
        </div>
      </section>
	</nav>
		
		
		<nav id="nav4">
		
		<section class="sect1">
			<div class="ostimg">
				<div class="img1" @click="playAudio('audio1', 60)"></div> <!-- TXT - 어느날 머리에서 뿔이 자랐다 -->
				<div class="img2" @click="playAudio('audio2', 60)"></div> <!-- LE SSERAFIM - UNFORGIVEN -->
				<div class="img3" @click="playAudio('audio3', 60)"></div> <!-- BTS - Butter -->
				<div class="img4" @click="playAudio('audio4', 60)"></div> <!-- NewJeans- Super Shy -->
				<div class="img5" @click="playAudio('audio5', 60)"></div> <!-- SEVENTEEN - 손오공 -->
			</div>
			
			<audio id="audio1">
			    <source src="../audio/TXT - 어느날 머리에서 뿔이 자랐다.mp3"> <!-- TXT - 어느날 머리에서 뿔이 자랐다 -->
			</audio>
			<audio id="audio2">
			    <source src="../audio/LE SSERAFIM - UNFORGIVEN.mp3"><!-- LE SSERAFIM - UNFORGIVEN -->
			</audio>
			<audio id="audio3">
			    <source src="../audio/BTS -  Butter.mp3"><!-- BTS -  Butter -->
			</audio>
			<audio id="audio4">
			    <source src="../audio/NewJeans- Super Shy.mp3"> <!-- NewJeans- Super Shy -->
			</audio>
			<audio id="audio5">
			    <source src="../audio/SEVENTEEN - 손오공.mp3"> <!-- SEVENTEEN - 손오공 -->
			</audio>

		</section>
		
		</nav>

	</div> 
		
</div> <!-- app div -->

</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		uId : "${sessionId}",
		list : [],
		info : {},
		best : [],
    currentAudio: null 
	}, 
	
	methods : {
		playAudio(audioId, durationInSeconds) {
			  var audio = document.getElementById(audioId);

			  if (this.currentAudio === audio && !audio.paused) {
			    // 동일한 오디오 요소를 눌렀고, 현재 재생 중인 경우에는 일시정지
			    audio.pause();
			    audio.currentTime = 0;
			    clearTimeout(this.audioTimer);
			  } else {
			    if (this.currentAudio && !this.currentAudio.paused) {
			      // 다른 오디오 요소가 재생 중인 경우에는 일시정지
			      this.currentAudio.pause();
			      this.currentAudio.currentTime = 0;
			      clearTimeout(this.audioTimer);
			    }

			    audio.play();

			    // 기존 타이머 제거
			    clearTimeout(this.audioTimer);

			    this.audioTimer = setTimeout(function () {
			      audio.pause();
			      audio.currentTime = 0;
			    }, durationInSeconds * 1000);
			  }

			  this.currentAudio = audio; // 현재 재생 중인 오디오 요소 저장
			},
	  
	  fnGetList() { 
        var self = this;
        var nparmap = {uId: self.uId};            
        $.ajax({
           url: "/home3.dox",
           dataType: "json",
           type: "POST",
           data: nparmap,
           success(data) {                  
              self.list = data.list;
              console.log(self.list)
           }
        });
	  },

	  fnBestItem() { 
        var self = this;
        var nparmap = {uId: self.uId};            
        $.ajax({
          url: "/bestItemLoad.dox",
          dataType: "json",
          type: "POST",
          data: nparmap,
          success(data) {                  
            self.best = data.list;
            console.log("best==>",self.best);
          }
       });
    },
	 
    productView(item) {
      console.log("Clicked product:", item);
    }
  },
	
	created() {
		var self = this;
		self.fnGetList();
		self.fnBestItem();

	}
});

var slideIndex = 0;
var slides = document.getElementsByClassName("mySlides"); 
var gradientColors = [ 'linear-gradient(to bottom, #e5cfff, #8fd6ff, #d8ff8f)',
    					'linear-gradient(to bottom, #f0c3ff, #8fffd8, #ffb38f)',
    					'linear-gradient(to bottom, #e5cfff, #8fd6ff, #d8ff8f)']

function showSlides() {
    var i;
    var dots = document.getElementsByClassName("dot");
    var container = document.getElementById("container-color");
    
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
    
    var gradient = gradientColors[slideIndex % gradientColors.length];
    container.style.background = gradient;
    
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}
showSlides(); 
</script>