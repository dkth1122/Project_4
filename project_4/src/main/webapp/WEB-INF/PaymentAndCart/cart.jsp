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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>��ٱ���</title>
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
	width: 45%
}
.c{
	width: 10%;
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
td input{
	text-align: center;
	border : none;
	width: 20px;
	height: 20px;
}
i{
	border: 1px solid black;
	border-radius: 50%;
	padding: 5px;
}
.table button{
	background-color: #fff;
	border-radius: 25px;
	width: 63px;
	height: 25px;
}
</style>
</head>
<body>
	<div id="app">
		<div id="container">
		
			<div id="title">Cart</div>
			<div class="body">
				<table class="table">
					<tr>
						<th>�̹���</th>
						<th colspan="2">��ǰ����</th>
						<th>����</th>
						<th>����</th>
						<th>�ֹ��ݾ�</th>						
					</tr>
					<tr v-for="(item, index) in list">
						<td class="a"><img :src="item.path" class="pImg"></td>
						<td class="b">{{item.pName}}</td>
						<td class="c">
							 <a href="#none" @click="decreaseCnt(item)"> <i class="fa-solid fa-minus"></i> </a>
							  <input :value="item.cnt" @input="updateItemCnt(item)" readonly>							
							 <a href="#none" @click="increaseCnt(item)"> <i class="fa-solid fa-plus"></i> </a>
						</td>
						<td class="c"><button @click="fnCartChange(item)">����</button></td>
						<td class="c"><button @click ="fnRemoveCart(item.pNo)">����</button></td>
						<td class="e">{{calculateTotal(item) | numberWithCommas}}��</td>
						
					</tr>
				</table>

				<div class="ch_deletebutton">
					<span>\ �ݾ� {{ calculateTotalPrice() | numberWithCommas }}��</span>
					<span v-if="delivery == 0">\ ��� {{ delivery}}��</span>
					<span v-else>\ ��� {{ delivery | numberWithCommas }}��</span>
					<span class="red">\ �� {{ calculateTotalPrice()  + delivery | numberWithCommas }} </span>
				</div>
			
				<div>
					<div class="payment"></div>
					<div class="baybutton">��ǰ�� �ɼ� �� ���� ������ ��ǰ�� �Ǵ� ��ٱ��Ͽ��� �����մϴ�.</div>
				</div>
					
				<div id="baybutton">
					<button @click="fnPay">�����ϱ�</button> 
				</div>
		</div>	
	</div>
</div>
</body>
</html>
<script>
// ���� ����
	Vue.filter('numberWithCommas', function (value) {
	    if (!value) return '';
	    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');});

	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			uId : "${sessionId}",
			totalPrice : 0,
			delivery : 0,
		},
		methods : {
			fnGetList : function(){
	            var self = this;
	            var nparmap = {uId : self.uId};            
	            $.ajax({
	                url : "searchCart.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.list = data.list; //�����
	                	console.log(self.list);
	                }
	            }); 
	        }, calculateTotal: function (item) {
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
                    self.totalPrice = total  + self.delivery;
                } else {
                    self.delivery = 0;
                    self.totalPrice = total  + self.delivery;
                } 
                 return total;
                 
        	},decreaseCnt: function (item) {
                if (item.cnt > 1) {
                    item.cnt--;
                    this.calculateTotalPrice();
                }
            }, increaseCnt: function (item) {
            	var self = this;
            	if(item.cnt < item.pLimit){
            		 item.cnt++;
            		 this.calculateTotalPrice();
            	}else{
            		alert("�ش��ǰ�� �ִ뱸�ż����� "+item.pLimit+"�� �Դϴ�.");
            	}
                
                
                
            }, fnRemoveCart : function(pNo){
                var self = this;
	            var nparmap = {uId : self.uId, pNo : pNo};            
	            $.ajax({
	                url : "removeCart.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	alert("�ش� ��ǰ�� ��ٱ��Ͽ��� ���ܵǾ����ϴ�.");
	                	self.fnGetList();
	                }
	            }); 
            }, fnPay : function(item){
                var self = this;
        		console.log("��Ż����=======>",self.totalPrice);
        		var currentDate = new Date();

            	var year = currentDate.getFullYear();
            	var month = currentDate.getMonth() + 1; // ���� 0���� �����ϹǷ� 1�� ����
            	var day = currentDate.getDate();
            	var hours = currentDate.getHours();
            	var minutes = currentDate.getMinutes();
            	var seconds = currentDate.getSeconds();

            	var currentDateString = year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
            	
            	for(var i=0; i<self.list.length; i++){
            		if(self.list[i].membership == "Y"){
            			if(currentDateString <= self.list[i].mExpDate || currentDateString >= self.list[i].mRegDate){
                    		alert(self.list[i].pName+"\n�ش� ��ǰ�� ����� ������ �ʿ��� ��ǰ�Դϴ�. \n�ش� ��Ƽ��Ʈ�� ������� �������ּ���.");                    	
                				if(self.list[i].kitYn == "Y"){
                                	alert(self.list[i].pName+"\nŰƮ ���Ŵ� ������ ��Ƽ��Ʈ �� 1���� ���� �����մϴ�.");
                                	return;
                			}
            			}            			                    	
            		}
            		else if(self.list[i].stock == 0){
            			alert(self.list[i].pName + "\n�ش��ǰ�� ������ �� �����ϴ�.\n*���� : SOLD OUT");            			
            		}
            		else{
            			$.pageChange("/payment/cartPayment.do", {totalPrice : self.totalPrice});
            			return;            			
            		}
            	}
	           //    $.pageChange("/payment/cartPayment.do", {totalPrice : self.totalPrice}); 
           
            }, fnCartChange : function(item){
        	   var self = this;
               var nparmap = {pNo : item.pNo, uId : self.uId, quantity : item.cnt};            
               $.ajax({
                   url : "/cart/addCart.dox",
                   dataType:"json",	
                   type : "POST", 
                   data : nparmap,
                   success : function(data) { 
                	   self.fnGetList();
                 	  }
               }); 
           },updateItemCnt: function (item) {
           	
           	if (parseInt(event.target.value) > 1){
               item.cnt = parseInt(event.target.value);
               this.calculateTotalPrice();
           	}
       	 }
		},
		created : function() {
			var self = this;
			self.fnGetList();
		}
	});
</script>