<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="mypageheader.jsp" %>
  <script src="../js/jquery.js"></script>    
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link href="../css/mypag.css" rel="stylesheet" type="text/css">
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="EUC-KR">
  <style type="text/css">
  	table{
  		width: 910px;
  		border-collapse : collapse;
  		text-align: center;
  	}
  	table td{
  	height : 40px;
  	padding : 25px 0px;
  		border-bottom: 1px solid #e3e3e3; 
  	}
  	.tablebutton{
  		width: 930px;
  		display: flex;
  		flex-direction: column;
  		align-items: center;
  	}	
  	.button > button{
  		margin: 40px 10px;
  		width: 150px;
  		height: 60px;
  		border-radius: 50px;
  		background-color: #fff;
  		font-size: 0.5em;
  		font-weight: bold;
  	}
  	#remo{
  		border: none;
  		background-color: rgb(24, 0, 109);
  		color: #fff;]
  		
  	}
  	.l{
  		margin-bottom: 30px;
  	}
  	.warningm{
  		width: 900px;
   		line-height: 80px;
   		color : rgb(73, 73, 73);
  	}
  	#warningImg{
  		margin-right: 20px;
  	}
  	#editbut{
  		width: 50px;
  		height: 50px;
  		border-radius: 50%;
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
                           <div class="View">
                              <div class="lowerBox"> ��� �ּҷ� ���� </div>
                                 <div> 
                                 	<table>
                                 		<tr>
                                 			<th>��</th>
                                 			<th>No.</th>
                                 			<th>�����</th>
                                 			<th>�ּ�</th>
                                 			<th>����ó</th>
                                 			<th>����� ����</th>
                                 		</tr>
                                 		<tr v-for = "item in info">
                                 			<td><input type="radio" v-model="duNo" :value="item.duNo"></td>
                                 			<td>{{item.duNo}}</td>
                                 			<td>{{item.uDname}}</td>
                                 			<td>{{item.uDaddr}} {{item.uDaddrDetail}}</td>
                                 			<td>{{item.uDphone}}</td>
                                 			<td><button @click="editAddr(item)" id="editbut"><a href="http://localhost:8082/mypag/editAddr.do"> ����</a></button></td>
                                 		</tr>
                                 	</table>
                                 	<div class="tablebutton">
                                 		<div class="button">
	                                 		<button id="eid" @click="removeAddr(duNo)">���� �ּҷ� ����</button>
	                                 		<button id="remo" @click="addAddr">����� ���</button>
                                 		</div>
                                 	</div>
                                 </div>
                                <div class="lowerBox l"> ��� �ּҷ� ���ǻ��� </div>
                               <div class="warningm">  <i id="warningImg" class="fa-solid fa-circle-exclamation fa-2xl" style="color: #ff5c5c;"></i><span>��� �ּҷ��� �ִ� 10������ ����� �� ������, ������ ������� ���� ��� �ֱ� ��� �ּҷ� �������� �ڵ� ������Ʈ �˴ϴ�.</span>
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
       list : [],
       info :{},
       uId : "${sessionId}",
       duNo : "",
       order : "",
       exchange : "",
	   refund : "",
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
            self.info.uId = self.uId;
            self.info.duNo = self.duNo;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/delivery/list.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.list; //�����   
                }
            }); 
        },
        editAddr : function(item){
            var self = this;
            $.pageChange("editAddr.do", {uId : self.uId, duNo : item.duNo});
        },
        infoAddr : function(){
        	var self = this;
        	$.pageChange("infoAddr.do", {uId : self.uId});
        },
        infoUpdate : function(){
        	var self = this;
        	$.pageChange("infoUpdate.do", {uId : self.uId});
        },
        addAddr : function(){
        	var self = this;
        	$.pageChange("addAddr.do", {uId : self.uId});
        },
        myInquiry : function(){
	    	var self = this;
	    	$.pageChange("myInquiry.do", {uId : self.uId});
	    },
        removeAddr : function(duNo){
        	var self = this;
        	if(!confirm("�����ּҸ� �����Ͻðڽ��ϱ�?")){
        		return;
        	}
            var nparmap = {duNo : self.duNo};
            console.log(duNo);
            $.ajax({
                url : "deleteAddr.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�ش��ּҰ� �����Ǿ����ϴ�.");
                	self.fnGetList();
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