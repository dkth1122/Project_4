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
	body{
		font-family: aŸ��Ʋ���2;
		width : 1250px;
		margin : 10px auto;
	}
	ul, li{
		text-decoration : none;
		list-style : none;	
	}
	.header{
		width: 1000px;
		height: 100px;
		border: 1px solid tomato;
		padding: 32px;
	}
	.artistNewFeed{
		width: 1000px;
		height: 300px;
	}
	.feedType{
		width: 300px;
		height: 200px;
	    display: inline-block; 
	}	
	 .feedType > a > div {
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
		width: 1000px;
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
   
   .container > ul{
   		border: 1px solid tomato;
   }
</style>
</head>
<body>
<div id="app">
    <button @click="fnMove">�ڷΰ���</button>
    <div class="header">
        <label>����, �ۼ��� :  
            <input type="text" v-model="keyword">
            <button @click="fnSearch">�˻�</button>
        </label>
        
        <button>�˸�</button>
        <button>����������</button>
    </div>
    
    <div class="artistNewFeed">
        <!-- ��¥ ���� ������ ���� �� ��� -->
        	<ul class="feedType" v-if="index  < 3 " v-for="(item, index) in list2"  @click = "fnComment(item.gNo)" >
		        <a href="javascript:;">
	            <div>
	            	<li>{{item.gcCnt}}</li>
	                <li>{{item.artist}}</li>
	                <li>{{item.uName2}}</li>
	                <li>{{item.gDate}}</li>
	                <li>{{item.gContent}}</li>
	                <li>{{item.gLike}}</li>
	                <img :src="item.path">
	            </div>
		       </a>
       	 	</ul>
    </div>
    
    <div class="write">
        <textarea rows="10" cols="100" v-model="content"></textarea>
        <button @click="fnAdd">�Խñ� ���</button>
        <div>
			<span>����</span>
			<span><input type="file" id="file1" name="file1"></span>
		</div>
    </div>
    
    <div class="container">
        <ul v-for="item in list" v-if="item.gBanYN < 5 && item.gDelYN != 'Y'">
        	<li>{{item.gcCnt}}</li>
            <li>{{item.artist}}</li>
            <li>{{item.uName2}}</li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li>{{item.gLike}}</li>
            <img :src="item.path">
            <li><button @click="fnLike(item.gNo)">���ƿ�</button></li>
            <li><button @click="fnComment(item.gNo)">���</button></li>
            <li><button @click="reportPost(item.gNo)">�Ű�</button></li>
            <li v-if="uId == item.uId">
                <a href="javascript:;">
                    <div><i class="fa-regular fa-circle-xmark fa-xs" @click="fnRemove(item)"></i></div>
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
                        self.fnGetList(); // Ű���尡 ��������� ��ü ����� ������
                        self.search = "";
                    } else {
                        self.list = data.info; // Ű���尡 ������ �˻� ����� ������
                        self.search = "�˻�";
                    }
                }
            });
        },
        fnAdd: function () {
            var self = this;

            if (!confirm("����ұ��?")) {
                return;
            }
            var nparmap = {content: self.content, artist: self.artist, uId : self.uId };

            $.ajax({
                url: "add.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("��ϵǾ����.");
                    self.comment = "";
                    self.fnGetList();
 	           		var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "gNo",  data.gNo); // pk
	           		self.upload(form); 
                }
            });
        },
     // ���� ���ε�
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
            if (!confirm("�����Ͻðھ��?")) {
                return;
            }
            var nparmap = item;
            $.ajax({
                url: "remove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("�����Ǿ����ϴ�.");
                    self.fnGetList();
                }
            });
            
        },fnMove: function (gNo) {
	            location.href = "main.do";
	            
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
            var option = "width=500,height=500,top=100,left";
            var url = "view.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
        	
        },  reportPost : function(gNo) {
            var self = this;
            self.selectedReason = ""; // �ʱ�ȭ
            self.otherReason = ""; // �ʱ�ȭ
            self.reportDescription = ""; // �ʱ�ȭ
            self.showReportModal = true;
            
            var option = "width=500,height=500,top=100,right";
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
          }
        
    }, // methods
    created: function () {
        var self = this;
        self.fnGetList();
    }// created
});
</script>