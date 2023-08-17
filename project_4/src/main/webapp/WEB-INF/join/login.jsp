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
</style>
</head>
<body>
<div id="app">
	<div id="wc">
	<h2>�α���</h2>
	<div><label>���̵� : <input v-model="uId" @keyup.enter="fnLogin"></label></div>
	<div><label>�н����� : <input type="password" v-model="uPw" @keyup.enter="fnLogin"></label></div>
	<div>
		<button @click="fnLogin">�α���</button>
		<button @click="fnJoin">ȸ������</button>
	</div>
	<div><a href="findId.do">���̵� ã��</a></div>
	<div><a href="nonOrder.do">��ȸ�� �ֹ���ȸ</a></div>
	<div><a href="findPw.do">��й�ȣ ã��</a></div>
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		uId : "",
		uPw : ""
	},// data
	methods : {
		fnLogin : function(){
			var self = this;
			var param = {uId : self.uId, uPw : self.uPw};
			$.ajax({
                url : "/login.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	if(data.success){
                		alert(data.message);
                		$.pageChange("../home.do", {uId : self.uId});
                		
                	} else {
                		alert(data.message);
                	}
                	
                }
            }); 
		},
		fnJoin : function(){
			location.href='join.do';
		}
	}, // methods
	created : function() {
		var self = this;
	//	self.fnGetList();
	}// created
});
</script>