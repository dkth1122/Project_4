<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
		height: 300px;
	}
	.feedType > ul{
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
	a{
        	text-decoration: none;
        	color: inherit;
        }
   .write{
   	width: 1000px;
		height: 300px;
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
		<div class="feedType" v-if="item.gArtist == 'Y'" v-for="item in list" >
		<!-- ��¥ ���� ������ ���� �� ��� -->
			<ul style="left:0.5%">
		            <li>{{item.mArtist}}</li>
		            <li>{{item.uName2}}</li>
		            <li>{{item.gDate}}</li>
		            <li>{{item.gContent}}</li>
		            <li>{{item.gLike}}</li>
		            <li><button>�Ű�</button></li>
			</ul>
			<ul style="left:30%">
		            <li>{{item.mArtist}}</li>
		            <li>{{item.uName2}}</li>
		            <li>{{item.gDate}}</li>
		            <li>{{item.gContent}}</li>
		            <li>{{item.gLike}}</li>
		            <li><button>�Ű�</button></li>
			</ul>
			<ul style="left:50%">
	            <li>{{item.mArtist}}</li>
	            <li>{{item.uName2}}</li>
	            <li>{{item.gDate}}</li>
	            <li>{{item.gContent}}</li>
	            <li>{{item.gLike}}</li>
	            <li><button>�Ű�</button></li>
			</ul>
		</div>
	</div>
	
	    	<div class="write">
	    		<textarea rows="5" cols="3" v-model="content"></textarea>
		    	<button  @click="fnAdd">�Խñ� ���</button>
	    	</div>
	    
	    <div class="container">
	    	
	        <ul v-for="item in list">
	            <li>{{item.mArtist}}</li>
	            <li>{{item.uName2}}</li>
	            <li>{{item.gDate}}</li>
	            <li>{{item.gContent}}</li>
	            <li>{{item.gLike}}</li>
	            <li><button>�Ű�</button></li>
	            <li> 
	            <!-- v-if="cUser == item.cUser && item.delYn == 'N' || status == 'A'" v-model="item.gNo" -->
		            <a href="javascript:;" >
		            	<div ><i class="fa-regular fa-circle-xmark fa-xs"  @click="fnRemove"></i></div>
		            </a>
				</li>
	        </ul>
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
	            uId : "${sessionId}",
	            selectItem : [],
	            content : "",
	            artist : "BTS",
	            info : {}
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
	            }, fnGetList2 : function() {
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
	            }, fnSearch: function() {
	                var self = this;
	                var nparmap = {artist:self.artist, keyword: self.keyword};
	                $.ajax({
	                    url: "search.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                    	self.list = data.info;
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
	            	 if(!confirm("�����Ͻðھ��?")){
	                 	return;
	                 }
	                 var nparmap = {gNo : self.gNo};
	                  $.ajax({
	                     url : "remove.dox",
	                     dataType:"json",
	                     type : "POST",
	                     data : nparmap,
	                     success : function(data) {
	     	               alert("�����Ǿ����ϴ�.");
	     	               self.fnGetList(); 
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
