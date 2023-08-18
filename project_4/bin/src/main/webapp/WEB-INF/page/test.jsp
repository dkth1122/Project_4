<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
/*SECT1*/

/* 슬라이드 배경색 */
.sect1 {
position: absolute;
top: 100%;
right: 50%;
transform: translate(50%, -50%);
	width: 2000px;
	height: 706px;
	background: url(img/homeimg/s2_back.jpg) no-repeat;
	color: #000;
}

/* 앨범 커버 */
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
	background: url(img/homeimg/homeimg/homeimg/ost1.png);
}

.ostimg .img2 {
	background: url(img/homeimg/homeimg/homeimg/lsf_album.jpg);
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
</head>
<body>
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
</body>
</html>