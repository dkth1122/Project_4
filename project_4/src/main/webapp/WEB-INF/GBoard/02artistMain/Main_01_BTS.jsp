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
	*{
		font-family: aŸ��Ʋ���2;
	}
	body{
		width : 1250px;
		margin : 10px auto;
            background-color: #F2DAED;
	}
        #app {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        button {
            padding: 10px 20px;
            background-color: #FC8E9B;
            border: none;
            color: white;
            cursor: pointer;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .header label {
            margin-right: 20px;
        }
        
        .feedType {
            display: inline-block;
            width: calc(30% - 2%); /* �ʺ� ��� (������ ��Ҵ� 1%�� margin�� ���� ������ 2%�� ����) */
            height: 200px; /* ���ϴ� ���� �� ���� */
        	margin: 0 1%; /* 1%�� margin�� �¿�� �߰� */
            box-sizing: border-box;
            vertical-align: top;
            border: 1px solid #BB91E7;
            padding: 20px;
            background-color: #FFFFFF;
            list-style: none;
        }
        
        .feedType a {
            text-decoration: none;
            color: inherit;
        }
        
        .profile-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .write textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
            resize: vertical;
        }
        
        .write button {
            background-color: #FC8E9B;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        
        .container ul {
            list-style: none;
            padding: 0;
        }
        
        .container ul li {
            margin-bottom: 10px;
        }
        
        .container ul li span {
            font-weight: bold;
            margin-right: 5px;
        }
        
        .container ul li button {
            background-color: #FFFFFF;
            border: 1px solid #BB91E7;
            color: #BB91E7;
            padding: 5px 10px;
            cursor: pointer;
        }
        
        .container ul li button:hover {
            background-color: #BB91E7;
            color: white;
        }
   
	   .profile-image {
		    width: 50px; /* ���ϴ� �̹��� ũ�� ���� */
		    height: 50px;
		    border : 1px solid #BB91E7;
		    border-radius: 50%; /* 50%�� �����Ͽ� ���׶�� ������� �ڸ� */
		    object-fit: cover; /* �̹����� ȭ�鿡 �°� �����Ͽ� �߸� �κ��� �� ���̵��� �� */
		}
		
		hr{
			border: none; /* �⺻ �׵θ� ���� */
	        height: 2px; /* ���� ���� */
	        background: linear-gradient(to right, #BB91E7, #F2DAED); /* �׶���Ʈ ��� ���� */
	        margin: 20px 0; /* ���Ʒ� ���� ���� */
		}
		.image{
			border : none;
			width : 300px;
			height : 300px;
		}
		.imageX{
			display: none;
		}
</style>
</head>
<body>
<div id="app">
    <button @click="fnMove">�ڷΰ���</button>
    <button @click="fnMove('my')">����������</button>
        <button>�˸�</button>
        <hr>
    <div class="header">
        <label>����, �ۼ��� :  
            <input type="text" v-model="keyword">
            <button @click="fnSearch">�˻�</button>
        </label>
        
    </div>
    
    <div class="artistNewFeed">
        <!-- ��¥ ���� ������ ���� �� ��� -->
        	<ul class="feedType" v-if="index  < 3 && item.gDelYN != 'Y'" v-for="(item, index) in list2"  @click = "fnComment(item.gNo)" >
		        <a href="javascript:;">
	            <div>
	            	<li><span>��ۼ� : </span>{{item.gcCnt}}</li>
	                <li>{{item.artist}}</li>
	            	<li>{{item.nickName}}</li>
	            	<li><img :src = "item.gpPath" class="profile-image"></li>
	                <li>{{item.gDate}}</li>
	                <li>{{item.gContent}}</li>
	                <li><span>���ƿ� : </span>{{item.gLike}}</li>
	            </div>
		       </a>
       	 	</ul>
    </div>
    
    <hr>
    <div class="write">
        <textarea rows="10" cols="100" v-model="content"></textarea>
			<span>����</span>
			<span><input type="file" id="file1" name="file1" accept=".gif, .jpg, .png" @change="handleFileChange"></span>
        <button @click="fnAdd">�Խñ� ���</button>
    </div>
    <hr>
    <div class="container">
        <ul v-for="item in list" v-if="item.gBanYN < 5 && item.gDelYN != 'Y'">
        	<li><span>��ۼ� : </span>{{item.gcCnt}}</li>
            <li>{{item.artist}}</li>
	        <li>{{item.nickName}}<img :src = "item.gpPath" class="profile-image"></li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li><span>���ƿ� : </span>{{item.gLike}}</li>
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
            
            if(self.content == null || self.content == ""){
            	alert("������ �Է����ּ���");
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
            self.selectedReason = ""; // �ʱ�ȭ
            self.otherReason = ""; // �ʱ�ȭ
            self.reportDescription = ""; // �ʱ�ȭ
            self.showReportModal = true;
            
            var option = "width=700,height=500,top=100,right";
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
            
          }, handleFileChange: function(event) {
              var self = this;
              var file = event.target.files[0];
              
              if (file) {
                  var ext = file.name.split('.').pop().toLowerCase(); // ���� Ȯ���� ����

                  if (['gif', 'jpg', 'jpeg', 'png'].indexOf(ext) === -1) {
                      alert('�̹��� ������ gif, jpg, png Ȯ���ڸ� ���˴ϴ�.');
                      // ���� ������ ����ϵ��� ó�� (������ ������ �ʱ�ȭ)
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