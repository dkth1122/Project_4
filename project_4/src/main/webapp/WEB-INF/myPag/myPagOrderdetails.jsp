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
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>\
<meta charset="EUC-KR">
<!-- 페이징 추가 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<style type="text/css">

.orderchart{
padding-left : 30px;
	margin: 30px 0px;
}
.table{
   border-collapse: collapse;
	border : 1px solid black;
	width: 1200px;
	text-align: center;
}
th{
	background-color: #DACDFB;
	color: #a1a1a1da;
}


th,td {
 border: 1px solid black;
}
td{
	height: 60px;
}
.column-width1{
	width: 15%;
}
.column-width2{
	width: 20%;
}
.column-width3{
	width: 40%;
}
.column-width4{
	width: 5%;
}
.column-width5{
	width: 10%;
}
.find{
	padding: 40px;
}
.date{ 
	margin-right: 40px;
}

</style>

</head>
<body>

	<div id="app">

			<div id="container">
				<div id="top">
					<div id="topbody">
						<div style="height: 150px;"></div>

						<div class="a">
							<div class="left topImgBoxwid">
								<a href="/mypag/main.do"><div id="profileImg"></div></a>
							</div>
							<div class="topBox">
								<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
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

									<div>교환/환불</div>
									<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</div>

								</div>
								<div class="details">
									<div>포인트</div>
									<div>{{info.uPoint}} P</div>
								</div>
								<div class="details">
									<div>Jelly</div>
									<div>0</div>
								</div>
							</div>
						</div>


					</div>
				</div>


				<div id="body">

					<div id="left">
						<div class="categories">MY PAGE</div>
						<div style="text-align: left;">
							<ul style="padding: 0px;">
                                 <li class="ulh1">나의 쇼핑 정보 </li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myPagOrderdetails.do">주문내역</a></li>
                                       <li><a href="/mypag/myPageInterest.do">장바구니</a></li>
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
                                       <li><a href="/mypag/addAddr.do">배송주소록</a></li>                           
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
							 <div class="lowerBox"> 구매내역 </div>
							 <div class="find">
							 	
							 	 
									<span class="date"> 결제 일자 </span> <input  type='date' > ~ <input type='date'>
									    
							 </div>
							 
							  <div class="orderchart"> 구매목록 </div>
							<div>
								<table class="table">
										<tr>
											<th class="column-width1">주문번호</th>
											<th class="column-width2">구입 날짜</th>
											<th class="column-width3" >제품 이름 </th>
											<th class="column-width4">수량</th>
											<th class="column-width5">금액</th>
										</tr>
										
										<tr  v-for="item in list">
											<td class="column-width1">{{item.oNo}}</td>
											<td class="column-width2">{{item.oDate}}</td>
											<td class="column-width3">{{item.pName}}</td>
											<td class="column-width5">{{item.quantity}}</td>
											<td class="column-width4">{{item.price}}</td>
										
										<tr>
										
								
								
								</table>

							
							</div>	 	
						
						</div>

						

					</div>

				</div>


			</div>
		</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			info : [],
			orderCntList : [],
			uId : "${sessionId}",
			order : "",
			exchange : "",
			refund : "",
			list : [],
			price : [],
			dat : "",
	
		}, 
		methods : {
			fnGetList : function() { // 사용자 정보 불러오기 이름 , 별명 (닉네임)
				var self = this;
				var nparmap = {uId : self.uId};				
				$.ajax({
					url : "/user2.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.info = data.findPw;
						self.fnOrderList();
					}
				});
			},
			fnOrderList : function() { // 사용자 구매 내역 
				var self = this;
				var nparmap = {uId : self.uId};				
				$.ajax({
					url : "/mypag/Orderp.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.list = data.list;
						
					}
				});
			},
			fnCntList : function() {
				var self = this;
				var nparmap = {uId : self.uId};
				console.log(nparmap);
				$.ajax({
					url : "/mypag/listExchange.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						var listCnt = data.list;
						for (var i = 0; i < listCnt.length; i++) {
							if (listCnt[i].exchange == "N") {
								self.order = listCnt[i].orderCnt;
								console.log(self.order);
							} else if (listCnt[i].exchange == "E") {
								self.exchange = listCnt[i].orderCnt;
							} else {
								self.refund = listCnt[i].orderCnt;
							}
						}

					}
				});
			},
		
		
		


		},
		created : function() {
			var self = this;
			self.fnGetList();
			self.fnCntList();
		}
	});
</script>
