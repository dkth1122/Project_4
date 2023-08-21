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
	#table th {
	width : 300px;
		padding: 30px;
		border-bottom: 1px solid #e3e3e3; 
	}
	#table td {
		width : 360px;
		padding: 30px;
		border-bottom: 1px solid #e3e3e3; 
	}
#table{
	width: 1000px;
	border-collapse : collapse
}
.pointp{
	text-align: left;
}
.num{
	text-align: right;
}
.View{
	height: 309px;
}
.pointable{
	width: 1000px;
	text-align: center;
	border-collapse : collapse;
}
.pointable td {	
	height: 40px;
	padding: 10px;
	border-bottom: 1px solid #e3e3e3; 
}
.pointable th {
	border-bottom: 1px solid #e3e3e3; 
	height: 60px;
	padding: 10px 0px;
}
.potd{
	text-align: left;
}
.ab{
	margin: 0px;
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
					    	 	 <a href="/mypag/main.do"><div id="profileImg"></div></a>
					    	</div >
					    	<div class="topBox">
					    	<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
					    	</div>
					    	
					    	<div class="topBox">
					    	
					    		<div class="details" >
					    		
					    		 		<div>Order</div>
			                        <label><a href="/mypag/myPagOrderdetails.do">                            
			                        <div v-if="order != 0">{{order}}</div>
			                        <div v-else>0</div>
                          			</a></label>
						    				
					    		</div>
					    		
					    		<div class="details" >
					    		
					    			<div>교환/환불</div>
					    			<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
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
								<div class="categories ab"> 포인트</div>
							     <div class="View">
									<table id="table">
										<tr>
											<th rowspan="3">
												사용가능 적립금
												<h1>{{maxpoint}} P</h1>
											
											</th>
											<td class="pointp">총 적립금</td>
											<td class="num">{{numpoint + maxpoint}}P</td>
											
										</tr>
										<tr>											
											<td class="pointp">사용된 적립금</td>
											<td class="num">{{numpoint}}P</td>
										</tr>
										<tr>											
											<td class="pointp">환불 예정 적립금</td>
											<td class="num">{{repoint}}P</td>
										</tr>
										
									</table>
							     </div> 
							     	<div class="categories ab">적립금 내역</div>
							     	 <div class="View">
							     	 	<table class="pointable">
							     	 		<tr>
							     	 			<th>주문날짜</th>
							     	 			<th>관련주문</th>
							     	 			<th>적립금</th>
							     	 										     	 		
							     	 		</tr>
							     	 		
							     	 		<tr v-for="item in usepointList">
							     	 			<td>{{item.podata}}</td>
							     	 			<td class="potd">{{item.pName}}</td>
							     	 			<td>{{item.point}}</td>
							     	 			
							     	 		</tr>
							     	 		
							     	 	</table>
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
    	usepointList : [],
    	maxpoint : undefined,
    	numpoint : undefined,
    	repoint : undefined,
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
	     fnPoint : function(){ // 포인트 내역 확인
	        var self = this;
	        var nparmap = {uId : self.uId};
	        $.ajax({
	            url : "/pointList.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 	
	            	self.usepointList = data.list;
	            	console.log(self.usepointList);
	            	var x = 0;
	            	var y = 0;
	            	var z = 0;
	            	var datalist = data.list;
	            	for(var i=0; i<datalist.length; i++){
	            		x += datalist[i].point;	  
	            		y += datalist[i].usepoint;
	            		z += datalist[i].repoint;
	            	}
	            	
	            	self.maxpoint = x;
	            	self.numpoint = y;
	            	self.repoint = z;
	            }
	        }); 
	    }, 
	
    },
    created: function() {
      var self = this;
      self.fnGetList();
       self.fnPoint(); 
    }

});
</script>
