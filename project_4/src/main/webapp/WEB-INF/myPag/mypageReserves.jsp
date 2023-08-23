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

<style type="text/css">
#container {
    height: 1166px;
    width: 100%;
    margin-bottom: 163px;
}
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
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
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
			                                       <li><a href="/mypag/myPageInterest.do  ">��ٱ���</a></li>
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
			                                       <li><a href="/mypag/myInquiry.do">1:1 ����</a></li>
			                                       <li><a @click="fnNotice" href="#javascript:;">��������</a></li>
			                                       <li><a @click="fnUseGuide" href="#javascript:;">�̿�ȳ�</a></li>
			                                       <li><a @click="fnFaq" href="#javascript:;">FAQ</a></li>                                 
			                                    </ul>   
			                                 </li>  
			                              </ul>
							      	
							      									      	
							      	</div>
							      	 </div>
							      
					<div id="right">
								<div class="categories ab"> ����Ʈ</div>
							     <div class="View">
									<table id="table">
										<tr>
											<th rowspan="3">
												��밡�� ������
												<h1>{{maxpoint}} P</h1>
											
											</th>
											<td class="pointp">�� ������</td>
											<td class="num">{{numpoint + maxpoint}}P</td>
											
										</tr>
										<tr>											
											<td class="pointp">���� ������</td>
											<td class="num">{{numpoint}}P</td>
										</tr>
										<tr>											
											<td class="pointp">ȯ�� ���� ������</td>
											<td class="num">{{repoint}}P</td>
										</tr>
										
									</table>
							     </div> 
							     	<div class="categories ab">������ ����</div>
							     	 <div class="View">
							     	 	<table class="pointable">
							     	 		<tr>
							     	 			<th>�ֹ���¥</th>
							     	 			<th>�����ֹ�</th>
							     	 			<th>������</th>
							     	 										     	 		
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
<div><%@ include file="../page/footer.jsp" %></div>

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
    	maxpoint : undefined,
 	    infouser : [],
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
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.findPw; //�����
                	self.fnCntList();
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
	            	
	            	self.maxpoint = x; // ��밡�� ����Ʈ 
	            	self.numpoint = y; // ����� ����Ʈ
	            	self.repoint = z; // ȯ�� ����Ʈ
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
