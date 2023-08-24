<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/header.css" rel="stylesheet" type="text/css">  
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">


<style>

/*  */
#app{
	widows: 100%;
}
body{
	widows: 100%;
	display: flex;	
    flex-direction: column;
	
	}
#head{
z-index : 2;
 	width: 100%;
}
#nav1{
	width: 1500px;
	height: 500px;
	z-index: 999;
	background-color: orange;
	margin: 50px auto;
}
#app{
	width: 100%;
}
#centainer{
	display: flex;
	flex-direction: column;
}
/*new item*/
</style>
<!-- Start HEAD section -->
<link href="../css/mainpageslideshow.css" rel="stylesheet" type="text/css">

<!-- End HEAD section -->
</head>

<body>

<div id="app">
<div id="head"><%@ include file="../Product/sexyheader.jsp" %></div>
	<div id="centainer">
	
			
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
					<div style="text-align:center">
						  <span class="dot"></span> 
						  <span class="dot"></span> 
						  <span class="dot"></span> 
				    </div>
				</nav>
				
				<nav>
				
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
		list : [],
		info : {},
		best : []
	}
	methods : {
		
  },
	created : function() {
		var self = this;	

	}
}); 
</script>