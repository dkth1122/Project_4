<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/join.css" rel="stylesheet" type="text/css">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>
<div id="app">
	<div id="wc">
	<h2>���̵� ã��</h2>
		<div>
		<input type="text" name="uName" v-model = "uName" placeholder="������̸�">
		</div>
		<div>
		<input type="text" name="uPhone"  v-model = "uPhone" placeholder="�ڵ�����ȣ">
		</div>
		<div><button @click="fnSearch">�˻�</button></div>
		<div><button @click="fnBack">���</button></div>
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		uName : "",
		uPhone : ""
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
                url : "/findId.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.user;
                	console.log(self.list);
                }
            }); 
		},
		fnSearch : function(){
			var self = this;
			var param = {uName : self.uName, uPhone : self.uPhone};
			$.ajax({
                url : "findId.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) {
                	console.log(data.user);
                	if(data.user != undefined){
                		alert("���̵� ã�� ����")
                		$.pageChange("findIdView.do", {uPhone : self.uPhone});
                  		
                	} else {
                		alert("�����ϴ� ������ �����ϴ�.");
                	}
                }
            }); 
		},
		fnBack : function(){
			location.href = 'login.do';
		}
		
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>