<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>占쏙옙占쏙옙占� 占쌉쏙옙占쏙옙</title>
<style>
	*{
		font-family: a타占쏙옙틀占쏙옙占�2;
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
            border:none;
            cursor:pointer;
        }
        button:hover{
         background-color: #FFDADA;
        }
        
        #buttons {
        	height: 50px;
         	background-color: white;
         	padding : 30px;
         	margin-bottom:50px;
        
        }
        .btn {
        float:left;
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
        
        input {
        border: 2px solid rgb(215, 215, 215); }
        
        input:focus {outline:none;
 		border: 2px solid rgb(255, 128, 128);}
 
        
        .feedType {
            display: inline-block;
            width: calc(30% - 2%); /* 占십븝옙 占쏙옙占� (占쏙옙占쏙옙占쏙옙 占쏙옙年占� 1%占쏙옙 margin占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 2%占쏙옙 占쏙옙占쏙옙) */
            height: 200px; /* 占쏙옙占싹댐옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙 */
        	margin: 0 1%; /* 1%占쏙옙 margin占쏙옙 占승울옙占� 占쌩곤옙 */
        	margin-bottom: 30px;
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
        
        #writearea{
        background-color: white;
        padding:30px;
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
		    width: 50px; /* 占쏙옙占싹댐옙 占싱뱄옙占쏙옙 크占쏙옙 占쏙옙占쏙옙 */
		    height: 50px;
		    border : 1px solid #BB91E7;
		    border-radius: 50%; /* 50%占쏙옙 占쏙옙占쏙옙占싹울옙 占쏙옙占쌓띰옙占� 占쏙옙占쏙옙占쏙옙占� 占쌘몌옙 */
		    object-fit: cover; /* 占싱뱄옙占쏙옙占쏙옙 화占썽에 占승곤옙 占쏙옙占쏙옙占싹울옙 占쌩몌옙 占싸븝옙占쏙옙 占쏙옙 占쏙옙占싱듸옙占쏙옙 占쏙옙 */
		}
		
		hr{
			border: none; /* 占썩본 占쌓두몌옙 占쏙옙占쏙옙 */
	        height: 2px; /* 占쏙옙占쏙옙 占쏙옙占쏙옙 */
	        background: linear-gradient(to right, #BB91E7, #F2DAED); /* 占쌓띰옙占쏙옙트 占쏙옙占� 占쏙옙占쏙옙 */
	        margin: 20px 0; /* 占쏙옙占싣뤄옙 占쏙옙占쏙옙 占쏙옙占쏙옙 */
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
 <nav id="app">

	<nav id="buttons">
	<div class="header">
	<div class="btn">
    <button @click="fnMove">back</button>
    <button @click="fnMove('my')">menu</button>
        <button>占싯몌옙</button>
      </div> 
        
    
        <label>  
            <input type="text" v-model="keyword">
            <button @click="fnSearch">search</button>
        </label>
        </div>
        <hr>
    </nav>
    
    <div class="artistNewFeed">
        <!-- 占쏙옙짜 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占� -->
        	<ul class="feedType" v-if="index  < 3 && item.gDelYN != 'Y'" v-for="(item, index) in list2"  @click = "fnComment(item.gNo)" >
		        <a href="javascript:;">
	            <div>
	            	<li><span>占쏙옙蒡占� : </span>{{item.gcCnt}}</li>
	                <li>{{item.artist}}</li>
	            	<li>{{item.nickName}}</li>
	            	<li><img :src = "item.gpPath" class="profile-image"></li>
	                <li>{{item.gDate}}</li>
	                <li>{{item.gContent}}</li>
	                <li><span>占쏙옙占싣울옙 : </span>{{item.gLike}}</li>
	            </div>
		       </a>
       	 	</ul>
    </div>
    
    <hr>
    <nav id= "writearea">
    <div class="write">
        <textarea rows="10" cols="100" v-model="content"></textarea>
			<span>占쏙옙占쏙옙</span>
			<span><input type="file" id="file1" name="file1" accept=".gif, .jpg, .png" @change="handleFileChange"></span>
        <button @click="fnAdd">占쌉시깍옙 占쏙옙占�</button>
    </div>
    </nav>
    <hr>
    <div class="container">
        <ul v-for="item in list" v-if="item.gBanYN < 5 && item.gDelYN != 'Y'">
        	<li><span>占쏙옙蒡占� : </span>{{item.gcCnt}}</li>
            <li>{{item.artist}}</li>
	        <li>{{item.nickName}}<img :src = "item.gpPath" class="profile-image"></li>
            <li>{{item.gDate}}</li>
            <li>{{item.gContent}}</li>
            <li><span>占쏙옙占싣울옙 : </span>{{item.gLike}}</li>
            <img v-if="item.path" :src="item.path" class="image" />
			<img v-else class="imageX" />
            <li><button @click="fnLike(item.gNo)">占쏙옙占싣울옙</button></li>
            <li><button @click="fnComment(item.gNo)">占쏙옙占�</button></li>
            <li><button @click="reportPost(item.gNo)">占신곤옙</button></li>
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
                        self.fnGetList(); // 키占쏙옙占썲가 占쏙옙占쏙옙占쏙옙占쏙옙占� 占쏙옙체 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙
                        self.search = "";
                    } else {
                        self.list = data.info; // 키占쏙옙占썲가 占쏙옙占쏙옙占쏙옙 占싯삼옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙
                        self.search = "占싯삼옙";
                    }
                }
            });
        },
        fnAdd: function () {
            var self = this;

            if (!confirm("占쏙옙占쏙옙耐占쏙옙?")) {
                return;
            }
            
            if(self.content == null || self.content == ""){
            	alert("占쏙옙占쏙옙占쏙옙 占쌉뤄옙占쏙옙占쌍쇽옙占쏙옙");
                return;
            }
            var nparmap = {content: self.content, artist: self.artist, uId : self.uId };

            $.ajax({
                url: "add.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("占쏙옙溝퓸占쏙옙占쏙옙.");
                    self.comment = "";
                    self.fnGetList();
 	           		var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "gNo",  data.gNo); // pk
	           		self.upload(form); 
                }
            });
        },
     // 占쏙옙占쏙옙 占쏙옙占싸듸옙
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
            if (!confirm("占쏙옙占쏙옙占싹시겠억옙占�?")) {
                return;
            }
            var nparmap = item;
            $.ajax({
                url: "remove.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("占쏙옙占쏙옙占실억옙占쏙옙占싹댐옙.");
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
            self.selectedReason = ""; // 占십깍옙화
            self.otherReason = ""; // 占십깍옙화
            self.reportDescription = ""; // 占십깍옙화
            self.showReportModal = true;
            
            var option = "width=700,height=500,top=100,right";
            var url = "report.do?gNo=" + gNo + "&uId=" + self.uId;
            window.open(url, "gNo", option);
            
          }, handleFileChange: function(event) {
              var self = this;
              var file = event.target.files[0];
              
              if (file) {
                  var ext = file.name.split('.').pop().toLowerCase(); // 占쏙옙占쏙옙 확占쏙옙占쏙옙 占쏙옙占쏙옙

                  if (['gif', 'jpg', 'jpeg', 'png'].indexOf(ext) === -1) {
                      alert('占싱뱄옙占쏙옙 占쏙옙占쏙옙占쏙옙 gif, jpg, png 확占쏙옙占쌘몌옙 占쏙옙占싯니댐옙.');
                      // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙溝占쏙옙占� 처占쏙옙 (占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占십깍옙화)
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