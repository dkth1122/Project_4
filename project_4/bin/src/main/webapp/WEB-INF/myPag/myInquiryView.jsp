<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="mypageheader.jsp" %>
  <script src="../js/jquery.js"></script>  
  <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<meta charset="EUC-KR">
	<title>����������</title>
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
					    	<span class="name">{{infouser.uName}}</span> <span class="nickname">{{infouser.uName2}}</span>
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
					    		
					    			<div>��ȯ/ȯ��</div>
					    			<div>
					    				<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</div>
					    			</div>
					    			
					    		</div>
					    		<div class="details" >
					    			<div>����Ʈ</div>
									<div v-if="!maxpoint == 0">{{maxpoint}} P</div>
									<div v-else>0 P</div>
					    		</div>
					    	</div>
					    </div>
					    	
					    	 
					    </div>					    
					    <div id="body">
					    
							      <div id="left">
							      	<div class="categories"> MY PAGE</div>
							      	<div style="text-align: left;">
							      	<ul style="padding: 0px;">
                                 <li class="ulh1">���� ���� ���� </li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myPagOrderdetails.do">�ֹ�����</a></li>
                                       <li><a href="/cart/cartList.do">��ٱ���</a></li>
                                       <li><a href="/mypag/myInformation.do">�� ���</a></li>
                                       <li><a href="/mypag/mypageReserves.do">����Ʈ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>
                              <ul style="padding: 0px;">
                                 <li class="ulh1">ȸ�� ����</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/infoUpdate.do">ȸ�� ���� ����</a></li>
                                       <li><a href="/mypag/infoAddr.do">����ּҷ�</a></li>                           
                                    </ul>   
                                 </li>  
                              </ul>
                               <ul style="padding: 0px;">
                                 <li class="ulh1">������</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myAddInquiry.do">1:1 ����</a></li>
                                       <li><a @click="fnNotice" href="#javascript:;">��������</a></li>
                                       <li><a @click="fnUseGuide" href="#javascript:;">�̿�ȳ�</a></li>
                                       <li><a @click="fnFaq" href="#javascript:;">FAQ</a></li>                                      
                                    </ul>   
                                 </li>  
                              </ul>
							      	
							      									      	
							      	</div>
							      	 </div>
							      
					<div id="right">
					
							      <div class="View">
							    	  <div class="lowerBox"> 1:1���� </div>
							    	  	<div v-for="item in info">
								    	  		<div><h4>{{item.iQtitle}}</h4></div>
								    	  		<div>�ۼ���<span>{{item.iQtime}}</span>�亯����<span>{{item.state}}</span></div>
								    	  		<hr>
								    	  		<div><pre v-html="item.iQcontent"></pre></div>							    	  	
								    	  	<div v-if="item.iAcontent == null && iNo == item.iNo">
								    	  		<hr>
								    	  			<div>�����ð����� �亯�帮�ڽ��ϴ�. ��ø� ��ٷ� �ּ���!</div>
								    	  		<hr>
								    	  	</div>
								    	  	<div v-else>
								    	  		<hr>
								    	  		<div>�亯��¥ {{item.iAtime}}</div>
								    	  		<hr>
								    	  		<div>{{item.iAcontent}}</div>
								    	  	</div>
								    	  	<div>
								    	  		<img :src="item.path">
								    	  	</div>					
							    	  <div>
							    	  	<div><button @click="fnList">���</button></div>
							    	  </div>
							     </div> 
							     
							     
							</div>
					    
					    </div>
			    	</div>
			  </div>
  
</div>
<div><%@ include file="../page/footer.jsp" %></div>
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
    	maxpoint : undefined,
 	    infouser : [],
    	list : [],
    	iNo : "${map.iNo}"
    },
    methods: {
    	fnGetInfo : function() { // ����� ���� �ҷ����� �̸� , ���� (�г���)
			var self = this;
			var nparmap = {uId : self.uId};				
			$.ajax({
				url : "/user2.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {						
					self.infouser = data.findPw;
				}
			});
		},
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
                	self.info = data.list; //�����
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
        },
        fnPoint : function(){ // ����Ʈ ���� Ȯ��
	        var self = this;
	        var nparmap = {uId : self.uId};
	        $.ajax({
	            url : "/pointList.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 	
	            	self.usepointList = data.list;
	            	var x = 0;
	            	var datalist = data.list;
	            	for(var i=0; i<datalist.length; i++){
	            		x += datalist[i].point;	
	            	}
	            	self.maxpoint = x; // ��밡�� ����Ʈ 
	            
	            }
	        }); 
	    },
	    fnNotice : function (){ // ���� 
			var self = this;
    		var option = "width = 915, height = 500, top = 100, left = 200, location = no"
    		window.open("http://localhost:8082/mypag/noticeList.do", "Notice", option);
		},
		fnUseGuide : function (){ //�̿�ȳ�
			var self = this;
    		var option = "width = 1100, height = 500, top = 100, left = 200, location = no"
    		window.open("http://localhost:8082/mypag/useGuide.do", "UseGuide", option);
		},
		fnFaq : function (){ //faq
			var self = this;
    		var option = "width = 1100, height = 500, top = 100, left = 200, location = no"
    		window.open("http://localhost:8082/mypag/faq.do", "fnFaq", option);
		},
		/* ��� ���ų��� ī��Ʈ ���� */
		fnCntList : function() {
			var self = this;
			var nparmap = {uId : self.uId};
			$.ajax({
				url : "/mypag/listExchange.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					
					var listCnt = data.list;
					for (var i = 0; i < listCnt.length; i++) {
						if (listCnt[i].exchange == "C") {								
							self.refund = listCnt[i].orderCnt;							
						} else if (listCnt[i].exchange == "R") {
							self.exchange = listCnt[i].orderCnt;
						} else{
							self.order = listCnt[i].orderCnt;
							console.log(self.order);
						}
					}

				}
			});
		},
	    
    },
    created: function() {
      var self = this;
      self.fnGetList();
      self.fnGetInfo();
		self.fnPoint();
		self.fnCntList();
    }
});
</script>
