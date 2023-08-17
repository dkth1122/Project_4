<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  
  <script src="../js/jquery.js"></script>  
  <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="EUC-KR">
<title>마이페이지</title>
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
								      			<li><a href="#" @click="inquiry">1:1 문의</a></li>
								      			<li><a href="#" @clikc="noticeList">공지사항</a></li>
								      			<li><a href="#" @click="useGuide">이용안내</a></li>
								      			<li><a href="#" @click="faq">FAQ</a></li>							      		
								      		</ul>	
								      	</li>  
							      	</ul>
							      	
							      									      	
							      	</div>
							      	 </div>
							      
					<div id="right">
					
							      <div class="View">
							    	  <div class="lowerBox"> 1:1문의 </div>
							    	  	<div v-if="info.length > 0" v-for="item in info">
							    	  		<hr>
							    	  		<div>{{item.iNo}}
							    	  		<span>{{item.category}}</span>
							    	  		<span><a @click="boardView(item)">{{item.iQtitle}}</a></span>
							    	  		<span>{{item.iQtime}}</span>
							    	  		<span>{{item.state}}</span>
							    	  		</div>
							    	  		
							    	  	</div>
							    	  	<div v-if="info.length == 0" class="nodata"> 검색결과가 없습니다</div>
							    	  	<div><button @click="addBoard">글쓰기</button></div>
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
    	list : []
    },
    methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
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
        boardView : function(item){
        	var self = this;
        	$.pageChange("myInquiryView.do", {iNo : item.iNo});        	
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
	    /* 1:1문의 */
	    inquiry : function(){
	    	var self = this;
	    	$.pageChange("myInquiry.do", {uId : self.uId});
	    },
	    /* FAQ */
	    faq : function(){
	    	var self = this;
	    	$.pageChange("faq.do", {uId : self.uId});
	    }
    },
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
