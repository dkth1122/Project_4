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
.login-box{
		height : 460px;
	}
	
</style>
</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2"> Order Check </h2>
		<div class="login-box">
			<div class="login-box2">
			<h3 class="stadyInfo">��ȸ�� �ֹ���ȸ</h3>
				<div class="idpw">						
				    <div><label>�ֹ���ȣ  <span><input type="text" name="nmNo" v-model = "nmNo" placeholder="�ֹ���ȣ">
					    </span></label>
				    </div>
				    <div><label>�����ڸ�  <span><input type="text" name="nmName"  v-model = "nmName" placeholder="�����ڸ�">
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
		nmNo : "",
		nmName : ""
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
			var param = {nmNo : self.nmNo, nmName : self.nmName};
			$.ajax({
                url : "nonOrder.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) {
                	console.log(data.list);
                	if(data.list != undefined){
                		alert("success Test")
                		$.pageChange("nonOrder.do", {nmNo : self.nmNo});
                  		
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