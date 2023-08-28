<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>멤버십 댓글</title>
<style>
	@font-face {
    	font-family: "a타이틀고딕2";
        src: url("../../../font/A타이틀고딕2.TTF") format("truetype");
    }
    
    *{
    	font-family: a타이틀고딕2;
    }
   body{
   	background-color:  rgb(230, 230, 255);
   	overflow: auto;
   	max-height: 300px;
   }
	
	ul{	
		width:300px;
		margin:5px auto;
		list-style:none;
		border: 1px solid black;
		background-color: white;
		padding: 10px;
	}
	.aa{
		float: right;
	}
</style>
</head>
<body>
<div id="app">
    
    <div class="container">
        <ul v-for="item in list" v-if="item.noRead != 'Y'">
            <li>{{item.noMessage}}  <a href="#" class="aa"><i class="fa-solid fa-xmark" style="color: #f20707;" @click="fnAlarmRemove"></i></a></li>
        </ul>
        
        <ul v-for="item in list2" v-if="item.cNoRead != 'Y'">
            <li>{{item.cNoMessage}}  <a href="#" class="aa"><i class="fa-solid fa-xmark" style="color: #f20707;" @click="fnAlarmRemove"></i></a></li>
        </ul>
      
      	<ul v-for="item in list3" v-if="item.noRead != 'Y'">
            <li>{{item.noMessage}}  <a href="#" class="aa"><i class="fa-solid fa-xmark" style="color: #f20707;" @click="fnAlarmRemove"></i></a></li>
        </ul>
        
        <ul v-for="item in list4" v-if="item.cNoRead != 'Y'">
            <li>{{item.cNoMessage}}  <a href="#" class="aa"><i class="fa-solid fa-xmark" style="color: #f20707;" @click="fnAlarmRemove"></i></a></li>
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
        list3 : [],
        list4 : [],
        uId: "${sessionId}",
        artist: "${map.artist}",
    },// data
    methods: {
        fnGetList: function () {
             var self = this;
             var nparmap = {artist: self.artist, uId : self.uId };
             $.ajax({
                 url: "alramList.dox",
                 dataType: "json",
                 type: "POST",
                 data: nparmap,
                 success: function (data) {
                     self.list = data.list;
                     self.list2 = data.list2;
                     self.list3 = data.list3;
                     self.list4 = data.list4;
                     console.log("여기 게시글 리스트===>",self.list);
                     console.log("여기 댓글 리스트===>",self.list2);
                 }
             });
         },fnAlarmRemove : function(){
        	 
        	 
         },fnMove : function(num){

			if(1){
				
			}
        	 param = {}
     		$.pageChange("/payment/nonmemberpayment.do", param);
        	 
         }
        
    }, // methods
    created: function () {
        var self = this;
        self.fnGetList();
    }// created
});
</script>