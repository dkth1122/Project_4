<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="../js/jquery.js"></script>  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="UTF-8">
  <title>마이페이지</title>
<style>
.box1{
border-top:3px solid black;

height: 300px;
width:2000px;
}
@charset "EUC-KR";
      .nickname{
  line-height:  127px;
  margin-left: 70px;
 } 
 
 .name{
   margin-left: 45px;
  font-size: 4em;
  font-weight: bold;
 }
  body{
  	margin : 0px;
  	padding : 0px;}
  #app {
  
    display: flex;
    justify-content: center;
    align-items: center;
    
  }
  #container {
    width: 2300px;
  }
  #top {
  	background-color: #FADBEE;
    width: 2300px;
    height: 400px;
    
  }
  #body {
  margin-top : 40px;
    width: 1200px;
    display: flex;
    justify-content: center;
    font-size: 1.5em;
    
  }
  #left {
    
    width: 250px;
    height: 800px;
  }
  #right {
   margin-left : 90px;
    width: 950px;
    height: 800px;
  }
  #profileImg{
  	border-radius: 50%;
  	background-color: purple;
  	width: 200px;
  	height: 200px;
  	margin-left: 55px;
  	margin-top : -15px;
  }
  .left{
  float: left;
  }
  .topImgBoxwid{
   	width: 300px;
  	height: 240px;
  }
  .topBoxwid{
   	width: 200px;
  	height: 250px;
  }
  .userName{
  	height: 245px;
  	
  }
  .a{
  	height: 245px;
  }
  .topBox{
  width : 889px;
   height: 120px;
    float: left;
     display: flex;
  }
  .details{  
  	margin: 0px 30px;
  	width: 200px;
  	text-align: center;
  	font-size: 2em;
  }
 h1{
 margin-left: 30px;
 } 
  .categories{
    padding-bottom : 25px;
   	widows : 200px;
  	border-bottom:3px solid black;
  	border-bottom-color: #a1a1a1da;
  	margin-bottom: 40px;
  }
  .lowerBox{
  	text-align:center;
  	font-size:2em;
    padding-bottom : 25px;
   	width : 849.8px;   	  
  	border-bottom:3px solid black;
  	border-bottom-color: #a1a1a1da;
  }
 li {
 
  list-style-type: none;
  line-height: 55px;
}
a {
  text-decoration: none;
  color: black; 
}
.nodata{
 color: #888888;
 line-height: 200px;
 text-align: center;
}
.View{
height: 300px;
 margin-bottom: 150px;
}
  
</style>
</head>
<body>
<div id="app">

			  <div id="container">
			  
					    <div id="top">
					    
					    	<div style="height: 150px;"></div>
					    	
					    <div class="a">
					    	<div class="left topImgBoxwid">
					    	 	 <a @click="fnVuwmain" href="#"><div id="profileImg"></div></a>
					    	</div >
					    	<div class="topBox">
					    	<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
					    	</div>
					    	
					    	<div class="topBox">
					    	
					    		<div class="details" >
					    		
					    			<div>주문내역</div>
					    			<div>{{order}}</div>
					    			
					    		</div>
					    		
					    		<div class="details" >
					    		
					    			<div>교환/환불</div>
					    			<div>
					    				<span>{{refund}} /</span><span> {{exchange}}</span>
					    			</div>
					    			
					    		</div>
					    		<div class="details" >
					    			<div>포인트</div>
					    			<div>{{info.uPoint}} P</div>
					    		</div>
					    		<div class="details" >
					    			<div>Jelly</div>
					    			<div>0</div>
					    		</div>
					    	</div>
					    </div>
					    	
					    	 
					    </div>					    
					    <div id="body">
					    
							      
							      
					<div id="right">
					
							      <div class="View" >
							      <div class="lowerBox"> CART </div>
							      <div v-for="item in cart" class= "box1">
							      <input type="radio" name="select" v-model="pNo" :value="item.pNo">
							      <div><img src= "item.pImg"></div>
								      <div>아티스트 : {{item.artist}}</div>
								      <div>남은 재고: {{item.stock}}</div>
								      <div>가격: {{item.price}}</div>
								      <div>품명 : {{item.pName}}</div>
								      <div>카테고리 : {{item.category}}</div>
								      
							     </div> 
							    <div><button @click="fnOrder">주문하기</button></div>
							 <div><button @click="fnRemove">삭제</button></div>
						
					</div>
					    
					    </div>
			    
			  </div>
  
</div>
</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	info : [],
    	orderCntList : [],
    	uId :"dcsdsd3" ,/* "${sessionId}" */
    	order  : "",
    	exchange : "",
    	refund : "",
    	list : [],
    	cart : [],
    	pNo : ""   	
    },
    methods: {
    	 fnRemove : function(){
 	        var self = this;
 	        var nparmap = {pNo : self.pNo};
 	        $.ajax({
 	            url : "/mypag/deletecart.dox",
 	            dataType:"json",	
 	            type : "POST", 
 	            data : nparmap,
 	            success : function(data) { 	
 	            	alert("장바구니에서 삭제되었습니다.");
 	            	console.log(self.pNo);
 	            }
 	        }); 
 	    },
    	 fnOrder : function(){
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
 	            			console.log(self.order);	            			
 	            		}else if(listCnt[i].exchange == "E"){
 	            			self.exchange = listCnt[i].orderCnt;
 	            		}else{
 	            			self.refund = listCnt[i].orderCnt;
 	            		}
 	            	}
 	            	
 	            	
 	            }
 	        }); 
 	    },
 	    
    	fnGetProduct : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/mypag/cart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
				self.cart = data.list;
				console.log(self.cart);
				
                }
            }); 
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
                	self.info = data.findPw; //사용자
                	self.fnCntList();
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
	            			console.log(self.order);	            			
	            		}else if(listCnt[i].exchange == "E"){
	            			self.exchange = listCnt[i].orderCnt;
	            		}else{
	            			self.refund = listCnt[i].orderCnt;
	            		}
	            	}
	            	
	            	
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
	    }
	    
    },
    created: function() {
      var self = this;
      self.fnGetList();
      self.fnGetProduct();
    }
});
</script>
