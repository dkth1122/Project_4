<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>멤버십 게시판</title>
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
		font-family: a타이틀고딕2;
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
    <button @click="fnMove">뒤로가기</button>
    <div class="header">
        <label>제목, 작성자 :  
            <input type="text" v-model="keyword">
            <button @click="fnSearch">검색</button>
        </label>
        
        <button>알림</button>
        <button>마이페이지</button>
    </div>
    
    <div class="artistNewFeed">
        <!-- 날짜 빠른 순으로 정렬 후 출력 -->
        <ul class="feedType" v-if="item.gArtist == 'Y' && index <= 3" v-for="(item, index) in list">
            <div>
                <li>{{item.artist}}</li>
                <li>{{item.uName2}}</li>
                <li>{{item.gDate}}</li>
                <li>{{item.gContent}}</li>
                <li>{{item.gLike}}</li>
                <li><button>신고</button></li>
            </div>
        </ul>
    </div>
    
    <div class="write">
        <textarea rows="5" cols="3" v-model="content"></textarea>
        <button @click="fnAdd">게시글 등록</button>
    </div>
    
    <div class="container">
        <ul v-for="item in list">
            <li>{{item.artist}}</li>
            <li>{{item.uName2}}</li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li>{{item.gLike}}</li>
            <li><button @click="fnLike(item.gNo)">좋아요</button></li>
            <li><button>댓글</button></li>
            <li><button>신고</button></li>
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
        artist: "BTS",
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
                        self.fnGetList(); // 키워드가 비어있으면 전체 목록을 보여줌
                    } else {
                        self.list = data.info; // 키워드가 있으면 검색 결과를 보여줌
                    }
                    console.log(self.list);
                }
            });
        },
        fnAdd: function () {
            var self = this;

            if (!confirm("등록할까요?")) {
                return;
            }
            var nparmap = { content: self.content, artist: self.artist, uId : self.uId };

            $.ajax({
                url: "add.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("등록되었어요.");
                    self.content = "";
                    self.fnGetList();
                }
            });
        },
        fnRemove: function () {
            var self = this;
            if (!confirm("삭제하시겠어요?")) {
                return;
            }
            var nparmap = { gNo: self.gNo };
            $.ajax({
                url: "remove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제되었습니다.");
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