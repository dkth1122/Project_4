<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">

<style>


.icon {
float : right;
margin-left :30px;
color:black;
}

.mark{
position: absolute;
top: 60%;
right: 50%;
transform: translate(50%, -50%);
}
* {
	margin: 0;
	padding: 0;
}

img, area {
	border: 0;
	outline: none;
}

ul, ol, li {
	list-style: none;
}

a {
	color:black;
	text-decoration: none;
} 
body{ font-family:Graduate, Kelly Slab, Aldrich;/*OCR A Std, arial;*/ font-size:1.5em; color:#000;}

nav {
	width: 100%;
	height: 140px;
	position: relative;
	z-index: 9999;
}

<!--
�ΰ� �ִ� �κ� -->.

nav{ width:2000px; height:160px; z-index:9999;}
		.navWrap{ width:2000px; height:35px; overflow:hidden; transition: all 0.6s; position:absolute; top:20%; font-size: 30px;}
		.navWrap:hover{ height:550px; background:rgb(245, 235, 236);}
			h1{ width :2000px; height:93px; text-align:center; padding-top:12px; box-sizing:border-box;}
			hr{ width:1381px; height:1px; background:rgba(255,255,255,0.8); text-align:center; margin-left:257px; border:none;}
			
nav.menu {
position: absolute;
top: 60%;
right: 50%;
	font-weight : bold;

	width: 1230px;
	margin: 0 auto;
	height: 36px;
}

nav .menu a {
	color: 000000;
}


/* ���� ���� */
nav .menu>li {
	width: 130px;
	float:left;
	margin-right: 40px;
	height: 43px;
	
}

nav .menu>li:hover>a {
	color: #b4adf6;
}

nav .menu>li:last-child {
	margin-left: 0;
}

nav .menu>li a {
	display: block;
	width: 132px;
	height: 100%;
	text-align: center;
	line-height: 43px;
}

nav .menu .depths {
	
}

nav .menu .depths li {
	width: 200px;
}

nav .menu .depths li a {
	font-size: 1.27rem;
	margin-top :18px;
	line-height: 38px;
}

nav .menu .depths li:hover a {
	color: #6fd7ff;
}

.ban {
	position: absolute;
	top: 140px;
	right: 0px;
	z-index: 9998;
}

header {
	width: 100%;
	height: 703px;
	color: #fff;
	overflow: hidden;
}

header #container1 {
	position: absolute;
	top: 0px;
}
</style>
<!-- Start HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End HEAD section -->
</head>

<body>


		<nav>
		
		<div class="mark"><a href="home.do"><img src="img/btsProduct/veryperiii.png"  alt="" style="height : 100px; width:auto;"/></a></div>
				<hr>
				
<div class="navWrap">

				<ul class="menu">
				
					<li><a href="artistpage.do">ARTIST</a>
						<ul class="depths">
							<li><a href="#">BTS</a></li>
							<li><a href="#">LE SSERAFIM</a></li>
							<li><a href="#">SEVENTEEN</a></li>
							<li><a href="#">fromis_9</a></li>
							<li><a href="#">TXT</a></li>
							<li><a href="#">NewJeans</a></li>
							<li><a href="#">ENHYPEN</a></li>
							<li><a href="#">BOYNEXTDOOR</a></li>
							<li><a href="#">ZICO</a></li>
						</ul>
					</li>
						
						
					<li><a href="productpage.do">PRODUCT</a>
						<ul class="depths">
							<li><a href="#">MEMBERSHIP</a></li>
							<li><a href="#">ALBUM</a></li>
							<li><a href="#">MERCHANDISE</a></li>
							<li><a href="#">DVD</a></li>
							<li><a href="#">PHOTO BOOK</a></li>
						</ul>
					</li>
						
						
					<li><a href="eventpage.do">EVENT</a>
						<ul class="depths">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
						</ul>
					</li>

					<li><a href="notifypage.do">NOTIFY</a>
						<ul class="depths">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul>
					</li>	
					
			
				
											
						<div class="icon">
						<span class="icon"><a href="bookmark.do"><i class="fa-solid fa-bookmark" style="color: #8a8a8a;"></i></a></span>
						<span class="icon"><a href="search.do"><i class="fa-solid fa-magnifying-glass" style="color: #8a8a8a;"></i></a></span>
						<span class="icon"><a href="mypage.do"><i class="fa-solid fa-user" style="color: #8a8a8a;"></i></a></span>
						</div>
						
					</ul>
					</div>
			</nav>
		



		
</body>
</html>
<script>
// �����̵带 �ڵ����� �����ϴ� �Լ�
function changeSlide() {
  var currentSlide = document.querySelector('input[type="radio"]:checked');
  var nextSlide = currentSlide.nextElementSibling || document.querySelector('input[type="radio"]:first-child');
  nextSlide.checked = true;

  // ���� 5��° �����̵��� ���, 1��° �����̵�� �ڵ����� ����
  if (currentSlide.id === 'slide5') {
    document.querySelector('#slide1').checked = true;
  }
}

// �������� �ε�Ǹ� �����̴� Ÿ�̸Ӹ� ����
document.addEventListener('DOMContentLoaded', function() {
  setInterval(changeSlide, 3000); // 3000 �и��� = 3��
});
	
</script>