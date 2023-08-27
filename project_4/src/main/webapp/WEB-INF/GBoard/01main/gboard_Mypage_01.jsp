<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<%@ include file="../../Product/sexyheader.jsp" %>
<style>
    @font-face {
    	font-family: "ridibatang";
        src: url("../../../font/ridibatang.ttf") format("truetype");
    }
    
    *{
    	font-family: ridibatang;
    }
	
	.profile-image {
	    width: 50px;
	    height: 50px;	
	    border-radius: 50%; 
	    object-fit: cover; 
	    margin-top : 15px;
	}
	
	.container{
		padding-top:130px;
		background-color: #f0f0f0;
		height : 1100px;
	}
	.imgBox {
	    width: 100%; 
	    max-height: 220px; 
	    overflow: hidden; 
	    background-color : #444;
	    text-align:center;
	    color:white;
	}
	.imgBox img {
		margin : 0px auto;
	    width: 531px;
	    aspect-ratio: auto 531 / 299;
	    height: 299px;
	    text-align:center;
	}
	.container{
		padding-top:130px;
	}
	.prof{
		width : 1100px;
		margin : 0 auto;
		padding : 50px 0px;
		text-align : left;
	}
	.smText{
		font-size:14px;
		color : #d4d5d9;
	}
	
	.h1{
		font-size:32px;
		font-weight:bold;
	}
	.button {
	  display: inline-block;
	  padding: 5px 10px;
	  font-size: 13px;
	  text-align: center;
	  color: white;
	  font-weight : bold;
	  background-color: #555;
	  border-radius: 30px;
	  border : none;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 100px;	  
	  margin-right : 3px;	  
	}
	
	/* 버튼 호버 효과 */
	.button:hover {
	  background-color: #666;
	}
	

	.button:active {
	  background-color: #666;
	}
	.topbar{
		margin-left : 60%;
	}
	.mainAreaBox{
		display: flex;
	    justify-content: space-between;
	    margin: 0px auto;
	    padding-top: 50px;
	    width: 1100px;
	}
	.mainAreaBox2{
		display: flex;
	    justify-content: space-between;
	    margin: 0px auto;
	    width: 1100px;
	}
	.miniBox{
		display:block;
		float:left;
		width: 335px;
		background-color: #f0f0f0;
		height:300px;
	}
	.miniBox2{
		display:block;
		float:left;
		width: 335px;
		background-color: #f0f0f0;
		height:200px;
	}
	.miniBox3{
		display:block;
		float:left;
		width: 725px;
		background-color: #f0f0f0;
		height:300px;
	}
	.bigFont{
		font-size : 20px;
		font-weight : bold;
		margin-bottom : 10px;
	}
	.bigFont table{
		margin-bottom : 20px;
		
	}
	.minimi{
		width:100%;
		background-color : white;
		height:auto;
		margin : 0 auto;
		border-radius: 14px;
    	box-shadow: 0 5px 20px rgba(0,0,0,.02);
    	text-align: center;
    	border-bottom: 2px solid #ccc;
	}
	th{
		text-align : left;
	}
	
	table{
		border-bottom : 1px solid #d4d5d9;
		    margin: auto;
	}
	.minimi2{
		width:100%;
		background-color : white;
		height:auto;
		margin : 0 auto;
		border-radius: 14px;
    	box-shadow: 0 5px 20px rgba(0,0,0,.02);
    	text-align: center;
    	border-bottom: 2px solid #ccc;
	}
	.minimi3{
		width:100%;
		background-color : white;
		height:auto;
		margin : 0 auto;
		border-radius: 14px;
    	box-shadow: 0 5px 20px rgba(0,0,0,.02);
    	text-align: center;
    	border-bottom: 2px solid #ccc;
	}
	.mainImg{
		align-items: center;
    	display: flex;
    	justify-content: center;
	}
	#radioMenu{
		display: flex;
   		flex-direction: row;
  		justify-content: space-evenly;
  		border-bottom: 2px solid #ccc;
	}
	
	#radioMenu > div{
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		font-size: 1.2em;
		font-weight: bold;
	}
  input[type="radio"]:checked + div label a {
    display: inline-block;
    color: #6667AB; 
    border-bottom: 2px solid #6667AB;
    }
    .button2 {
	  display: inline-block;
	  padding: 5px 15px;
	  font-size: 13px;
	  text-align: center;
	  color: #black;
	  background-color: white;
	  border-radius: 30px;
	  border : 1px solid #d4d5d9;
	  cursor: pointer;
	  transition: background-color 0.3s;
	  width : 80px;
	  margin-right : 3px;	  
	}
	.button2:hover {
	  background-color: #d4d5d9;
	}
	.button2:active {
	  background-color: #1f618d;
	}
	.hidden-input {
   		display: none;
 	 }
 	 .smText2{
 	 	color:#999;
 	 	font-weight : bold;
 	 }
 	 .smText3{
 	 font-weight:200;
 	 }
 	 .minimi td{
 	 	color:#999;
 	 	right:10px;
 	 }
	 #selectedMenu th{
	 	text-align : center;
	 	border-bottom: 1px solid #ccc;	 	
	 }
	 #selectedMenu td{
	  border-bottom: 1px solid #ccc;	 	
	 }
	 }
</style>
<title>myPage</title>
</head>
<body>
	<div id="app">
		<div class="container">
			<div class="imgBox">
				<div class="prof">
					<div><span class="h1">{{uName2}}</span>
						<span class="topbar">
							<a href="/mypag/noticeList.do"><button class="button">공지사항</button></a>
							<a href="/mypag/infoUpdate.do"><button class="button">계정설정</button></a>
							<a href="/product/membership.do"><button class="button">멤버쉽구독</button></a>
						</span>
					</div>
					<strong class="smText">{{uName}}</strong>
					
					<div>
						<strong>MEMBERSHIP ARTIST</strong> 
							<div><span v-for="godok in plist" class="smText">
							<span v-if="godok.artist != null"> {{godok.artist}} </span>
							<span v-else>구독중인 ARTIST가 없습니다.</span>
							</div>
					</div>									
				</div>
			</div>
			
			<div class="mainAreaBox">
				<div class="miniBox">
				<p class="bigFont">멤버쉽 정보 - 구독 내역</p>
				<div class="minimi">
					<table v-for = "item in mlist">
						<tbody>				
						<i class="fa-solid fa-thumbtack" style="color: #000000; font-size:23px; margin-left : 15px;"></i>								
							<tr>
								<th>구독 상태</th><td><strong>{{item.mStatus}}</strong></td>
							</tr>
							<tr>
								<th>아티스트</th><td>{{item.artist}}</td>
							</tr>
							<tr>
								<th>구독 시작일</th><td>{{item.mRegDate}}</td>
							</tr>
							<tr>
								<th>구독 만료일</th><td>{{item.mExpDate}}</td>							
							</tr>
						</tbody>
					</table>
					</div>
				</div>
				<div class="miniBox3">
					<div id="radioMenu">
			    		<input id="1" type="radio" name="Menu" value="내가쓴피드" v-model="selectedMenu" hidden>
			    		<div><label for="1" class="menu"><a>내가쓴피드</a></label></div>
			    		<input id="2" type="radio" name="Menu" value="내가쓴댓글" v-model="selectedMenu" hidden>
			    		<div><label for="2" class="menu"><a>내가쓴댓글</a></label></div>
			    		<input id="3" type="radio" name="Menu" value="내가쓴대댓글" v-model="selectedMenu" hidden>
						<div><label for="3" class="menu"><a>내가쓴대댓글</a></label></div>			    		
			    	</div>
					<div class="minimi3">
						<div id="selectedMenu">
							<table v-if="selectedMenu == '내가쓴피드'">	
								<tr>
									<th>아티스트</th>
									<th>작성일</th>
									<th>피드 내용</th>
									<th>좋아요 수</th>
								</tr>
								<tr v-for = "item in list"  @click="fnCheck(item.gNo)">
										<td>{{item.artist}}</td>
										<td>{{item.gcDate}}</td>
										<td>{{item.gContent}}</td>
										<td>{{item.gLike}}</td>
								</tr>
							</table>
							<table v-if="selectedMenu == '내가쓴댓글'">
								<tr>
									<th>아티스트</th>
									<th>작성일</th>
									<th>댓글 내용</th>
									<th>좋아요 수</th>
								</tr>
								<tr v-for ="item in list2"  @click="fnCheck(item.gNo)">
										<td>{{item.artist}}</td>
										<td>{{item.gcDate}}</td>
										<td>{{item.gcContent}}</td>
										<td>{{item.gcLike}}</td>
								</tr>
							</table>
							<table v-if="selectedMenu == '내가쓴대댓글'">
								<tr>
									<th>아티스트</th>
									<th>작성일</th>
									<th>댓글 내용</th>
									<th>좋아요 수</th>
								</tr>
								<tr v-for = "item in list3"  @click="fnCheck(item.gNo)">
										<td>{{item.artist}}</td>
										<td>{{item.gcDate}}</td>
										<td>{{item.gcContent}}</td>
										<td>{{item.gcLike}}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>				
			</div>
			<div class="mainAreaBox2">
				<div class="miniBox2">
					<p class="bigFont">나의 프로필 관리</p>
					<div class="minimi2" v-for = "(pitem, index) in plist">
						<div class="mainImg">
							<img :src="pitem.gpPath" class="profile-image">
						</div>
						<div class="mainImgBox">
							<h3>{{pitem.nickName}}</h3>
							<div class="smText2">
								<div>{{pitem.artist}}</div>
								<div class="smText3">이미지 변경</div>
							</div>							
							<label class="button2" for="'index'+index">파일 선택</label>
  							<input class="hidden-input" type="file" :id="'index'+index" :name="'index'+index" accept=".gif, .jpg, .png" @change="handleFileChange">
							<button class="button2" @click="fnProfile(pitem, index)">등록</button>
							<button class="button2" @click="fnImgRemove(pitem.gpNo)">이미지 제거</button>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
	<!-- <button @click="fnMove">뒤로가기</button> -->
</body>
</html>
<script>
	    var app = new Vue({
	        el: '#app',
	        data: {
	            list: [],
	            list2: [],
	            list3: [],
				plist: [],	            
				mlist: [],	            
	            uId: "${sessionId}",
	            artist : "",
	            selectedMenu : '내가쓴피드',
	            uName2 : "",
	            uName : ""
	        },// data
	        methods: {
	            fnGetList: function() {
	                var self = this;
	                var nparmap = {uId : self.uId};
	                $.ajax({
	                    url: "myPageList.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                    	/* if(data.list[0].uName == ""){
	                    		location.href="/user/login.do";
	                    	}else{ */
	                    		self.list = data.list;
	 	                        self.list2 = data.list2;
	 	                        self.list3 = data.list3;
	 	                        self.plist = data.plist;
	 	                        self.mlist = data.mlist;
	 	                        self.uName = data.list[0].uName
	 	                        self.uName2 = data.list[0].uName2
	 	                        console.log("plist==>", data);
	 	                        	
	                    		                      
	                    }
	                });
	            }, fnMove : function(){
	            	window.history.back();
	            	
	            }, fnProfile: function(pitem, index) {
	            	  var self = this;
						console.log("pitem==>", pitem);
						console.log("index==>", index);
						console.log("nickName==>", pitem.nickName);
						
	            	    if (!confirm("등록할까요?")) {
	            	        return;
	            	    }
	            	    var nparmap = {nickName : pitem.nickName, artist: pitem.artist, uId : self.uId, gpNo : pitem.gpNo };
	            	    
	            	    $.ajax({
	            	        url: "updateProfileNickName.dox",
		                    dataType: "json",
		                    type: "POST",
	            	        data: nparmap,
		                    success: function (data) {
		                    	 alert("등록되었어요.");
		                        self.fnGetList();
		                        
 		     	           		var form = new FormData();
			            	    form.append("nickName", pitem.nickName);
			            	    form.append("gpNo", pitem.gpNo);
			            	    form.append("artist", pitem.artist);
			            	    form.append("uId", self.uId); 
				       	        form.append( "index",  $("#index"+index)[0].files[0] );
		    	           		self.upload(form); 
		                    }
	            	    });
	            },
	         // 파일 업로드
	    	     upload : function(form){
	    	    	var self = this;
	    	         $.ajax({
	    	             url : "updateProfileImg.dox"
	    	           , type : "POST"
	    	           , processData : false
	    	           , contentType : false
	    	           , data : form
	    	           , success:function(response) { 
	    	        	   location.reload();
	    	           }
	    	       });
	    		},  fnCheck: function(gNo){
	                var self = this;
	                var option = "width=500,height=500,top=100,left";
	                var url = "view.do?gNo=" + gNo + "&uId=" + self.uId;
	                window.open(url, "gNo", option);
	                
	    		},fnMove: function () {
		            window.history.back();
		            
		       }, fnImgRemove : function(gpNo){
	                var self = this;
	                var nparmap = {gpNo : gpNo};
	                
	                if(!confirm("제거 하시겠습니까?")){
	                	return;
	                }
	                $.ajax({
	                    url: "ImgRemove.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                    	alert("이미지 제거 완료");
	                    }
	                });
		       }, handleFileChange: function(event) {
		              var self = this;
		              var file = event.target.files[0];
		              
		              if (file) {
		                  var ext = file.name.split('.').pop().toLowerCase(); // 파일 확장자 추출

		                  if (['gif', 'jpg', 'jpeg', 'png'].indexOf(ext) === -1) {
		                      alert('이미지 파일은 gif, jpg, png 확장자만 허용됩니다.');
		                      // 파일 선택을 취소하도록 처리 (선택한 파일을 초기화)
		                      event.target.value = '';
		                  }
		              }
		          }
	        }, // methods
	        
	        created: function () {
	            var self = this;
	            self.fnGetList();
	        }// created
	    });
	</script>
