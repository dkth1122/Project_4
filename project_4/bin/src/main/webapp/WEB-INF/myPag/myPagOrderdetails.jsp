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
<!-- ����¡ �߰� 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<style type="text/css">


.button11{
	background: none;
	 border: none;
	 padding: 0;
	 font-family: inherit;
	 font-size: inherit;
	 color: inherit;
	 cursor: pointer;
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
							 	
							 	 <div class="xans-element- xans-myshop xans-myshop-orderhistoryhead cboth "><fieldset class="ec-base-box">
<legend>�˻��Ⱓ����</legend>
				<div class="stateSelect  displaynone">
					<select id="order_status" name="order_status" class="fSelect">
<option value="all">��ü �ֹ�ó������</option>
<option value="shipped_before">�Ա���</option>
<option value="shipped_standby">����غ���</option>
<option value="shipped_begin">�����</option>
<option value="shipped_complate">��ۿϷ�</option>
<option value="order_cancel">���</option>
<option value="order_exchange">��ȯ</option>
<option value="order_return">��ǰ</option>
</select>				</div>
				<span class="period">
					<a href="#none" class="btnNormal" days="00"><img src="/morenvyimg/m_myshop/btn_date1.gif" offimage="/morenvyimg/m_myshop/btn_date1.gif" onimage="/morenvyimg/m_myshop/btn_date1_on.gif" alt="����"></a>
					<a href="#none" class="btnNormal" days="07"><img src="/morenvyimg/m_myshop/btn_date2.gif" offimage="/morenvyimg/m_myshop/btn_date2.gif" onimage="/morenvyimg/m_myshop/btn_date2_on.gif" alt="1����"></a>
					<a href="#none" class="btnNormal" days="30"><img src="/morenvyimg/m_myshop/btn_date3.gif" offimage="/morenvyimg/m_myshop/btn_date3.gif" onimage="/morenvyimg/m_myshop/btn_date3_on.gif" alt="1����"></a>
					<a href="#none" class="btnNormal" days="90"><img src="/morenvyimg/m_myshop/btn_date4.gif" offimage="/morenvyimg/m_myshop/btn_date4.gif" onimage="/morenvyimg/m_myshop/btn_date4_on.gif" alt="3����"></a>
					<a href="#none" class="btnNormal" days="180"><img src="/morenvyimg/m_myshop/btn_date5.gif" offimage="/morenvyimg/m_myshop/btn_date5.gif" onimage="/morenvyimg/m_myshop/btn_date5_on.gif" alt="6����"></a>
				</span>
				<input id="history_start_date" name="history_start_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2023-05-24" type="text"><button type="button" class="ui-datepicker-trigger"><img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="..."></button><span class="start_date_line">-</span><input id="history_end_date" name="history_end_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2023-08-22" type="text"><button type="button" class="ui-datepicker-trigger"><img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="..."></button>				<input alt="��ȸ" id="order_search_btn" type="image" src="/morenvyimg/m_myshop/btn_date_search.gif">			</fieldset>
<ul>
<li>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</li>
				<li>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</li>
				<!--<li class="">���/��ȯ/��ǰ ��û�� �ֹ��Ϸ��� ���� 30�ϱ��� �����մϴ�.</li>-->
			</ul>
</div>
									<span class="date"> ���� ���� </span> <input  type='date' > ~ <input type='date'>
									<div>�⺻������ �ֱ� 3�������� �ڷᰡ ��ȸ�Ǹ�, �Ⱓ �˻��� ���� �ֹ������� ��ȸ�Ͻ� �� �ֽ��ϴ�.</div>
									<div>�ֹ���ȣ�� Ŭ���Ͻø� �ش� �ֹ��� ���� �󼼳����� Ȯ���Ͻ� �� �ֽ��ϴ�.</div>
							 </div>
							 
							  <div class="orderchart">�ֹ� ��ǰ ����</div>
							<div>
								<table class="table">
										<tr>
											<th class="column-width1">�ֹ���ȣ</th>
											<th class="column-width2">�ֹ�����</th>
											<th class="column-width3">��ǰ����</th>
											<th class="column-width4">�����ݾ�</th>
											<th class="column-width5">�ֹ�����</th>
										</tr>
										
										<tr  v-for="item in list">											
											<td class="column-width1"><button class="button11" @click="orderDetail(item)">{{item.oNo}}</button></td>
											<td class="column-width2">{{item.oDate}}</td>
											<td class="column-width3"><button class="button11" @click="productDetail(item)">{{item.pName}}�� {{item.cnt}}��</button></td>
											<td class="column-width5">{{item.price}}��</td>
											<td class="column-width4">{{item.dState}}</td>										
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
			fnGetList : function() { // ����� ���� �ҷ����� �̸� , ���� (�г���)
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
				$.pageChange("/myPag/OrderListView.do", {buyNo : item.buyNo});
			}
		},
		created : function() {
			var self = this;
			self.fnGetList();
			self.fnCntList();
		}
	});
</script>
