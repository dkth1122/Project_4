<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery.js"></script>
<link href="../css/membership.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>멤버쉽 게시판 </title>
<style>
	#app{
		background-color : white;
	}
    @font-face {
    	font-family: "ridibatang";
        src: url("../../../font/ridibatang.ttf") format("truetype");
    }
    
    *{
    	font-family: ridibatang;
    }
    .artistNewFeed{
    	background-color: rgb(230, 230, 255);
    }
    a{
    	text-decoration: none;
    	color: rgb(76, 76, 76);
    }
		
</style>
</head>
<body>
 <div id="app">
	<div class="logos">
      <a href="../home.do"><img alt="" src="../img/logo/veryperiiix-.png" style="width:130px; height:80px; margin-top:25px;"></a>
      <a href="/gboard/main.do"><img alt="" src="../img/logo/ehp_logo.png" style="width:120px; height:auto; margin-top:8px;"></a>
    </div>
    
	<nav id="buttons">
		<div class="header">
			<div class="btn">
    			<button @click="fnMove">back</button>
    			<button @click="fnMove('my')">mypage</button>
      		</div> 
       
     	    <label>  
            	<input type="text" v-model="keyword">
            	<button @click="fnSearch">search</button>
			</label>
        </div>
        <hr>
    </nav>
    <nav id="contents">
    <div class="artistNewFeed">
        	<ul class="feedType" v-if="index  < 3 && item.gDelYN != 'Y'" v-for="(item, index) in list2">
	            	<li><span style="color: rgb(179, 179, 255);">COMMENT ✉<span>{{item.gcCnt}}</li>
	                <li>{{item.artist}}</li>
	            	<li>{{item.nickName}}</li>
	            	<li>
	            		<img :src = "item.gpPath" class="profile-image" v-if="item.gpPath != null && item.gpPath != ''">
	            		<img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
	            	</li>
	                <li>{{item.gDate}}</li>
	                <li @click = "fnComment(item.gNo)">{{item.gContent}}</li>
	                <li><span @click="fnLike(item.gNo)"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥ </a></span>{{item.gLike}}</li>
       	 	</ul>
    </div>
    </nav>
    <hr>
    <nav id= "writearea">
    <div class="write">
        <textarea rows="10" cols="100" v-model="content"></textarea>
			<span><input type="file" id="file1" name="file1" accept=".gif, .jpg, .png" @change="handleFileChange" style="background-color:white;"></span>
        <button @click="fnAdd">등록</button>
    </div>
    </nav>
    <hr>
    <div class="container">
        <ul v-for="item in list" v-if="item.gBanYN < 5 && item.gDelYN != 'Y'">
        	<li><span style="color: rgb(179, 179, 255);">COMMENT ✉ </span>{{item.gcCnt}}</li>
            <li>{{item.artist}}</li>
	        <li>{{item.nickName}}</li>
	        <li>
	          	<img :src = "item.gpPath" class="profile-image" v-if="item.gpPath != null && item.gpPath != ''">
	          	<img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
	        </li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li><span @click="fnLike(item.gNo)"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥ </a></span>{{item.gLike}}</li>
            <li>
	            <img v-if="item.path" :src="item.path" class="image" />
				<img v-else class="imageX" />
			</li>
            <li class="clickThis"><span @click="fnComment(item.gNo)"><a href="javascript:">댓글✉</a></span></li>
            <li class="clickThis"><span @click="reportPost(item.gNo)"><a href="javascript:">신고🚨<a></span></li>
            <li v-if="uId == item.uId" class="clickThis">
                    <div class="clickThis" @click="fnRemove(item)"><span><a href="javascript:">✖</a></span></div>
            </li>
            <hr>
        </ul>
    </div>
    <hr>
  </div>
</body>
</html>
<script>
var app = new Vue({
    el: '#app',
    data: {
        list: [],
        list2: [],
        keyword: "",
        uId: "${sessionId}",
        selectItem: [],
        content: "",
        artist: "EHP",
        info: {},
        selectedReason: "",
        otherReason: "",
        reportDescription: "",
        search : ""
    },// data
    methods: {
        fnGetList: function () {
            var self = this;
            var nparmap = { artist: self.artist };
            $.ajax({
                url: "list.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                    self.list2 = data.list2;
                    console.log(self.list);
                    console.log(self.list2);
                }
            });
        },
        fnSearch: function () {
            var self = this;
            var nparmap = { artist: self.artist, keyword: self.keyword };
            $.ajax({
                url: "search.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    if (self.keyword === "") {
                        self.fnGetList(); 
                        self.search = "";
                    } else {
                        self.list = data.info; 
                        self.search = "";
                    }
                }
            });
        },
        fnAdd: function () {
            var self = this;

            if (!confirm("등록하시겠습니까?")) {
                return;
            }
            
            if(self.content == null || self.content == ""){
            	alert("내용을 입력해주세요.");
                return;
            }
            var nparmap = {content: self.content, artist: self.artist, uId : self.uId };

            $.ajax({
                url: "add.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("등록 완료");
                    self.comment = "";
                    self.fnGetList();
 	           		var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "gNo",  data.gNo); // pk
	           		self.upload(form); 
                }
            });
        },
	     upload : function(form){
	    	var self = this;
	         $.ajax({
	             url : "fileUpload.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	           }
	           
	       });
		}
        ,fnRemove: function (item) {
            var self = this;
            if (!confirm("삭제하시겠습니까?")) {
                return;
            }
            var nparmap = item;
            $.ajax({
                url: "remove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제 완료");
                    self.fnGetList();
                }
            });
            
        },fnMove: function (where) {
        	  window.history.back();
	            
	            if(where == 'my'){
	            	location.href = "myPage.do";
	            }
	            
        },fnLike: function(gNo) {
            var self = this;
            var nparmap = {artist : self.artist, gNo: gNo, uId : self.uId};
            $.ajax({
                url: "like.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                	console.log(data);
                	self.fnGetList();
                }
            });
        }, fnComment : function(gNo){
            var self = this;
            
            var width = 850;
            var height = 800;
            var screenWidth = window.innerWidth; // 브라우저의 너비
            var screenHeight = window.innerHeight; // 브라우저의 높이
            
            var left = (screenWidth - width) / 2; // 팝업의 왼쪽 위치 계산
            var top = (screenHeight - height) / 2; // 팝업의 상단 위치 계산
            
            var option = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top;
            var url = "view.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "view", option);
        	
        },  reportPost : function(gNo) {
            var self = this;
            self.selectedReason = ""; 
            self.otherReason = "";
            self.reportDescription = ""; 
            self.showReportModal = true;
            
            var popupWidth = 600; // 팝업의 너비
            var popupHeight = 200; // 팝업의 높이
            var screenWidth = window.innerWidth; // 브라우저의 너비
            var screenHeight = window.innerHeight; // 브라우저의 높이
            
            var left = (screenWidth - popupWidth) / 2; // 팝업의 왼쪽 위치 계산
            var top = (screenHeight - popupHeight) / 2; // 팝업의 상단 위치 계산
            
            var option = "width=" + popupWidth + ",height=" + popupHeight + ",left=" + left + ",top=" + top;
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
            
          }, handleFileChange: function(event) {
              var self = this;
              var file = event.target.files[0];
              
              if (file) {
                  var ext = file.name.split('.').pop().toLowerCase();

                  if (['gif', 'jpg', 'jpeg', 'png'].indexOf(ext) === -1) {
                      alert('gif, jpg, jpeg, png 타입의 파일만 업로드 가능합니다.');
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