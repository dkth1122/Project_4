<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
		*{ margin:0; padding:0;}
		img,area{ border:0; outline:none;}
		ul,ol,li{ list-style:none;}
		a{ color:#000; text-decoration:none;}
		body{ font-family:Graduate, Kelly Slab, Aldrich;/*OCR A Std, arial;*/ font-size:1.5em; color:#000;}
		
		nav{ width:100%; height:140px;position:relative; z-index:9999;}
		.navWrap{ width:100%; height:140px; overflow:hidden; transition: all 0.6s; position:relative;}
		.navWrap:hover{ height:500px; background:rgba(0,0,0,0.3);}
			h1{ width:100%; height:93px; text-align:center; padding-top:12px; box-sizing:border-box;}
			hr{ width:1381px; height:1px; background:rgba(255,255,255,0.8); text-align:center; margin-left:257px; border:none;}
			
			nav .gnb{ width:1230px; margin:0 auto; height:43px;  }
			nav .gnb a{color:#000000;}
			nav .gnb>li{ width:205px; float:left; margin-right:40px; height:43px; position:relative;}
			nav .gnb>li:hover>a{ color:#b4adf6;}
			nav .gnb>li:last-child{ margin-left:0;}
			nav .gnb>li a{ display:block; width:100%; height:100%; text-align:center; line-height:43px;}	
			
				nav .gnb .depths{ position:absolute;}
				nav .gnb .depths li{ width:200px;}
				nav .gnb .depths li a{ font-size:1rem; line-height:38px; }
					
				nav .gnb .depths li:hover a{ color:#6fd7ff;}
					
			
		.ban{ position:absolute; top:140px; right:0px; z-index:9998;}							
								
		header{ width:100%; height:703px; color:#fff; overflow:hidden;}
			
			
			header #container1{ position:absolute; top:0px; }
			
			/*SECT1*/
		.sect1{ width:100%; height:706px; background:url(img/s2_back.jpg) no-repeat; color:#000; }
			
					
					.ostimg { width:1665px; margin:0 auto; margin-top:240px; }
					.ostimg>div{  width:208px; height:208px; float:left; margin-left:103px; border-radius:100%; background:#900; border:5px solid #d4dafa;}
					.ostimg>div:first-child{ margin-left:0;}
					
					
					.ostimg .img1{ background:url(img/ost1.png);}
					.ostimg .img2{ background:url(img/lsf_album.jpg);background-size: contain;}
					.ostimg .img3{ background:url(img/bts_album.gif);   background-size: contain; width:370px; height:370px; margin-top:-100px;} 
					.ostimg .img4{ background:url(img/ost4.png);}
					.ostimg .img5{ background:url(img/ost5.png);}
					
					
					/*SECT1- animation*/
					.ostimg .img1{ animation: Sback 32s 4s infinite; transition:all 2s;}
					.ostimg .img2{ animation: Lback 32s 4s infinite; transition:all 2s; }
					.ostimg .img3{ animation: Hback 32s 4s infinite, Hrotate 6.6s 4s infinite;} 
					.ostimg .img4{ animation: Dback 32s 4s infinite; transition:all 2s; }
					.ostimg .img5{ animation: Iback 32s 4s infinite; transition:all 2s; }

					
 

					
					 /*
					 빙글빙글 돌아가는 멧돌 
					 @keyframes Sback
					{0%{ background:url(img/ost1.png);}
					15%{ background:url(img/ost1.png);}
					 20%{ background:url(img/ost5.png);}
					 35%{ background:url(img/ost5.png);}
					 40%{ background:url(img/ost4.png);}
					 55%{ background:url(img/ost4.png);}
					 60%{ background:url(img/ost3.png);}
					 75%{ background:url(img/ost3.png);}
					 80%{ background:url(img/ost2.png);}
					 95%{ background:url(img/ost2.png);}
					 100%{ background:url(img/ost1.png);}}
					
					@keyframes Lback
					{0%{ background:url(img/ost2.png);}
					15%{ background:url(img/ost2.png);}
					 20%{ background:url(img/ost1.png);}
					 35%{ background:url(img/ost1.png);}
					 40%{ background:url(img/ost5.png);}
					 55%{ background:url(img/ost5.png);}
					 60%{ background:url(img/ost4.png);}
					 75%{ background:url(img/ost4.png);}
					 80%{ background:url(img/ost3.png);}
					 95%{ background:url(img/ost3.png);}
					 100%{ background:url(img/ost2.png);}}			
					
					@keyframes Hback
					{0%{ background:url(img/ost_maIn1.png);}
					15%{ background:url(img/ost_maIn1.png);}
					 20%{ background:url(img/ost_maIn2.png);}
					 35%{ background:url(img/ost_maIn2.png);}
					 40%{ background:url(img/ost_maIn3.png);}
					 55%{ background:url(img/ost_maIn3.png);}
					 60%{ background:url(img/ost_maIn4.png);}
					 75%{ background:url(img/ost_maIn4.png);}
					 80%{ background:url(img/ost_maIn5.png);}
					 95%{ background:url(img/ost_maIn5.png);}
					 100%{ background:url(img/ost_maIn1.png);}}	
					 
					@keyframes Hrotate
					{0%{ transform:rotate(0deg);}
					100%{ transform:rotate(360deg);}} 		
							
					@keyframes Dback
					{0%{ background:url(img/ost4.png);}
					15%{ background:url(img/ost4.png);}
					 20%{ background:url(img/ost3.png);}
					 35%{ background:url(img/ost3.png);}
					 40%{ background:url(img/ost2.png);}
					 55%{ background:url(img/ost2.png);}
					 60%{ background:url(img/ost1.png);}
					 75%{ background:url(img/ost1.png);}
					 80%{ background:url(img/ost5.png);}
					 95%{ background:url(img/ost5.png);}
					 100%{ background:url(img/ost4.png);}}
					
					@keyframes Iback
					{0%{ background:url(img/ost5.png);}
					15%{ background:url(img/ost5.png);}
					 20%{ background:url(img/ost4.png);}
					 35%{ background:url(img/ost4.png);}
					 40%{ background:url(img/ost3.png);}
					 55%{ background:url(img/ost3.png);}
					 60%{ background:url(img/ost2.png);}
					 75%{ background:url(img/ost2.png);}
					 80%{ background:url(img/ost1.png);}
					 95%{ background:url(img/ost1.png);}
					 100%{ background:url(img/ost5.png);}} 
	 */
				/*SECT1- animation2*/
				.sect1 .ost{ width:572px; height:88px; background:url(img/ost_name1.png) no-repeat; margin-left:300px; position:relative; top:74px;
							   animation: ostname 32s 4s infinite; transition:all 2s;} 
			
	
		/*SECT2*/
		.sect2{ width:100%; height:681px; background:#f0f0f0;}	
		.sect2 h2{ text-align:center; height:102px; padding:56px 0 56px 0; box-sizing:border-box;}
		.sect2 div{  width:307px; height:438px; float:left; margin:50px 39px 0 0; background:#F00; 
						  position:relative; overflow:hidden; position:relative;}
		.sect2 div a{ width:307px; height:438px; opacity:0; color:#fff; font-size:30pt; font-family:arial; font-weight:550; position:absolute; top:0; left:0;
						padding-top:85px; padding-left:105px; box-sizing:border-box;}
		/*Sbox*/				  
		.sect2 .Sbox1{ margin-left:272px; background:url(img/seson1.jpg);}
		.sect2 .Sbox2{ background:url(img/seson2.jpg);}
		.sect2 .Sbox3{ background:url(img/seson3.jpg);}
		.sect2 .Sbox4{ background:url(img/seson4.jpg);}
		
		
		.sect2 .Sbox1:hover{ background:url(img/seson1_hover.jpg);}
		.sect2 .Sbox2:hover{ background:url(img/seson2_hover.jpg);}
		.sect2 .Sbox3:hover{ background:url(img/seson3_hover.jpg);}
		.sect2 .Sbox4:hover{ background:url(img/seson4_hover.jpg);}
		
		.sect2 div:hover a{ opacity:1;}
		
		/*SUP*/
		.sect2 div .sub{ position:absolute; bottom:-300px; width:307px; height:206px; background:rgba(255,255,255,0.7); color:#000; 
								   line-height:25pt; font-family:arial; font-size:15pt; text-align:left; padding-left:11px; box-sizing:border-box;   opacity:0; transition:all 1s;}
		
		.sect2 div:hover .sub{ position:absolute; bottom:0; opacity:1;}
		
			
		.sect2 div .sub .sname{ font-size:23pt; font-weight:bold; padding:50px 0 20px 0; box-sizing:border-box;  text-align:left;}
		
		.sect2 div:nth-child(4){ margin-left:0;}
				
		/*SECT3*/
		.sect3{  width:100%; height:593px; color:#000;}
			.sect3 h2{ text-align:center; height:44px; margin:49px 0 36px 0;}
			.sect3 .sale{ background-size: contain; width:1227px; height:276px; margin:0 auto; text-align:center; }
			.sect3 .sale li{ float:left; margin-right:40px; font-size:13.7pt; line-height:30pt;}
			
			.sect3 .sale li:last-child{ margin-right:0;}
			
		footer{ width:100%; height:163px; background:url(img/footer.jpg); text-align:center; font-size:13.8pt; padding-top:43px; box-sizing:border-box;}
				footer p{ margin-bottom:15px;}
</style>
<!-- Start HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End HEAD section -->
</head>
<body>

<nav>
<div class="navWrap">
<h1><a href="#"><img src="img/head_logo.png" alt=""/></a></h1>
<hr>

	<ul class="gnb">
            <li><a href="#">ARTIST</a>
				<ul class="depths">
					<li><a href="#">방탄소년단</a></li>
					<li><a href="#">투모로우바이투게더</a></li>
					<li><a href="#">엔하이픈</a></li>
					<li><a href="#">세븐틴</a></li>
					<li><a href="#">프로미스나인</a></li>
					<li><a href="#">르세라핌</a></li>
					<li><a href="#">뉴진스</a></li>
					<li><a href="#">보이넥스트도어</a></li>
					<li><a href="#">지코</a></li>
					</ul>
			</li>
            <li><a href="#">CATEGORY</a></li>

            <li><a href="#">EVENT</a>
				<ul class="depths">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				</ul>
            </li>
            
            <li><a href="#">STORY</a>
                <ul class="depths">
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                </ul>
            </li>
            
            <li><a href="#">더넣을거</a>
                <ul class="depths">
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                </ul>
            </li>
        </ul>
  </div>    
</nav>


<header>
<!-- Start BODY section -->
<div id="container1">
<div class="ws_images">
	<ul0>
		<li>
			<img src="data1/images/ban1.jpg" alt="ban1" title="ban1" id="wows1_0"/>
		</li>
	</ul>
</div>
</div>
<!-- End BODY section -->

</header>


<!-- !!!!!!!!!!!!!!!!!!!!  뉴 아이템 !!!!!!!!!!!!!!!!!!!!!!! -->
<section class="sect2">
	<h2>NEW ITEM</h2>
	<div class="Sbox1">
		<p class="more"><a href="#">More</a></p>
		<ul class="sub">
			<li class="sname">아티스트</li>
			<li>제품 명</li>
			<li>가격</li>
		</ul>
	</div>
	
	
	<div class="Sbox2">
		<p class="more"><a href="#">More</a></p>
		<ul class="sub">
			<li class="sname">아티스트</li>
			<li>제품 명</li>
			<li>가격</li>
		</ul>
	</div>
	
	<div class="Sbox3">
		<p class="more"><a href="#">More</a></p>
		<ul class="sub">
			<li class="sname">아티스트</li>
			<li>제품 명</li>
			<li>가격</li>
    </ul>
</div>

<div class="Sbox4">
	<p class="more"><a href="#">More</a></p>
    <ul class="sub">
		<li class="sname">아티스트</li>
		<li>제품 명</li>
		<li>가격</li>
    </ul>
</div>

</ul>


</section>
<section class="sect3">
	<h2>STORE</h2>
	<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 스토어!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->

	<ul class="sale">
		<li><a href="#"><img src="img/sale1.jpg" alt=""/><p>아이템1 - 이름<br>8,000원</a></li>
			<li><a href="#"><img src="img/sale2.jpg" alt=""/><p>아이템2 - 이름<br>8,000원</p></a></li>
			<li><a href="#"><img src="img/sale3.jpg" alt=""/><p>아이템3 - 이름<br>7,000원</p></a></li>
			<li><a href="#"><img src="img/sale4.jpg" alt=""/><p>아이템4 - 이름<br>5,500원</a></li>
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
			<p>푸터용<br>
				회사명 (주)에스엠브랜드마케팅 대표자명 한경진, 진현주 주소 06097 서울 강남구 봉은사로 413 백신제3빌딩 4층 대표번호 1661-6110
사업자등록번호 211-88-17109 통신판매업 신고번호 제 2021-서울성동-01975호 개인정보보호책임자 정성아 / responsibility@smtown.com
호스팅서비스 제공자 카페24(주) 구매안전서비스 이용확인
SMTOWN &STORE의 모든 콘텐츠는 저작권의 보호를 받고 있습니다</p>
				<img src="img/footerlogo.png" alt=""/>
			</footer>
			
			
	
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : []
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	console.log(self.list);
                }
            }); 
		}
		
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>