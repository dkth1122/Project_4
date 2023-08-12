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
  <title>마이페이지</title>
  <style type="text/css">
  </style>
</head>
<body>
<div id="app">

           <div id="container">
           
                   <div id="top">
                   
                      <div style="height: 150px;"></div>
                      
                   <div class="a">
                      <div class="left topImgBoxwid">
                           <a href="#"><div id="profileImg"></div></a>
                      </div >
                      <div class="topBox">
                      <span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
                      </div>                    
                      <div class="topBox">                      
                         <div class="details" >
                         	<label><a href="#" name="메모:누르면 주문내역 페이지로전환">
                            <div>Order</div>
                            <div>2</div>
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
                                 <li>나의 쇼핑 정보 </li>
                                 <li>
                                    <ul>
                                       <li><a href="#">주문내역</a></li>
                                       <li><a href="#">관심상품</a></li>
                                       <li><a href="#">최근 본 상품</a></li>
                                       <li><a href="#">적림금</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>
                              <ul style="padding: 0px;">
                                 <li>회원 정보</li>
                                 <li>
                                    <ul>
                                       <li><a @click="infoUpdate">회원 정보 수정</a></li>
                                       <li><a @click="infoAddr">배송주소록</a></li>                           
                                    </ul>   
                                 </li>  
                              </ul>
                                    <ul style="padding: 0px;">
                                 <li>고객센터</li>
                                 <li>
                                    <ul>
                                       <li><a href="#">1:1 문의</a></li>
                                       <li><a href="#">공지사항</a></li>
                                       <li><a href="#">이용안내</a></li>
                                       <li><a href="#">FAQ</a></li>                                 
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
                                 			<th>선택</th>
                                 			<th>배송지</th>
                                 			<th>주소</th>
                                 			<th>연락처</th>
                                 			<th>배송지 관리</th>
                                 		</tr>
                                 		<tr v-for = "item in info">
                                 			<td><input type="radio" :value="info.dUno"></td>
                                 			<td>{{item.uDname}}</td>
                                 			<td>{{item.uDaddr}}</td>
                                 			<td>{{item.uDphone}}</td>
                                 			<td><button @click="editAddr">수정</button></td>
                                 		</tr>
                                 	</table>
                                 	<div>
                                 		<button>선택 주소록 삭제</button>
                                 		<button>배송지 등록</button>
                                 	</div>
                                 </div>
                                <div class="lowerBox"> 배송 주소록 유의사항 </div>
                                 <i class="fa-solid fa-exclamation" style="color: #b8b8b8;"></i><span>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</span>
                        
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
       uId : "${sessionId}"
       
    },
    methods: {
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
                   self.info = data.list; //사용자
                 
                }
            }); 
        },
        editAddr : function(){
            var self = this;
            $.pageChange("editAddr.do", {uId : self.uId});
        },
        infoAddr : function(){
        	var self = this;
        	$.pageChange("infoAddr.do", {uId : self.uId});
        },
        infoUpdate : function(){
        	var self = this;
        	$.pageChange("infoUpdate.do", {uId : self.uId});
        }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      // Vue.js ì½ë ìì± ê°ë¥
    }
});
</script>