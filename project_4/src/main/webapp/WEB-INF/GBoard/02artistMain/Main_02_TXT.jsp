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
		font-family: aŸ��Ʋ���2;
	}
	.feedType{
		width: 1000px;
		height: 300px;
	}
	 .feedType > div {
	    position: relative; 
	    display: inline-block; 
	    border: 1px solid tomato;
	    padding: 32px;
	    margin: 10px; 
	    vertical-align: top; 
	    box-sizing: border-box; 
	    width: calc(33.33% - 20px);
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
        <ul class="feedType" v-if="item.gArtist == 'Y' && index <= 3" v-for="(item, index) in list">
            <div>
                <li>{{item.artist}}</li>
                <li>{{item.uName2}}</li>
                <li>{{item.gDate}}</li>
                <li>{{item.gContent}}</li>
                <li>{{item.gLike}}</li>
                <li><button>�Ű�</button></li>
            </div>
        </ul>
    </div>
    
    <div class="write">
        <textarea rows="5" cols="3" v-model="content"></textarea>
        <button @click="fnAdd">�Խñ� ���</button>
    </div>
    
    <div class="container">
        <ul v-for="item in list">
            <li>{{item.artist}}</li>
            <li>{{item.uName2}}</li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li>{{item.gLike}}</li>
            <li><button @click="fnLike(item.gNo)">���ƿ�</button></li>
            <li><button>���</button></li>
            <li><button>�Ű�</button></li>
            <li> 
                <!-- v-if="cUser == item.cUser && item.delYn == 'N' || status == 'A'" v-model="item.gNo" -->
                <a href="javascript:;">
                    <div><i class="fa-regular fa-circle-xmark fa-xs" @click="fnRemove"></i></div>
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
        no: "",
        keyword: "",
        uId: "${sessionId}",
        selectItem: [],
        content: "",
        artist: "TXT",
        info: {}
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
                    console.log(self.list);
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
                    } else {
                        self.list = data.info; // Ű���尡 ������ �˻� ����� ������
                    }
                    console.log(self.list);
                }
            });
        },
        fnAdd: function () {
            var self = this;

            if (!confirm("����ұ��?")) {
                return;
            }
            var nparmap = { content: self.content, artist: self.artist, uId : self.uId };

            $.ajax({
                url: "add.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("��ϵǾ����.");
                    self.content = "";
                    self.fnGetList();
                }
            });
        },
        fnRemove: function () {
            var self = this;
            if (!confirm("�����Ͻðھ��?")) {
                return;
            }
            var nparmap = { gNo: self.gNo };
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
        },
        fnMove: function () {
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
        }
    }, // methods
    created: function () {
        var self = this;
        self.fnGetList();
    }// created
});
</script>