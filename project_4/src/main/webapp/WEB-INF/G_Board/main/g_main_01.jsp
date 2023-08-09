<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>멤버십 게시판</title>
<style>
	.header{
		width: 1000px;
		height: 100px;
		border: 1px solid tomato;
		padding: 32px;
	}
	.artistNewFeed{
		font-family: a타이틀고딕2;
	}
	.feedType{
		width: 1000px;
		height: 100px;
	}
	.feedType > span{
		position: absolute;
		border: 1px solid tomato;
		padding: 32px;
	}
	.container{
		width: 1000px;
		height: 1000px;
		border: 1px solid tomato;
		padding: 32px;
	}
</style>
</head>
<body>
<div id="app">
	<button  @click="fnMove">뒤로가기</button>
	<div class="header">
		    <label>제목, 작성자 :	
		        <input type="text" v-model="keyword">
		        <button @click="fnSearch">검색</button>
		    </label>
		    
		    <button>알림</button>
		    <button>마이페이지</button>
	    </div>
	
	<div class="artistNewFeed">
		<div class="feedType">
			<span style="left:0.5%">아티스트 최신 글1</span>
			<span style="left:15%">아티스트 최신 글2</span>
			<span style="left:30%">아티스트 최신 글3</span>
		</div>
	</div>
	
	    	<div class="write">
	    		<textarea rows="5" cols="3"></textarea>
		    	<button  @click="fnAdd">게시글 등록</button>
	    	</div>
	    
	    <div class="container">
	    	
	        <ul>
	            <li>게시글 작성자</li>
	            <li>작성 날짜</li>
	            <li>작성자</li>
	            <li>내용</li>
	            <li>좋아요 수</li>
	            <li>신고</li>
	            <li>작성자 차단</li>
<!-- 	            <li>
				    <button v-if="item.uId == uId">삭제</button>
				</li> -->
	        </ul>
	   <div class="dd">
	    </div>
	    </div>
	</div>
	</body>
	</html>
	<script>
	    var app = new Vue({
	        el: '#app',
	        data: {
	            list: [],
	            no : "",
	            keyword: "",
	            bUser : "${sessionId}",
	            selectItem : []
	            
	        },// data
	        methods: {
	            fnGetList: function() {
	                var self = this;
	                var nparmap = {};
	                $.ajax({
	                    url: "list.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                        self.list = data.list;
	                        console.log(data);
	                    }
	                });
	            }, fnView : function (no) {
	            	 var self = this;
	            	 $.pageChange("view.do", {no : no});
	            	 
	            }, fnSearch: function() {
	                var self = this;
	                var nparmap = {keyword: self.keyword};
	                $.ajax({
	                    url: "search.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                    	self.list = data.list;
			                console.log(self.list);
	                    }
	                });
	            }, fnAdd: function () {
	            	location.href="add.do";
	            	
	            }, fnRemove: function () {
	            	 var self = this;
	                 
	            	 if(!confirm("정말루?;;")){
	                 	return;
	                 }
	                 
	            	 var noList = JSON.stringify(self.selectItem);
	            	 
	                 var nparmap = {selectItem : noList};
	                 
	                  $.ajax({
	                     url : "remove.dox",
	                     dataType:"json",
	                     type : "POST",
	                     data : nparmap,
	                     success : function(data) {
	     	               alert("삭제되었습니다.");
	     	               self.fnGetList(); 
	     	               self.selectItem = [] ;
	                     }
	                 });   
	                 
	            }, fnMove: function () {
					location.href = "/user/main.do";
					
	            }
	        }, // methods
	        created: function () {
	            var self = this;
	        }// created
	    });
	</script>
