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
			<th></th>
			<th>아티스트</th>
			<th>상품코드</th>
			<th>이름</th>
			<th>가격</th>
			<th>재고</th>
			<th>재고조정</th>
			<th>멤버십</th>
			<th>판매일</th>
			<th>종류</th>
		</tr>
		
		<tr v-for="(item, index) in list">
			<td><input type="radio" name="뭐하지" :value="item.pNo" v-model="pNo"></td>
			<td>{{item.artist}}</td>
			<td>{{item.pNo}}</td>
			<td>{{item.pName}}</td>
			<td>{{item.price}}</td>
			<td>{{item.stock}}</td>
			<td><button @click="fnStockPopup(item)">재고</button></td>
			<td>{{item.membership}}</td>
			<td>{{item.pDate}}</td>
			<td>{{item.category}}</td>
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
	
	<button @click="fnProductAdd">상품 추가</button>
	<button @click="fnProductDelete">상품 삭제</button>
	
	
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
		selectItem : "",
		pNo : "",
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
                url : "/product/list.dox",
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
        fnProductAdd : function(){
        	location.href="../product/add.do";
        },
        fnBack : function(){
        	location.href = '../staff/main.do';
        },
        fnStockPopup : function(item) {
        	  var self = this;
        	  window.open("../product/stockpopup.do?pNo=" + item.pNo, "stockPopup", "width=700,height=500");
        	},
        fnProductDelete : function() {
        	var self = this;
            var nparmap = {pNo : self.pNo};
            if(!confirm("정말 삭제하시겠습니까?")){
                return;
            }
            $.ajax({
                url : "/product/delete.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("삭제되었습니다.");
                	self.fnGetList();
                }
            }); 
        }, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/product/list.dox",
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