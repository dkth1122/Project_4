<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<!-- ���� ������ ���� ��Ʈ�� ���̺귯�� �߰� --> 
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<meta charset="EUC-KR">
<title>���� ������</title>
<style>

#title {
	width: 1500px;
	margin-bottom: 50px;
	margin: 0px auto;
	margin-top: 100px;
	font-size: 4em;
	text-align: center;
	font-weight: bold;
}

.table {
	
	margin: 0px auto;
	border-collapse: collapse;
	width: 1500px;
	margin-top: 100px;
	margin-bottom: 30px;
}
.table >th{
	text-align: center;
}
.table > th, td {
	text-align: center;
	height: 100px;
}
 .table td{
 	padding: 20px;
	border-bottom: 1px solid black;
	border-bottom-color: #e3e3e3;
 }
.table td {
	padding: 20px;
	border-bottom: 1px solid black;
	border-bottom-color: #e3e3e3;
}

#body {
	width: 1500px;
}

#container {
	width: 100%;
	display: flex;
	flex-direction: column;
}
.ch_deletebutton{
	width: 1500px;
	margin: 0px auto;
	margin-bottom: 30px;
	text-align: right;
}
.border-bottom{
	border-bottom: 1px solid #e3e3e3;
	width: 1500px;
	margin: 0px auto;
}
.payment{
	margin: 0px auto;
	width: 1500px;
	text-align: center;
	font-size: 2em;
	border-bottom: 1px solid #e3e3e3;
	margin-bottom: 30px;
}
.red{
	color: red;
}
span {
	margin-left: 111px;
}
.baybutton{
	width: 1500px;
	text-align: right;
	margin: 0px auto;
	color: #4b4b4bda;
	font-size: 0.8em;
}
.a{
	width: 15%
}
.b{
	width: 60%
}
.c{
	width: 5%;
}
.d{
	width: 10%
}
.e{
	width: 10%
}
#addr{
width: 1500px;
margin: 0px auto;
margin-top: 40px;
display: flex;
}
#inputaddr{
	width: 940px;
	margin-right: 50px;
	margin-bottom: 100px;
	
}
#inputhd{
	border-bottom: 3px solid black;
}
#point{
	margin-top :10px;
	widows: 700px;
}
h3{
	width : 700px;
	display: inline-block;
}
i{
	margin-right: 7px;
}
.adr{
	widows: 960px;
}
.adr th{
	width : 300px;
	text-align: left;
}
.adr > th, td{
	height: 20px;
	padding: 0px;
}
.nameinput{
	width: 100%;
}
.addrinput2{
width: 100%;
}
.adr input{ 
	height: 40px;
	text-align: left;
	margin: 10px 0px;
	border-width: 0 0 1px;	
}
.adr td{
	text-align: left;
	margin: 10px;
}
select{
	margin-right: 20px;
	height: 42px;
	width: 83px;
	border-width: 0px 0px 1px;
	outline: none;
}
#viewpoint{
	border:  1px solid #e3e3e3; 
	width: 410px;
	height: 88px;
	margin: 8px 0px 20px 0px;
	padding: 57px 50px 80px 50px;
}
#pointhd{
	line-height: 45px;
	font-size: 1.1em;
	font-weight: 700;
}
.pontbottombor{
	margin-top : 50px;
	border-bottom: 3px solid black;
}
.pointable th{
	font-size: 1em;
	width: 150px;
	text-align: left;
}
.pointable td{
	font-size: 1.5em;
	font-weight: bold;
}
#baybutton{
	width: 1500px;
	margin: 30px auto;
	text-align: center;
}
#baybutton > button{
	width: 350px;
	height: 70px;
	font-size: 1.1em;
	border-radius: 100px;
	background-color: #7C81BB;
	color: #fff;
	border: 0px;
}
input {
  outline: none;
}
.select2{
margin-left :20px;
text-align: center;
	width: 114px;
}

.pImg{
	width: 200px;
	height: 100px;
}

</style>
</head>
<body>
	<div id="app">

		<div id="container">
		
			<div id="title">Order</div>

			<div class="body">
			
			
				<table class="table">
					<tr>
						<th>�̹���</th>
						<th colspan="2">��ǰ����</th>
						<th>����</th>
						<th>�ֹ��ݾ�</th>						
					</tr>
					<tr v-for="item in list">
						<td class="a"><img :src="item.path" class="pImg"></td>
						<td class="b">{{item.pName}}</td>
						<td class="c"></td>
						<td class="d">{{item.cnt}}</td>
						<td class="e">{{calculateTotal(item) | numberWithCommas}}��</td>
					</tr>
				</table>
				
				<div class="ch_deletebutton">
					<span>\ �ݾ� {{ calculateTotalPrice() | numberWithCommas }}��</span>
					<span v-if="delivery == 0">\ ��� {{ delivery}}��</span>
					<span v-else>\ ��� {{ delivery | numberWithCommas }}��</span>
					<span class="red">\ �� {{ calculateTotalPrice()  + delivery | numberWithCommas }} </span>
				</div>
			
				<div class="payment"></div>
					<div class="baybutton">��ǰ�� �ɼ� �� ���� ������ ��ǰ�� �Ǵ� ��ٱ��Ͽ��� �����մϴ�.</div>
			</div>
			<div id="addr">
				<div>
				<div id="inputaddr">
						<div id="inputhd">
						<h3>�ֹ��� ����</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�ʼ� �Է»���</span>
						<div>** ��ϵ� ����ּҷ��� ���� �� ����ּҷ��� ������ּ���.</div>
						</div>
						<button @click="fnAddrList" >�ּҷ� ����</button>
						<table>
								 <tr v-for = "item in info" v-if="flg">
                                 	<td style="display : none">
									  <input type="text" v-model="item.duNo">
									</td>
                                 	<td>{{item.uDname}}</td>
                                 	<td>{{item.uDaddr}}{{item.uDaddrDetail}}</td>
                                 	<td>{{item.uDphone}}</td>
									<td><input rows="7" cols="110" v-model="item.uDmessage" hidden/> </td>
                                 	<td><button @click="fnAddAddr(item, 'y')">����</button></td>
                                 <td><button @click="fnAddAddr(item, 'n')">���</button></td>
                                 </tr>
                        </table>
					<table class="adr" border="0">
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ֹ��� �� </th>
							<td><input  class="nameinput " type="text" v-model="uDname"> </td>
						</tr>
						<tr style="display:none"><td><input v-model="duNo"/></td></tr>
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ּ�</th>
							<td>
							<br>
							<input class="addrinput2" type="text" placeholder="�⺻�ּ�"v-model="addr" >
							<br>
							<input class="addrinput2" type="text" placeholder="������ �ּ� " v-model="addrDetail">
							<input class="addrinput2" type="text" placeholder="�����ȣ" v-model="zipNo">								
							<button @click="fnSearchAddr">�ּ� ã��</button>  
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�޴���ȭ</th>
							<td>
							<select class="select" v-model="phone1">
									<option value="">����</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							<input class="numinput" type="text" v-model="phone2">	- <input class="numinput" type="text" v-model="phone3">								
							</td>	
						<tr>
							<th>��۸޽���</th>
							<td><textarea rows="7" cols="110" v-model="dText"></textarea></td>
						</tr>
							<td><button @click="fnAddAddrList">�ּҷ� ���</button></td>	
						</tr>
						
					</table>
				</div>
				<div id="inputaddr">
						<div id="inputhd">
						<h3>��� ����</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�ʼ� �Է»���</span>
						</div>
						<table class="adr" border="0">
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> ��������� </th>
							<td>
								<div id="to" >
										<label><input name="addr" type="radio" style="height: 12px; width: 30px;" @click="fnAddAddr2('y')">�ֹ��� ������ ����</label> 
										<label><input name="addr" type="radio" style="height: 12px; width: 20px;" @click="fnAddAddr2('n')">�ʱ�ȭ</label>
										
							 	</div>
							</td>
							</tr>
							<tr>
						</tr>
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ֹ��� �� </th>
							<td><input  class="nameinput " type="text" v-model="user.uDname"> </td>
						</tr>
						<tr style="display:none"><td><input v-model="user.duNo"/></td></tr>
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ּ�</th>
							<td>
							<br>
							<input class="addrinput2" type="text" placeholder="�⺻�ּ�" v-model="user.addr" >
							<br>
							<input class="addrinput2" type="text" placeholder="������ �ּ�" v-model="user.addrDetail">					
							<input class="addrinput2" type="text" placeholder="�����ȣ" v-model="user.zipNo">		
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�޴���ȭ</th>
							<td>
								<select class="select" v-model="user.phone1">
									<option value="">����</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							<input class="numinput" type="text" v-model="user.phone2"> - <input class="numinput" type="text" v-model="user.phone3">			
							</td>						
						</tr>
						
						
					</table>
				</div>
				</div>
				<div id="point">
				<div id="pointhd">
					���� ����/���� ����
				</div>	
					<div id="viewpoint">
						<table class="pointable">
							<tr>
								<th>
									���� ���� �ݾ�
								</th>
								
								<td>
									{{ (calculateTotalPrice()  + delivery | numberWithCommas) * 0.02 }} 
								</td>
							</tr>
						</table>
						<div class="pontbottombor"></div>
					</div>					
					
<div id="note">
<div style="font-weight: bold;">				
[�ֹ� �� �������]
</div>

<p>
[���� �Ϲ� ���]
</p>
<p>
�� ��۹�� : SMTOWN &STORE  �������� �������(CJ�������)<br>
�� ������� : ����(�Ϻ����� ����)<br>
�� ��ۺ�� : 3,000�� / �ֹ��ݾ� 50,000�� �̻� �� ������<br>
�� �갣������ �����갣������ �߰� ��ۺ� �߻��� �� �ֽ��ϴ�.  <br>           
�� ��۱Ⱓ : ���� �� 7~10�� �̳� ��� ���۵� �����Դϴ�.<br>
</p>					
					
	

<p>
<div>- ��ǰ�� ����Ȳ�� ���� ��۱Ⱓ�� �ټ� ������ ���� �ֽ��ϴ�.</div>
<div>- �������� �������� ���� ����� ������ �� �ֽ��ϴ�.</div>
<div style="color: red">- ��������/�ֹ����� �� ���� ����� ����� ��ǰ�� �Բ� �����Ͻô� ��� ���
   			��ǰ�� ��� ������ ���°� �Ǵ� ������ �ֹ��Ͻ� ��ǰ�� �Բ� ��� �˴ϴ�.</div>
<div>- �⺻ ��۱Ⱓ �̻� �ҿ�Ǵ� ��ǰ �Ǵ� ǰ���� ��ǰ�� ���� ���� �帮�ڽ��ϴ�.</div>

<div style="color: red">- ���� ������ ��ǰ�� ��� ���� �� �ܼ� �������� ���� ��ǰ�� �Ұ��մϴ�.</div>
</p>
					</div>
				</div>
			</div>
		<div id="baybutton"><button @click="requestPay">�����ϱ�</button></div>
		</div>

</div>
</body>
</html>
<script>
const userCode = "imp36711884"; 
IMP.init(userCode); 

Vue.filter('numberWithCommas', function (value) {
    if (!value) return '';
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');});


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
}

	var app = new Vue({
		el : '#app',
		data : {
			uId : "${sessionId}",
			totalPrice : "${map.totalPrice}",
    	   	uDname : "",
    	   	uDphone : "",
			addr : "",
			addrDetail : "",
			zipNo : "",
			email : "",
			list : [],
			delivery : 0,
			numberWithCommas : "",
			 user : {
		    	   	uId : "",
		    	   	uDname : "",
		    	   	phone1 : "",
		    	   	phone2 : "",
		    	   	phone3 : "",
					addr : "",
					addrDetail : "",
					zipNo : "",
					phone : "",
					duNo : "",
					oNo: "",
					buyNo: "",
					uId : ""
				},
			info : [],
			flg : false,
    	   	phone1 : "",
			phone2 : "",
			phone3 : "",
			dText : "",
			duNo : "",
			oNo : "",
			buyNo: ""
			
		},
		methods : {
			fnGetList : function(){
	            var self = this;
	            var nparmap = {uId : self.uId};        
	            $.ajax({
	                url : "/cart/searchCart.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.list = data.list;
	                }
	            }); 
	        },calculateTotal: function (item) {
                return item.price * item.cnt;
            },
	        // ��ǰ ��ü �ݾ� �ջ� �޼���
       		 calculateTotalPrice: function () {
                 var self = this;
                 var total = 0;
                 self.list.forEach(function (item) {
                     total += self.calculateTotal(item);
                 });
	   			if (total < 50000) {
                    self.delivery = 3000;
                } else {
                    self.delivery = 0;
                } 
                 return total;
                 
            },updateItemCnt: function (item) {
            	
            	if (parseInt(event.target.value) > 1){
                item.cnt = parseInt(event.target.value);
                this.calculateTotalPrice();
            	}
         },fnSearchAddr : function (check){
			var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("/mypag/addr.do", "test", option);
			self.check = check;
			
         },fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		
	    		self.addr = roadAddrPart1;
	    		self.addrDetail = addrDetail;
	    		self.zipNo = zipNo;
    		
    	}, fnAddrList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/delivery/list.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.list; //�����
                   self.flg = !self.flg;
                   
                }
            }); 
    	},fnAddAddrList : function(){
	       	 var self = this;
	       	 self.uDphone = self.phone1 + self.phone2 + self.phone3
	       	 
	       	 if(self.uDname == null || self.uDname == "" || self.phone1 == null || self.phone1 == "" || self.phone2 == null || self.phone2 == ""|| self.phone3 == null || self.phone3 == ""|| self.addr == null || self.addr == "" || self.addrDetail == null || self.addrDetail == "" ||  self.zipNo == null || self.zipNo == ""){
					alert("������ ��� �Է����ּ���.");	
	       		 return;	       		 
	       	 }
	       	 
	       	 if(self.uId == null || self.uId == ""){
	       		 alert("�α��� ���ּ���.");
	       		 return;
	       	 }
	       	 
	         var nparmap = {uId : self.uId, uDname : self.uDname, uDphone : self.uDphone, addr : self.addr, addrDetail : self.addrDetail, zipNo : self.zipNo, uDmessage : self.dText };
	         $.ajax({
	             url : "/mypag/addAddr.dox",
	             dataType:"json",	
	             type : "POST", 
	             data : nparmap,
	             success : function(data) { 
	             	alert("����ּҷϿ� �߰� �Ǿ����ϴ�!");
	             	location.reload();
	             }
       		  }); 
    	},fnAddAddr : function(item, check){
    		var self = this;
    		
    		if(check == 'y'){
	    	   self.uDname = item.uDname;
	    	   self.addr = item.uDaddr;
	    	   self.addrDetail = item.uDaddrDetail;
	    	   self.zipNo = item.zipNo;
	    	   self.phone1 = item.uDphone.substr(0,3);
	    	   self.phone2 = item.uDphone.substr(3,4);
	    	   self.phone3 = item.uDphone.substr(7);
	    	   self.duNo = item.duNo;
	    	   self.dText = item.uDmessage;
    		}else if (check == 'n'){
    	   		self.uDname = "";
    	    	self.addr = "";
    	    	self.addrDetail = "";
    	    	self.zipNo = "";
 	    	  	self.phone1 = "";
    	    	self.phone2 = "";
    	    	self.phone3 = "";
 	    	   self.duNo = "";
 	    	  self.dText = "";
    		}
    	
    	},fnAddAddr2 : function(check){
    		var self = this;
	    	if(check == 'y'){
	    	   self.user.uDname = self.uDname;
	    	   self.user.addr = self.addr;
	    	   self.user.addrDetail = self.addrDetail;
	    	   self.user.zipNo = self.zipNo;
	    	   self.user.phone1 = self.phone1;
	    	   self.user.phone2 = self.phone2;
	    	   self.user.phone3 = self.phone3;
	    	   self.user.duNo = self.duNo;
	    	   
	    	}else if (check == 'n'){
	    	  	self.user.uDname = "";
	        	self.user.addr = "";
	        	self.user.addrDetail = "";
	        	self.user.zipNo = "";
	        	self.user.phone1 = 
	        	self.user.phone2 = "";
	        	self.user.phone3 = "";
		    	self.user.duNo = "";
	    	}
   		}, requestPay : function() {
    		var self = this;
    		self.user.phone = self.user.phone1+"-" + self.user.phone2 +"-" +self.user.phone3;
            var timestamp = new Date().getTime();
    			IMP.request_pay({
       		    pg: "nice",
       		    pay_method: "card",
       		    merchant_uid:  "order_" + timestamp,
       		    name: "���� ����",
       		    amount: self.totalPrice,
       		    buyer_addr : self.user.addr + self.user.addrDetail,
       		    buyer_postcord : self.user.zipNo,
       		    buyer_name: self.user.uDname,
       		    buyer_tel: self.user.phone,
  	   	 
    		}, function (rsp) { // callback
  	   	      if (rsp.success) {
  	   	    	self.fnInsertAll();
  	   	    	alert("���� ����");
  	   	   		location.href = "../home.do";
  	   	        
  	   	      } else {
  	   	        // ���� ���� ��
  	   	        alert("����");
  	   	      }
    		
  	   	  });
    			
  	   	},  fnRemoveCart : function(){
            var self = this;
            var nparmap = {uId : self.uId};            
            $.ajax({
                url : "/cart/removeCart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                }
            });
            
        }, fnInsertAll : function(){
        	var self = this;
        	var timestamp =  new Date().getTime(); 
        	self.oNo = timestamp;
          	for(var i = 0; i < self.list.length; i++){
                 	var nparmap = {uId : self.uId, pNo : self.list[i].pNo, price : self.list[i].price, cnt : self.list[i].cnt, artist : self.list[i].artist, oNo : self.oNo };
	                   $.ajax({
	                       url : "insertALL.dox",
	                       dataType:"json",   	
	                       type : "POST", 
	                       data : nparmap,
	                       success : function(data) { 
	                    	   self.buyNo = data.buyNo;
	                    	   self.fninsertDelivery();
	                    	   self.fnRemoveCart();
	                       }
	                   });  
          	}//for
        }, fninsertDelivery : function(){
        	var self = this;
        	self.user.uId = self.uId;
        	self.user.oNo = self.oNo;
        	self.user.buyNo = self.buyNo;
         	var nparmap = self.user;
               $.ajax({
                   url : "insertDelivery.dox",
                   dataType:"json",   	
                   type : "POST", 
                   data : nparmap,
                   success : function(data) { 
                   }
               });  
        	
        	
        }//function
        
        
	},created : function() {
			var self = this;
			self.fnGetList();
		}
	});
	
</script>
