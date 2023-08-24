<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/login.css" rel="stylesheet" type="text/css">
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
	.login-box{
		height : 460px;
	}
</style>
</style>
</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2">Find ID</h2>
		<div class="login-box">
			<div class="login-box2">
			<h3 class="stadyInfo">���̵�ã��</h3>
				<div class="idpw">						
				    <div><label>�̸�  <span><input type="text" name="uName" v-model = "uName" placeholder="������̸�">
					    </span></label>
				    </div>
				    <div><label>�ڵ�����ȣ  <span><input type="text" name="uPhone"  v-model = "uPhone" placeholder="�ڵ�����ȣ">
					    </span></label>
				    </div>	
				</div>
				
				
				<div class="login"><button @click="fnSearch" >Ȯ��</button></div>
				<div class="join">
					<button @click="fnBack">���</button>
				</div>
			</div>
		</div>
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
                url : "/findId.dox",
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