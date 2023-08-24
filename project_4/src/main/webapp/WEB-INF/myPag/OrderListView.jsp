<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="mypageheader.jsp" %>
<script src="../js/jquery.js"></script>
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
   integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="EUC-KR">
<!-- ����¡ �߰� 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<style type="text/css">


.orderArea{
   font-size : 15px;
}
.DateNoList{
   border-bottom : 2px solid black;
   margin : 20px 0px;
   padding-bottom : 20px;
}
.DateNoList span{
   margin-left : 50px;
}
.imgOrderBox{
   width : 100px;
   height : 120px;
   float:left;
}
.fontCCC{
   color : #777777;
   font-size : 14px;
   font-weight : 400;
   line-height: 22px;
}
.orderInfo{
   display: table-cell;
    padding-left: 10px;
    vertical-align: middle;
    float:left;
    text-align : left;
}
.noticeArea{   
    color : #777777;
   font-size : 14px;
   font-weight : bold;
   margin-bottom : 60px;
}
.noticeArea li{
   margin : 5px 0px;
}
.noticeArea li:before {
  content: ""; 
  margin-right: 8px; 
}
.ordertbody:hover {
      background-color:#f8f8f8;
  }
 .addrArea h6{
    width : 625px;
    margin : 20px 0px;
 }
.bottomBorder{
   border-bottom : 1px solid black;
}
.addrInfouser{
   text-align: left;
}
.addrInfouser th{
   border-bottom: 1px solid #f1f1f1;
   width : 30%;
   height : 35px;
   padding : 4px 10px;
}
.addrInfouser td{
   width : 70%;
   border-bottom: 1px solid #f1f1f1;
   height : 35px;
   padding : 4px 10px;
   text-align : left;
}
.headerListArea th{
   border-bottom: 1px solid #f1f1f1;
}
.finishList{
   height:100px;
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
                          <div v-if="!maxpoint == 0">{{maxpoint}} P</div>
									<div v-else>0 P</div>
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
                      <div class="lowerBox"> �ֹ� �� ���� </div>
                      <div class="orderArea">
                         <div>
                            <div class="DateNoList">�ֹ���ȣ <strong>{{oNo}}</strong> <span>�ֹ����� <strong>{{oDate}}</strong></span></div>
                         </div>
                         <table>
                            <tr class="headerListArea">
                               <th>��ǰ����</th>
                               <th>������</th>                               
                               <th>�ֹ��ݾ�</th>
                               <th>��� ����</th>
                               <th>�ֹ� ����</th>
                            </tr>
                            <div class="thArea"></div>
                            <tbody class="ordertbody">
                               <tr v-for="item in list">
                                  <td>
                                     <div>
                                        <a href="#" @click="productDetail(item)"><img class="imgOrderBox" :src="item.path">
                                        <ul class="orderInfo">
                                           <li>{{item.artist}} <span class="fontCCC">{{item.pNo}}</span></li>
                                           <li><strong>{{item.pName}}</strong></li>
                                           <li class="fontCCC">���� : {{item.oCount}}</li>
                                        </ul>                                     
                                        </a>
                                     </div>      
                                  </td>
                                  <td>{{item.price*0.02}} P</td>                               
                                  <td>{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}
                                     <div class="fontCCC">{{item.oCount}}��</div>
                                  </td>
                                  <td>
                                     <div>{{item.artist}}</div>
                                     <div>��ü ���</div>
                                     <div>��������:1.1��</div>
                                  </td>
                                  <td v-if='item.dState == "��üȮ����" ||item.dState == "��ǰ�غ���" '><div>{{item.dState}}</div><button class="button" @click="fnOrderCancel(item)">���</button></td>
                                 <td v-else-if='item.dState == "��ۿϷ�"'><div>{{item.dState}}</div><button class="button" @click="fnOrderchange(item)">��ȯ/��ǰ</button><button class="button" @click="fnOrderConfirm(item)">���� Ȯ��</button></td>                                 
                                 <td v-else>{{item.dState}}</td>
                               </tr>
                            </tbody>
                         </table>   
                         
                         <ul class="noticeArea">
                            <li>������ �ֹ���ȣ�� 2�� �̻��� �귣�忡�� �ֹ��Ͻ� ��� ����� �ּҰ� �޶� ���� ���˴ϴ�. (�ù� �ڽ��� 2�� �̻� ���� ����)</li>
                            <li>��� �Ϸ� ���� ��ȯ / ȯ�� ��û�� �ϴ��� ��ǰ�� �����Ͻ� �� �ù� ��ü�� ���� �����ּž� ó�� �����մϴ�.</li>
                            <li>������ ���� ������ ������ ��ǰ ��� �Ϸ� �� 7���� ���� ��쿡�� �ڵ� ����Ȯ��, �������� �ڵ� ���޵˴ϴ�.</li>
                            <li>�ڼ��� ������ <a href="/mypag/faq.do" style="color:#0078ff; font-weight:bold;">FAQ</a>�� Ȯ���Ͽ� �ֽñ� �ٶ��ϴ�.</li>
                         </ul>                                      
                      </div>
                      
                      <div class="addrArea">
                         <div class="bottomBorder">
                            <h6>����� ����</h6>
                         </div>
                            <table class="addrInfouser">
                              <colgroup>
                                 <col style="width:190px">
                                 <col style="width:*">
                              </colgroup>
                           <tbody>
                           <tr>
                              <th scope="row">�̸�</th>
                              <td>{{list2.uName}}</td>
                           </tr>
                           <tr>
                              <th scope="row">����ó</th>
                              <td>{{list2.uPhone}} / {{list2.uDphone}}</td>
                           </tr>
                                             <tr>
                              <th scope="row">����� �ּ�</th>
                              <td>({{list2.zipNo}}) &nbsp; {{list2.uDaddr}}  {{list2.uDaddrDetail}}</td>
                           </tr>
                           <tr>
                              <th scope="row">��� �޽���</th>
                              <td>{{list2.uDmessage}}</td>
                           </tr>
                           </tbody>
                        </table>
                        
                        <ul class="noticeArea">
                            <li>�߼��� �϶��� ����� �ּҸ� �����Ͻ� �� �ֽ��ϴ�.(���Ա�/�Ա�Ȯ��/����û �ܰ����������)</li>                            
                         </ul>         
                      </div>
                      
                      
                      <div class="paydaypayday">
                         <div class="bottomBorder">
                            <h6>���� ���� ����</h6>
                         </div>
                            <table class="addrInfouser">
                              <colgroup>
                                 <col style="width:190px">
                                 <col style="width:*">
                              </colgroup>
                           <tbody>
                           <tr>
                              <th scope="row">��ǰ �հ�</th>
                              <td>{{calcPrice}}��</td>
                           </tr>
                           <tr>
                              <th scope="row">��ۺ�</th>
                              <td v-if="calcPrice < 50000">��ۺ� 3,000��</td>
                              <td v-else style="color:#14aaff;">��ۺ� ����</td>
                           </tr>
                           <tr>
                              <th scope="row">���� ������</th>
                              <td>0��</td>
                           </tr>
                           <tr>
                              <th scope="row" style="font-weight:bold;">���� ���� �ݾ�</th>
                              <td v-if="parseFloat(calcPrice.replace(/,/g, ''))>=50000" style="font-weight:600; font-size:20px;">{{calcPrice}}��
                                 <div style="font-size:12px;">���� ������ {{parseFloat(calcPrice.replace(/,/g, ''))*0.02}}P</div>
                              </td>
                              <td v-else style="font-weight:600; font-size:20px;">{{calcPrice}}��
                                 <div style="font-size:12px;">���� ������ {{calcPrice*0.02}}P</div>
                              </td>
                           </tr>
                           <tr>
                              <th scope="row">���� ����</th>
                              <td style="font-size:14px; font-weight:bolder;">īī������ + ������</td>
                           </tr>
                           </tbody>
                        </table>
                        
                        <ul class="noticeArea">
                            <li>ī������� ���ݿ�����/���ݰ�꼭 �߱��� �Ұ����ϸ� ī����ǥ�� ��ü�Ͻ� �� �ֽ��ϴ�.</li>                            
                            <li>PG�� �Ǵ� ī��翡�� �����ϴ� ��� ������ ���� ���� �ݾ׿� �ݿ����� �ʽ��ϴ�. (ex. īī������ �������)</li>                            
                            <li>�ٷ����� OFF ������ ������ ���� ���� ������ ���ѵ� �� �ֽ��ϴ�.</li>                            
                         </ul>         
                      </div>
                  <div class="finishList"></div>                  
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
      el : '#app',
      data : {
         info : [],
         orderCntList : [],
         uId : "${sessionId}",
         order : 0,
         exchange : "",
         refund : "",
         maxpoint : undefined,
         list : [],
         list2 : [],
         price : [],
         dat : "",
         oDate : "",
         oNo : "${map.oNo}"
         
      }, 
       computed: {
         
    	   calcPrice: function () {
    		   var total = 0;
    		   for (var i = 0; i < this.list.length; i++) {
    		     var item = this.list[i];
    		     total += item.price * item.oCount;
    		   }
    		   return total.toLocaleString();
    		 }
           },
      methods : {
    	  fnGetInfoList : function() { // ����� ���� �ҷ����� �̸� , ���� (�г���)
				var self = this;
				var nparmap = {uId : self.uId};				
				$.ajax({
					url : "/user2.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.info = data.findPw;
					}
				});
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
								self.order += listCnt[i].orderCnt;
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
         fnGetList : function() { 
            var self = this;
            var nparmap = {oNo : self.oNo, uId : self.uId};            
            $.ajax({
               url : "/mypag/OrderListView.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {   
                  console.log(data);
                  self.list = data.list;
                  self.list2 = data.list[0];
                  self.oDate = self.list[0].oDate;
                  console.log(self.list2);
                  
               }
            });
         },
         productDetail : function(item){
            var self = this;
            $.pageChange("/product/productView.do", {pNo : item.pNo});
         },
         fnOrderCancel  : function(item) {
            var self = this;
            if(!confirm("���� ����Ͻðڽ��ϱ�?")){
                   return;
               }
            var nparmap = {buyNo : item.buyNo};
            console.log(nparmap);
            $.ajax({
               url : "/mypag/mypageOrderCancel.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {
                  alert("��ҵǾ����ϴ�.");
                  self.fnGetList();

               }
            });
         },
         fnOrderchange  : function(item) {
            var self = this;
            window.open("/mypag/orderExchange.do?buyNo=" + item.buyNo, "���������� �ֹ� ��ȯ/��ǰ �˾�", "width=400, height=400 top=300, left=700");
         },
         fnOrderConfirm  : function(item)  {
            var self = this;
            if(!confirm("���� ����Ȯ���Ͻðڽ��ϱ�?")){
                   return;
               }
            var userPointAdd = parseInt((self.list2.price * self.list2.oCount) * 0.02);
            var nparmap = {buyNo : item.buyNo, userPointAdd : userPointAdd, uId : self.uId};
            console.log(nparmap);
            $.ajax({
               url : "/mypag/mypageOrderConfirm.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {
                  alert("���� Ȯ�� ó���Ǿ����ϴ�.");
                  self.fnGetList();
               }
            });
         }
      },
      created : function() {
         var self = this;
         self.fnGetList();
         self.fnPoint();
         self.fnCntList();
         self.fnGetInfoList();
      }
   });
</script>