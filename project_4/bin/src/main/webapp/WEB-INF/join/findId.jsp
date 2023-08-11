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
		<input type="text" name="uName" placeholder="사용자이름">
		</div>
		<div>
		<input type="text" name="uPhone" placeholder="핸드폰번호">
		</div>
		<div><button @click="fnSearch">검색</button></div>
		<div><button @click="fnBack">취소</button></div>
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
                url : "list.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
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
                	if(data.success){
                		alert("아이디 찾기 성공 \n아이디 알려주는 페이지 만들어야함~")
                		location.href='main.do';
                	} else {
                		alert("존재하는 정보가 없습니다.");
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