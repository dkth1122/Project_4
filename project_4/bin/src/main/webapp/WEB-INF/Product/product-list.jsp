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
			<th></th>
			<th>��Ƽ��Ʈ</th>
			<th>��ǰ�ڵ�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>���</th>
			<th>�����</th>
			<th>�Ǹ���</th>
			<th>ǰ������</th>
			<th>����</th>
		</tr>
		
		<tr v-for="(item, index) in list">
			<td><input type="radio" value="item.pNo"></td>
			<td>{{item.artist}}</td>
			<td>{{item.pNo}}</td>
			<td>{{item.pName}}</td>
			<td>{{item.price}}</td>
			<td>{{item.stock}}</td>
			<td>{{item.membership}}</td>
			<td>{{item.pDate}}</td>
			<td>{{item.soldout}}</td>
			<td>{{item.category}}</td>
		</tr>
	
	</table>
	<button @click="fnProductAdd">��ǰ �߰�</button>
	
	
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
                url : "/product/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnProductAdd : function(){
        	location.href="../product/add.do";
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