<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<style>
	table, td,tr, th {
		border : 1px solid tomato ;
		border-collapse: collapse;
	}
	.header{
		border:1px solid tomato;
	}
	.profile-image {
	    width: 50px; /* 원하는 이미지 크기 조절 */
	    height: 50px;
	    border : 1px solid tomato;
	    border-radius: 50%; /* 50%로 설정하여 동그라미 모양으로 자름 */
	    object-fit: cover; /* 이미지를 화면에 맞게 조절하여 잘린 부분이 잘 보이도록 함 */
}
</style>
<title>myPage</title>
</head>
<body>
	<div id="app">
	 <button @click="fnMove">뒤로가기</button>
	<h1>마이페이지지롱~</h1>
	<div class="header">
		<h2>{{uId}}</h2>
	</div>
	
	<div><h1>멤버쉽 정보 - 구독 내역</h1>
		<table>
			<tr>
				<th>구독 상태</th>
				<th>아티스트</th>
				<th>구독 시작일</th>
				<th>구독 만료일</th>
			</tr>
			<tr v-for = "item in mlist" >
					<td>{{item.mStatus}}</td>
					<td>{{item.artist}}</td>
					<td>{{item.mRegDate}}</td>
					<td>{{item.mExpDate}}</td>
			</tr>
		</table>
	</div>

<div>
	<h1>구독 멤버 별 프로필 사진</h1>
		<table>
			<tr>
				<th>번호</th>
				<th>아티스트</th>
				<th>닉네임</th>
				<th>이미지</th>
				<th>이미지 수정</th>
				<th>완료</th>
				<th>이미지 제거...</th>
			</tr>
			<tr v-for = "(pitem, index) in plist" >
					<td>{{pitem.gpNo}}</td>
					<td>{{pitem.artist}}</td>
					<td>
						<input v-model="pitem.nickName" placeholder="변경할 닉네임 입력">
        			</td>
					<td><img :src="pitem.gpPath" class="profile-image"></td>
					
        			<td>
        				<div>이미지</div>
						<input type="file" :id="'index'+index"  :name="'index'+index" accept=".gif, .jpg, .png" @change="handleFileChange" >
        			</td>
        			<td>	
        				<button @click="fnProfile(pitem, index)">등록</button>
        			</td>
        			<td><button @click="fnImgRemove(pitem.gpNo)">이미지 제거 버튼</button></td>
        			
			</tr>
		</table>
</div>
	
	<div><h1>내가 쓴 피드 ==> 누르면 우측에 테이블 출력</h1>
		<table>
			<tr>
				<th>아티스트</th>
				<th>작성일</th>
				<th>피드 내용</th>
				<th>좋아요 수</th>
			</tr>
			<tr v-for = "item in list"  @click="fnCheck(item.gNo)">
					<td>{{item.artist}}</td>
					<td>{{item.gDate}}</td>
					<td>{{item.gContent}}</td>
					<td>{{item.gLike}}</td>
			</tr>
		</table>
	</div>
	
	<div><h1>내가 쓴 댓글</h1>
		<table>
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
	</div>
		
	<div><h1>내가 쓴 대댓글</h1>
		<table >
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
	            artist : ""
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
	                        self.list = data.list;
	                        self.list2 = data.list2;
	                        self.list3 = data.list3;
	                        self.plist = data.plist;
	                        self.mlist = data.mlist;
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
