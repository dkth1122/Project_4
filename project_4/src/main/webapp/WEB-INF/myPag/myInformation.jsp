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
th{

}
td {
	height: 60px;
	text-align: center;
}
</style>
<title>찜목록</title>

</head>
<body>
	<div id="app">

		<div id="container">

			<div id="top">

				<div style="height: 78px;"></div>

				<div class="a">
					<div class="left topImgBoxwid">
						<a @click="fnVuwmain" href="#"><div id="profileImg"></div></a>
					</div>
					<div class="topBox">
						<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
					</div>

					<div class="topBox">

						<div class="details">

							<div>주문내역</div>
							<div>{{order}}</div>

						</div>

						<div class="details">

							<div>교환/환불</div>
							<div>
								<span>{{refund}} /</span><span> {{exchange}}</span>
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
			<div id="body">

				<div id="left">
					<div class="categories">MY PAGE</div>
					<div style="text-align: left;">
						<ul style="padding: 0px;">
							<li>나의 쇼핑 정보</li>
							<li>
								<ul>
									<li><a href="#" @click="fnInformation">주문내역</a></li>
									<li><a href="#" @click="fnInterest">관심상품</a></li>
									<li><a href="#" @click="">최근 본 상품</a></li>
									<li><a href="#" @click="fnReserves">적립금</a></li>
								</ul>
							</li>
						</ul>
						<ul style="padding: 0px;">
							<li>회원 정보</li>
							<li>
								<ul>
									<li><a href="#" @click="infoUpdate">회원 정보 수정</a></li>
									<li><a href="#" @click="infoAddr">배송주소록</a></li>
								</ul>
							</li>
						</ul>
						<ul style="padding: 0px;">
							<li>고객센터</li>
							<li>
								<ul>
									<li><a href="#" @clikc="myInquiry">1:1 문의</a></li>
									<li><a href="#" @click="noticeList">공지사항</a></li>
									<li><a href="#" @click="useGuide">이용안내</a></li>
									<li><a href="#" @click="faz">FAQ</a></li>
								</ul>
							</li>
						</ul>


					</div>
				</div>

				<div id="right">

					<div class="View">
						<div class="lowerBox" style="border-bottom-color: black;">
							주문 상품 정보</div>
						<div class="box-border-bottom"></div>
						<table border-bottum="1">
						<thead>
							<tr>
								
								<th><input type="checkbox" @click="fnAllCheck" ></th>
								<th colspan="2">상품정보</th>
								<th>적립금</th>
								<th>배송비</th>
								<th>판매가</th>
								<th>선택</th>
								
							</tr>
						</thead>
						<tbody>
							<tr  v-for="item in wishList">
								<td><input type="checkbox" :value="item.wnum" v-model="selectItem"></td>
								<td><img class="responsive-image" :src="item.pImg" ></td>
								<td>{{item.pName}}</td>
								<td>적립금</td>
								<td>배송비</td>
								<td>판매가</td>
								<td>
								<button @click="insertCart(item)"> 장바구니 </button>
								주문하기
								<button @click="fnRemoveOne(item)">사악제</button>
								
								</td>
							</tr>
						</tbody>
				
						</table>
						<button @click="fnRemove">삭제</button>
						<button @click="fnRemoveAll">찜목록 지우기 </button>
						
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
    	uId : "dcsdsd3"/* "${sessionId}" */,
    	order  : "",
    	exchange : "",
    	refund : "",
    	wishList : [],
    	selectItem : [],
 
    },
    methods: {
    	fnAllCheck : function(){
    		var self = this;
    		if(cnt == "Y" ){
    			self.selectItem = [];
    			for(var i=0;  i < self.wishList.length; i++){
                    self.selectItem.push(self.wishList[i].wnum);
                 } 
    			cnt = "N";
    		}else{
    			self.selectItem = [];
    			cnt = "Y";
    		}    		
    				
    	},
    	  selectAllItems: function() {
    	        // 전체 선택 상태에 따라 selectItem 배열을 업데이트
    	        if (this.selectAll) {
    	            this.selectItem = this.wishList.map(item => item.wnum);
    	        } else {
    	            this.selectItem = [];
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
				console.log(param);
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
   	}
	    
    },
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
