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

#headiner {
    font-family: Graduate, Kelly Slab, Aldrich;
    font-size: 1.1em;
    color: #000;
  
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
    height: 157px;
    overflow: hidden;
    transition: all 0.6s;
    position: relative;
    }
		.navWrap:hover {
      height:650px; /* ȭ���� ��ü ���̷� Ȯ�� */
      background: rgba(245, 235, 236); /* ȣ�� �� ���� �������ϰ� ���� */
    }
			
nav .menu {
	font-weight : bold;
	width: 1700px;
	margin: 0 auto;
	height: 100px;
	 z-index: 1;

}

nav .menu a {
	color: 000000;
}
.menu-container {
    display: flex;
    justify-content: center;
}
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
    margin-left: 345px;
    width: 152px;
    height: auto;
    top: 21px;
    z-index: 1;

	
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
					<li class="titleLi"><a href="/product/BTS.do">ARTIST</a>
						<ul class="depths">
							<li ><a  href="/product/BTS.do">BTS</a></li>
							<li ><a   href="/product/LSF.do">LE SSERAFIM</a></li>
							<li ><a  href="/product/SVT.do">SEVENTEEN</a></li>
							<li ><a  href="/product/FMN.do">fromis_9</a></li>
							<li ><a  href="/product/TXT.do">TXT</a></li>
							<li ><a href="/product/NJS.do">NewJeans</a></li>
							<li ><a href="/product/EHP.do">ENHYPEN</a></li>
							<li ><a href="/product/BND.do">BOYNEXTDOOR</a></li>
							<li ><a href="/product/ZIC.do">ZICO</a></li>
						</ul>
					</li>
						
						
					<li class="titleLi"><a href="/product/membership.do">PRODUCT</a>
						<ul class="depths">
<li><a href="/product/membership.do">MEMBERSHIP</a></li>
							<li><a href="/product/album.do">ALBUM</a></li>
							<li><a href="/product/merch.do">MERCHANDISE</a></li>
							<li><a href="/product/dvd.do">DVD</a></li>
							<li><a href="/product/photoBook.do">PHOTO BOOK</a></li>
						</ul>
					</li>
				
						
					<li class="titleLi"><a href="/event/eventpage.do" onclick="window.open(this.href, 'event', 'width=850,height=1000,top=200,left=500'); return false;">EVENT</a>
					
					</li>

					<li class="titleLi"><a href="/mypag/noticeList.do" onclick="window.open(this.href, 'notice', 'width=1000,height=1000,top=200,left=500'); return false;">NOTIFY</a>
					
					</li>					
					
					
						<span><a href="../home.do"><img id="logo" src="../../img/logo/veryperiii.png"></a></span>
					
						
						<div class="icon">
						<span class="icon"><a href="bookmark.do"><i class="fa-solid fa-bookmark fa-1xl" style="color: #8a8a8a;"></i></a></span>
						<span class="icon"><a href="search.do"><i class="fa-solid fa-magnifying-glass fa-1xl" style="color: #8a8a8a;"></i></a></span>
						<span class="icon"><a href="../mypag/main.do"><i class="fa-solid fa-user fa-1xl" style="color: #8a8a8a;"></i></a></span>
						</div>
						
					</ul>
					
					</div>
					
					</div>
			</nav>
		



		
</body>
</html>
<script>

	
</script>