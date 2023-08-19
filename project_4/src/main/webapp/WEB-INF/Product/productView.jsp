<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>  
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	div{
		display : block;
	}
	
	#imgBox{
		background-color : gray;
		height : 840px;
		width : 700px;
		txext-align : center;
		float : left;
		position : relative;
	}	
	.headingArea{
		position : relative;
		padding : 0 0 10px;
		margin : 15px 0 15px;
		line-height : 24px;
		border-bottom : 1px solid #d4d5d9;
	}
	table{
		text-indent: initial;
	}
	#infoArea {
	    float: right;
	    width: 350px;
	    margin: 0 0 0 48px;
	    background-color: #fff;
	    position: relative;
	}
	.infoDetail{
		border-bottom : 1px solid #d4d5d9;
		
	}
	.pointDetail{
		border-bottom : 1px solid #d4d5d9;
	}
	.productsAddList{
		background-color: #f8f8f8;
	    position: relative;
	    display: block;
	    margin-bottom: 4px;	 
	    padding: 14px;
	    margin-top : 20px;
	}
	#totalPrice {
	    margin: 20px 0 0;
	    height: 34px;
	    line-height: 34px;
	    padding: 0 9px 0;
	    color: #2d2f43;
	    vertical-align: middle;
	    background: #fff;
	    font-size: 14px;
	    margin-bottom : 20px;
	}
	#itemSlideArea{
	 	display: flex;
	 	justify-content: center;
   		align-items: center;
		width : 350px;
		height: 300px;
	}
	.itemSlide{
		margin: 0 20px;
    	text-align: center;
		width : 175px;
		height: 260px;
	}
	.itemContainer {
	    display: inline-block;
    	vertical-align: top; /* div요소에 있는 이미지와 텍스트 상단 정렬 */
	}
	.txt-box {
    	margin-top: 10px; 
    	font-weight : bold;
    	font-size : 13px;
	}
	.pc-wrap .slider-type2 .swiper-slide .txt-box {
	    min-height: 76px;
	    padding: 0 15px 0;
	    box-sizing: border-box;
	}
	.explanation{
		width: 1200px;
    	margin: 80px auto;
    	margin: 80px auto 0 !important;
	}
	#container{
		height: auto;
		width: 1200px;
	    padding: 0;
	    margin: 0 auto;
	    /* content: "";
    	display: block;
    	clear: both; */
	}
	
	
	#radioMenu {
	  display: flex;
	  gap: 20px;
	  border-bottom : 2px solid #d4d5d9;
	  justify-content: center;
	}

	#radioMenu input[type="radio"] {
	  display: none;
	}
	
	#radioMenu label {
	  display: inline-block;
	  padding: 10px 20px;
	  border-bottom: 3px solid transparent;
	  cursor: pointer;
	  transition: color 0.3s, border-bottom 0.3s;
	}
	
	#radioMenu label:hover {
	  color: RGB(102, 103, 171);
	}
	
	#radioMenu input[type="radio"]:checked + label {
	  color:RGB(102, 103, 171);
	  border-bottom-color: RGB(102, 103, 171);
	  font-weight: bold;
	  
	}
	pre{
		padding : 20px;
	}
	/* 버튼 기본 스타일 */
	.button {
	  display: inline-block;
	  padding: 10px 20px;
	  font-size: 14px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 49%;
	  margin-right : 3px;
	  margin-bottom : 30px;
	  
	}
	
	/* 버튼 호버 효과 */
	.button:hover {
	  background-color: #d4d5d9;
	}
	
	/* 버튼 클릭 효과 */
	.button:active {
	  background-color: #1f618d;
	}
	 .buyButton {
	    background-color: rgb(102, 103, 171); /* 바로구매 버튼 배경색 */
	    color: white; /* 바로구매 버튼 글자색 */
	    border-radius: 30px; /* 라운딩 처리 */
	    padding: 10px 20px; 
	    font-weight: bold; 
	    font-size: 16px;
	    cursor: pointer; 
	    border: none; /* 테두리 없애기 */
	    width : 100%;
	    margin-bottom : 10px;
  }

  .buyButton:hover {
   	 	 background-color:rgb(71, 72, 141);
  }
  .buyButton:active {
	   background-color: rgb(91, 92, 161);
	}
	em{
		color:#d4d5d9;
		font-size : 14px;
	}
	.category{
		font-size : 15px;
	}
	.notice{
		color : tomato;
		font-size : 12px;
		font-weight : bold;
	}
	.pointArea{
		border-bottom : 1px solid #d4d5d9;
		padding-bottom : 15px;
		margin-bottom : 15px;
	}
	.jeokrip{
		margin : 40px;
	}
	#totalProducts{
		margin-bottom : 10px;
	}
	#quantity{
		border: none; /* 입력 상자 테두리 없애기 */
		background-color: transparent; /* 배경색 없애기 */
		outline: none; /* 포커스 시 나타나는 테두리 없애기 */
		font-weight:bold;
		width: 16px;
		margin-left : 6px;
	}
	.total{
		float:right;
	}
	.price{
		font-weight : bold;
		font-size : 14px;
	}
	.h3 {
    	margin-bottom: 0; 
	}
</style>
</head>
<body>

<div id="app">
	<div id="container">
		<div id="imgBox">
			 <div id="mainImg">
			 <img :src="path">
			 </div>
		</div>	
		<div id="infoArea" style="display : block;, height: 623px; top:auto; ">
			<div class="headingArea">
				<h2 class="cboth">
					<em>[CONNECTION] {{artist}}</em>
					<div class="category">{{category}}</div>
					<div>{{pName}}</div>
				</h2>
				<div class="priceArea">
					<span><i class="fa-solid fa-won-sign"></i></span>
					<span><strong>{{formattedPrice}}</strong></span>
				</div>
			</div>	
			
			<div class="infoDetail">
				<div>
					<div class="pointArea">
						<span width="100px" height="30px">
							<span style="font-size:14px;color:#232744; font-weight:bold; text-align:left;" >적립금</span>
						</span>
						<span class="pointArea" width="250px" height="30px" >
							<span class="jeokrip" style="font-size:14px;color:#232744;">최대 0.50% ({{price*0.005}} P)</span>
						</span>
					</div>
					<div>
						<div width="360px" height="60px" >
							<span class="notice">								
								<div v-if='membership == "N"'>*GOT the beat Stamp On It MD끼리만 주문 가능합니다.</div>
								<div style="margin-bottom:20px;">*해당 상품은 결제 후 7~10일(주말,공휴일 제외) 이내 배송이 시작될 예정입니다.</div>
							</span>
						</div>
					</div>
				</div>
			</div>	
			
			<div class="productsAddList">
				<div style="max-height: none;">
					<div style="position:relative; top:0; left:0; backgound-color:#232744;">
						<div id="totalProducts">
							{{pName}}
						</div>
						
						<span class="quantity">
							<a href="#none" @click="decreaseQuantity"><i class="fa-solid fa-minus"></i></a>
							<input id="quantity" name="quantity_opt[]" v-model="quantity" @input="formatQuantity" type="text">
							<a href="#none" @click="increaseQuantity"><i class="fa-solid fa-plus"></i></a>
							<span style="font-weight:bold; font-size:15px; float:right;">₩{{ totalPrice }}</span>							
						</span>
					</div>
				</div>
			</div>
			
			<div id="totalPrice">
				<span>TOTAL</span>
				<span class="total"><strong style="font-size:25px;">₩{{ totalPrice }}</strong> ({{ quantity }}개)</span>
			</div>
			
			<div class="buyArea" style="position: static; bottom: auto; width: auto; margin-left: 0px;">
				<div style="position : relative;">
					<button class="buyButton" style="display: block" @click="requestPay">바로 구매하기</button>
					<div>
						<button class="button" @click="" >장바구니 담기</button><button class="button">위시리스트 담기</button>
					</div>
				</div>				
			</div>
			
			<div class="h3"><h3>함께하면 좋은 상품!</h3></div>
			<div id="itemSlideArea">		  
			    <div class="itemSlide">
			        <div class="itemContainer">
			            <div>
			                <img style="width:155px;" src="../img/aespaFilm.jpg">
			            </div>
			            <div class="txt-box">
			                <span class="xname">SuperM The 1st Mini Album</span>
			                <div>
			                    <span class="price" style="color:undefined">₩ 18,300</span>
			                </div>
			            </div>
			        </div>
			    </div>
			    <div class="itemSlide">
			        <div class="itemContainer">
			            <div>
			                <img style="width:155px;" src="../img/aespaA4photo.jpg">
			            </div>
			            <div class="txt-box">
			                <span class="xname">aespa A4 PHOTO - Girls</span>
			                <div>
			                    <span class="price">₩ 9,900</span>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		</div>	
		
		<div class="explanation">
			<img alt="상품상세설명" src="../img/detail01.jpg">
			
			<div id="radioMenu">
	    		<input id="1" type="radio" name="Menu" value="상품정보" v-model="selectedMenu">
	    		<label for="1">상품정보</label>
	    		<input id="2" type="radio" name="Menu" value="주문 및 배송 안내" v-model="selectedMenu">
	    		<label for="2">주문 및 배송 안내</label>
	    		<input id="3" type="radio" name="Menu" value="교환 및 환불 안내" v-model="selectedMenu">
	    		<label for="3">교환 및 환불 안내</label>
	    		<input id="4" type="radio" name="Menu" value="품질보증기준" v-model="selectedMenu">
	    		<label for="4">품질보증기준</label>    		
    		</div>
    		
    		<div id="selectedMenu">
    			<pre v-if = "selectedMenu == '상품정보'">
<h4>[상품정보]</h4>
- 상품 : SuperM OFFICIAL FANLIGHT
- 소재 : ABS, PC, 실리콘, 알루미늄
- 구성품 : 응원봉, 스트랩, 사용자설명서
- 사이즈 : 75.4 X 74.8 X 247(mm)
- 무게 : 205.7(g)
- 판매원 : SM BRAND MARKETING 
- POWER : 알카라인 AAA 건전지 3개(건전지 미포함 상품)
- 작동시간 : 약 3시간(조작 방법에 따라 상이할 수 있습니다.)
- KC 인증 : R-C-REI-SME-SM01
- 제조사 : 드림어스 컴퍼니

[안내 사항]
* 단순 변심으로 인한 교환/반품이 불가합니다.
* 설명서를 충분히 숙지 후 사용해주세요.

[추가 안내 사항] 
* 본 제품은 사용연령 만 14세 이상 분들을 위한 제품으로, 어린이용이 아닙니다.
* 본 제품은 공정거래위원회고시 소비자분쟁해결기준에 의거 교환 또는 보상을 받을 수 있습니다.
    			</pre>
    			<pre v-if="selectedMenu=='주문 및 배송 안내'">
<h4>[주문 및 배송정보]</h4>
[국내 일반 배송]
・배송방식 : SMTOWN &STORE  물류센터 직접배송(CJ대한통운)
・배송지역 : 전국(일부지역 제외)
・배송비용 : 3,000원 / 주문금액 50,000원 이상 시 무료배송
・도서산간지역은 추가 배송비가 발생할 수 있습니다.
・배송기간 : 결제 후 3~10일 이내 (영업일 기준)



- 상품의 재고상황에 따라 배송기간이 다소 지연될 수도 있습니다.
- 물류센터 사정으로 인해 배송이 지연될 수 있습니다.

- 예약판매 상품 등 당일 배송이 어려운 상품을 함께 구매하는 경우
   모든 상품이 배송 가능한 상태가 되는 시점에 주문하신 상품이 함께 배송됩니다.
    (상품별 배송일정이 상이하오니 자세한 일정은 상품 상세페이지를 참고 바랍니다.)
- 기본 배송기간 이상 소요되는 상품이거나 품절된 상품은 개별 연락 드리겠습니다.
    			</pre>
    			<pre v-if="selectedMenu=='교환 및 환불 안내'">
<h4>[교환 및 환불정보]</h4>
[교환∙반품 방법]

- 상품 수령일로부터 7일 이내 교환/반품 사유가 가능한 사진 (상품 전체 혹은 불량 부분 확대사진)을 첨부하여 주문번호, 상품 바코드, 사유 등을 1:1문의 또는 고객센터(1661-6110) 접수 바랍니다.
- 첨부파일의 용량이 큰 경우 CSCENTER@SMTOWN.COM으로 메일 발송 후 1:1문의 또는 고객센터(1661-6110) 접수 바랍니다.

・상품교환∙반품단계
- Step1: 교환∙반품 기간확인
- Step2: 마이페이지 또는 1:1문의로 교환∙반품접수
- Step3: CS담당자의 안내 후 7일 이내 지정 반품지 및 지정 반품수단으로 교환, 반품 배송
- Step4: 반품지에 상품 입고 및 검품 후 교환∙반품 진행
- Step5: 교환∙반품 완료



[교환∙반품시 유의사항]
・상품의 색상은 모니터 사양에 따라 실제 색상과는 다소 차이가 있을 수 있으며, 
   상품 라벨의 위치나 색상은 이미지와 다를 수 있습니다.
- 구성품 누락 및 불량으로 인한 교환/환불을 위해서는 택배 박스 및 상품 개봉(구성품 포함) 영상이 반드시 필요합니다.
  개봉 영상이 없을 경우 교환 및 환불이 어려울 수 있습니다
- 개봉 영상은 개봉 전 박스의 모든 면이 보이고, 상품 개봉 장면이 온전하게 보이도록 촬영 하셔야 합니다.
- 구성품이 랜덤인 상품의 경우, 교환 진행 시 교환 상품도 랜덤으로 발송됩니다.
- 상품 결함의 경우 5mm 이하의 찍힘 자국과 상품 공정상 발견 될 수 있는 스크래치 및 눌림, 찍힘 자국은 교환 및 반품의 대상이 되지 않습니다.
- 인화류/지류 및 초상 상품의 경우 뒷면, 배경 등 초상 이외의 결함과 공정 과정에서 발생 할 수 있는 스크래치, 눌림 및 찍힘은 교환 및 반품의 대상이 되지 않습니다.
- 모든 상품은 빛 반사가 없는 상태에서 보이는 하자일 경우에만 교환/환불 가능합니다.
- PVC 상품의 경우 소재 특성상 주변환경(온. 습도)의 영향에 따라 형태의 변형 또는 PVC 간 달라붙음 등의 하자가 발생할 수 있으며, 그로인한 교환 및 반품의 대상이 되지 않습니다.

・교환∙반품 가능기간
- 변심, 배송오류, 파손, 불량 등 상품 결함 : 단순 변심, 상품 하자, 오배송의 경우 수령일로부터 7일 이내까지 1:1문의 또는 CS CENTER로 접수 가능합니다.

・교환∙반품 불가한 경우
- 상품 수령 후 7일을 초과한 경우
- 상품의 가치가 감소한 경우 (포장지 훼손, 세탁, 상품 얼룩, 향수 냄새, 탈취제 냄새, 증정품 훼손, 구성품 훼손, 사용 흔적 등)
- 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우(상품 바코드 제거, 수선 등)
- 주문제작 상품이나 세일 상품, 음반 등 상품 상세페이지에 교환/환불 불가를 공지한 상품의 경우 
- 복제가 가능한 상품등의 포장을 훼손한 경우
- 제품의 오배송, 불량 상품이라도 사용 흔적, 훼손 등의 흔적이 있을 경우 
- 촬영 또는 해상도 등의 영향으로 고객님의 모니터에서 확인되는 색상과 실제 수령한 상품의 색상 차이가 있을 경우 
- 상품의 프린트 혹은 패턴이 있는 경우 상품상세페이지 이미지와 다를 수 있습니다.
- 교환/반품 진행시 이벤트, 프로모션으로 증정된 증정품을 함께 보내주셔야 하며, 누락시 교환/환불이 불가합니다.
- 모든 상품 특성상 재고가 조기 소진될 수 있어 단순변심에 의한 교환은 어려울 수 있으며, 
   반품/교환은 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 규정을 따릅니다.
- SMTOWN &STORE 온라인스토어에서 구매하신 상품은 공식 오프라인 매장에서 교환/환불이 절대 불가합니다.
- 공식 오프라인 매장에서 구매하신 상품은 SMTOWN &STORE 온라인스토어에서 교환/환불이 절대 불가합니다.
- 각 상품별로 교환/환불 정책은 차이가 있을 수 있으며 자세한 사항은 상품정보에서 확인 부탁드립니다.
 (자세한 내용은 1:1문의 또는 CS CENTER를 이용해 주시기 바랍니다)

・교환∙반품 비용
- 변심 : 단순 변심으로 반품을 원할 경우에는 구매자가 왕복배송비 지불
- 배송오류, 파손, 불량 등 상품 결함 : 상품하자, 오배송의 경우에는 판매자가 배송비 지불
 (정확한 교환∙반품비용은 1:1문의 또는 CS CENTER를 이용해 주시기 바랍니다)



[미성년자 권리보호안내]
미성년 고객께서 상품을 주문(계약) 하시는 경우, 법정대리인(부모님 등)이 그 주문(계약)에 동의하지 않으면
미성년자 본인 또는 법정대리인(부모님 등)이 그 주문(계약)을 취소하실 수 있습니다. 
    			</pre>
    			<pre v-if="selectedMenu=='품질보증기준'">
<h4>[품질보증기준]</h4>
제품의 품질에 이상이 있을 경우, 반품, 교환, A/S, 환불 , 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁해결기준(공정거래위원회 고시)에 의거하여 처리됩니다.
    			</pre>
    		</div>
			
		</div>    
	</div>
</div>
</body>
</html>
<script>
const userCode = "imp36711884";
IMP.init(userCode);
var app = new Vue({
    el: '#app',
    data: {    	
    	uId : "${sessionId}",    	
    	list : [],
    	info : {},
    	pNo : "${map.pNo}",
    	pName : "",
    	price: "",
    	formattedPrice: "",
    	artist : "",
    	path : "",
    	category : "",
    	membership : "",
    	quantity: "1", // 기본 수량 값
    	totalPrice : 0, // 총 가격 초기값 0
    	selectedMenu : "상품정보"
    },
    methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {pNo : self.pNo};            
            $.ajax({
                url : "/product/selectProductInfo.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info; //사용자
                	self.pName = self.info.pName;
                	self.price = self.info.price;
                	self.formattedPrice = self.formatPrice(self.price); // 가격 포맷 변환
                	self.artist = self.info.artist;
                	self.path = self.info.path;
                	self.category = self.info.category;
                	self.membership = self.info.membership;
                	console.log(self.info);
                }
            }); 
        }, requestPay : function() {
            var self = this;
            IMP.request_pay({
              pg: "nice",
              pay_method: "card",
              merchant_uid : 'merchant_'+new Date().getTime(),
                 name : '결제테스트',
                 amount : self.price,
                 buyer_name : self.uId,
            }, function (rsp) { // callback
                if (rsp.success) {
                  // 결제 성공 시
              console.log("결제 성공");
              console.log(rsp); // 결제 결과 정보 출력
              var self = this;
              var nparmap = rsp;            
              $.ajax({
                  url : "/product/insertProductPayment.dox",
                  dataType:"json",	
                  type : "POST", 
                  data : nparmap,
                  success : function(data) { 
                  	self.info = data.info; //사용자
                  	self.pName = self.info.pName;
                  	self.price = self.info.price;
                  	self.formattedPrice = self.formatPrice(self.price); // 가격 포맷 변환
                  	self.artist = self.info.artist;
                  	self.path = self.info.path;
                  	self.category = self.info.category;
                  	console.log(self.info);
                  }
              }); 
              
                } else {
                  // 결제 실패 시
                    console.log("결제 실패");
              	console.log(rsp); // 결제 실패 정보 출력
                }
            });
          },
        formatPrice: function(price) {
        	// 가격 포맷 변환을 위한 함수
        	return price.toLocaleString();
        },
        formatQuantity: function() {
        	var self = this;
    		// 수량 포맷 변환을 위한 함수
    		self.quantity = self.quantity.replace(/\D/g, ''); // 숫자 이외의 문자 제거
    		self.quantity = parseInt(self.quantity); // 숫자로 변환
    		self.quantity = self.quantity.toLocaleString(); // 포맷 변환
    	},
    	increaseQuantity: function() {
    		var self = this;
            // 수량 증가를 위한 함수
            self.quantity++;
        },

        decreaseQuantity: function() {
        	var self = this;
            // 수량 감소를 위한 함수
            if (self.quantity > 1) {
            	self.quantity--;
            }
        },
        calculateTotalPrice: function() {
            // 총 가격을 계산하는 함수
            var self = this;
            var numericQuantity = parseInt(self.quantity.replace(/\D/g, '')); // 숫자로 변환
            self.totalPrice = (self.price * numericQuantity).toLocaleString();
        }
    	
    },
    //총 가격 계산
   computed: {
    	totalPriceCalculation: function() {
        var numericQuantity = parseInt(this.quantity, 10);
        return this.price * numericQuantity;
    	},
	},
	watch: {
	    totalPriceCalculation: function(newTotalPrice) {
	        this.totalPrice = newTotalPrice.toLocaleString();
	    }
	},
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
