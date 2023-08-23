<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
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
.calenderArea{
	margin-top: 40px;
    background-color: #fcfcfc;
    border: 1px solid #d8d9df;
    
}
.calenderArea2{
    border: 0;
    border-bottom: 1px dashed #d8d9df;
    padding: 33px 24px;
}
.calenderArea2 ul{
   padding : 0px;
}
.calenderArea ul li {
    color: #96979e;
    padding: 0 0 0 25px;
    height: 33px;
    line-height: 33px;
    font-weight: 400;
    font-size: 14px;
}
.calenderArea i {
	padding-right: 10px;
}
.dateSearch{
	color: #96979e;
	font-size : 20px;
	font-weight : bolder;
}
.date22{
	margin-left : 40px;
}
.button {
	  display: inline-block;
	  padding: 10px 20px;
	  font-size: 14px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 60px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 60px;
	  margin-right : 3px;
	  
	}
	
	/* ��ư ȣ�� ȿ�� */
	.button:hover {
	  background-color: #d4d5d9;
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
                                 <li class="ulh1">��������</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myInquiry.do">1:1 ����</a></li>
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
							 	<div class="calenderArea">				
							 		<div class="calenderArea2">		 	 
										<span class="dateSearch"> ���� ���� ��ȸ </span> 
										<span class="date22">
											<input id="startDate" type='date' v-model="startDate">
											 ~ 
											<input id="endDate" type='date' v-model="endDate"></span>
										<span><button class="button" @click="searchCalender"><i class="fa-solid fa-magnifying-glass"></i></button></span>
									</div>
										<ul>
											<li><i class="fa-regular fa-bell"></i>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</li>
											<li><i class="fa-regular fa-bell"></i>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
										</ul>									
								</div>
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
										
										<tr class="footerListArea" v-for="item in list">											
											<td class="column2"><button class="button11" @click="orderDetail(item)">{{item.oNo}}</button></td>
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
							</div>	 	
						</div>
					</div>
				</div>
			</div>			
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
			cnt : 0,
			startDate: '', 
		    endDate: ''
	
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
			searchCalender : function(){
				var self = this;
				console.log(self.startDate);
				console.log(self.endDate);
				if(self.startDate > self.endDate){
					alert("��ȸ��¥�� �ٽ� Ȯ�����ּ���.");
					return;
				}
				if(self.startDate == ""){
					alert("��ȸ��¥�� üũ���ּ���.");
					return;
				}
				if(self.endDate == ""){
					alert("��ȸ��¥�� üũ���ּ���.");
					return;
				}
				var nparmap = {uId : self.uId, startDate : self.startDate, endDate : self.endDate};				
				 $.ajax({
					url : "/mypag/Orderp.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.list = data.list;
						
					}
				}); */
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
				$.pageChange("/myPag/OrderListView.do", {buyNo : item.buyNo});
			}
		},
		created : function() {
			var self = this;
			self.fnGetList();	
			self.searchCalender();
			self.fnCntList();
		}
	});
</script>
 --%>