<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <script src="../js/jquery.js"></script>
 <link href="../css/membership.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>����� �Խ���</title>
<style>
	/* body{
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
   } */
</style>
</head>
<body>
 
	<div class="logos">
      <a href="../home2.do"><img alt="" src="../img/logo/veryperiiix.png" style="width:125px; height:80px; margin-top:25px;"></a>
      <a href="../home2.do"><img alt="" src="../img/logo/ehp_logo.png" style="width:80px; height:auto;  margin-top:27px; margin-left:10px;"></a>
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
        <!-- ��¥ ���� ������ ���� �� ��� -->
        	<ul class="feedType" v-if="index  < 3 " v-for="(item, index) in list2"  @click = "fnComment(item.gNo)" >
		        <a href="javascript:;">
	         <div>
	            	<li><span>COMMENT �� </span>{{item.gcCnt}}</li>
	                <li>{{item.artist}}</li>
	            	<li>{{item.nickName}}</li>
	            	<li><img :src = "item.gpPath" class="profile-image"></li>
	                <li>{{item.gDate}}</li>
	                <li>{{item.gContent}}</li>
	                <li><span>LIKE �� </span>{{item.gLike}}</li>
	            </div>
		       </a>
       	 	</ul>
    </div>
    
     <nav id= "writearea">
    <div class="write">
        <textarea rows="10" cols="100" v-model="content"></textarea>
			<span><input type="file" id="file1" name="file1" accept=".gif, .jpg, .png" @change="handleFileChange" style="background-color:white;"></span>
        <button @click="fnAdd">���</button>
    </div>
    </nav>
    <hr>
    
    <div class="container">
        <ul v-for="item in list" v-if="item.gBanYN < 5 && item.gDelYN != 'Y'">
      		<li><span>COMMENT �� </span>{{item.gcCnt}}</li>
            <li>{{item.artist}}</li>
	        <li>{{item.nickName}}<img :src = "item.gpPath" class="profile-image"></li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li><span>LIKE �� </span>{{item.gLike}}</li>
            <img v-if="item.path" :src="item.path" class="image" />
			<img v-else class="imageX" />
            <li><button @click="fnLike(item.gNo)">���ƿ�</button></li>
            <li><button @click="fnComment(item.gNo)">���</button></li>
            <li><button @click="reportPost(item.gNo)">�Ű�</button></li>
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
                        self.fnGetList(); // Ű���尡 ��������� ��ü ����� ������
                        self.search = "";
                    } else {
                        self.list = data.info; // Ű���尡 ������ �˻� ����� ������
                        self.search = "";
                    }
                }
            });
        },
        fnAdd: function () {
            var self = this;


            if (!confirm("����Ͻðڽ��ϱ�?")) {
                return;
            }
            
            if(self.content == null || self.content == ""){
            	alert("������ �Է����ּ���.");
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
            
        },fnMove: function  (where) {
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
            self.selectedReason = ""; // �ʱ�ȭ
            self.otherReason = ""; // �ʱ�ȭ
            self.reportDescription = ""; // �ʱ�ȭ
            self.showReportModal = true;
            
            var option = "width=500,height=500,top=100,right";
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
                 
  	  }, handleFileChange: function(event) {
        var self = this;
        var file = event.target.files[0];
        
        if (file) {
            var ext = file.name.split('.').pop().toLowerCase();

            if (['gif', 'jpg', 'jpeg', 'png'].indexOf(ext) === -1) {
                alert('gif, jpg, jpeg, png Ÿ���� ���ϸ� ���ε� �����մϴ�.');
                event.target.value = '';
            }
        }
    }, // methods
    created: function () {
        var self = this;
        self.fnGetList();
    }// created
});
</script>