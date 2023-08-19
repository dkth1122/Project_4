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
					    	 	 <a @click="fnVuwmain" href="#"><div id="profileImg"></div></a>
					    	</div >
					    	<div class="topBox">
					    	<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
					    	</div>
					    	
					    	<div class="topBox">
					    	
					    		<div class="details" >
					    		
					    		 		<div>Order</div>
				                        <label><a href="/mypag/myPagOrderdetails.do">                            
				                        <div>{{order}}</div>
	                          			</a></label>
						    				
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
	    fnPoint : function(){
	        var self = this;
	        var nparmap = {uId : self.uId};
	        $.ajax({
	            url : "/pointList.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 	
	            	console.log(data);
	            	
	            	
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
	    /* 1:1문의 */
	    inquiry : function(){
	    	var self = this;
	    	$.pageChange("myInquiry.do", {uId : self.uId});
	    }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      self.fnPoint();
    }

});
</script>
