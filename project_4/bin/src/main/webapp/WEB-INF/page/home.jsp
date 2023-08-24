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
 
  padding: 20px; /* �ʿ��� ���� ���� */
}
.slidetext {
	font-size:2em;

	}
.dot {
    width: 12px;
    height: 12px;
    margin: 10px 5px; /* ���� ��ġ�� ������ �� ������ ù ��° �� ���� */
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
    position: absolute; /* ��Ʈ�� ���� ��ġ�� ���� */
    bottom: 20px; /* �̹��� �����̵� �ؿ� ������ ���� */
  /*   left: 50%; /* ���� ��ġ �߾ӿ� ���� */ */
  /*   transform: translateX(-50%); /* ���� ��ġ�� �߾����� ���� */ */
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
    left: 50%; /* ����� ���� ��ġ�� �߾����� �̵� */
    transform: translateX(-50%); 
	align-items: center; /* ���� ��� ���� */
	}
	
/*  nav{
	widows: 1800px;
	height: 1500px;
	margin-bottom: 50px;
 */
 #nav1, #nav2, #nav3 {
    position: relative; 
    z-index: z; 
}

#nav1{
	border:5px dotted red;
	margin-top:-200px;
	margin-bottom:500px;
	padding:70px;
	width: 100%;
	height:1000px;
	margin-bottom: 50px;
	}

#nav2{
	border:5px dotted red;
	widows: 1800px;
	height: 1800px;
	margin-top: 50px;
	margin-bottom: 50px;
	float:left;
}
#nav3{
	border:5px dotted red;
	widows: 1800px;
	height: 1800px;
	margin-top: 50px;
	margin-bottom: 50px;
	float:left;
	}

#nav4{
	border:5px dotted red;
	widows: 1800px;
	height: 800px;
	margin-top: 50px;
	margin-bottom: 50px;
	float:left;
	}


.sect2 {
border:5px dotted green;
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
	/* width: 307px; */
	height: 438px;
	float: left;
	margin-right:10px;
	
	/* overflow: hidden; */
	
}

/* .sect2 div a {
	border:9px solid yellow;
	
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
} */

.sect3 {
border:1px dotted green;
	margin :  0px auto;
	widows: 1800px;
	height: 1500px;
	background: #f0f0f0;
}


.productList-container {
  border:1px solid red;
  content-align: center;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  width: 100%;
  margin: 0 -10px; /* �� �ڽ� ������ ������ ���� */
   left: 50%; /* ����� ���� ��ġ�� �߾����� �̵� */
    transform: translateX(-50%); 
}
.sect2 div{
height:350px;
margin:20px;
}

.productList {
  border:1px solid blue;
 
  width: 300px;
  margin: 0 10px; /* �� �ڽ� ������ ������ ���� */
  
  text-align: center;
}
/*new item*/

 .Sbox1 {
 text-align:center;
  border:6px solid orange;
    vertical-align: middle;
	width:1500px;
	height: 650px;
	position: absolute;
    left: 50%; /* ����� ���� ��ġ�� �߾����� �̵� */
    transform: translateX(-50%); 
	align-items: center; /* ���� ��� ���� */
	flex-wrap: wrap;
	padding:50px;
} 


/* .sect2 .Sbox1 {
	border:4px solid black;
	 content-align: center;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  width: 100%;
  
  margin: 20px; 
   left: 50%; 
    transform: translateX(-50%); 
	
	
} */

/* .sect2 .Sbox1:hover {
	border:1px solid yellow;
}
 */
/* .sect2 div:hover a {
	border:1px solid green;
	opacity: 1;
	} */
	
/*SUP*//* 
.sect2 div .sub {
	border:7px solid green;
	position: ablsolute;
	
	width: 300px;
	height: auto;
	background: rgba(255, 255, 255, 0.7);
	color: #000;
	line-height: 25pt;
	font-family: arial;
	font-size: 15pt;
	text-align: left;
	
	box-sizing: border-box;
	opacity: 0;
	transition: all 1s;
}
 */
.sect2 div:hover .sub {
	position: relative;
	opacity: 1;
	border:7px solid green;
	position: ablsolute;
	
	
	width: 300px;
	height: auto;
	background: rgba(255, 255, 255, 0.7);
	line-height: 25pt;
	font-family: arial;
	font-size: 15pt;
	text-align: left;
	
	box-sizing: border-box;
	opacity: 0;

.sect2 div .sub .sname {
	font-size: 23pt;
	font-weight: bold;
	width:300px;
	text-align: left;
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
    <div class="sect2name"><a href="newitem.do">NEW ARRIVAL</a></div>
     <div class="Sbox1">
    
    <!--   <p class="more"><a href="#">MORE</a></p> -->
     
       <div v-for="(item, index) in list" class="productList" :key="index">
          <span><img :src="item.path" class="pImg"></span>
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
		  <section class="sect3">
		    <h2><a href="newitem.do">�Ż�ǰ</a></h2>
		    <div class="Sbox1">
		      <p class="more"><a href="#">������</a></p>
		     
		        <div v-for="item in list" class="productList">
		          <span><img :src="item.path" class="pImg"></span>
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
		            
		
		<nav id="nav4">
		
		
		
		</nav>

	</div> <!-- �����̳� div -->
		
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
		fnGetList : function() { // ����� ���� �ҷ����� �̸� , ���� (�г���)
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

	fnBestItem : function() { // ����� ���� �ҷ����� �̸� , ���� (�г���)
        var self = this;
        var nparmap = {uId : self.uId};            
        $.ajax({
           url : "/home3.dox",
           dataType : "json",
           type : "POST",
           data : nparmap,
           success : function(data) {                  
              self.best = data.list;
              console.log(self.best)
             
              
           }
      });
},
	 // productView �޼��� �߰�
    productView: function(item) {
      console.log("Clicked product:", item);
      // Ŭ���� ��ǰ ������ Ȱ���� ���� �߰�
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
var colors = [ 'rgb(229, 143, 255)', ' rgb(143, 214, 255)', ' rgb(216, 255, 143)'];
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