<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/swiper.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>

<!-- Swiper library -->
<link href="https://cdn.jsdelivr.net/npm/swiper@5.3.6/css/swiper.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/swiper@5.3.6/js/swiper.min.js"></script>
<!-- vue-awesome-swiper -->
<script src="https://cdn.jsdelivr.net/npm/vue-awesome-swiper@4.1.1/dist/vue-awesome-swiper.js"></script>

<meta charset="EUC-KR">
<style type="text/css">
.swiper-container {
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
.j{
	margin-bottom: 55px;
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


				<div id="body">

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

						<div class="View" style="margin-bottom : 30px;">
							<div class="lowerBox j">�ֹ���ǰ</div>
							<div v-if="orderlist.length == 0">
									<div class="nodata">������ �����ϴ�</div>							
								</div> 
							<div v-else class="swiper-container">
							<swiper
							    ref="swiperComponent"
							    :options="swiperOptions"
							    @click-slide="onSwiperClickSlide"
							    @set-translate="onSetTranslate"
							>
								<template v-for="item in orderlist">
							    	<swiper-slide>
						    			<div><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
							            <div class="justBox">{{item.pName}}</div>
							            <div class="justpay">\ {{item.price}}</div>		
							    	</swiper-slide>
							    </template>
						          <div class="swiper-pagination"  slot="pagination"></div>
							      <div class="swiper-button-prev" slot="button-prev"></div>
							      <div class="swiper-button-next" slot="button-next"></div>
							</swiper>
						</div>
				
						</div>

						<div class="View">						
							<div class="lowerBox j">��ٱ���</div>
								<div v-if="cartlist.length == 0">
									<div class="nodata">������ �����ϴ�</div>							
								</div> 
									<div v-else class="swiper-container">
										<swiper
										    ref="swiperComponent"
										    :options="swiperOptions"
										    @click-slide="onSwiperClickSlide"
										    @set-translate="onSetTranslate"
										>
											<template v-for="item in cartlist">
										    	<swiper-slide>
									    			<div><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
										            <div class="justBox">{{item.pName}}</div>
										            <div class="justpay">\ {{item.price}}</div>		
										    	</swiper-slide>
										    </template>
									          <div class="swiper-pagination"  slot="pagination"></div>
										      <div class="swiper-button-prev" slot="button-prev"></div>
										      <div class="swiper-button-next" slot="button-next"></div>
										</swiper>
									</div>

							
							
							
						</div>

						<div class="View">
						<div class="lowerBox j">����</div>
						<div v-if="wishlist.length == 0">
									<div class="nodata">������ �����ϴ�</div>							
								</div> 
								<div v-else class="swiper-container">
										<swiper
										    ref="swiperComponent"
										    :options="swiperOptions"
										    @click-slide="onSwiperClickSlide"
										    @set-translate="onSetTranslate"
										>
											<template v-for="item in wishlist">
										    	<swiper-slide>
									    			<div><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
										            <div class="justBox">{{item.pName}}</div>
										            <div class="justpay">\ {{item.price}}</div>		
										    	</swiper-slide>
										    </template>
									          <div class="swiper-pagination"  slot="pagination"></div>
										      <div class="swiper-button-prev" slot="button-prev"></div>
										      <div class="swiper-button-next" slot="button-next"></div>
										</swiper>
									</div>
						</div>

					</div>

				</div>


			</div>
		</div>
</body>
</html>
<script type="text/javascript">
Vue.use(VueAwesomeSwiper);
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
			swiperOptions: {
		      loop: true,
		      slidesPerView: 3, 
		      pagination: {
		        el: '.swiper-pagination',
		        clickable : true, 
	            type: 'bullets'
		      },
		      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev'
		      }
		    }
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
							if (listCnt[i].exchange == "E") {								
								self.refund = listCnt[i].orderCnt;							
							} else if (listCnt[i].exchange == "R") {
								self.exchange = listCnt[i].orderCnt;
							} else if(listCnt[i].exchange == null){
								console.log(listCnt[i].orderCnt);
								self.order = listCnt[i].orderCnt;
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
						console.log("����");
						console.log(self.cartlist);

					}
				});
			},
			onSetTranslate() {
			      console.log('onSetTranslate')
		    },
		    onSwiperSlideChangeTransitionStart() {
		      console.log('onSwiperSlideChangeTransitionStart')
		    },
		    onSwiperClickSlide(index, reallyIndex) {
		      console.log('Swiper click slide!', reallyIndex)
		    }

		
		},
		mounted() {
			console.log('Swiper instances:', this.$refs.swiperComponent.$swiper, this.swiper);
		},
		created : function() {
			var self = this;
			self.fnGetList();
			self.fnCntList();
			self.fnorder();
			self.fncart();
			self.fnwish();
		}
	});

</script>
