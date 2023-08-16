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
								      			<li><a @click="infoUpdate">회원 정보 수정</a></li>
								      			<li><a @click="infoAddr">배송주소록</a></li>					      		
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
							    	  <div class="lowerBox"> 1:1문의 </div>
							    	  	<div v-for="item in info">
								    	  		<div><h4>{{item.iQtitle}}</h4></div>
								    	  		<div>작성일<span>{{item.iQtime}}</span>답변여부<span>{{item.state}}</span></div>
								    	  		<hr>
								    	  		<div><pre v-html="item.iQcontent"></pre></div>							    	  	
								    	  	<div v-if="item.iAcontent == null && iNo == item.iNo">
								    	  		<hr>
								    	  			<div>빠른시간내에 답변드리겠습니다. 잠시만 기다려 주세요!</div>
								    	  		<hr>
								    	  	</div>
								    	  	<div v-else>
								    	  		<hr>
								    	  		<div>답변날짜 {{item.iAtime}}</div>
								    	  		<hr>
								    	  		<div>{{item.iAcontent}}</div>
								    	  	</div>
							    	  	</div>
							    	  <div>
							    	  	<div><button @click="fnList">목록</button></div>
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
    el: '#app',
    data: {
    	info : {},
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : "",
    	exchange : "",
    	refund : "",
    	list : [],
    	iNo : "${map.iNo}"
    },
    methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId, iNo : self.iNo};
            self.info.uId = self.uId;
            $.ajax({
                url : "/mypag/userInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.list; //사용자
                	console.log(self.info);
                }
            }); 
        },
	    infoAddr : function(){
	    	var self = this;
	    	$.pageChange("infoAddr.do", {uId : self.uId});
	    },
	    infoUpdate : function(){
	    	var self = this;
	    	$.pageChange("infoUpdate.do", {uId : self.uId});
	    },
	    addBoard : function(){
            var self = this;
                $.pageChange("myAddInquiry.do", {uId : self.uId});
        },
        fnList : function(){
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
