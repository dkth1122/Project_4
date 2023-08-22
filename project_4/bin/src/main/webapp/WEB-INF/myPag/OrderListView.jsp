<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>\
<meta charset="UTF-8">
<!-- 페이징 추가 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<style type="text/css">


.orderArea{
	font-size : 15px;
}
.DateNoList{
	border-bottom : 2px solid black;
	margin : 20px 0px;
	padding-bottom : 20px;
}
.DateNoList span{
	margin-left : 50px;
}
.imgOrderBox{
	width : 100px;
	height : 120px;
	float:left;
}
.fontCCC{
	color : #777777;
	font-size : 14px;
	font-weight : 400;
	line-height: 22px;
}
.orderInfo{
	display: table-cell;
    padding-left: 10px;
    vertical-align: middle;
    float:left;
    text-align : left;
}
.noticeArea{	
    color : #777777;
	font-size : 14px;
	font-weight : bold;
	margin-bottom : 60px;
}
.noticeArea li{
	margin : 5px 0px;
}
.noticeArea li:before {
  content: "•"; 
  margin-right: 8px; 
}
.ordertbody:hover {
   	background-color:#f8f8f8;
  }
 .addrArea h6{
 	width : 625px;
 	margin : 20px 0px;
 }
.bottomBorder{
	border-bottom : 1px solid black;
}
.addrInfouser{
	text-align: left;
}
.addrInfouser th{
	border-bottom: 1px solid #f1f1f1;
	width : 30%;
	height : 35px;
	padding : 4px 10px;
}
.addrInfouser td{
	width : 70%;
	border-bottom: 1px solid #f1f1f1;
	height : 35px;
	padding : 4px 10px;
	text-align : left;
}
.headerListArea th{
	border-bottom: 1px solid #f1f1f1;
}
.finishList{
	height:100px;
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
                                       <li><a href="/mypag/myPageInterest.do">장바구니</a></li>
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
                                       <li><a href="/mypag/infoAddr.do">배송주소록</a></li>                           
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
							 <div class="lowerBox"> 주문 상세 내역 </div>
							 <div class="orderArea">
							 	<div>
							 		<div class="DateNoList">주문번호 <strong>{{buyNo}}</strong> <span>주문일자 <strong>{{oDate}}</strong></span></div>
							 	</div>
							 	<table>
							 		<tr class="headerListArea">
							 			<th>상품정보</th>
							 			<th>적립금</th>							 			
							 			<th>주문금액</th>
							 			<th>배송 정보</th>
							 			<th>주문 상태</th>
							 		</tr>
							 		<div class="thArea"></div>
							 		<tbody class="ordertbody">
								 		<tr v-for="item in list">
								 			<td>
								 				<div>
											 		<a href="#" @click="productDetail(item)"><img class="imgOrderBox" :src="item.path">
											 		<ul class="orderInfo">
											 			<li>{{item.artist}} <span class="fontCCC">{{item.pNo}}</span></li>
											 			<li><strong>{{item.pName}}</strong></li>
											 			<li class="fontCCC">수량 : {{item.oCount}}</li>
											 		</ul>										 		
											 		</a>
											 	</div>		
								 			</td>
								 			<td>{{parseFloat(calcPrice.replace(/,/g, ''))*0.005}} P</td>							 			
								 			<td>{{calcPrice}}원
								 				<div class="fontCCC">{{item.oCount}}개</div>
								 			</td>
								 			<td>
								 				<div>{{item.artist}}</div>
								 				<div>업체 배송</div>
								 				<div>평균출고일:1.1일</div>
								 			</td>
								 			<td v-if='item.dState == "업체확인중" ||item.dState == "상품준비중" '><div>{{item.dState}}</div><button>취소</button></td>
											<td v-else-if='item.dState == "배송완료"'><div>{{item.dState}}</div><button>교환/반품</button><button>구매 확정</button></td>											
											<td v-else>{{item.dState}}</td>
								 		</tr>
							 		</tbody>
							 	</table>	
							 	
							 	<ul class="noticeArea">
							 		<li>동일한 주문번호라도 2개 이상의 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다. (택배 박스를 2개 이상 수령 가능)</li>
							 		<li>출고 완료 직후 교환 / 환불 요청을 하더라도 상품을 수령하신 후 택배 업체를 통해 보내주셔야 처리 가능합니다.</li>
							 		<li>별도의 구매 결정이 없더라도 상품 배송 완료 후 7일이 지난 경우에는 자동 구매확정, 적립금이 자동 지급됩니다.</li>
							 		<li>자세한 내용은 <a href="/faq.do" style="color:#0078ff; font-weight:bold;">FAQ</a>를 확인하여 주시기 바랍니다.</li>
							 	</ul>				 								 
							 </div>
							 
							 <div class="addrArea">
							 	<div class="bottomBorder">
							 		<h6>배송지 정보</h6>
							 	</div>
								 	<table class="addrInfouser">
										<colgroup>
											<col style="width:190px">
											<col style="width:*">
										</colgroup>
									<tbody>
									<tr>
										<th scope="row">이름</th>
										<td>{{list2.uName}}</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>{{list2.uPhone}} / {{list2.uDphone}}</td>
									</tr>
															<tr>
										<th scope="row">배송지 주소</th>
										<td>({{list2.zipNo}}) &nbsp; {{list2.uDaddr}}  {{list2.uDaddrDetail}}</td>
									</tr>
									<tr>
										<th scope="row">배송 메시지</th>
										<td>{{list2.uDmessage}}</td>
									</tr>
									</tbody>
								</table>
								
								<ul class="noticeArea">
							 		<li>발송전 일때만 배송지 주소를 변경하실 수 있습니다.(미입금/입금확인/출고요청 단계까지만가능)</li>							 		
							 	</ul>			
							 </div>
							 
							 
							 <div class="paydaypayday">
							 	<div class="bottomBorder">
							 		<h6>최종 결제 정보</h6>
							 	</div>
								 	<table class="addrInfouser">
										<colgroup>
											<col style="width:190px">
											<col style="width:*">
										</colgroup>
									<tbody>
									<tr>
										<th scope="row">상품 합계</th>
										<td>{{calcPrice}}원</td>
									</tr>
									<tr>
										<th scope="row">배송비</th>
										<td v-if="calcPrice < 50000">배송비 3,000원</td>
										<td v-else style="color:#14aaff;">배송비 무료</td>
									</tr>
									<tr>
										<th scope="row">결제 수수료</th>
										<td>0원</td>
									</tr>
									<tr>
										<th scope="row" style="font-weight:bold;">최종 결제 금액</th>
										<td v-if="parseFloat(calcPrice.replace(/,/g, ''))>=50000" style="font-weight:600; font-size:20px;">{{calcPrice}}원
											<div style="font-size:12px;">예상 적립금 {{parseFloat(calcPrice.replace(/,/g, ''))*0.005}}P</div>
										</td>
										<td v-else style="font-weight:600; font-size:20px;">{{calcPrice}}원
											<div style="font-size:12px;">예상 적립금 {{parseFloat(calcPrice.replace(/,/g, ''))*0.005}}P</div>
										</td>
									</tr>
									<tr>
										<th scope="row">결제 수단</th>
										<td style="font-size:14px; font-weight:bolder;">카카오페이 + 적립금</td>
									</tr>
									</tbody>
								</table>
								
								<ul class="noticeArea">
							 		<li>카드결제시 현금영수증/세금계산서 발급이 불가능하며 카드전표로 대체하실 수 있습니다.</li>							 		
							 		<li>PG사 또는 카드사에서 제공하는 즉시 할인은 최종 결제 금액에 반영되지 않습니다. (ex. 카카오페이 즉시할인)</li>							 		
							 		<li>바로접속 OFF 상태일 때에는 각종 할인 혜택이 제한될 수 있습니다.</li>							 		
							 	</ul>			
							 </div>
						<div class="finishList"></div>						
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
			list : [],
			list2 : [],
			price : [],
			dat : "",
			buyNo : "${map.buyNo}",
			oDate : ""
			
		}, 
		 computed: {
			
			    calcPrice: function () {			     
			    	 var calculatedPrice = this.list2.price * this.list2.oCount;
			    	 return calculatedPrice.toLocaleString();
			    }
			  },
		methods : {
			fnGetList : function() { 
				var self = this;
				var nparmap = {buyNo : self.buyNo, uId : self.uId};				
				$.ajax({
					url : "/mypag/OrderListView.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.list = data.list;
						self.list2 = data.list[0];
						self.oDate = self.list[0].oDate;
						console.log(self.list2);
						
					}
				});
			},
			productDetail : function(item){
				var self = this;
				$.pageChange("/product/productView.do", {pNo : item.pNo});
			}
		},
		created : function() {
			var self = this;
			self.fnGetList();
		}
	});
</script>
