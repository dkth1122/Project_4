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
                                       <li><a href="#">회원 정보 수정</a></li>
                                       <li><a href="#">배송주소록</a></li>                           
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
                                <div>· 배송지명 <span><input v-model="info.uDname"></span>
                                <div>· 휴대전화 <span><input v-model="info.uDphone"></span>
                                <div>· 주소 : <button @click="fnSearchAddr">주소 검색</button> 
									<div v-if="user.addr != ''" ><label>도로명 주소 : <input disabled style="width : 300px;" type="text" v-model="user.addr"></label></div>
									<div v-if="user.addrDetail != ''"><label>상세 주소 : <input  style="width : 300px;" type="text" v-model="user.addrDetail"></label></div>
							   </div>
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

const userCode = "imp50081124";
IMP.init(userCode);

var app = new Vue({
    el: '#app',
    data: {
       user : {
			
			addr : "",
			addrDetail : ""
		},
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
    		// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
    		console.log(roadFullAddr);
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    	}
    },
    created: function() {
      var self = this;
      self.fnGetList();
      // Vue.js ì½ë ìì± ê°ë¥
    }
});
</script>