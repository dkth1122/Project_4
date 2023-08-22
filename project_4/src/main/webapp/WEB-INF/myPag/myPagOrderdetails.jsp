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
<!-- ����¡ �߰� 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="EUC-KR">
<style type="text/css">
<!-- ����¡ �߰� 2-->
.pagination {
     margin:24px;
     display: inline-flex;
    }
ul {
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
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
.headerListArea th{
	border-bottom: 1px solid #f1f1f1;
	padding-bottom : 20px;
	font-size: 14px;
	color: #98989f;
	
}
.footerListArea th{
	border-bottom: 1px solid #f1f1f1;
	height : 35px;
	padding : 4px 10px;
}
.footerListArea td{
	border-bottom: 1px solid #f1f1f1;
	height : 35px;
	padding : 20px 10px;
}
.column2{
	text-align : center;
}
.column{
	text-align : left;
}
.pagepage{
	
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
                                 <li class="ulh1">���� ���� ���� </li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myPagOrderdetails.do">�ֹ�����</a></li>
                                       <li><a href="/mypag/myPageInterest.do">��ٱ���</a></li>
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
                                       <li><a href="/mypag/noticeList.do">��������</a></li>
                                       <li><a href="/mypag/useGuide.do">�̿�ȳ�</a></li>
                                       <li><a href="/mypag/faq.do">FAQ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>


						</div>
					</div>

					<div id="right">

						<div class="View">
							 <div class="lowerBox"> �ֹ� ���� ��ȸ </div>
							 <div class="find">
							 	
							 	 
									<span class="date"> ���� ���� </span> <input  type='date' > ~ <input type='date'>
									<div>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</div>
									<div>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</div>
							 </div>
							 
							  <div class="lowerBox">�ֹ� ��ǰ ����</div>
							<div>
								<table class="table">
										<tr class="headerListArea">
											<th class="column-width1">�ֹ���ȣ</th>
											<th class="column-width2">�ֹ�����</th>
											<th class="column-width3">��ǰ����</th>
											<th class="column-width4">�����ݾ�</th>
											<th class="column-width5">�ֹ�����</th>
										</tr>
<<<<<<< HEAD
										<tr  v-for="item in list">											
											<td class="column-width1"><button class="button11" @click="orderDetail(item)">{{item.oNo}}</button></td>
											<td class="column-width2">{{item.oDate}}</td>
											<td v-if="item.cnt >= 2">{{ item.pName }}�� {{ parseInt(item.cnt) - 1 }}��</td>
											<td v-else>{{ item.pName }}</td>
											<td class="column-width5">{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</td>
											<!-- <td class="column-width4" v-if='item.dState == "��üȮ����" ||item.dState == "��ǰ�غ���" '><div>{{item.dState}}</div><button @click="fnOrderCancel(item)">���</button></td>
											<td class="column-width4" v-else-if='item.dState == "��ۿϷ�"'><div>{{item.dState}}</div><button @click="fnOrderchange(item)">��ȯ/��ǰ</button><button @click="fnOrderConfirm(item)">���� Ȯ��</button></td>								 -->
											<td class="column-width4">{{item.dState}}</td>										
										<tr>								
								</table>
=======
										
										<tr class="footerListArea" v-for="item in list">											
											<td class="column"><button class="button11" @click="orderDetail(item)">{{item.oNo}}</button></td>
											<td class="column">{{item.oDate}}</td>
											<td class="column"><button class="button11" @click="productDetail(item)">{{item.pName}}</button></td>
											<td class="column">{{item.price}}��</td>
											<td class="column2" v-if='item.dState == "��üȮ����" ||item.dState == "��ǰ�غ���" '><div>{{item.dState}}</div><button>���</button></td>
											<td class="column2" v-else-if='item.dState == "��ۿϷ�"'><div>{{item.dState}}</div><button>��ȯ/��ǰ</button><div><button>���� Ȯ��</button></div></td>											
											<td class="column2" v-else>{{item.dState}}</td>										
										<tr>
										<!-- ����¡ �߰� 3 -->
			<template class="pagepage">
			  <paginate
			    :page-count="pageCount"
			    :page-range="3"
			    :margin-pages="2"
			    :click-handler="fnSearch"
			    :prev-text="'<'"
			    :next-text="'>'"
			    :container-class="'pagination'"
			    :page-class="'page-item'">
			  </paginate>
			</template>								
								</table>								
							
>>>>>>> branch 'main' of https://github.com/dkth1122/Project_4.git
							</div>	 	
						</div>
					</div>
				</div>
<<<<<<< HEAD
			</div>
=======


			</div>			
>>>>>>> branch 'main' of https://github.com/dkth1122/Project_4.git
		</div>
</body>
</html>
<script type="text/javascript">
<!-- ����¡ �߰� 4 -->
Vue.component('paginate', VuejsPaginate)
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
			<!-- ����¡ �߰� 5 -->
			selectPage: 1,
			pageCount: 1,
			cnt : 0
	
		}, 
		methods : {
			fnGetList : function() {
				var self = this;
				<!-- ����¡ �߰� 6 -->
				var startNum = ((self.selectPage-1) * 10);
	    		var lastNum = 10;
				var param = {uId:self.uId, startNum : startNum, lastNum : lastNum};
				$.ajax({
	                url : "/meme/list.dox",
	                dataType:"json",	
	                type : "POST",
	                data : param,
	                success : function(data) { 
	                	self.list = data.list;
	                	self.cnt = data.cnt;
	                	self.fnOrderList();
		                self.pageCount = Math.ceil(self.cnt / 10);
	                }
	            }); 
			},
			fnSearch : function(pageNum){
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum-1) * 10);
				var lastNum = 10;
				var nparmap = {uId:self.uId,startNum : startNum, lastNum : lastNum};
				$.ajax({
					url : "/meme/list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.cnt = data.cnt;
						self.fnOrderList();
						self.pageCount = Math.ceil(self.cnt / 10);
					}
				});
			},
			fnOrderList : function() { // ����� ���� ���� 
				var self = this;
				var nparmap = {uId : self.uId};				
				$.ajax({
					url : "/mypag/Orderp.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.list = data.list;
						console.log(self.list);
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
								self.order = listCnt[i].orderCnt
								;
							} else if (listCnt[i].exchange == "E") {
								self.exchange = listCnt[i].orderCnt;
							} else {
								self.refund = listCnt[i].orderCnt;
							}
						}

					}
				});
			},
			productDetail : function(item){
				var self = this;
				$.pageChange("/product/productView.do", {pNo : item.pNo});
			},
			orderDetail : function(item){
				var self = this;
				$.pageChange("../myPag/OrderListView.do", {oNo : item.oNo});
			},
			fnOrderCancel  : function(item) {
				var self = this;
				var nparmap = {buyNo : item.buyNo};
				console.log(nparmap);
				$.ajax({
					url : "/mypag/demo.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("��ҵǾ����ϴ�.");

					}
				});
			},
			fnOrderchange  : function(item) {
				var self = this;
				$.pageChange("/product/productView.do", {pNo : item.pNo});
			},
			fnOrderConfirm  : function(item)  {
				var self = this;
				var nparmap = {oNo : item.oNo};
				console.log(nparmap);
				$.ajax({
					url : "/mypag/demo.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("���� Ȯ�� ó���Ǿ����ϴ�.");
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnGetList();
			self.fnCntList();
		}
	});
</script>
