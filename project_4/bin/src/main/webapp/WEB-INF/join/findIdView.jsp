<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
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
	<h2>아이디 찾기</h2>
		<div>
		[{{list.uName}}]회원님의 아이디는 [{{list.uId}}] 입니다.
		</div>
		
		<div><button @click="fnSearch">비밀번호 찾기</button></div>
		<div><button @click="fnBack">로그인하러가기</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		uName : "",
		uPhone : "${map.uPhone}"
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {uPhone : self.uPhone};
			$.ajax({
                url : "user.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.findId;
                	console.log(self.list);
                	console.log(self.uPhone);
                }
            }); 
		},
		fnBack : function(){
			location.href = 'login.do';
		},
		fnSearch : function(){
			location.href = 'findPw.do';
		}
		
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		console.log(self.uPhone);
	}// created
});
</script>