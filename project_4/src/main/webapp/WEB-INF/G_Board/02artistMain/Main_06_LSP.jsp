<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>����� �Խ���</title>
<style>
	.header{
		width: 1000px;
		height: 100px;
		border: 1px solid tomato;
		padding: 32px;
	}
	.artistNewFeed{
		font-family: aŸ��Ʋ���2;
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
	<button  @click="fnMove">�ڷΰ���</button>
	<div class="header">
		    <label>����, �ۼ��� :	
		        <input type="text" v-model="keyword">
		        <button @click="fnSearch">�˻�</button>
		    </label>
		    
		    <button>�˸�</button>
		    <button>����������</button>
	    </div>
	
	<div class="artistNewFeed">
		<div class="feedType">
			<span style="left:0.5%">��Ƽ��Ʈ �ֽ� ��1</span>
			<span style="left:15%">��Ƽ��Ʈ �ֽ� ��2</span>
			<span style="left:30%">��Ƽ��Ʈ �ֽ� ��3</span>
		</div>
	</div>
	
	    	<div class="write">
	    		<textarea rows="5" cols="3" v-model="content"></textarea>
		    	<button  @click="fnAdd">�Խñ� ���</button>
	    	</div>
	    
	    <div class="container">
	    	
	        <ul v-for="item in list">
	            <li>{{item.mArtist}}</li>
	            <li>{{item.uId}}</li>
	            <li>{{item.gDate}}</li>
	            <li>{{item.gContent}}</li>
	            <li>{{item.gLike}}</li>
	            <li>�Ű�</li>
	            <li>�ۼ��� ����</li>
<!-- 	            <li>
				    <button v-if="item.uId == uId">����</button>
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
	            selectItem : [],
	            content : "",
	            artist : "LSP"
	            
	        },// data
	        methods: {
	            fnGetList: function() {
	                var self = this;
	                var nparmap = {artist : self.artist };
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
 					var self = this;
	                 
	            	 if(!confirm("����ұ��?")){
	                 	return;
	                 }
	                 var nparmap = {content : self.content, artist : self.artist};
	                 
	                  $.ajax({
	                     url : "add.dox",
	                     dataType:"json",
	                     type : "POST",
	                     data : nparmap,
	                     success : function(data) {
	     	               alert("��ϵǾ����.");
	     	               self.fnGetList(); 
	                     }
	                 });   
	            }, fnRemove: function () {
	            	 var self = this;
	                 
	            	 if(!confirm("������?;;")){
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
	     	               alert("�����Ǿ����ϴ�.");
	     	               self.fnGetList(); 
	     	               self.selectItem = [] ;
	                     }
	                 });   
	                 
	            }, fnMove: function () {
					location.href = "main.do";
					
	            }
	        }, // methods
	        created: function () {
	            var self = this;
	            self.fnGetList();
	        }// created
	    });
	</script>
