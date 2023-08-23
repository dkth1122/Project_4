<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<script src="../js/jquery.js"></script>
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="EUC-KR">

<style type="text/css">
#container {
    height: 923px;
    width: 100%;
    margin-bottom: 163px;
}
#table {
	width: 1400px;
}
.responsive-image{
	width : 100px;
	height : 100px;
}
.button {
	  display: inline-block;
	  padding: 5px 10px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 49%;
	  margin-right : 3px;	  
	}
	
	/* ��ư ȣ�� ȿ�� */
	.button:hover {
	  background-color: #d4d5d9;
	}
	

	.button:active {
	  background-color: #1f618d;
	}
	.button2{
	 display: inline-block;
	  padding: 15px 20px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 14%;
	  font-size : 15px;
	  margin-right : 3px;	  
	}
	.button2:hover {
	  background-color: #d4d5d9;
	}

	.button2:active {
	  background-color: #1f618d;
	}
	.button3{
	 display: inline-block;
	  float : right;
	  left : 300px;
	  padding: 15px 20px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 22%;
	  font-size : 15px;
	  margin-right : 70px;	  
	}
	.button3:hover {
	  background-color: #d4d5d9;
	}
	
	/* ��ư Ŭ�� ȿ�� */
	.button3:active {
	  background-color: #1f618d;
	}
	.button11{
	background: none;
	 border: none;
	 padding: 0;
	 font-family: inherit;
	 font-size: inherit;
	 color: inherit;
	 cursor: pointer;
}
.thead th{
}
</style>

</head>
<body>
	<div id="app">

		<div id="container">

			<div id="top">

				<div style="height: 78px;"></div>

				<div class="a">
					<div class="left topImgBoxwid">
						<a href="/mypag/main.do"><div id="profileImg"></div></a>
					</div>
					<div class="topBox">
						<span class="name">{{infouser.uName}}</span> <span class="nickname">{{infouser.uName2}}</span>
					</div>

					<div class="topBox">

						<div class="details">

							<div>Order</div>
			                        <label><a href="/mypag/myPagOrderdetails.do">                            
			                        <div v-if="order != 0">{{order}}</div>
			                        <div v-else>0</div>
                          			</a></label>

								</div>

								<div class="details">

									<div>��ȯ/ȯ��</div>
									<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</div>

								</div>
								<div class="details">
									<div>����Ʈ</div>
									<div v-if="!maxpoint == 0">{{maxpoint}} P</div>
									<div v-else>0 P</div>
								</div>
				
					</div>
				</div>


			</div>
			<div id="body">

				<div id="left">
					<div class="categories">MY PAGE</div>
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
						<div class="lowerBox">
							�ֹ� ��ǰ ����</div>
						<div class="box-border-bottom"></div>
						<table>
						<thead class="thead">
							<tr>
								<th><input type="checkbox" @click="fnAllCheck" v-model="selectAll"></th>
								<th></th>
								<th>��ǰ����</th>
								<th>������</th>
								<th>��ۺ�</th>
								<th>�ǸŰ�</th>
								<th>����</th>
								
							</tr>
						</thead>
						<tbody>
							<tr  v-for="item in wishList">
								<td><input type="checkbox" name="ssss" :value="item.wnum" v-model="selectItem"></td>
								<td><button class="button11" @click="productDetail(item)"><img class="responsive-image" :src="item.path" ></button></td>
								<td><button class="button11" @click="productDetail(item)"><div class="artist">{{item.artist}}</div>
									{{item.pName}}</button></td>
								<td>{{item.price*0.005}} P</td>							
								<td v-if="item.price < 50000">�⺻���<div>\3,000</div><div>(����)</div></td>
								<td v-if="item.price >= 50000">������</td>
								<td><strong>\{{formatPriceWithCommas(item.price)}}</strong></td>
								<td>
									<button class="button" @click="OrderProduct(item)"> �ֹ��ϱ� </button>								
									<button class="button" @click="insertCart(item)"> ��ٱ��� </button>								
									<button class="button" @click="fnRemoveOne(item)">����</button>								
								</td>								
							</tr>
						</tbody>
				
						</table>
						<div class="BTbottomArea">
							<button class="button2" @click="fnRemove">����</button>
							<button class="button3" @click="fnRemoveAll">���� ����� </button>
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
var cnt = "Y";
var app = new Vue({
    el: '#app',
    data: {
    	info : [],
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : "",
    	exchange : "",
    	refund : "",
    	wishList : [],
    	selectItem : [],
    	selectAll: false,
    	maxpoint : undefined,
 	 	infouser : "",
    	
 
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
    	fnAllCheck: function() {
    		var self = this;
    		self.selectAll = !self.selectAll;
	            if (self.selectAll) {
	            	self.selectItem = self.wishList.map(item => item.wnum);
	            } else {
	            	self.selectItem = [];
	            }
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
                	console.log(data);
                	self.info = data.findPw; //�����                	
                	self.fnProduct();
                }
            }); 
        },           
	    fnProduct : function(){
	        var self = this;
	        var nparmap = {uId : self.uId};
	        $.ajax({
	            url : "/mypag/wishlist.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 	
					self.wishList = data.list;
					console.log(data);	            	
	            }
	        }); 
	    },
	    fnRemove : function(){
			var self = this;
			if(!confirm("���� �����Ұų�?")){
				return;
			}
			var noList = JSON.stringify(self.selectItem);
			var param = {selectItem : noList};
			$.ajax({
                url : "/mypag/removeWishProduct.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("�����Ǿ���!");
                	self.fnGetList();
                	self.selectItem = [];
                }
            });
		},
		fnRemoveAll : function(){
			var self = this;
			if(!confirm("���� �����Ұų�?")){
				return;
			}
			var param = {uId : self.uId};
			$.ajax({
                url : "/mypag/removeAllProdeuctWish.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("�����Ǿ���!");
                	self.fnGetList();
                	
                }
            });
		},		
		fnRemoveOne : function(item){		
			var self = this;
			console.log(item.wnum)
				 if(!confirm("���� �����Ұų�?")){
					return;
				} 
				var param ={wnum : item.wnum};
				console.log(param);
				 $.ajax({
	                url : "/mypag/removeSingleProdeuctWish.dox",
	                dataType:"json",	
	                type : "POST",
	                data : param,
	                success : function(data) { 
	                	alert(data.list);
	                	self.fnGetList();
	                	self.selectItem = [];
	                }
	            }); 
			 	
			},
		insertCart : function(item){
				var self = this;			
				var param ={uId : self.uId, pNo : item.pNo};
				$.ajax({
	                url : "/mypag/editCart.dox",
	                dataType:"json",	
	                type : "POST",
	                data : param,
	                success : function(data) {
	                	/* īƮ�� ��ǰ��ϼ� ��ٱ��Ϸ� ���ų� ������ â���� */
	                	alert(data.list);
	                }
	            });
		},	   
		OrderProduct : function(item){
			var self = this;
			console.log(item.wnum);
		},	   
        myInquiry : function(){
   	    	var self = this;
   	    	$.pageChange("myInquiry.do", {uId : self.uId});
   		},
   		formatPriceWithCommas(price) {
   		    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   	  },
   		productDetail : function(item){
			var self = this;
			$.pageChange("/product/productView.do", {pNo : item.pNo});
	}, fnPoint : function(){ // ����Ʈ ���� Ȯ��
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
	
	    
},created: function() {
      var self = this;
      self.fnGetList();
      self.fnGetInfo();
		self.fnPoint();
		self.fnCntList();
    }
});
</script>
