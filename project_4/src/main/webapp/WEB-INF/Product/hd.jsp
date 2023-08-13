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
body {
    font-family: Graduate, Kelly Slab, Aldrich;
    font-size: 1.1em;
    color: #000;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100vw;
    margin: 0;
}

.icon {
float : right;
padding-right : 30px;
margin-right : 10px;
color:black;
height: 80px;
padding-top: 35px;


}


* {
	margin: 0;
	padding: 0;
}


ul, ol, li {
	list-style: none;
	line-height: 50px;
}

a {
	color:black;
	text-decoration: none;
} 
nav {
	width: 100%;
	height: 140px;
	position: relative;
	z-index: 9999;
}

<!--
�ΰ� �ִ� �κ� -->.

nav{ width:100%; height:135px;position:relative; z-index:9999;}
		.navWrap {
      width: 100%;
      height: 180px;
      overflow: hidden;
      transition: all 0.6s;
      position: relative;

    }
		.navWrap:hover {
      height:600px; /* ȭ���� ��ü ���̷� Ȯ�� */
      background: rgba(245, 235, 236); /* ȣ�� �� ���� �������ϰ� ���� */
    }
			
nav .menu {
	font-weight : bold;
	width: 1200px;
	margin: 0 auto;
	height: 100px;

}

nav .menu a {
	color: 000000;
}
.menu-container {
    display: flex;
    justify-content: center;
}

/* ���� ���� */
nav .menu>li {
	width: 100px;
	float: left;
	margin-right: 0px;
	height: 140px;
	position: relative;
	margin-top: 30px;
}

nav .menu>li:hover>a {
	color: #b4adf6;
}

nav .menu>li:last-child {
	margin-left: 0;
}


nav .menu>li a {
	display: block;
	width: 105px;
	height: 100%;
	text-align: center;
	line-height: 120px;
}

nav .menu .depths {
	position: absolute;
}

nav .menu .depths li {
	width: 300px;
}

nav .menu .depths li a {
	font-size: 0.8rem;
	line-height: 40px;
}

nav .menu .depths li:hover a {
	color: #6fd7ff;
}

.titleLi{
 margin: 0xp;
}
#logo{
margin-left : 50px;
	width: 300px;
	height: auto;
	top: -10px;
	z-index:1;
}
.mene{
	text-align: center;
	padding-left: 5px;
}
#headiner{
width: 100%; 
margin: 0 auto;
}

</style>
</head>

<body>


		<nav>
		<div id="headiner">
			<div class="navWrap">
			<ul class="menu">
					<li class="titleLi"><a href="#">ARTIST</a>
						<ul class="depths">
							<li ><a  href="#">BTS</a></li>
							<li ><a   href="#">LE SSERAFIM</a></li>
							<li ><a  href="#">SEVENTEEN</a></li>
							<li ><a  href="#">fromis_9</a></li>
							<li ><a  href="#">TXT</a></li>
							<li ><a href="#">NewJeans</a></li>
							<li ><a href="#">ENHYPEN</a></li>
							<li ><a href="#">BOYNEXTDOOR</a></li>
							<li ><a href="#">ZICO</a></li>
						</ul>
					</li>
						
						
					<li class="titleLi"><a href="#">PRODUCT</a>
						<ul class="depths">
							<li><a href="#">MEMBERSHIP</a></li>
							<li><a href="#">ALBUM</a></li>
							<li><a href="#">MERCHANDISE</a></li>
							<li><a href="#">DVD</a></li>
							<li><a href="#">PHOTO BOOK</a></li>
						</ul>
					</li>
				
						
					<li class="titleLi"><a href="#">EVENT</a>
					
					</li>

					<li class="titleLi"><a href="#">NOTIFY</a>
					
					</li>					
					
					
						<span><img id="logo" src="../../img/logo/VeryPeriLogo.png"></span>
					
						
						<div class="icon">
						<span class="icon"><a href="bookmark.do"><i class="fa-solid fa-bookmark fa-2xl" style="color: #8a8a8a;"></i></a></span>
						<span class="icon"><a href="search.do"><i class="fa-solid fa-magnifying-glass fa-2xl" style="color: #8a8a8a;"></i></a></span>
						<span class="icon"><a href="mypage.do"><i class="fa-solid fa-user fa-2xl" style="color: #8a8a8a;"></i></a></span>
						</div>
						
					</ul>
					
					</div>
					
					</div>
			</nav>
		



		
</body>
</html>
<script>

	
</script>