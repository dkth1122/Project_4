<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="../js/jquery.js"></script>  
   <link href="../css/mypag.css" rel="stylesheet" type="text/css">  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
                               	<div v-for ="item in list" v-if="item.duNo == duNo">
                              	  <div>· 배송지명 <span><input v-model="item.uDname"></span> </div>
		                          <div>· 휴대전화 <span><input v-model="item.uDphone"></span> </div>
		                          <div v-if="user.addr == ''">· 주소 : <input v-model="item.uDaddr" disabled/></div> 
		                          <div v-if="user.addrDetail == ''">· 상세주소 : <input v-model="item.uDaddrDetail" disabled/></div>
		                          <div v-if="user.zipNo == ''">· 우편주소 : <input v-model="item.zipNo" disabled/></div>		                          		
								 		<div v-if="user.addr != ''" ><label>· 주소 : <input disabled style="width : 300px;" type="text" v-model="user.addr"></label></div>
										<div v-if="user.addrDetail != ''"><label>· 상세 주소 : <input  style="width : 300px;" type="text" v-model="user.addrDetail"></label></div>
										<div v-if="user.zipNo != ''"><label>· 우편번호 : <input  style="width : 300px;" type="text" v-model="user.zipNo"></label></div>
							   	  
							   	  <button @click="fnSearchAddr">주소 검색</button>
							   	  <div><button @click="back">취소</button> 
							   	  <div><button @click="fnEdit()">수정</button></div>
							   	</div>							  
                              <div class="lowerBox"> 배송 주소록 유의사항 </div>
                              <i class="fa-solid fa-exclamation" style="color: #b8b8b8;"></i><span>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</span>
                        
                        		</div>
                   
                 		   </div>
             
           			</div>
  
			</div>
		</div>
</div>
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
       duNo : "${map.duNo}"
       
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
                   self.list = data.list; //사용자
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
                 	alert("주소 수정 완료!");
                 	 $.pageChange("infoAddr.do", {uId : self.uId});
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
    		// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
    		console.log(roadFullAddr);
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    	},
    	infoAddr : function(){
 	    	var self = this;
 	    	$.pageChange("infoAddr.do", {uId : self.uId});
 	    },
 	   infoUpdate : function(){
	    	var self = this;
	    	$.pageChange("infoUpdate.do", {uId : self.uId});
	    },
 	   myInquiry : function(){
	    	var self = this;
	    	$.pageChange("myInquiry.do", {uId : self.uId});
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