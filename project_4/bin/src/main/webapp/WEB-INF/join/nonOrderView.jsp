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
	<div>쇼핑백 이미지 공간</div>
	<h2>{{list.nmName}}고객님의 \n주문 내역입니다.</h2>
		<div>
		상품번호 : {{list.nmNo}}
		</div>
		<div>대충 내용추가</div>
		
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
		nmName : "",
		nmNo : "${map.nmNo}"
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {nmNo : self.nmNo};
			$.ajax({
                url : "user3.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	console.log(self.list);
                	console.log(self.nmNo);
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