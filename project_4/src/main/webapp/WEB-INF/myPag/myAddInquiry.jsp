<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <!-- 1. vue2editor 에디터 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
  <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="UTF-8">
  <title>마이페이지</title>
<style>
	#iQtext{
		 min-height : 600px;
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
					    	 	 <a href="#"><div id="profileImg"></div></a>
					    	</div >
					    	<div class="topBox">
					    	<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
					    	</div>
					    	
					    	<div class="topBox">
					    	
					    		<div class="details" >
					    		
					    			<div>주문내역</div>
					    			<div>{{order}}</div>
					    			
					    		</div>
					    		
					    		<div class="details" >
					    		
					    			<div>교환/환불</div>
					    			<div>
					    				<span>{{refund}} /</span><span> {{exchange}}</span>
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
								      			<li><a href="#" @click="myInquiry">1:1 문의</a></li>
								      			<li><a href="#" @click="noticeList">공지사항</a></li>
								      			<li><a href="#" @click="useGuide">이용안내</a></li>
								      			<li><a href="#" @click="faq">FAQ</a></li>							      		
								      		</ul>	
								      	</li>  
							      	</ul>
							      	
							      									      	
							      	</div>
							      	 </div>
							      
					<div id="right">
					
							      <div class="View">
							    	  <div class="lowerBox"> 1:1문의 </div>
							    	  <div>질문유형
							    	  		<select v-model="info.category">
							    	  			<option value="상품문의">상품문의</option>
							    	  			<option value="결제/변경">결제/변경</option>
							    	  			<option value="취소/환불">취소/환불</option>
							    	  			<option value="배송문의">배송문의</option>
							    	  			<option value="불량문의">불량문의</option>
							    	  			<option value="기타문의">기타문의</option>
							    	  		</select>
							    	  </div>
							    	  <div>문의제목 <input v-model="info.iQtitle"></div>
							    	  <div><span>내용
							    	  <!-- 2. 화면 에디터 추가 -->
							    	  		<vue-editor id="iQtext" v-model="info.iQcontent" placeholder="1. 주문번호

2. 문의상품
- 상품명 : (상품 뒷면에 기재된 한글 또는 영문의 상품명)
- 바코드 : (상품 뒷면에 기재된 880으로 시작되는 13자리의 숫자)
- 수량 :

3. 접수 내용
　- 정확한 구성품 종류와 총 요청수량을 기재해주셔야 빠른 접수가 가능합니다.
( 예시. 포토카드 찍힘 1장 구겨짐 2장 )


※ 주의사항
1) 랜덤 상품 또는 구성품의 경우 교환 진행 시 교환품도 랜덤으로 발송 됩니다.
2) 상품 불량 및 오작동 하는 경우, 사진 또는 동영상 첨부 부탁드립니다.
3) 파일 첨부 시 아래 사항은 상품의 불량으로 확인하기 어려우니 참고하시어 첨부 바랍니다.
　- 빛 반사가 심한 사진, 특정 부분만 확대해서 촬영한 사진, 동영상 캡쳐본
　- 패키지 봉투 또는 겉포장지나 PVC 파우치를 제거하지 않은 사진
4) 상품 개봉 전 발생된 불량 또는 누락임을 확인하기 위해 개봉 영상 촬영을 권장 드립니다.
5) 첨부파일은 파일 당 최대 10MB의 용량 제한이 있으며 용량을 초과할 경우 아래 주소로 메일 발송 후 게시글 등록 바랍니다.
　- CSCENTER@SMTOWN.COM
　- 제목양식: 주문번호/주문자명 불량CS 확인요청 (예시) 20230101-0000000/홍길동 불량CS 확인요청">							    	  		
							    	  		</vue-editor> 							    	  		
							    	  		</span></div>							    	
							    	  	<div>
							    	  	<button @click="fnBack">취소</button>
							    	  	<button @click="addBoard">등록</button>
							    	  	</div>
							    	  	
							    	  	
							    	  	<div>
							    	  		<div><span>첨부파일 1 <input type="file" id="file1" name="file1"></span></div>							    	  								    	  
							    	  	</div>
							     </div> 
							     
							     
					</div>
					    
					    </div>
			    
			  </div>
  
</div>
</body>
</html>
<script type="text/javascript">
//3. 뷰에 vue2editor 추가
console.log(Vue);
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;

var app = new Vue({	
    el: '#app',
    data: {
    	info : {
    		iQtitle : "",
    		uId : "",
    		iQtime : "",
    		category : "상품문의"
    		
    	},
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : "",
    	exchange : "",
    	refund : "",
    	list : []
    },
    components: {VueEditor},
    methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            self.info.uId = self.uId;
            $.ajax({
                url : "/mypag/userInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
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
	    fnBack : function(){
	    	var self = this;
	    	$.pageChange("myInquiry.do", {uId : self.uId});
	    },
	    addBoard : function(){
            var self = this;
            var nparmap = self.info;
            console.log(self.info);
            $.ajax({
                url : "/mypag/myPageAddInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
                	alert("문의글이 정상등록 되었습니다.");
                	$.pageChange("myInquiry.do", {uId : self.uId});
                	                	
                	var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "iNo",  data.iNo); // pk
	           		self.upload(form); 
	       	     	
                }
            }); 
        },
     // 파일 업로드
	    upload : function(form){
	    	var self = this;
	         $.ajax({
	             url : "/mypag/fileUpload2.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	           }
	       });
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
	    },
	    faq : function(){
	    	var self = this;
	    	$.pageChange("faq.do", {uId : self.uId});
	    }
    },
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
