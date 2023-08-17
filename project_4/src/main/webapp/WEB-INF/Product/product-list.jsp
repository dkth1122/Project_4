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

<div>
<input type="text"> <button>�˻�</button>
</div>

	<div>
		<select v-model="artist" @change="fnArtistSearch">
		  <option value="All">��ü</option>
		  <option value="BTS">��ź�ҳ��</option>
		  <option value="TXT">����ο�������Դ�</option>
		  <option value="EHP">��������</option>
		  <option value="SVT">����ƾ</option>
		  <option value="FMN">���ι̽�����</option>
		  <option value="LSF">��������</option>
		  <option value="NJS">������</option>
		  <option value="BND">���̳ؽ�Ʈ����</option>
		  <option value="ZIC">����</option>
		</select>
	</div>

<table>
		<tr>
			<th></th>
			<th>��Ƽ��Ʈ</th>
			<th>��ǰ�ڵ�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>���</th>
			<th>�������</th>
			<th>�����</th>
			<th>�Ǹ���</th>
			<th>����</th>
		</tr>
		
		<tr v-for="(item, index) in list">
			<td><input type="radio" name="product" :value="item.pNo" v-model="pNo"></td>
			<td>{{item.artist}}</td>
			<td>{{item.pNo}}</td>
			<td>{{item.pName}}</td>
			<td>{{Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'})}}</td>
			<td>{{item.stock}}</td>
			<td><button @click="fnStockPopup(item)">���</button></td>
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
	
	<div>
	<button @click="fnProductAdd">��ǰ �߰�</button>
	<button @click="fnProductDelete">��ǰ ����</button>
	</div>
	
	
	<div><button @click="fnBack">�ǵ��ư���</button></div>


	
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
		cnt : 0,
		artist: ""
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
        	var self = this;
      		window.open("../product/add.do", "addPopup", "width=700,height=500,left=500,top=100");
        },
        fnBack : function(){
        	location.href = '../staff/main.do';
        },
        fnStockPopup : function(item) {
        	  var self = this;
        	  window.open("../product/stockpopup.do?pNo=" + item.pNo, "stockPopup", "width=700,height=500,left=500,top=100");
        	},
        fnProductDelete : function() {
        	var self = this;
            var nparmap = {pNo : self.pNo};
            if (self.pNo == "") {
                alert("������ ��ǰ�� �������ּ���.");
                return;
            }
            if(!confirm("���� �����Ͻðڽ��ϱ�?")){
                return;
            }
            $.ajax({
                url : "/product/delete.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�����Ǿ����ϴ�.");
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
		},
		 fnArtistSearch : function() {
		    var self = this;
		    var startNum = 0;
		    var lastNum = 10;
		    var nparmap = {startNum: startNum, lastNum: lastNum, artist: self.artist};
		    $.ajax({
		      url: "/product/search.dox",
		      dataType: "json",   
		      type: "POST", 
		      data: nparmap,
		      success: function (data) {
		        self.list = data.list;
		        self.cnt = data.cnt;
		        self.pageCount = Math.ceil(self.cnt / 10);
		      },
		    });
		  }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>