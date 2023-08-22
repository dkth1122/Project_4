<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="../js/jquery.js"></script>    
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link href="../css/mypag.css" rel="stylesheet" type="text/css">
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="UTF-8">
  <title>배송 주소록</title>
  <style type="text/css">
  	table{
  		width: 910px;
  		border-collapse : collapse;
  		text-align: center;
  	}
  	table td{
  	height : 40px;
  	padding : 25px 0px;
  		border-bottom: 1px solid #e3e3e3; 
  	}
  	.tablebutton{
  		width: 930px;
  		display: flex;
  		flex-direction: column;
  		align-items: center;
  	}	
  	.button > button{
  		margin: 40px 10px;
  		width: 150px;
  		height: 60px;
  		border-radius: 50px;
  		background-color: #fff;
  		font-size: 0.5em;
  		font-weight: bold;
  	}
  	#remo{
  		border: none;
  		background-color: rgb(24, 0, 109);
  		color: #fff;]
  		
  	}
  	.l{
  		margin-bottom: 30px;
  	}
  	.warningm{
  		width: 900px;
   		line-height: 80px;
   		color : rgb(73, 73, 73);
  	}
  	#warningImg{
  		margin-right: 20px;
  	}
  	#editbut{
  		width: 50px;
  		height: 50px;
  		border-radius: 50%;
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
                           <div id="profileImg"></div>
                      </div >
                      <div class="topBox">
                      <span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
                      </div>                    
                      <div class="topBox">                      
                         <div class="details" >
                         	<div>Order</div>
			                        <label><a href="/mypag/myPagOrderdetails.do">                            
			                        <div>{{order}}</div>
                          			</a></label>
                         </div>
                         
                         <div class="details" >
                         
                            <div>Refund</div>
                            <div>
                               <span>0/</span><span>0/</span><span>0</span>
                            </div>
                            
                         </div>
                         <div class="details" >
                            <div>포인트</div>
                            <div>{{info.uPoint}} P</div>
                         </div>
                         <div class="details" >
                            <div>Jelly</div>
                            <div>0</div>
                         </div>
                      </div>
                   </div>
                      
                       
                   </div>                   
                   <div id="body">
                   
                           <div id="left">
                              <div class="categories"> MY PAGE</div>
                              <div style="text-align: left;">
                              <ul style="padding: 0px;">
                                 <li class="ulh1">나의 쇼핑 정보 </li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myPagOrderdetails.do">주문내역</a></li>
                                       <li><a href="/mypag/myPageInterest.do  ">장바구니</a></li>
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
                                       <li><a href="/mypag/infoAddr.do">배송주소록</a></li>                           
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
                              <div class="lowerBox"> 배송 주소록 관리 </div>
                                 <div> 
                                 	<table>
                                 		<tr>
                                 			<th>　</th>
                                 			<th>No.</th>
                                 			<th>배송지</th>
                                 			<th>주소</th>
                                 			<th>연락처</th>
                                 			<th>배송지 관리</th>
                                 		</tr>
                                 		<tr v-for = "item in info">
                                 			<td><input type="radio" v-model="duNo" :value="item.duNo"></td>
                                 			<td>{{item.duNo}}</td>
                                 			<td>{{item.uDname}}</td>
                                 			<td>{{item.uDaddr}} {{item.uDaddrDetail}}</td>
                                 			<td>{{item.uDphone}}</td>
                                 			<td><button @click="editAddr(item)" id="editbut">수정</button></td>
                                 		</tr>
                                 	</table>
                                 	<div class="tablebutton">
                                 		<div class="button">
	                                 		<button id="eid" @click="removeAddr(duNo)">선택 주소록 삭제</button>
	                                 		<button id="remo" @click="addAddr">배송지 등록</button>
                                 		</div>
                                 	</div>
                                 </div>
                                <div class="lowerBox l"> 배송 주소록 유의사항 </div>
                               <div class="warningm">  <i id="warningImg" class="fa-solid fa-circle-exclamation fa-2xl" style="color: #ff5c5c;"></i><span>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</span>
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
    el: '#app',
    data: {
       list : [],
       info :{},
       uId : "${sessionId}",
       duNo : "",
       order : "",
       
    },
    methods: {
       fnGetList : function(){
            var self = this;
            self.info.uId = self.uId;
            self.info.duNo = self.duNo;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/delivery/list.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.list; //사용자                  
                
                 
                }
            }); 
        },
        editAddr : function(item){
            var self = this;
            $.pageChange("editAddr.do", {uId : self.uId, duNo : item.duNo});
        },
        infoAddr : function(){
        	var self = this;
        	$.pageChange("infoAddr.do", {uId : self.uId});
        },
        infoUpdate : function(){
        	var self = this;
        	$.pageChange("infoUpdate.do", {uId : self.uId});
        },
        addAddr : function(){
        	var self = this;
        	$.pageChange("addAddr.do", {uId : self.uId});
        },
        myInquiry : function(){
	    	var self = this;
	    	$.pageChange("myInquiry.do", {uId : self.uId});
	    },
        removeAddr : function(duNo){
        	var self = this;
        	if(!confirm("선택주소를 삭제하시겠습니까?")){
        		return;
        	}
            var nparmap = {duNo : self.duNo};
            console.log(duNo);
            $.ajax({
                url : "deleteAddr.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("해당주소가 삭제되었습니다.");
                	self.fnGetList();
                }
            });
        },
	    /* 이용안내 */
	    useGuide : function(){
	    	var self = this;
	    	$.pageChange("useGuide.do", {uId : self.uId});
	    },
	    noticeList : function(){
	    	var self = this;
	    	$.pageChange("noticeList.do", {uId : self.uId});
	    },
	    faq : function(){
	    	var self = this;
	    	$.pageChange("faq.do", {uId : self.uId});
	    }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      // Vue.js ì½ë ìì± ê°ë¥
    }
});
</script>