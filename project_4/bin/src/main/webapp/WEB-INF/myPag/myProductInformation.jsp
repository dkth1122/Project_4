<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="../js/jquery.js"></script>  
    <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="UTF-8">
  <title>마이페이지</title>
  <style type="text/css">
  .box-border-bottom{
  	border-bottom: 2px solid #83828277;
  	width: 850px;
  	height: 80px;
  }
  .box { 
  	margin-top: 30px;
  	width: 850px;
  	height: 300px;
  	display: flex;
  }
  .p_content{
   padding : 20px 0px;
  	width: 540px;
  }
  
  .p_img{
  padding : 20px 29px;
  width: 250px;
  }
  td{
  width: 170px;
  height: 80px;
  }
   .responsive-image {
    max-width: 100%;
    height: 250px;
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
					    	 	 <a href="#"><div id="profileImg"></div></a>
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
					    
							      <div id="left">
							      	<div class="categories"> MY PAGE</div>
							      	<div style="text-align: left;">
							      	<ul style="padding: 0px;">
							      		<li>나의 쇼핑 정보 </li>
								      	<li>
								      		<ul>
								      			<li><a href="#">주문내역</a></li>
								      			<li><a href="#">관심상품</a></li>
								      			<li><a href="#">최근 본 상품</a></li>
								      			<li><a href="#">적림금</a></li>							      		
								      		</ul>	
								      	</li>  
							      	</ul>
							      	<ul style="padding: 0px;">
							      		<li>회원 정보</li>
								      	<li>
								      		<ul>
								      			<li><a href="#">회원 정보 수정</a></li>
								      			<li><a href="#">배송주소록</a></li>					      		
								      		</ul>	
								      	</li>  
							      	</ul>
							      	   	<ul style="padding: 0px;">
							      		<li>고객센터</li>
								      	<li>
								      		<ul>
								      			<li><a href="#">1:1 문의</a></li>
								      			<li><a href="#">공지사항</a></li>
								      			<li><a href="#">이용안내</a></li>
								      			<li><a href="#">FAQ</a></li>							      		
								      		</ul>	
								      	</li>  
							      	</ul>
							      	
							      									      	
							      	</div>
							      	 </div>
							      
					<div id="right">
					
							      <div class="View">
							    	  <div class="lowerBox" style="border-bottom-color: black;"> 주문 상품 정보 </div>
							    	  <div class="box-border-bottom"></div>
							    	  
							    	  <div class="box" v-for="item in productList">
							    	  	<div class="p_img"><img class="responsive-image" src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202009/09/f663c475-26e6-45de-9644-46170134d718.jpg"> </div>
							    	  	<div class="p_content">
										   <table>
										   			<tr>
										   				<td colspan="2">주문번호 : {{item.oNo}}</td>
										   				
										   				<td> 배송중/배송완료 </td>
										   			</tr>
										   			<tr>
										   				<td colspan="2">{{item.pName}}</td>
										   				
										   				<td>Artist : {{item.artist}}</td>
										   			</tr>
										   			<tr>
										   				<td>{{item.oDate}}</td>
										   				<td style="text-align: center;">{{item.oCount}}개</td>
										   				<td>{{item.price}}원</td>
										   			</tr>
										   </table>
										
										</div>
							    	  
							    	  </div>
							     </div> 
							     
							    <!--   <div class="View">
							    	  <div class="lowerBox"> 관심상품 </div>
							    	  	<div class="nodata"> 내역이 없습니다 </div>
							     </div>  -->
							     
							     
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
    	uId : "dcsdsd3",
    	order  : "",
    	exchange : "",
    	refund : "",
    	productList : [],
    },
    methods: {
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
	            url : "/mypag/productInformation.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 	
					self.productList = data.list;
					console.log(self.productList);
	            	
	            	
	            	
	            }
	        }); 
	    }
	    
    },
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
