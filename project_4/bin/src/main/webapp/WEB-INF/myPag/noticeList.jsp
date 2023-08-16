<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <!-- 페이징 추가 1 -->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
 <meta charset="UTF-8">
  <title>마이페이지</title>
  <style type="text/css">
  	#notice{
  		margin-top : 150px;
		width: 1200px;
		text-align: center;  		
  	}
  <!-- 페이징 추가 2-->
	.pagination {
        margin:24px;
        display: inline-flex;
        
    }
    ul {
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	}
  </style>
</head>
<body>
<div id="app">
    <div id="wc">
    	<h1 id="notice">Notice</h1>
    	
    	<div v-for="item in list">
    		<div>{{item.aNo}}
    			<span @click="noticeView(item)">{{item.aTitle}}</span>
    			<span>{{formatWithoutTime(item.aDate)}}</span>
    			<span>{{item.hits}}</span>
    		</div>
    	</div>    	
    	<template>
	  		<paginate
			    :page-count="pageCount"
			    :page-range="3"
			    :margin-pages="2"
			    :click-handler="fnSearch"
			    :prev-text="'<'"
			    :next-text="'>'"
			    :container-class="'pagination'"
			    :page-class="'page-item'">
		  </paginate>
		</template>
	</div>
</div>
</body>
</html>
<script type="text/javascript">
<!-- 페이징 추가 4 -->
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
    el: '#app',
    data: {
       list : [],
       uId : "${sessionId}",
       <!-- 페이징 추가 5 -->
		selectPage: 1,
		pageCount: 1,
		cnt : 0
    },
    methods: {
    	formatWithoutTime(dateString) {
    	      const date = new Date(dateString);
    	      const formattedDate = new Date(
    	        date.getFullYear(),
    	        date.getMonth(),
    	        date.getDate()
    	      );
    	      return formattedDate.toISOString().split('T')[0];
    	},
       fnGetList : function(){
            var self = this;<!-- 페이징 추가 6 -->
			var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
			var param = {startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "/aboard/list.dox",
                dataType:"json",   
                type : "POST", 
                data : param,
                success : function(data) { 
                   self.list = data.list; //사용자      
                   self.cnt = data.cnt;
	               self.pageCount = Math.ceil(self.cnt / 10);
                
                 
                }
            }); 
        },
        <!-- 페이징 추가 7-->
		fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "list.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 10);
				}
			});
		},
        noticeView : function(item){
        	 var self = this;
             $.pageChange("noticeView.do", {aNo : item.aNo});
         }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      // Vue.js ì½ë ìì± ê°ë¥
    }
});
</script>