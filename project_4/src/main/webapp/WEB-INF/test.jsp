<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">

<style>
<!--
�����̵� ���� -->.slider {
	width: 640px;
	height: 480px;
	margin: 0 auto;
}

.slider input[type=radio] {
	display: none;
}

ul.imgs {
	padding: 0;
	margin: 0;
}
/* �����̴� ��ġ ���� */
ul.imgs li {
	position: absolute;
	top: 100%;
	right: 50%;
	transform: translate(50%, -50%);
	position: absolute;
	opacity: 0;
	list-style: none;
	padding: 0;
	margin: 0;
	transition-delay: 0.9s;
}

.bullets {
	position: absolute;
	top: 134%;
	right: 50%;
	transform: translate(50%, -50%);
	bottom: 20px;
	z-index: 2;
}

.bullets label {
	display: inline-block;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.55);
	width: 20px;
	height: 20px;
	cursor: pointer;
}

.slider input[type=radio]:nth-child(1):checked ~.bullets>label:nth-child(1)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(2):checked ~.bullets>label:nth-child(2)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(3):checked ~.bullets>label:nth-child(3)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(4):checked ~.bullets>label:nth-child(4)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(5):checked ~.bullets>label:nth-child(5)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(1):checked ~ul.imgs>li:nth-child(1)
	{
	opacity: 1;
	transition: 1s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(2):checked ~ul.imgs>li:nth-child(2)
	{
	opacity: 1;
	transition: 1s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(3):checked ~ul.imgs>li:nth-child(3)
	{
	opacity: 1;
	transition: 1s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(4):checked ~ul.imgs>li:nth-child(4)
	{
	opacity: 1;
	transition: 1s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(5):checked ~ul.imgs>li:nth-child(5)
	{
	opacity: 1;
	transition: 1s;
	z-index: 1;
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
	color: #000;
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

nav{ width:100%; height:140px;position:relative; z-index:9999;}
		.navWrap{ width:100%; height:140px; overflow:hidden; transition: all 0.6s; position:relative;}
		.navWrap:hover{ height:500px; background:rgba(0,0,0,0.3);}
			h1{ width:100%; height:93px; text-align:center; padding-top:12px; box-sizing:border-box;}
			hr{ width:1381px; height:1px; background:rgba(255,255,255,0.8); text-align:center; margin-left:257px; border:none;}
			
nav .menu {
	width: 1230px;
	margin: 0 auto;
	height: 43px;
}

nav .menu a {
	color: 000000;
}


/* ���� ���� */
nav .menu>li {
	width: 105px;
	float: left;
	margin-right: 40px;
	height: 43px;
	position: relative;
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
	line-height: 43px;
}

nav .menu .depths {
	position: absolute;
}

nav .menu .depths li {
	width: 200px;
}

nav .menu .depths li a {
	font-size: 1rem;
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

/*SECT1*/

/* �����̵� ���� */
.sect1 {
position: absolute;
top: 100%;
right: 50%;
transform: translate(50%, -50%);
	width: 2000px;
	height: 706px;
	background: url(img/s2_back.jpg) no-repeat;
	color: #000;
}

/* �ٹ� Ŀ�� */
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
	background: url(img/ost1.png);
}

.ostimg .img2 {
	background: url(img/lsf_album.jpg);
	background-size: contain;
}

.ostimg .img3 {
	background: url(img/bts_album.gif);
	background-size: contain;
	width: 370px;
	height: 370px;
	margin-top: -100px;
}

.ostimg .img4 {
	background: url(img/ost4.png);
}

.ostimg .img5 {
	background: url(img/ost5.png);
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

/*new item*/
.sect2 {
position: absolute;
	top: 200%;
	right: 50%;
	transform: translate(50%, -50%);
	width: 2000px;
	height: 681px;
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
	position: relative;
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
	background: url(img/seson1.jpg);
}

.sect2 .Sbox2 {
	background: url(img/seson2.jpg);
}

.sect2 .Sbox3 {
	background: url(img/seson3.jpg);
}

.sect2 .Sbox4 {
	background: url(img/seson4.jpg);
}
.sect2 .Sbox5 {
	margin-left: 272px;
	background: url(img/seson1.jpg);
}

.sect2 .Sbox6 {
	background: url(img/seson2.jpg);
}

.sect2 .Sbox7 {
	background: url(img/seson3.jpg);
}

.sect2 .Sbox8 {
	background: url(img/seson4.jpg);
}

.sect2 .Sbox1:hover {
	background: url(img/seson1_hover.jpg);
}

.sect2 .Sbox2:hover {
	background: url(img/seson2_hover.jpg);
}

.sect2 .Sbox3:hover {
	background: url(img/seson3_hover.jpg);
}

.sect2 .Sbox4:hover {
	background: url(img/seson4_hover.jpg);
}
.sect2 .Sbox5:hover {
	background: url(img/seson1_hover.jpg);
}

.sect2 .Sbox6:hover {
	background: url(img/seson2_hover.jpg);
}

.sect2 .Sbox7:hover {
	background: url(img/seson3_hover.jpg);
}

.sect2 .Sbox8:hover {
	background: url(img/seson4_hover.jpg);
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


/*SECT3*/
.sect3 {
position: absolute;
	top: 400%;
	right: 50%;
	transform: translate(50%, -50%);
	width: 2000px;
	height: 593px;
	color: #000;
}

.sect3 h2 {
	text-align: center;
	height: 44px;
	margin: 49px 0 36px 0;
}

.sect3 .sale {
	background-size: contain;
	width: 1227px;
	height: 276px;
	margin: 0 auto;
	text-align: center;
}

.sect3 .sale li {
	float: left;
	margin-right: 40px;
	font-size: 13.7pt;
	line-height: 30pt;
}

.sect3 .sale li:last-child {
	margin-right: 0;
}

footer {
position: absolute;
top: 600%;
right: 50%;
transform: translate(50%, -50%);
	width: 100%;
	height: 163px;
	background: url(img/footer.jpg);
	text-align: center;
	font-size: 13.8pt;
	padding-top: 43px;
	box-sizing: border-box;
}

footer p {
	margin-bottom: 15px;
}

<!--
�����̵� ��Ÿ��  -->section {
	position: relative;
	width: 1200px;
	height: 300px;
	overflow: hidden;
}

img.imgslide1 {
	position: absolute;
	left: 0px;
	top: 0;
	width: 1200px;
	height: 300px;
	animation: slide1 7s infinite;
}

img.imgslide2 {
	position: absolute;
	left: 0;
	top: 0;
	width: 1200px;
	height: 300px;
	animation: slide2 7s infinite;
}

img.imgslide3 {
	position: absolute;
	left: 0;
	top: 0;
	width: 1200px;
	height: 300px;
	animation: slide3 7s infinite;
}
</style>
<!-- Start HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End HEAD section -->
</head>

<body>

	<!-- !!!!!!!!!!!!!!!!!!!!!    �����̴� !!!!!!!!!!!!!!!!!! -->
	<div class="slider">
		<input type="radio" name="slide" id="slide1" checked=""> <input
			type="radio" name="slide" id="slide2"> <input type="radio"
			name="slide" id="slide3"> <input type="radio" name="slide"
			id="slide4"> <input type="radio" name="slide" id="slide5">
		<ul id="imgholder" class="imgs">
			<li><img src="img/seventeen_main.jpg"></li>
			<li><img src="img/lsf_main.jpg"></li>
			<li><img src="img/newjins_main.jpeg"></li>
			<li><img src="img/promiss_main.jpg"></li>
			<li><img src="img/boynext.jpg"></li>
		</ul>
		<div class="bullets">
			<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
			<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
			<label for="slide5">&nbsp;</label>
		</div>

		<nav>
			<div class="navWrap">
				<h1>
					<a href="#"><img src="img/head_logo.png" alt="" /></a>
				</h1>
				<hr>

				<ul class="menu">
					<li><a href="#">ARTIST</a>
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
						</ul></li>
						
						
					<li><a href="#">PRODUCT</a>
						<ul class="depths">
							<li><a href="#">MEMBERSHIP</a></li>
							<li><a href="#">ALBUM</a></li>
							<li><a href="#">MERCHANDISE</a></li>
							<li><a href="#">DVD</a></li>
							<li><a href="#">PHOTO BOOK</a></li>
						</ul></li>
						
						
					<li><a href="#">EVENT</a>
						<ul class="depths">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
						</ul></li>

					<li><a href="#">STORY</a>
						<ul class="depths">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul></li>
						
								</ul>
			</div>
		</nav>


		<header>
			<!-- Start BODY section -->
			<div id="container1">
				<div class="ws_images">
					<ul0>
					<li><img src="data1/images/ban1.jpg" alt="ban1" title="ban1"
						id="wows1_0" /></li>
					</ul>
				</div>
			</div>
			<!-- End BODY section -->

		</header>


		<!-- !!!!!!!!!!!!!!!!!!!!  �� ������ !!!!!!!!!!!!!!!!!!!!!!! -->
		<section class="sect2">
			<h2>NEW ITEM</h2>
			<div class="Sbox1">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">��Ƽ��Ʈ</li>
					<li>��ǰ ��</li>
					<li>����</li>
				</ul>
			</div>


			<div class="Sbox2">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">��Ƽ��Ʈ</li>
					<li>��ǰ ��</li>
					<li>����</li>
				</ul>
			</div>

			<div class="Sbox3">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">��Ƽ��Ʈ</li>
					<li>��ǰ ��</li>
					<li>����</li>
				</ul>
			</div>

			<div class="Sbox4">
				<p class="more">
					<a href="#">More</a>
				</p>
				<ul class="sub">
					<li class="sname">��Ƽ��Ʈ</li>
					<li>��ǰ ��</li>
					<li>����</li>
				</ul>
			</div>

			</ul>


		</section>
		<section class="sect3">
			<h2>STORE</h2>
			<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! �����!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->

			<ul class="sale">
				<li><a href="#"><img src="img/sale1.jpg" alt="" />
						<p>
							������1 - �̸�<br>8,000��</a></li>
				<li><a href="#"><img src="img/sale2.jpg" alt="" />
						<p>
							������2 - �̸�<br>8,000��
						</p></a></li>
				<li><a href="#"><img src="img/sale3.jpg" alt="" />
						<p>
							������3 - �̸�<br>7,000��
						</p></a></li>
				<li><a href="#"><img src="img/sale4.jpg" alt="" />
						<p>
							������4 - �̸�<br>5,500��</a></li>
			</ul>

		</section>
		<section class="sect1">
			<div class="ost"></div>
			<div class="ostimg">

				<div class="img1"></div>

				<div class="img2"></div>

				<div class="img3"></div>

				<div class="img4"></div>

				<div class="img5"></div>

			</div>

		</section>
		<footer>
			<p>
				<br> ȸ��� (��)VeryPeri Corp. ��ǥ�ڸ� ������
				 <br>�ּ� ��õ������ ���� ���� 534-48 7��
				 ��ǥ��ȣ 4444-4444 / 4zomotchamchi@veryperi.com 
				<br> VeriPeri�� ��� �������� ���۱��� ��ȣ�� �ް� �ֽ��ϴ�
			</p>
			<img src="img/footerlogo.png" alt="" />
		</footer>
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