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
    body.dimmed::before{
	    content: '';
	    position: fixed;
	    left: 0;
	    right: 0;
	    top: 0;
	    bottom: 0;
	    background-color: rgba(255,255,255, 0.75);
	    -webkit-backdrop-filter: blur(5px);
	    backdrop-filter: blur(5px);
	    z-index: 1000; 
	}
	.popup {
	    z-index: 1001;
	    overflow: auto;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%,-50%);
	    min-width: 600px;
	    max-width: 800px;
	    max-height: 600px; /* 최대 높이 설정 */
	    background-color: #fff;
	    border-radius: 15px;
	    box-shadow: 0 2px 55px -25px rgb(0 0 0 / 100%);
	}	
	.popup > .title{
	    border-radius: 15px 15px 0 0;
	    min-height: 40px;
	    color: #fff;
	    background-color: #b66;
	    padding: 10px 15px;
	    box-sizing: border-box;
	    font-weight: bold;
	}
	.popup > .content {
	    padding: 20px;
	    box-sizing: border-box;
	}
	.popup > .cmd {
	    bottom: 0;
	    min-height: 40px;
	    padding: 15px 15px;
	    box-sizing: border-box;
	    border-radius: 0 0 15px 15px;
	    min-height: 40px;
	    text-align: right;
	}
	.popup > .cmd .button {
	    border-radius: 8px;
	    padding: 5px 10px;
	    border: 1px solid #aaa;
	}
	.popup > .cmd .button:hover {
	    color: #fff;
	    background-color: #000;
	    border-color: #000;
	}
	
	ul, li{
		list-style: none;
	}
	.ulList{
		border: 1px solid rgb(230, 230, 255);
	}
</style>
</head>
<body :class="{ dimmed: flg }">
 <div id="app">
	<div class="logos">
      <a href="../home.do"><img alt="" src="../img/logo/veryperiiix-.png" style="width:130px; height:80px; margin-top:25px;"></a>
      <a href="/gboard/main.do"><img alt="" src="../img/logo/bts_logo.png" style="width:120px; height:auto;"></a>
    </div>
    
	<nav id="buttons">
		<div class="header">
			<div class="btn">
    			<button @click="fnMove">back</button>
    			<button @click="fnMove('my')">mypage</button>
    			<button >알람</button>
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
	                <li @click = "fnComment(item.gNo)">{{ item.gContent.length > 20 ? item.gContent.substring(0, 20) + '...' : item.gContent }}</li>
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
            <li v-if="uId == item.uId || item.uId =='admin'" class="clickThis">
               <div class="clickThis" @click="fnRemove(item)"><span><a href="javascript:">✖</a></span></div>
            </li>
            <hr>
        </ul>
    </div>
    <hr>
    
    <div class="popup" v-if="flg">
        <div class="title">댓글</div>
        <div class="cmd">
            <input type="button" name="btnclose" class="button" value="닫기" @click="CoMove">
        </div>
		<!-- 게시글 출력 -->
        <ul v-for="item in list">
            <li>{{item.artist}}</li>
            <li>{{item.nickName}}</li>
           	<li>
           		<img :src = "item.gpPath" class="profile-image" v-if="item.gpPath">
           		<img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
           	</li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li>
	            <img v-if="item.path" :src="item.path" class="image" />
	            <img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
	        </li>
            <li><span @click="fnLike(item.gNo)"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥ </a>{{item.gLike}}</span></li>
            <li><span @click="reportPost1(item.gNo)"><a href="javascript:">신고🚨<a></span></li>
        	<li v-if="uId == item.uId || item.uId =='admin'" class="clickThis">
               <div class="clickThis" @click="CoRemove(item.gcNo)"><span><a href="javascript:">✖</a></span></div>
            </li>
        </ul>
        
        <hr>
        <button @click = "CoReload">새로 고침</button>
        
        <!-- 댓글 리스트 출력 -->
        <ul v-for="item in commentList" v-if="item.gcDelYN !== 'Y'" class="ulList">
            <li>{{item.uId}}</li>
            <li>{{item.nickName}}</li>
            <li>
	            <img v-if="item.gpPath" :src="item.gpPath" class="image" />
	            <img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
	        </li>
            <li>{{item.gcDate}}</li>
            <li>{{item.gcContent}}</li>
            <li><span @click="CommnetLike(item.gcNo)"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥ </a>{{item.gcLike}}</span></li>
            <li><span @click="reportPost2(item.gcNo)"><a href="javascript:">신고🚨<a></span></li>
	        <li v-if="item.uId == uId || item.uId =='admin'">
	          <a href="javascript:;">
	          	<div @click="CoRemove(item.gcNo)"><span><a href="javascript:">✖</a></span></div>
	          </a>
	        </li>
            
            <!-- 대댓글 출력 -->
               <div><button @click="CoCommentView(item.gcNo)">댓글</button> </div>
            <li>
               
               <ul v-for ="citem in cocommentList" v-if="citem.gcDelYN !== 'Y' && citem.gcGroup == item.gcNo">
                  <li>{{citem.nickName}}</li>
                  <li>
                  	<img :src = "citem.gpPath" class="profile-image" v-if="citem.gpPath">
                  	<img src ="../img/logo/profileImg.jpg"class="profile-image" v-else />
                  </li>
                  <li>{{citem.gcDate}}</li>
                  <li>{{citem.gcContent}}</li>   
                  <li><span @click="CommnetLike(citem.gcNo, item.gcNo)"><a href="javascript:" style="color: rgb(179, 179, 255);">LIKE ♥ </a>{{citem.gcLike}}</span></li>
                  <li><button @click="reportPost2(citem.gcNo)">신고</button></li>
                  <li v-if="citem.uId == uId || item.uId =='admin'">
                    <a href="javascript:;">
                         <div @click="CocoRemove(citem.gcNo)"><span><a href="javascript:">✖</a></span></div>
                      </a>
                    </li>
               <hr>
               </ul>
               <div><button @click="fnReload" v-if="reload">닫기</button></div>
             <textarea rows="5" cols="30" v-model="cocomment" ></textarea>
               <button @click="CoComment(item)">등록</button>
            </li>
        <hr>
        </ul>
		    <div class="write">
		        <textarea rows="5" cols="30" v-model="comment"></textarea>
		        <button @click="CommentAdd">댓글 등록</button>
		    </div>
        <div class="cmd">
            <input type="button" name="btnclose" class="button" value="닫기" @click="CoMove">
        </div>
        </div>
    </div>
</body>
    
    
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
        search : "",
		clist: [],
        comment: "",
        commentList : [],
        gNo : "",
        cocomment : "",
        cocommentList : [],
        reload : false,
        selectedReason: "",
        otherReason: "",
        flg : false,
            
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
                    if(self.uId == null || self.uId == ''){
                    	alert("로그인 해주세요.");
                    	location.href = "main.do";
                    }
                    self.list = data.list;
                    self.list2 = data.list2;
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
                    if(self.uId == null || self.uId == ''){
                    	alert("로그인 해주세요.");
                    	location.href = "main.do";
                    }
                    
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
            
            if(self.uId == null || self.uId == ''){
            	alert("로그인 해주세요.");
            	location.href = "main.do";
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
	       	     	self.content = "";
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
            self.GetCoList(gNo);
            self.GetComments(gNo);
            self.flg = !self.flg;
            
        	
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
            //댓글 팝업에서 게시글 gNo로 하나 가져오기
         }, GetCoList: function(gNo) {
             var self = this;
             var nparmap = { artist: self.artist, gNo : gNo };
             console.log("댓글 ==>", nparmap);
             $.ajax({
                 url: "list.dox",
                 dataType: "json",
                 type: "POST",
                 data: nparmap,
                 success: function (data) {
                     self.clist = data.list;
                 }
             });
             
         //왜 있는지 모르겠음
         }, GetCnt: function () {
             var self = this;
             var nparmap = {gNo : self.gNo };
             $.ajax({
                 url: "list.dox",
                 dataType: "json",
                 type: "POST",
                 data: nparmap,
                 success: function (data) {
                     self.clist = data.list;
                 }
             });
         //해당 게시글의 댓글 가져오는 독스
         }, GetComments: function(gNo) {
            var self = this;
            var nparmap = { artist: self.artist, gNo : gNo };
            $.ajax({
                url: "commentList.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.commentList = data.commentList;
                }
            });
        },CommentAdd: function () {
            var self = this;
            var nparmap = { comment: self.comment, artist: self.artist, uId : self.uId, gNo : self.gNo, artist : self.artist };

            $.ajax({
                url: "addComment.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("등록되었어요.");
                    self.comment = "";
                    self.fnGetComments();
                }
            });
        }, CoRemove: function (gcNo) {
            var self = this;
            if (!confirm("삭제하시겠어요?")) {
                return;
            }
            var nparmap = { gcNo: gcNo };
            $.ajax({
                url: "commentRemove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제되었습니다.");
                    self.fnGetComments();
                }
            });
        }, CoMove: function () {
        	location.reload();
        
        },CoLike: function(gNo) {
            var self = this;
            var nparmap = {artist : self.artist, gNo: gNo, uId : self.uId};
            $.ajax({
                url: "like.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                   self.fnGetList();
                }
            });
            
        }, CommnetLike : function(gcNo, gcGroup) {
            var self = this;
            var nparmap = {artist : self.artist, gcNo: gcNo, uId : self.uId};
            $.ajax({
                url: "commentLike.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                   self.fnGetComments();
                   self.fnCoCommentView(gcGroup);
                }
            });
            
        }, CoCommentView : function(gcNo) {
            var self = this;
            var nparmap = { gcNo: gcNo,  artist: self.artist };
            $.ajax({
                url: "cocommentList.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.cocommentList = data.cocommentList;
                    self.reload = true;
                }
            });
            
        }, CoComment: function(item) {
            var self = this;
            var nparmap = { artist: self.artist, gcNo: item.gcNo, uId: self.uId, cocomment: self.cocomment };
            
            $.ajax({
                url: "cocomment.dox",
                dataType: "json",   
                type: "POST",
                data: nparmap,
                success: function (data) {
                   location.reload();
                }
            });
            
        }, CocoRemove : function(gcNo) {
            var self = this;
            var nparmap = { gcNo: gcNo, uId: self.uId};
            
            if(!confirm("삭제하시겠습니까?")){
               return;
            }
            
            $.ajax({
                url: "cocommentRemove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                   alert("삭제완료");
                   self.fnCoCommentView();
                }
            });
        }, CoReload : function(){
           location.reload();
           
        }, reportPost1 : function(gNo) {
            var self = this;
            self.selectedReason = ""; // 초기화
            self.otherReason = ""; // 초기화
            self.reportDescription = ""; // 초기화
            self.showReportModal = true;
            
            var option = "width=auto,height=auto,top=100,right";
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
          
        },  reportPost2 : function(gcNo) {
            var self = this;
            self.selectedReason = ""; // 초기화
            self.otherReason = ""; // 초기화
            self.reportDescription = ""; // 초기화
            self.showReportModal = true;
            
            var option = "width=700,height=500,top=100,right";
            var url = "report2.do?gcNo=" + gcNo + "&uId=" + self.uId;
            window.open(url, "gcNo", option);
        }
        
        	
    }, // methods
    created: function () {
        var self = this;
        if(self.uId == null || self.uId == ''){
        	alert("로그인 해주세요.");
        	location.href = "main.do";
        }
        self.fnGetList();
    }// created
});
</script>