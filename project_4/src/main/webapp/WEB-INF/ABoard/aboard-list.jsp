<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
</style>
</head>
<body>
<div id="app">

<table>
		<tr>
			<th>��Ƽ��Ʈ</th>
			<th>�Խù�ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
		</tr>
		
		<tr v-for="(item, index) in list">
			<td>{{item.artist}}</td>
			<td>{{item.aNo}}</td>
			<td><a href="javascript:;" @click="fnABoardView(item)">{{item.aTitle}}</a></td>
			<td>{{item.aDate}}</td>
		</tr>
	
	</table>
	<button @click="fnABoardAdd">�����߰�</button>
	<div><button @click="fnBack">�ǵ��ư���</button></div>

	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		selectItem : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/aboard/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnABoardAdd : function(){
        	location.href="../aboard/add.do";
        },
        fnABoardView : function(item){
            var self = this;
            $.pageChange("../aboard/view.do", {aNo : item.aNo});
          },
          fnBack : function(){
          	location.href = '../staff/main.do';
          }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>