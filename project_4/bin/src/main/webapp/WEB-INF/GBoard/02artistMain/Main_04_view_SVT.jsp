<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>멤버십 댓글</title>
<style>
	body{
		width : 500px;
		margin : 10px auto;
	}
	ul, li{
		text-decoration : none;
		list-style : none;	
	}
	.feedType{
		width: 300px;
		height: 200px;
	    display: inline-block; 
	}
	 .feedType > div {
	 	width: 300px;
		height: 200px;
	    position: relative; 
	   	display: inline-block; 
	    border: 1px solid tomato;
	    padding: 32px;
	    margin: 10px; 
	    vertical-align: top; 
	    box-sizing: border-box; 
	  }
	.container{
		width: 500px;
		border: 1px solid tomato;
		padding: 32px;
	}
	a{
        text-decoration: none;
        color: inherit;
   }
   .write{
   		width: 300px;
		height: 100px;
		border: 1px solid tomato;
		padding: 32px;
   }
   
   .container > ul{
   		border: 1px solid tomato;
   }
</style>
</head>
<body>
<div id="app">
    
    <div class="container">
        <ul v-for="item in list">
            <li>{{item.artist}}</li>
            <li>{{item.uName2}}</li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li>{{item.gLike}}</li>
            <li><button @click="fnLike(item.gNo)">좋아요</button></li>
            <li><button @click="reportPost1(item.gNo)">신고</button></li>
            <li> 
                <!-- v-if="cUser == item.cUser && item.delYn == 'N' || status == 'A'" v-model="item.gNo" -->
            </li>
        </ul>
        <hr>
        <button @click = "fnReload">새로 고침</button>
        
        <ul v-for="item in commentList" v-if="item.gcDelYN !== 'Y'">
            <li>{{item.uId}}</li>
            <li>{{item.uName2}}</li>
            <li>{{item.gcDate}}</li>
            <li>{{item.gcContent}}</li>
            <li>{{item.gcLike}}</li>
            <li><button @click="fnCommnetLike(item.gcNo)">좋아요</button></li>
            <li><button @click="reportPost2(item.gcNo)">신고</button></li>
        	<li v-if="item.uId == uId">
        		<a href="javascript:;">
                	<div><i class="fa-regular fa-circle-xmark fa-xs" @click="fnRemove(item.gcNo)"></i></div>
                </a>
            </li>
            
            <li>
            	<div><button @click="fnCoCommentView(item.gcNo)">댓글</button> </div>
            	
            	<ul v-for ="citem in cocommentList" v-if="citem.gcDelYN !== 'Y' && citem.gcGroup == item.gcNo">
            		<li>{{citem.uId}}</li>
		            <li>{{citem.gcDate}}</li>
		            <li>{{citem.gcContent}}</li>	
		            <li>{{citem.gcLike}}</li>
		            <li><button @click="fnCommnetLike(citem.gcNo, item.gcNo)">좋아요</button></li>
		            <li><button @click="reportPost2(citem.gcNo)">신고</button></li>
		            <li v-if="citem.uId == uId">
        				<a href="javascript:;">
                			<div><i class="fa-regular fa-circle-xmark fa-xs" @click="fnCocoRemove(citem.gcNo)"></i></div>
                		</a>
	           		</li>
	           		
            	</ul>
            	<div><button @click="fnReload" v-if="reload">닫기</button></div>
    			<textarea rows="5" cols="30" v-model="cocomment" ></textarea>
            	<button @click="fnCoComment(item)" >등록</button>
            	
   		   </li>
   		   	
        </ul>
        <hr>
    <div class="write">
        <textarea rows="5" cols="30" v-model="comment"></textarea>
        <button @click="fnCommentAdd">댓글 등록</button>
    </div>
    </div><!-- /컨테이너 div -->
    <button @click="fnMove">닫기</button>
</div>
</body>
</html>
<script>
var app = new Vue({
    el: '#app',
    data: {
        list: [],
        uId: "${sessionId}",
        comment: "",
        artist: "SVT",
        commentList : [],
        gNo : "${map.gNo}",
        cocomment : "",
        cocommentList : [],
        reload : false,
        selectedReason: "",
        otherReason: "",
        reportDescription: "",
        
    },// data
    methods: {
    	 fnGetList: function () {
             var self = this;
             var nparmap = { artist: self.artist, gNo : self.gNo };
             $.ajax({
                 url: "list.dox",
                 dataType: "json",
                 type: "POST",
                 data: nparmap,
                 success: function (data) {
                     self.list = data.list;
                 }
             });
         },
    	 fnGetCnt: function () {
             var self = this;
             var nparmap = {gNo : self.gNo };
             $.ajax({
                 url: "list.dox",
                 dataType: "json",
                 type: "POST",
                 data: nparmap,
                 success: function (data) {
                     self.list = data.list;
                 }
             });
         },
        fnGetComments: function () {
            var self = this;
            var nparmap = { artist: self.artist, gNo : self.gNo };
            $.ajax({
                url: "commentList.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.commentList = data.commentList;
                }
            });
        },
        fnCommentAdd: function () {
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
        },
        fnRemove: function (gcNo) {
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
        },
        fnMove: function () {
        	window.close();
        
        },fnLike: function(gNo) {
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
            
        }, fnCommnetLike : function(gcNo, gcGroup) {
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
            
        }, fnCoCommentView : function(gcNo) {
            var self = this;
            var nparmap = { gcNo: gcNo };
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
            
        }, fnCoComment: function(item) {
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
            
        }, fnCocoRemove : function(gcNo) {
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
        }, fnReload : function(){
        	location.reload();
        	
        }, reportPost1 : function(gNo) {
            var self = this;
            self.selectedReason = ""; // 초기화
            self.otherReason = ""; // 초기화
            self.reportDescription = ""; // 초기화
            self.showReportModal = true;
            
            var option = "width=500,height=500,top=100,right";
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
          
        },  reportPost2 : function(gcNo) {
            var self = this;
            self.selectedReason = ""; // 초기화
            self.otherReason = ""; // 초기화
            self.reportDescription = ""; // 초기화
            self.showReportModal = true;
            
            var option = "width=500,height=500,top=100,right";
            var url = "report2.do?gcNo=" + gcNo + "&uId=" + self.uId;
            window.open(url, "gcNo", option);
        }
        
    }, // methods
    created: function () {
        var self = this;
        self.fnGetList();
        self.fnGetComments();
    }// created
});
</script>