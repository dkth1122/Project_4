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
	*{
		font-family: a타이틀고딕2;
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
            width: calc(30% - 2%); /* 너비 계산 (각각의 요소는 1%의 margin을 갖기 때문에 2%를 빼줌) */
            height: 200px; /* 원하는 높이 값 설정 */
        	margin: 0 1%; /* 1%의 margin을 좌우로 추가 */
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
		    width: 50px; /* 원하는 이미지 크기 조절 */
		    height: 50px;
		    border : 1px solid #BB91E7;
		    border-radius: 50%; /* 50%로 설정하여 동그라미 모양으로 자름 */
		    object-fit: cover; /* 이미지를 화면에 맞게 조절하여 잘린 부분이 잘 보이도록 함 */
		}
		
		hr{
			border: none; /* 기본 테두리 제거 */
	        height: 2px; /* 높이 설정 */
	        background: linear-gradient(to right, #BB91E7, #F2DAED); /* 그라디언트 배경 설정 */
	        margin: 20px 0; /* 위아래 마진 설정 */
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
    <button @click="fnMove">뒤로가기</button>
    <button @click="fnMove('my')">마이페이지</button>
        <button>알림</button>
        <hr>
    <div class="header">
        <label>제목, 작성자 :  
            <input type="text" v-model="keyword">
            <button @click="fnSearch">검색</button>
        </label>
        
    </div>
    
    <div class="artistNewFeed">
        <!-- 날짜 빠른 순으로 정렬 후 출력 -->
        	<ul class="feedType" v-if="index  < 3 && item.gDelYN != 'Y'" v-for="(item, index) in list2"  @click = "fnComment(item.gNo)" >
		        <a href="javascript:;">
	            <div>
	            	<li><span>댓글수 : </span>{{item.gcCnt}}</li>
	                <li>{{item.artist}}</li>
	            	<li>{{item.nickName}}</li>
	            	<li><img :src = "item.gpPath" class="profile-image"></li>
	                <li>{{item.gDate}}</li>
	                <li>{{item.gContent}}</li>
	                <li><span>좋아요 : </span>{{item.gLike}}</li>
	            </div>
		       </a>
       	 	</ul>
    </div>
    
    <hr>
    <div class="write">
        <textarea rows="10" cols="100" v-model="content"></textarea>
			<span>파일</span>
			<span><input type="file" id="file1" name="file1" accept=".gif, .jpg, .png" @change="handleFileChange"></span>
        <button @click="fnAdd">게시글 등록</button>
    </div>
    <hr>
    <div class="container">
        <ul v-for="item in list" v-if="item.gBanYN < 5 && item.gDelYN != 'Y'">
        	<li><span>댓글수 : </span>{{item.gcCnt}}</li>
            <li>{{item.artist}}</li>
	        <li>{{item.nickName}}<img :src = "item.gpPath" class="profile-image"></li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li><span>좋아요 : </span>{{item.gLike}}</li>
            <img v-if="item.path" :src="item.path" class="image" />
			<img v-else class="imageX" />
            <li><button @click="fnLike(item.gNo)">좋아요</button></li>
            <li><button @click="fnComment(item.gNo)">댓글</button></li>
            <li><button @click="reportPost(item.gNo)">신고</button></li>
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
                        self.fnGetList(); // 키워드가 비어있으면 전체 목록을 보여줌
                        self.search = "";
                    } else {
                        self.list = data.info; // 키워드가 있으면 검색 결과를 보여줌
                        self.search = "검색";
                    }
                }
            });
        },
        fnAdd: function () {
            var self = this;

            if (!confirm("등록할까요?")) {
                return;
            }
            
            if(self.content == null || self.content == ""){
            	alert("내용을 입력해주세요");
                return;
            }
            var nparmap = {content: self.content, artist: self.artist, uId : self.uId };

            $.ajax({
                url: "add.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("등록되었어요.");
                    self.comment = "";
                    self.fnGetList();
 	           		var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "gNo",  data.gNo); // pk
	           		self.upload(form); 
                }
            });
        },
     // 파일 업로드
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
            if (!confirm("삭제하시겠어요?")) {
                return;
            }
            var nparmap = item;
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
            self.selectedReason = ""; // 초기화
            self.otherReason = ""; // 초기화
            self.reportDescription = ""; // 초기화
            self.showReportModal = true;
            
            var option = "width=700,height=500,top=100,right";
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
            
          }, handleFileChange: function(event) {
              var self = this;
              var file = event.target.files[0];
              
              if (file) {
                  var ext = file.name.split('.').pop().toLowerCase(); // 파일 확장자 추출

                  if (['gif', 'jpg', 'jpeg', 'png'].indexOf(ext) === -1) {
                      alert('이미지 파일은 gif, jpg, png 확장자만 허용됩니다.');
                      // 파일 선택을 취소하도록 처리 (선택한 파일을 초기화)
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