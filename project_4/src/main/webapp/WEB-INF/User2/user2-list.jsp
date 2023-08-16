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
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>연락처</th>
			<th>비밀번호오류횟수</th>

		</tr>
		<tr v-for="(item, index) in list">
			<td><a href="javascript:;" @click="fnuserInformation(item)">{{item.uId}}</a></td>
			<td>{{item.uName}}</td>
			<td>{{item.uName2}}</td>
			<td>{{item.uPhone}}</td>
			<td v-if="item.uCnt >= 5"><button @click="fnCntReset(item)">오류초기화</button></td>
			<td v-else></td>

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
		uId : "",
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
                url : "/user2/list.dox",
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
        fnuserInformation : function(item){
        	 var self = this;
             $.pageChange("../user2/view.do", {uId : item.uId});
        },
        fnCntReset : function(item){
            var self = this;
            var nparmap = {uId : item.uId};
            $.ajax({
                url : "/user2/cntReset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("초기화되었습니다.");
                	self.fnGetList();
                }
            }); 
        },
        fnBack : function(){
            location.href = '../staff/main.do';
         }, 
         fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/user2/list.dox",
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
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>