<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="UTF-8">
<style type="text/css">
#table {
	width: 1400px;
}
.responsive-image{
	width : 100px;
	height : 100px;
}
.button {
	  display: inline-block;
	  padding: 5px 10px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 49%;
	  margin-right : 3px;	  
	}
	
	/* 버튼 호버 효과 */
	.button:hover {
	  background-color: #d4d5d9;
	}
	
	/* 버튼 클릭 효과 */
	.button:active {
	  background-color: #1f618d;
	}
	.button2{
	 display: inline-block;
	  padding: 15px 20px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 14%;
	  font-size : 15px;
	  margin-right : 3px;	  
	}
	.button2:hover {
	  background-color: #d4d5d9;
	}
	
	/* 버튼 클릭 효과 */
	.button2:active {
	  background-color: #1f618d;
	}
	.button3{
	 display: inline-block;
	  float : right;
	  left : 300px;
	  padding: 15px 20px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 22%;
	  font-size : 15px;
	  margin-right : 70px;	  
	}
	.button3:hover {
	  background-color: #d4d5d9;
	}
	
	/* 버튼 클릭 효과 */
	.button3:active {
	  background-color: #1f618d;
	}
	.button11{
	background: none;
	 border: none;
	 padding: 0;
	 font-family: inherit;
	 font-size: inherit;
	 color: inherit;
	 cursor: pointer;
}
.thead th{
}
</style>
<title>관심상품</title>

</head>
<body>
	<div id="app">

		<div id="container">

			<div id="top">

				<div style="height: 78px;"></div>

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
									<div class="menuFontSize">{{info.uPoint}} P</div>
								</div>
						<div class="details">
							<div></div>
							<div></div>
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
                                       <li><a href="/mypag/infoAddr.do">배송주소록</a></li>                           
                                    </ul>   
                                 </li>  
                              </ul>
                               <ul style="padding: 0px;">
                                 <li class="ulh1">고객센터</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myInquiry.do">1:1 문의</a></li>
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
						<div class="lowerBox">
							주문 상품 정보</div>
						<div class="box-border-bottom"></div>
						<table>
						<thead class="thead">
							<tr>
								<th><input type="checkbox" @click="fnAllCheck" v-model="selectAll"></th>
								<th></th>
								<th>상품정보</th>
								<th>적립금</th>
								<th>배송비</th>
								<th>판매가</th>
								<th>선택</th>
								
							</tr>
						</thead>
						<tbody>
							<tr  v-for="item in wishList">
								<td><input type="checkbox" name="ssss" :value="item.wnum" v-model="selectItem"></td>
								<td><button class="button11" @click="productDetail(item)"><img class="responsive-image" :src="item.path" ></button></td>
								<td><button class="button11" @click="productDetail(item)"><div class="artist">{{item.artist}}</div>
									{{item.pName}}</button></td>
								<td>{{item.price*0.005}} P</td>							
								<td v-if="item.price < 50000">기본배송<div>₩3,000</div><div>(조건)</div></td>
								<td v-if="item.price >= 50000">무료배송</td>
								<td><strong>₩{{formatPriceWithCommas(item.price)}}</strong></td>
								<td>
									<button class="button" @click="OrderProduct(item)"> 주문하기 </button>								
									<button class="button" @click="insertCart(item)"> 장바구니 </button>								
									<button class="button" @click="fnRemoveOne(item)">삭제</button>								
								</td>								
							</tr>
						</tbody>
				
						</table>
						<div class="BTbottomArea">
							<button class="button2" @click="fnRemove">삭제</button>
							<button class="button3" @click="fnRemoveAll">찜목록 지우기 </button>
						</div>
					</div>


				</div>

			</div>

		</div>

	</div>
</body>
</html>
<script type="text/javascript">
var cnt = "Y";
var app = new Vue({
    el: '#app',
    data: {
    	info : [],
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : "",
    	exchange : "",
    	refund : "",
    	wishList : [],
    	selectItem : [],
    	selectAll: false
 
    },
    methods: {
    	fnAllCheck: function() {
    		var self = this;
    		self.selectAll = !self.selectAll;
	            if (self.selectAll) {
	            	self.selectItem = self.wishList.map(item => item.wnum);
	            } else {
	            	self.selectItem = [];
	            }
    	    },
    		  
    	fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	self.info = data.findPw; //사용자
                	self.fnCntList();
                	self.fnProduct();
                }
            }); 
        },    
        fnCntList : function(){
	        var self = this;
	        var nparmap = {uId : self.uId};
	        $.ajax({
	            url : "/mypag/listExchange.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 	
	            	var listCnt = data.list;
	            	for(var i=0; i<listCnt.length; i++){
	            		if(listCnt[i].exchange == "N"){	            			
	            			self.order = listCnt[i].orderCnt;          			
	            		}else if(listCnt[i].exchange == "E"){
	            			self.exchange = listCnt[i].orderCnt;
	            		}else{
	            			self.refund = listCnt[i].orderCnt;
	            		}
	            	}
	            	
	            	
	            }
	        }); 
	    },
	    fnProduct : function(){
	        var self = this;
	        var nparmap = {uId : self.uId};
	        $.ajax({
	            url : "/mypag/wishlist.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 	
					self.wishList = data.list;
					console.log(data);	            	
	            }
	        }); 
	    },
	    fnRemove : function(){
			var self = this;
			if(!confirm("정말 삭제할거냐?")){
				return;
			}
			var noList = JSON.stringify(self.selectItem);
			var param = {selectItem : noList};
			$.ajax({
                url : "/mypag/removeWishProduct.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("삭제되었다!");
                	self.fnGetList();
                	self.selectItem = [];
                }
            });
		},
		fnRemoveAll : function(){
			var self = this;
			if(!confirm("정말 삭제할거냐?")){
				return;
			}
			var param = {uId : self.uId};
			$.ajax({
                url : "/mypag/removeAllProdeuctWish.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("삭제되었다!");
                	self.fnGetList();
                	
                }
            });
		},		
		fnRemoveOne : function(item){		
			var self = this;
			console.log(item.wnum)
				 if(!confirm("정말 삭제할거냐?")){
					return;
				} 
				var param ={wnum : item.wnum};
				console.log(param);
				 $.ajax({
	                url : "/mypag/removeSingleProdeuctWish.dox",
	                dataType:"json",	
	                type : "POST",
	                data : param,
	                success : function(data) { 
	                	alert(data.list);
	                	self.fnGetList();
	                	self.selectItem = [];
	                }
	            }); 
			 	
			},
		insertCart : function(item){
				var self = this;			
				var param ={uId : self.uId, pNo : item.pNo};
				$.ajax({
	                url : "/mypag/editCart.dox",
	                dataType:"json",	
	                type : "POST",
	                data : param,
	                success : function(data) {
	                	/* 카트로 상품등록수 장바구니로 갈거냐 말꺼냐 창띄우기 */
	                	alert(data.list);
	                }
	            });
		},	   
		OrderProduct : function(item){
			var self = this;
			console.log(item.wnum);
		},
	    /* 메인 */
	    fnVuwmain : function(){
	    	var self = this;
	    	$.pageChange("main.do", {uId : self.uId});
	    },
	    /* 주문내역 */
	    fnInformation : function(){
	    	var self = this;
	    	$.pageChange("productInformation.do", {uId : self.uId});
	    },
	    /* 관심상품 */
	    fnInterest : function(){
	    	var self = this;
	    	$.pageChange("myPageInterest.do", {uId : self.uId});
	    },
	    /* 적립금 */
	    fnReserves : function(){
	    	var self = this;
	    	$.pageChange("mypageReserves.do", {uId : self.uId});
	    },
	    /* 배송주소록 */
	    infoAddr : function(){
	    	var self = this;
	    	$.pageChange("infoAddr.do", {uId : self.uId});
	    },
	    /* 회원 정보 수정 */
	    infoUpdate : function(){
	    	var self = this;
	    	$.pageChange("infoUpdate.do", {uId : self.uId});
	    },
	    /* 이용안내 */
	    useGuide : function(){
	    	var self = this;
	    	$.pageChange("useGuide.do", {uId : self.uId});
	    },
	    /* 공지사항 */
	    noticeList : function(){
	    	var self = this;
	    	$.pageChange("noticeList.do", {uId : self.uId});
	    },
	    faq : function(){
	    	var self = this;
	    	$.pageChange("faq.do", {uId : self.uId});
	    },
        myInquiry : function(){
   	    	var self = this;
   	    	$.pageChange("myInquiry.do", {uId : self.uId});
   		},
   		formatPriceWithCommas(price) {
   		    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   	  },
   		productDetail : function(item){
			var self = this;
			$.pageChange("/product/productView.do", {pNo : item.pNo});
	},
	    
    },
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
