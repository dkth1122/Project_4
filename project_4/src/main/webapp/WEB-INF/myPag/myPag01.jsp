<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/footer.js"></script>
<script src="../js/footer.js"></script>
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link href="../css/footer.css" rel="stylesheet" type="text/css">
<%@ include file="../Product/sexyheader.jsp" %>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/swiper.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="EUC-KR">
<style type="text/css">
.swiper-container {
	margin-top : 50px;
	height:420px;
	border-radius:7px;
}
.swiper-slide {
    line-height: 50px;
	text-align:center;
	align-items:center; /* ���Ʒ� ���� �߾����� */
	justify-content:center; /* �¿� ���� �߾����� */
}
.swiper-slide img {

	max-width:100%; /* �̹��� �ִ�ʺ� ����, �����̵忡 �̹����� �������� �������� �ʿ� */
	/* �� �������� �ʿ��ؼ� �����߽��ϴ�. ��Ȳ������ �ٸ� �� �ֽ��ϴ�. */
}
.b{ 

	height: 350px;
	display: flex;
	width: 1200px;	
}
.c{

	width: 250px;
	height: 350px;
	margin-right: 63px;
}
.justimg{
	width: 250px;
	height: 200px;
}
.justBox{
 	width: max-content;
 	word-break: break-all;
	max-width: 170px;
	display: inline-block;
	font-size: 0.7em;
	margin-bottom: 10px;
	line-height: 20px;
	
}
.justpay, .justBox {
	width : 276px;
    text-align: right;
  	margin:  0px;
  	padding: 0xp;
}
footer{
	width: 100%;
	height: 600px;
}
</style>

</head>
<body>

	<div id="app">

			<div id="container">
				<div id="top">
					<div id="topbody">
						<div style="height: 150px;"></div>

						<div class="a">
							<div class="left topImgBoxwid">
								<a href="/mypag/main.do"><div id="profileImg"></div></a>
							</div>
							<div class="topBox">
								<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
							</div>

							<div class="topBox">

								<div class="details">

									<div>Order</div>
			                        <label><a href="/mypag/myPagOrderdetails.do">                            
			                        <div v-if="order != 0">{{order}}</div>
			                        <div v-else>0</div>
                          			</a></label>

								</div>

								<div class="details">

									<div>��ȯ/ȯ��</div>
									<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</div>

								</div>
								<div class="details">
									<div>����Ʈ</div>
									<div v-if="info.uPoint !=0">{{info.uPoint}} P</div>
									<div v-else>0 P</div>
								</div>
								
							</div>
						</div>


					</div>
				</div>


				<div id="mypage">

					<div id="left">
						<div class="categories">MY PAGE</div>
						<div style="text-align: left;">
							<ul style="padding: 0px;">
                                 <li class="ulh1">���� ���� ���� </li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myPagOrderdetails.do">�ֹ�����</a></li>
                                       <li><a href="/mypag/myPageInterest.do  ">��ٱ���</a></li>
                                       <li><a href="/mypag/myInformation.do">�� ���</a></li>
                                       <li><a href="/mypag/mypageReserves.do">����Ʈ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>
                              <ul style="padding: 0px;">
                                 <li class="ulh1">ȸ�� ����</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/infoUpdate.do">ȸ�� ���� ����</a></li>
                                       <li><a href="/mypag/infoAddr.do">����ּҷ�</a></li>                           
                                    </ul>   
                                 </li>  
                              </ul>
                               <ul style="padding: 0px;">
                                 <li class="ulh1">������</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myAddInquiry.do">1:1 ����</a></li>
                                       <li><a href="/mypag/noticeList.do">��������</a></li>
                                       <li><a href="/mypag/useGuide.do">�̿�ȳ�</a></li>
                                       <li><a href="/mypag/faq.do">FAQ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>


						</div>
					</div>

					<div id="right">

						<div class="View">
							<div class="lowerBox">�ֹ���ǰ</div>
							<div class="swiper-container">
							<div class="swiper-wrapper">
								<template v-for="item in orderlist">
										<div class="swiper-slide" >																	
									       <div><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								           <div class="justBox">{{item.pName}}</div>
								           <div class="justpay">\ {{item.price}}</div>								      
										</div>
								</template>
						
							</div>
						
							<!-- �׺���̼� -->
							<div class="swiper-button-next" ></div><!-- ���� ��ư (�����ʿ� �ִ� ��ư) -->
							<div class="swiper-button-prev"></div><!-- ���� ��ư -->
						
							<!-- ����¡ -->
							<div class="swiper-pagination"></div>
						</div>
				
							
							<div v-if="false">
							<div class="nodata">������ �����ϴ�</div>							 
							</div>
							
						</div>

						<div class="View">						
							<div class="lowerBox">��ٱ���</div>
							<!-- 	<div v-if="falsecartlist.lenght == 0">
									<div class="nodata">������ �����ϴ�</div>							
								</div> -->
									<div class="swiper-container">
										<div class="swiper-wrapper">
												<div class="swiper-slide" v-for="item in cartlist">																	
											       <div><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
										           <div class="justBox">{{item.pName}}</div>
										           <div class="justpay">\ {{item.price}}</div>							        
										 		</div>
											
										</div>
									
										<!-- �׺���̼� -->
										<div class="swiper-button-next" ></div><!-- ���� ��ư (�����ʿ� �ִ� ��ư) -->
										<div class="swiper-button-prev"></div><!-- ���� ��ư -->
									
										<!-- ����¡ -->
										<div class="swiper-pagination"></div>
									</div>

							
							
							
						</div>

						<div class="View">
						<div class="lowerBox">����</div>
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<template v-for="item in wishlist">
												<div class="swiper-slide" >																	
											       <div><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
										           <div class="justBox">{{item.pName}}</div>
										           <div class="justpay">\ {{item.price}}</div>								      
												</div>
										</template>
								
									</div>
								
									<!-- �׺���̼� -->
									<div class="swiper-button-next" ></div><!-- ���� ��ư (�����ʿ� �ִ� ��ư) -->
									<div class="swiper-button-prev"></div><!-- ���� ��ư -->
								
									<!-- ����¡ -->
									<div class="swiper-pagination"></div>
								</div>
							<div v-if="false">
							<div class="nodata">������ �����ϴ�</div>
							</div>
						</div>

					</div>

				</div>


			</div>
			<div>
				<%@ include file="../page/footer.jsp" %>			
			</div>

		</div>
	
</body>
</html>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			info : [],
			orderCntList : [],
			uId : "${sessionId}",
			order : "",
			exchange : "",
			refund : "",
			wishlist : [],
			orderlist : [],
			cartlist : [],
		},
		methods : {
			fnGetList : function() { // ����� ���� �ҷ����� �̸� , ���� (�г���)
				var self = this;
				var nparmap = {uId : self.uId};				
				$.ajax({
					url : "/user2.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.info = data.findPw;
					}
				});
			},
			/* ��� ���ų��� ī��Ʈ ���� */
			fnCntList : function() {
				var self = this;
				var nparmap = {uId : self.uId};
				$.ajax({
					url : "/mypag/listExchange.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						
						var listCnt = data.list;
						for (var i = 0; i < listCnt.length; i++) {
							if (listCnt[i].exchange == "N") {
								self.order = listCnt[i].orderCnt;
							
							} else if (listCnt[i].exchange == "E") {
								self.exchange = listCnt[i].orderCnt;
							} else {
								self.refund = listCnt[i].orderCnt;
							}
						}

					}
				});
			},
			 /* ���� */
			fnwish: function() {
				var self = this;
				var nparmap = {uId : self.uId};
		
				$.ajax({
					url : "/mypag/wishlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						
						self.wishlist = data.list;
						
						

					}
				});
			},
			 /* ���ų��� */
			fnorder: function() {
				var self = this;
				var nparmap = {uId : self.uId};
			
				$.ajax({
					url : "/mypag/productInformation.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.orderlist = data.list;

					}
				});
			},
			 /* ��ٱ��� */
			fncart: function() {
				var self = this;
				var nparmap = {uId : self.uId};
			
				$.ajax({
					url : "/mypag/selectcartlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						
						self.cartlist = data.list;
						console.log(self.cartlist);

					}
				});
			},

		
		},created : function() {
			var self = this;
			self.fnGetList();
			self.fnCntList();
			self.fnorder();
			self.fncart();
			self.fnwish();
		}
	});
	

	new Swiper('.swiper-container', {

		slidesPerView : 3, // ���ÿ� ������ �����̵� ����
		spaceBetween : 20, // �����̵尣 ����
		slidesPerGroup : 3, // �׷����� ���� ��, slidesPerView �� ���� ���� �����ϴ°� ����

		// �׷���� ���� ���� ��� ��ĭ���� �޿��
		// 3���� ���;� �Ǵµ� 1���� �ִٸ� 2���� ��ĭ���� ä���� 3���� ����
		loopFillGroupWithBlank : true,

		loop : true, // ���� �ݺ�

		pagination : { // ����¡
			el : '.swiper-pagination',
			clickable : true, // ����¡�� Ŭ���ϸ� �ش� �������� �̵�, �ʿ�� ������ ��� ��� �۵�
		},
		navigation : { // �׺���̼�
			nextEl : '.swiper-button-next', // ���� ��ư Ŭ������
			prevEl : '.swiper-button-prev', // �̹� ��ư Ŭ������
		},
	});

</script>
