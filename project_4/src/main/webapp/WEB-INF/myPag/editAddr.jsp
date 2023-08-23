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
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
 <meta charset="EUC-KR">
  <style type="text/css">
  #container {
    height: 1164px;
    width: 100%;
    margin-bottom: 163px;
}
  	#adrbut{
  		width: 150px;
  		height: 40px;
  		border-radius: 10px;
  		margin: 0px auto;
  		background-color: #697BC9;
  		font-size: 0.8em;
  		color: #fff;
  		border-color: #ddd;
  		
  	}
  	#adrbutdiv{
  		text-align: right;
  		width: 900px;
  	}
	.l{
  		margin-bottom: 30px;
  	}
  	.warningm{
  		width: 930px;
   		line-height: 80px;
   		color : rgb(73, 73, 73);
  	}
  	#warningImg{
  		margin-right: 20px;
  		
  	}
  	table input{
  		width: 300px;
  		height: 50px;
  		border-width: 0 0 1px;
  		outline: none;  		
  	}
  	#pp{
  	width: 900px;
    margin: 30px auto;
    display: flex;
    flex-direction: row;
    justify-content: center;
  	}
  	#pp > button {
		margin: 0px 10px;
		width: 100px;
		height: 40px;
		border-radius: 40px;
		
	}
	#bbut{
		background-color: #fff;
	}
	#edut{
		background-color:  rgb(47, 47, 145);
		color: #fff;
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
                         
                            <div>Refund</div>
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
                              <div class="lowerBox"> ��� �ּҷ� ���� </div>
                              <table v-for="item in list">
                               	<tr>
                              		<th><label for="a1">�� �������</label></th>
                              		<td><input id="a1" v-model="item.uDname"></td>                      		
                              	</tr>
                              	<tr>
                              		<th><label for="b">�� �޴���ȭ</label></th>
                              		<td><input id="b" v-model="item.uDphone"></td>                      		
                              	</tr>
                              	<tr v-if="list[0].addr == ''">
                              		<th><label for="c" for="">�� �ּ�</label></th>
                              		<td> <input id="c" v-model="item.uDaddr" disabled/></td>                      		
                              	</tr>
                              	<tr v-if="list[0].addrDetail == ''">
                              		<th><label for="b" for="">�� ���ּ�</label></th>
                              		<td><input id="b" v-model="item.uDaddrDetail" disabled/></td>                      		
                              	</tr>
                              	<tr v-if="list[0].zipNo == ''">
                              		<th><label for="d" for="">�� �����ּ�</label></th>
                              		<td><input id="d" v-model="item.zipNo" disabled/></td>                      		
                              	</tr>
			                 		   	<tr v-if="user.addr != ''"  >
			                              		<th><label for="e" for="">�� �ּ�</label></th>
			                              		<td><input id="e" disabled style="width : 300px;" type="text" v-model="user.addr"></td>                      		
			                              	</tr>
			                              	<tr v-if="user.addrDetail != ''">
			                              		<th><label for="f" for="">�� ���ּ�</label></th>
			                              		<td><input id="f"  style="width : 300px;" type="text" v-model="user.addrDetail"></td>                      		
			                              	</tr>
			                              	<tr v-if="user.zipNo != ''">
			                              		<th><label for="g" for="">�� �����ּ�</label></th>
			                              		<td><input id="g" style="width : 300px;" type="text" v-model="user.zipNo"></td>                      		
			                              	</tr>
                   
                              	
                              </table>
                            
							   	 <div id="adrbutdiv"><button id="adrbut" @click="fnSearchAddr">�ּ� �˻�</button></div>
							   	  <div id="pp"><button id="bbut" @click="infoAddr">���</button>
							   	  <button id="edut" @click="fnEdit">����</button></div>
							 					  
                              <div class="lowerBox l"> ��� �ּҷ� ���ǻ��� </div>
                              <div class="warningm"> 
                               <i id="warningImg" class="fa-solid fa-circle-exclamation fa-2xl" style="color: #ff5c5c;"></i><span>��� �ּҷ��� �ִ� 10������ ����� �� ������, ������ ������� ���� ��� �ֱ� ��� �ּҷ� �������� �ڵ� ������Ʈ �˴ϴ�.</span>
                        		</div>                   
                 		   </div>
             
           			</div>
  
			</div>
		</div>
</div>
<div><%@ include file="../page/footer.jsp" %></div>
</body>
</html>
<script>
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
}

var app = new Vue({
    el: '#app',
    data: {
       user : {
    	   	uId : "",
    	   	uDname : "",
    	   	uDphone : "",
			addr : "",
			addrDetail : "",
			zipNo : ""
		},
       list : [],
       info :{},
       uId : "${sessionId}",
       duNo : "${map.duNo}",
       order : "",
       maxpoint : undefined,
       order : "",
       exchange : "",
       refund : "",

       
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
					self.info = data.findPw;
				}
			});
		},
       fnGetList : function(){
            var self = this;
            self.info.uId = self.uId;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/delivery/list.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.list = data.list; //�����
                   self.user.uId = self.uId;
                   for(var i=0; i<data.list.length; i++){
                	   self.user.uDname = data.list[i].uDname;
                	   self.user.uDphone = data.list[i].uDphone;
                   }                                   
                   console.log(self.duNo);                    
                   console.log(self.user);                    
                }
            }); 
        },
        fnEdit : function(){
        	 var self = this;
             var nparmap = self.user;
             $.ajax({
                 url : "editAddr.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) { 
                 	alert("�ּ� ���� �Ϸ�!");
                 	 $.pageChange("infoAddr.do", {uId : self.uId});
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
							self.order = listCnt[i].orderCnt;
							console.log(self.order);
						}
					}

				}
			});
		},
        editAddr : function(){
            var self = this;
            $.pageChange("infoAddr2.do", {uId : self.uId});
        },
        fnSearchAddr : function (){
			var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
		},
		fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.user.addr = roadAddrPart1;
    		self.user.addrDetail = addrDetail;
    		self.user.zipNo = zipNo;
    		// �ܼ� ���� �� ���� �� ���� �ʿ��Ѱ� ������ ���� �˴ϴ�.
    		console.log(roadFullAddr);
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    	},
    	infoAddr : function(){
 	    	var self = this;
 	    	$.pageChange("infoAddr.do", {uId : self.uId});
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


    },
    created: function() {
      var self = this;
      self.fnGetList();
      self.fnPoint();
      self.fnCntList();
      self.fnGetInfo();
    }
});
</script>