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
    line-height: 70px;
	text-align:center;
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {

	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
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
    text-align: right;
    padding-right: 10px;
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

									<div>교환/환불</div>
									<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</div>

								</div>
								<div class="details">
									<div>포인트</div>
									<div>{{info.uPoint}} P</div>
								</div>
								<div class="details">
									<div>Jelly</div>
									<div>0</div>
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
                                 <li class="ulh1">나의 쇼핑 정보 </li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myPagOrderdetails.do">주문내역</a></li>
                                       <li><a href="/mypag/myPageInterest.do  ">장바구니</a></li>
                                       <li><a href="/mypag/myInformation.do">찜 목록</a></li>
                                       <li><a href="/mypag/mypageReserves.do">포인트</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>
                              <ul style="padding: 0px;">
                                 <li class="ulh1">회원 정보</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/infoUpdate.do">회원 정보 수정</a></li>
                                       <li><a href="/mypag/addAddr.do">배송주소록</a></li>                           
                                    </ul>   
                                 </li>  
                              </ul>
                               <ul style="padding: 0px;">
                                 <li class="ulh1">고객센터</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myAddInquiry.do">1:1 문의</a></li>
                                       <li><a href="/mypag/noticeList.do">공지사항</a></li>
                                       <li><a href="/mypag/useGuide.do">이용안내</a></li>
                                       <li><a href="/mypag/faq.do">FAQ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>


						</div>
					</div>

					<div id="right">

						<div class="View">
							<div class="lowerBox">주문상품</div>
							<div class="swiper-container">
							<div class="swiper-wrapper">
							
								<div class="swiper-slide" v-for="item in orderlist">									
								       <div><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
							           <div class="justBox">{{item.pName}}</div>
							           <div class="justpay">\ {{item.price}}</div>
							          
								</div>
						
							</div>
						
							<!-- 네비게이션 -->
							<div class="swiper-button-next" ></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
							<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
						
							<!-- 페이징 -->
							<div class="swiper-pagination"></div>
						</div>
				
							
							<div v-if="false">
							<div class="nodata">내역이 없습니다</div>							 
							</div>
							
						</div>

						<div class="View">
							<div class="lowerBox">장바구니</div>
							<div class="swiper-container">
							<div class="swiper-wrapper">
					
							</div>
						
							<!-- 네비게이션 -->
							<div class="swiper-button-next" ></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
							<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
						
							<!-- 페이징 -->
							<div class="swiper-pagination"></div>
						</div>

							
							<div v-if="false">
							<div class="nodata">내역이 없습니다</div>
							</div>
							
						</div>

						<div class="View">
			

							<div v-if="true">
							<div class="nodata">내역이 없습니다</div>
							</div>
						</div>

					</div>

				</div>


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
			fnGetList : function() { // 사용자 정보 불러오기 이름 , 별명 (닉네임)
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
			/* 상단 구매내역 카운트 숫자 */
			fnCntList : function() {
				var self = this;
				var nparmap = {uId : self.uId};
				console.log(nparmap);
				$.ajax({
					url : "/mypag/listExchange.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						var listCnt = data.list;
						for (var i = 0; i < listCnt.length; i++) {
							if (listCnt[i].exchange == "N") {
								self.order = listCnt[i].orderCnt;
								console.log(self.order);
							} else if (listCnt[i].exchange == "E") {
								self.exchange = listCnt[i].orderCnt;
							} else {
								self.refund = listCnt[i].orderCnt;
							}
						}

					}
				});
			},
			 /* 찜목록 */
			fnwish: function() {
				var self = this;
				var nparmap = {uId : self.uId};
				console.log(nparmap);
				$.ajax({
					url : "/mypag/wishlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(self.wishlist);
						self.wishlist = data.list;
						

					}
				});
			},
			 /* 구매내역 */
			fnorder: function() {
				var self = this;
				var nparmap = {uId : self.uId};
				console.log(nparmap);
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
			 /* 장바구니 */
			fncart: function() {
				var self = this;
				var nparmap = {uId : self.uId};
				console.log(nparmap);
				$.ajax({
					url : "/mypag/selectcartlist.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.cartlist = data.list;
						

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

		slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 30, // 슬라이드간 간격
		slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,

		loop : true, // 무한 반복

		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});

</script>
