<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
		border : 1px solid black;
		border-collapse: collapse;
		text-align : center;
	}
	th, td {
		border : 1px solid black;
		padding : 5px 10px;
	}
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
	<table>
		<tr>
			<th>이벤트코드</th>
			<th>이벤트명</th>
			<th>아티스트</th>
			<th>활성상태</th>
		</tr>
		
		<tr v-for="(item, index) in list">
			<td>{{item.evtName}}</td>
			<td>{{item.evtNo}}</td>
			<td>{{item.artist}}</td>
			<td>
		<select v-model="item.evtYn" @change="fnUpdateEvent(item, index)">
            <option value="Y">Y</option>
            <option value="N">N</option>
        </select>
			</td>
		</tr>
	
	</table>
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
	
	<button @click="fnEventAdd">이벤트 등록</button>
	<div><button @click="fnBack">되돌아가기</button></div>
	
</div>
</body>
</html>
<script>
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		selectPage: 1,
		pageCount: 1,
		cnt : 0
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
            var nparmap = {startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "/event/list.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
                }
            }); 
        },
       fnEventAdd : function(){
    	   location.href="add.do";
       },
       fnUpdateEvent: function(item, index) {
    	    var self = this;
    	    $.ajax({
    	      url: "/event/update.do",
    	      dataType: "json",
    	      type: "POST",
    	      data: {
    	        evtNo: item.evtNo,
    	        evtYn: item.evtYn
    	      },
    	      success: function(data) {
    	        // 업데이트 성공 시 alert 창을 보여줍니다.
    	        alert("이벤트가 업데이트 되었습니다.");
    	      }
    	    }); 
    	  },
<<<<<<< HEAD
    	  fnSearch : function(pageNum){
  			var self = this;
  			self.selectPage = pageNum;
  			var startNum = ((pageNum-1) * 10);
  			var lastNum = 10;
  			var nparmap = {startNum : startNum, lastNum : lastNum};
  			$.ajax({
  				url : "/event/list.dox",
  				dataType : "json",
  				type : "POST",
  				data : nparmap,
  				success : function(data) {
  					self.list = data.list;
  					self.cnt = data.cnt;
  					self.pageCount = Math.ceil(self.cnt / 10);
  				}
  			});
  		}
=======
          fnBack : function(){
          	location.href = '../staff/main.do';
          }
>>>>>>> branch 'main' of https://github.com/dkth1122/Project_4.git
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>