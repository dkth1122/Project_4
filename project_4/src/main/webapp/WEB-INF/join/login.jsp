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
	<h2>로그인</h2>
	<div><label>아이디 : <input v-model="uId" @keyup.enter="fnLogin"></label></div>
	<div><label>패스워드 : <input type="password" v-model="uPw" @keyup.enter="fnLogin"></label></div>
	<div>
		<button @click="fnLogin">로그인</button>
		<button @click="fnJoin">회원가입</button>
	</div>
	<div><a href="findId.do">아이디 찾기</a></div>
	<div><a href="nonOrder.do">비회원 주문조회</a></div>
	<div><a href="findPw.do">비밀번호 찾기</a></div>
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
                		$.pageChange("main.do", {uId : self.uId});
                		
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