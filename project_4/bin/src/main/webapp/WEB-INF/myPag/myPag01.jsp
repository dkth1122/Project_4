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
  <style type="text/css">
  
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
    width: 1200px;
  }
  #top {
  	background-color: #FADBEE;
    width: 1200px;
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
    padding-bottom : 25px;
   	width : 800px;   	  
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
					    	 	 <a href="#"><div id="profileImg"></div></a>
					    	</div >
					    	<div class="topBox">
					    	<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
					    	</div>
					    	
					    	<div class="topBox">
					    	
					    		<div class="details" >
					    		
					    			<div>주문내역</div>
					    			<div>{{orderCnt.orderCnt}}</div>
					    			
					    		</div>
					    		
					    		<div class="details" >
					    		
					    			<div>교환/환불</div>
					    			<div>
					    				<span>0 /</span><span> 0</span>
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
							    	  <div class="lowerBox"> 최근 주문상품 </div>
							    	  	<div class="nodata"> 내역이 없습니다</div>
							     </div> 
							     
							      <div class="View">
							    	  <div class="lowerBox"> 관심상품 </div>
							    	  	<div class="nodata"> 내역이 없습니다 </div>
							     </div> 
							     
							      <div class="View">
							    	  <div class="lowerBox"> 최근 본 상품 </div>
							    	  	<div class="nodata"> 내역이 없습니다 </div>
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
    	orderCnt : [],
    	uId : "dcsdsd3",
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
                
                }
            }); 
        },    
	    fnGetList : function(){
	        var self = this;
	        var nparmap = {uId : self.uId};
	        $.ajax({
	            url : "/mypag/infoCnt.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 
	            	self.orderCnt = data.infoCnt; // 주문내역
	            	
	            }
	        }); 
	    },
	    
    },
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
