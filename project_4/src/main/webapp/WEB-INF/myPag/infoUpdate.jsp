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
    height: 1535px;
    width: 100%;
    margin-bottom: 163px;
}
   .updatetable{
    	width: 900px;
   }
   .warning{
   	 padding-left : 822px;
   	 text-align: right;
   }
   .updatetable th {
   	text-align: left;
   	width: 147px;
   	height: 60px;
   }
   .updatetable td {
   	height: 80px;
   }
  input {
  border-color : #e3e3e3;
  outline: none;
  border-width: 0 0 1px;
  width: 100%;	
  font-size: 1.2em;
}
.ph input{
	margin : 0px 20px;
	width: 150px;
}
select{
	border : none;
	width: 100px;
	height: 70px;
	font-size: 1.3em;
}
.buttomfn{
	width : 1200px;
	margin-top : 150px;
 	text-align: center;
 	height: 300px;
}
.buttomfn button{
	width: 150px;
	height: 55px;
	margin: 0px 10px;
	border-radius: 50px;
	font-size: 0.8em;
	background-color: #fff;
	font-weight: bold;
}
#fndd{
	color: #fff;
	background-color:rgb(24, 0, 109);
}
#remove{
	margin-left: 200px;
}
#yn input{
	width: 50px;
	height: 20px;
	text-align: left;
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
                           
                              <div class="lowerBox"> ȸ�� ���� ���� <span class="warning"><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ʼ�����</span> </div> 
                              
                              <table class="updatetable">
                              
                              	<tr>
                              		<th> ���̵�</th>
                              		<td>{{info.uId}}</td>
                              	</tr>
                              	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �г���</th>
                              		<td><input type="text" v-model="info.uName2"></td>
                              	</tr>
                             	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> ��й�ȣ</th>
                              		<td><input type="password" v-model="info.uPw" placeholder="����/����/Ư������ �� 2���� �̻� ����,10��~16��"></td>
                              	</tr>
                             	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �� ��й�ȣ Ȯ��</th>
                              		<td><input type="password" v-model="info.uPw2"></td>
                              	</tr>
                             	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �̸�</th>
                              		<td><input type="text" v-model="info.uName" ></td>
                              	</tr>
                             	<tr>
                              		<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> ����ó</th>
                              		<td class="ph">
                              			<select v-model="phnum">
                              				<option value="010">010</option>
                              				<option value="011">011</option>
                              				<option value="017">017</option>
                              				<option value="016">016</option>
                              			</select>
                              			<input type="text" v-model="prefix"> -
                              			<input type="text" v-model="suffix"> 
                              		</td>
                              	</tr>
                             	<tr>
                              		<th> SMS ���ſ���</th>
                              		<td id="yn">
                              			<label><input type="radio" name="evtyn"  v-model="info.uSmsyn" value="Y">������</label>
                                 		<label><input type="radio" name="evtyn" v-model="info.uSmsyn" value="N">���ž���</label>
                              		</td>
                              	</tr>
                              	
                              </table>
                               
                                 	
                               
                                 <div class="buttomfn">
                                 
                                 <button @click="fnback">���</button>
                                 <button id="fndd" @click="fnUpdate">Ȯ��</button>
                                 <button id="remove" @click="userRemove">ȸ�� Ż��</button>                                 
                                 
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
       info : [],
       user : {
    	   uName2 : "",
    	   uPw : "",
    	   uPw2 : "",
    	   uName : "",
    	   uPhone : "",
    	   uSmsyn : ""
       },
       uId : "${sessionId}",
       order : "",
       exchange : "",
       refund : "",
       prefix: "",
       suffix: "",
       phnum : "010",
       maxpoint : undefined,
       
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
                   self.info = data.findPw; //�����
                   self.user = self.info;
               	   self.user.uPw = undefined;
             	   const phoneNumber = self.user.uPhone.substring(3);
            	   self.prefix = phoneNumber.substring(0, 4);            	   
            	   self.suffix = phoneNumber.substring(4);
            	   self.info.uSmsyn = self.user.uSmsyn === 'Y' ? 'Y' : 'N';
            	   console.log(self.info.uPw);
                }
            }); 
        },
        fnUpdate : function(){
        	var self = this;
        	self.info.uId = self.uId;
        	if(self.info.uName2 == undefined || self.info.uName2 == ""){
				alert("���̵� �Է����ּ���.");
				return;
			}
        	if(self.info.uPw == undefined || self.info.uPw == ""){
				alert("�н����带 �Է����ּ���.");
				return;
			}
        	if(self.info.uPw != self.user.uPw2){
				alert("Ȯ���н����尡 ��ġ���� �ʽ��ϴ�.");
				return;
			}
        	if(self.info.uName == undefined || self.info.uName == ""){
				alert("�̸��� �Է����ּ���.");
				return;
			}
        	if(self.prefix == undefined || self.prefix == ""){
				alert("����ó�� �Է����ּ���.");
				return;
			}
        	if(self.suffix == undefined || self.suffix == ""){
				alert("����ó�� �Է����ּ���.");
				return;
			}
        	self.user.uPhone = self.phnum + self.prefix + self.suffix;
        	var nparmap = self.user;
            $.ajax({
                url : "/editInfo.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.findPw; //�����
                   alert("���� ���� �Ǿ����ϴ�.");
                   self.fnGetList();
                 }
             }); 
        },
        //�ڷΰ���
	    fnback : function(){
	    	var self = this;
	    	$.pageChange("main.do", {uId : self.uId});
	    },
	    userRemove : function(){
	    	var self = this;
	    	if(!confirm("���� Ż���Ͻðڽ��ϱ�?")){
				return;
			}
	    	var nparmap = {uId : self.uId};
            $.ajax({
                url : "/removeUser.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   alert("�̿����ּż� �����մϴ�.");
                   location.href="main.do";
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
		            	var x = 0;
		            	var datalist = data.list;
		            	for(var i=0; i<datalist.length; i++){
		            		x += datalist[i].point;	
		            	}
		            	self.maxpoint = x; // ��밡�� ����Ʈ 
		            
		            }
		        }); 
		    },
    },
    created: function() {
      var self = this;
      self.fnGetList();
	  self.fnPoint();
	  self.fnCntList();
    }
});
</script>