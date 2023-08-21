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
<meta charset="EUC-KR">
<title>결제 페이지</title>
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
						<th>이미지</th>
						<th colspan="2">상품정보</th>
						<th>수량</th>
						<th>제거</th>
						<th>주문금액</th>						
					</tr>
					<tr v-for="item in list">
						<td class="a"><img :src="item.path" class="pImg"></td>
						<td class="b">{{item.pName}}</td>
						<td class="c">
							 <input :value="item.cnt">
							 <a href="#none" @click="decreaseCnt(item)"> <i class="fa-solid fa-minus"></i> </a>
							 <a href="#none" @click="increaseCnt(item)"> <i class="fa-solid fa-plus"></i> </a>
						</td>
						<td><button @click ="fnRemoveCart(item.pNo)">삭제</button></td>
						<td class="e">{{calculateTotal(item) | numberWithCommas}}원</td>
					</tr>
				</table>
				
				<div class="ch_deletebutton">
					<span>\ 금액 {{ calculateTotalPrice() | numberWithCommas }}원</span>
					<span v-if="delivery == 0">\ 배송 {{ delivery}}원</span>
					<span v-else>\ 배송 {{ delivery | numberWithCommas }}원</span>
					<span class="red">\ 합 {{ calculateTotalPrice()  + delivery | numberWithCommas }} </span>
				</div>
			
				<div class="payment"></div>
			</div>
			<div id="addr">
				<div>
				<div id="inputaddr">
						<div id="inputhd">
						<h3>주문자 정보</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>필수 입력사항</span>
						</div>
						<button @click="fnAddrList" >주소록 보기</button>
						<table>
								 <tr v-for = "item in info" v-if="flg">
                                 	<td><input type="radio" v-model="duNo" :value="item.duNo" name="duNo"></td>
                                 	<td>{{item.duNo}}</td>
                                 	<td>{{item.uDname}}</td>
                                 	<td>{{item.uDaddr}} {{item.uDaddrDetail}}</td>
                                 	<td>{{item.uDphone}}</td>
                                 	<td><button @click="fnAddAddr(item, 'y')">선택</button></td>
                                 </tr>
                                 <tr><button @click="fnAddAddr(item, 'n')">취소</button></tr>
                        </table>
					<table class="adr" border="0">
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주문자 명 </th>
							<td><input  class="nameinput " type="text" v-model="uDname"> </td>
						</tr>
						
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주소</th>
							<td>
							<br>
							<input class="addrinput2" type="text" placeholder="기본주소"v-model="addr" >
							<br>
							<input class="addrinput2" type="text" placeholder="나머지 주소 " v-model="addrDetail">
							<input class="addrinput2" type="text" placeholder="우편번호" v-model="zipNo">								
							<button @click="fnSearchAddr">주소 찾기</button>  
							</td>
						</tr>
						
						<tr>
							<th>일반전화</th>
							<td>
							<select class="select">
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>033</option>
								<option>043</option>
							</select>
							<input class="numinput" type="text"> - <input class="numinput" type="text">			
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>휴대전화</th>
							<td>
								<select class="select">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							<input class="numinput" type="text" v-model="phone2">	- <input class="numinput" type="text" v-model="phone3">								
							</td>						
						</tr>
						
						<tr>
							<th>　<i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>이메일</th>
							<td><div style="width: 793px;">
								<input class="numinput" type="text"> @ <input class="numinput" type="text" :v-model="email">	
									<select class="select2"  :v-model="email">
											<option value="">-이메일 선택-</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="직접입력">직접입력</option>
									</select>
								</div></td>
						</tr>
						
					</table>
				</div>
				<div id="inputaddr">
						<div id="inputhd">
						<h3>배송 정보</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>필수 입력사항</span>
						</div>
						<table class="adr" border="0">
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 배송지선택 </th>
							<td>
								<div id="to" >
										<label><input name="addr" type="radio" style="height: 12px; width: 30px;" @click="fnAddAddr2('y')">주문자 정보와 동일</label> 
										<label><input name="addr" type="radio" style="height: 12px; width: 20px;" @click="fnAddAddr2('n')"> 새로운 배송지</label>
										
							 	</div>
							</td>
							</tr>
							<tr>
						</tr>
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주문자 명 </th>
							<td><input  class="nameinput " type="text" v-model="user.uDname"> </td>
						</tr>
						
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> 주소</th>
							<td>
							<br>
							<input class="addrinput2" type="text" placeholder="기본주소" v-model="user.addr" >
							<br>
							<input class="addrinput2" type="text" placeholder="나머지 주소" v-model="user.addrDetail">					
							<input class="addrinput2" type="text" placeholder="우편번호" v-model="user.zipNo">					
							<button @click="fnSearchAddr">주소 찾기</button> 
							</td>
						</tr>
						
						
						<tr>
							<th>일번전화</th>
							<td>
							<select class="select">
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>033</option>
								<option>043</option>
							</select>
							<input class="numinput" type="text">	- <input class="numinput" type="text">								
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>휴대전화</th>
							<td>
								<select class="select">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							<input class="numinput" type="text" v-model="user.phone2"> - <input class="numinput" type="text" v-model="user.phone3">>			
							</td>						
						</tr>
						
						<tr>
							<th>　배송메시지</th>
							<td><textarea rows="7" cols="110"></textarea> </td>
						</tr>
						
					</table>
				</div>
				</div>
				<div id="point">
				<div id="pointhd">
					할인 쿠폰/적립 혜택
				</div>	
					<div id="viewpoint">
						<table class="pointable">
							<tr>
								<th>
									적립 예정 금액
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
[주문 및 배송정보]
</div>

<p>
[국내 일반 배송]
</p>
<p>
· 배송방식 : SMTOWN &STORE  물류센터 직접배송(CJ대한통운)<br>
· 배송지역 : 전국(일부지역 제외)<br>
· 배송비용 : 3,000원 / 주문금액 50,000원 이상 시 무료배송<br>
· 산간벽지나 도서산간지역은 추가 배송비가 발생할 수 있습니다.  <br>           
· 배송기간 : 결제 후 7~10일 이내 배송 시작될 예정입니다.<br>
</p>					
					
	

<p>
<div>- 상품의 재고상황에 따라 배송기간이 다소 지연될 수도 있습니다.</div>
<div>- 물류센터 사정으로 인해 배송이 지연될 수 있습니다.</div>
<div style="color: red">- 사전예약/주문제작 등 당일 배송이 어려운 상품을 함께 구매하시는 경우 모든
   			상품이 배송 가능한 상태가 되는 시점에 주문하신 상품이 함께 배송 됩니다.</div>
<div>- 기본 배송기간 이상 소요되는 상품 또는 품절된 상품은 개별 연락 드리겠습니다.</div>

<div style="color: red">- 복제 가능한 상품의 경우 개봉 후 단순 변심으로 인한 반품이 불가합니다.</div>
</p>
					</div>
				</div>
			</div>
		<div id="baybutton"><button>결제하기</button></div>
		</div>

</div>
</body>
</html>
<script>
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
			totalPrice : 0,
			delivery : 0,
			 user : {
		    	   	uId : "",
		    	   	uDname : "",
		    	   	phone2 : "",
		    	   	phone3 : "",
					addr : "",
					addrDetail : "",
					zipNo : ""
				},
			info : [],
			flg : false,
			phone2 : "",
			phone3 : "",
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
	                	console.log(self.list);
	                }
	            }); 
	        },calculateTotal: function (item) {
                return item.price * item.cnt;
            },
	        // 상품 전체 금액 합산 메서드
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
	   			self.totalPrice = total;
                 return total;
                 
        	}, decreaseCnt: function (item) {
                if (item.cnt > 1) {
                    item.cnt--;
                    this.calculateTotalPrice();
                }
                
            }, increaseCnt: function (item) {
                item.cnt++;
                this.calculateTotalPrice();
            
         },fnSearchAddr : function (){
			var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("/mypag/addr.do", "test", option);
		
         },fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.user.addr = roadAddrPart1;
    		self.user.addrDetail = addrDetail;
    		self.user.zipNo = zipNo;
    		console.log(roadFullAddr);
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    		
    	}, fnAddrList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/delivery/list.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.list; //사용자
                   self.flg = !self.flg;
                   console.log(self.info);
                   
                }
            }); 
    	},fnAddAddr : function(item, check){
    		var self = this;
    		
    		if(check == 'y'){
	    	   self.uDname = item.uDname;
	    	   self.addr = item.uDaddr;
	    	   self.addrDetail = item.uDaddrDetail;
	    	   self.zipNo = item.zipNo;
	    	   self.phone2 = item.uDphone.substr(3,4);
	    	   self.phone3 = item.uDphone.substr(7);
    		}else if (check == 'n'){
    	   		self.uDname = "";
    	    	self.addr = "";
    	    	self.addrDetail = "";
    	    	self.zipNo = "";
    	    	self.phone2 = "";
    	    	self.phone3 = "";
    		}
    	
    	},fnAddAddr2 : function(check){
    		var self = this;
    		
    	if(check == 'y'){
    	   self.user.uDname = self.uDname;
    	   self.user.addr = self.addr;
    	   self.user.addrDetail = self.addrDetail;
    	   self.user.zipNo = self.zipNo;
    	   self.user.phone2 = self.phone2;
    	   self.user.phone3 = self.phone3;
    	   
    	}else if (check == 'n'){
    	  	self.user.uDname = "";
        	self.user.addr = "";
        	self.user.addrDetail = "";
        	self.user.zipNo = "";
        	self.user.phone2 = "";
        	self.user.phone3 = "";
    	}
    	
    	
    	}
    	
	},
	created : function() {
			var self = this;
			self.fnGetList();
			console.log(self.list);
		}
	});
</script>
