<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="../js/jquery.js"></script>  
     <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="EUC-KR">
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
                              <div class="lowerBox"> 회원 정보 수정 </div>
                                 <div> 
                                 	<div>· 아이디<span>{{info.uId}}</span></div>
                                 	<div>· 닉네임<span><input type="text" v-model="info.uName2"></span></div>                                 	
                                 	<div>· 비밀번호<span><input type="password" v-model="info.uPw" placeholder="영문/숫자/특수문자 중 2가지 이상 조합,10자~16자"></span></div>
                                 	<div>· 새 비밀번호 확인<span><input type="password" v-model="info.uPw2"></span></div>
                                 	<div>· 이름<span><input type="text" v-model="info.uName" ></span></div>                    
                                 	<div>· 연락처<span><input type="text" v-model="info.uPhone"  ></span></div>
                                 	<div>· 수신여부<span>SMS/메일 수신동의 
                                 		<label><input type="radio" name="evtyn"  v-model="info.uSmsyn" value="Y">수신함</label>
                                 		<label><input type="radio" name="evtyn" v-model="info.uSmsyn" value="N">수신안함</label>
                                 	</span></div>
                                 </div>
                                 <div>
                                 	<button @click="back">취소</button>
                                 	<button @click="fnUpdate">수정</button>
                                 </div>
                                 <div><button @click="userRemove">회원 탈퇴</button></div>
                        
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
       info : [
       ],
       user : {
    	   uName2 : "",
    	   uPw : "",
    	   uPw2 : "",
    	   uName : "",
    	   uPhone : "",
    	   uSmsyn : ""
       },
       uId : "${sessionId}"
    },
    methods: {
       fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.findPw; //사용자
                   console.log(self.info);
                   self.user = self.info;
               	   console.log(self.user);
               	   self.info.uSmsyn = self.user.uSmsyn === 'Y' ? 'Y' : 'N';
                }
            }); 
        },
        fnUpdate : function(){
        	var self = this;
        	self.info.uId = self.uId;
        	
        	if(self.info.uName2 == ""){
				alert("아이디를 입력해주세요.");
				return;
			}
        	if(self.info.uPw == ""){
				alert("패스워드를 입력해주세요.");
				return;
			}
        	if(self.info.uPw != self.user.uPw2){
				alert("확인패스워드가 일치하지 않습니다.");
				return;
			}
        	if(self.info.uName == ""){
				alert("이름을 입력해주세요.");
				return;
			}
        	if(self.info.uPhone == ""){
				alert("연락처를 입력해주세요.");
				return;
			}
        	var nparmap = self.user;
            $.ajax({
                url : "/editInfo.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.info = data.findPw; //사용자
                   alert("정상 수정 되었습니다.");
                   self.fnGetList();
                 }
             }); 
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
	    /* 공지사항 */
	    noticeList : function(){
	    	var self = this;
	    	$.pageChange("noticeList.do", {uId : self.uId});
	    },//뒤로가기
	    back : function(){
	    	var self = this;
	    	$.pageChange("main.do", {uId : self.uId});
	    },
	    userRemove : function(){
	    	var self = this;
	    	if(!confirm("정말 탈퇴하시겠습니까?")){
				return;
			}
	    	var nparmap = {uId : self.uId};
            $.ajax({
                url : "/removeUser.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   alert("이용해주셔서 감사합니다.");
                   location.href="main.do";
                }
            }); 
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