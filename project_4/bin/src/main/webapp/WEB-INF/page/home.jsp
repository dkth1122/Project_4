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
/*  占쌓온삼옙占쏙옙효占쏙옙 占쏙옙 */




#footer {
  position: fixed;
  bottom: -450px;
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
    margin: 10px 5px; /* 占쏙옙占쏙옙 占쏙옙치占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 첫 占쏙옙째 占쏙옙 占쏙옙占쏙옙 */
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
	

 #nav1, #nav2, #nav3 {
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
	margin-top: 50px;
	margin-bottom: 500px;
	float:left;
	} 


 .Sbox1 {
 	
 	border:6px solid orange;
    vertical-align: middle;
	width:1500px;
	height: 1500px;
	position: absolute;
    left: 50%; 
    transform: translateX(-50%); 
	align-items: center;
	flex-wrap: wrap;
	padding:50px;
} 


.productList {
  border:1px solid blue;
 height:400px;
  width: 300px;
  margin: 0 10px; 
  position : relative;
  text-align: center;
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
	height: 1500px;
	background: #f0f0f0;
	display: flex;
 	flex-wrap: wrap;
  	width: 100%; 
  	length: 1000px;
}

.sect2name {
 height: 50px;
  box-sizing: border-box;
  display: flex; 
  width:800px;
  justify-content: center;
  align-items: center; 
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
	height: 1500px;
	background: #f0f0f0;
	display: flex;
 	flex-wrap: wrap;
  	width: 100%; 
  	length: 1000px;
}

.sect3name {
 height: 50px;
  box-sizing: border-box;
  display: flex; 
  width:800px;
  justify-content: center;
  align-items: center; 
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



.sect3 div .sub .sname {
	font-size: 23pt;
	font-weight: bold;
	padding: 50px 0 20px 0;
	box-sizing: border-box;
	text-align: left;
}



		


.ostimg {
position: absolute;
top: 550%;
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

.ostimg .imgse {
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
	position: relative;
	top: 74px;
	animation: ostname 32s 4s infinite;
	transition: all 2s;
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
    <div class="sect2name"><a href="newitem.do">NEW ARRIVAL</a></div>
     <div class="Sbox1">
    
    <!--   <p class="more"><a href="#">MORE</a></p> -->
     
       <div v-for="(item, index) in list" class="productList" :key="index">
          <span><img :src="item.path" class="pImg"></span>
          <div>{{ item.pName }}</div>
          
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
		  <div class="sect3name"><a href="newitem.do">BEST ITEM</a></div>
     <div class="Sbox1">
         <div v-for="(item, index) in best" class="productList" :key="index">
          <span><img :src="item.path" class="pImg"></span>
          <div>{{ item.pName }}</div>
          
            <ul class="sub">
              <li class="sname">{{item.artist}}</li>
              <li>{{item.category}}</li>
              <li>{{item.price}}</li>
            </ul>
           
          </div>
        </div>
      </section>
	</nav>
		
		
		<nav id="nav4">
		
		<section class="sect1">
			<div class="ost"></div>
			<div class="ostimg">

				<div class="img1"></div>

				<div class="img2"></div>

				<div class="img3"></div>

				<div class="img4"></div>

				<div class="img5"></div>n

			</div>

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
		best : []
	}, 
	methods : {
		fnGetList : function() { 
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

	fnBestItem : function() { 
        var self = this;
        var nparmap = {uId : self.uId};            
        $.ajax({
           url : "/bestItemLoad.dox",
           dataType : "json",
           type : "POST",
           data : nparmap,
           success : function(data) {                  
              self.best = data.list;
              console.log(self.best)
             
              
           }
      });
},
	 
    productView: function(item) {
      console.log("Clicked product:", item);
     
    }
  },
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnBestItem();

	}
});

var slideIndex = 0;
var slides = document.getElementsByClassName("mySlides"); 
var colors = [ /* 프미나 */ 'rgb(189,24,144)', /* 보이넥스트도어  */ 'rgb(189, 24, 144)', /* 세븐 틴 */' rgb(250,188,255)'];
showSlides();

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
    
    var bgColor = colors[slideIndex % colors.length];
    container.style.backgroundColor = bgColor;
    
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}
showSlides(); 
</script>