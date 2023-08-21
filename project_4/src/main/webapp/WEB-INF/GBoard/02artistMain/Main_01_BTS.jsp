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

		
		
</style>
</head>
<body>
 <nav id="app">
 
	<div class="logos">
      <a href="../home2.do"><img alt="" src="../img/logo/veryperiiix.png" style="width:130px; height:80px; margin-top:25px;"></a>
      <a href="../home2.do"><img alt="" src="../img/logo/bts_logo.png" style="width:120px; height:auto;"></a>
    </div>
    
	<nav id="buttons">
		<div class="header">
			<div class="btn">
    			<button @click="fnMove">back</button>
    			<button @click="fnMove('my')">menu</button>
    			<button>mypage</button>
      		</div> 
       
     	    <label>  
            	<input type="text" v-model="keyword">
            	<button @click="fnSearch">search</button>
			</label>
        </div>
        <hr>
    </nav>
    
    <div class="artistNewFeed">
        	<ul class="feedType" v-if="index  < 3 && item.gDelYN != 'Y'" v-for="(item, index) in list2"  @click = "fnComment(item.gNo)" >
		        <a href="javascript:;">
	            <div>
	            	<li><span>COMMENT ♥ </span>{{item.gcCnt}}</li>
	                <li>{{item.artist}}</li>
	            	<li>{{item.nickName}}</li>
	            	<li><img :src = "item.gpPath" class="profile-image"></li>
	                <li>{{item.gDate}}</li>
	                <li>{{item.gContent}}</li>
	                <li><span>LIKE ♥ </span>{{item.gLike}}</li>
	            </div>
		       </a>
       	 	</ul>
    </div>
    
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
        	<li><span>COMMENT ♥ </span>{{item.gcCnt}}</li>
            <li>{{item.artist}}</li>
	        <li>{{item.nickName}}<img :src = "item.gpPath" class="profile-image"></li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li><span>LIKE ♥ </span>{{item.gLike}}</li>
            <img v-if="item.path" :src="item.path" class="image" />
			<img v-else class="imageX" />
            <li><button @click="fnLike(item.gNo)">좋아요</button></li>
            <li><button @click="fnComment(item.gNo)">댓글</button></li>
            <li><button @click="reportPost(item.gNo)">신고</button></li>
            <li v-if="uId == item.uId">
                <a href="javascript:;">
                    <div><i class="fa-regular fa-circle-xmark fa-xs" @click="fnRemove(item)"></i></div>
                </a>
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
        artist: "BTS",
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
            var width = 700;
            var height = 500;
            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;
            var option = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top;
            var url = "view.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
        	
        },  reportPost : function(gNo) {
            var self = this;
            self.selectedReason = ""; 
            self.otherReason = "";
            self.reportDescription = ""; 
            self.showReportModal = true;
            
            var option = "width=700,height=500,top=100,right";
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