<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
 <link href="../css/join.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

</style>
</head>
<body id="Jbody">
<div id="app">
<div id="wc">
	<h2>Welcome</h2>
		<h3>회원가입이 완료되었습니다!</h3>
			<div>
				<div>아이디 : <span>{{user.uId}}</span></div>
				<hr>
				<div>이름 : <span>{{user.uName}}</span></div>
				<hr>
				<div>이메일 : <span>{{user.uEmail}}</span></div>
				<hr>
			</div>
		<div><button @click="goToMain" >GO TO MAIN</button></div>
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		user : {
			uId : "",
			uName : "",
			uEmail : ""
		},
		uId : "${map.uId}",
		list : []
	},// data
	methods : {
		fnGetList : function(){
	   		var self = this;
			var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
               		self.user = data.findPw;
                }
            });
	   	},
	   	goToMain : function(){
	   		var self = this;
			var nparmap = {uId : self.user.uId};
            $.ajax({
                url : "/user2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
               		self.user = data.findPw;
               		$.pageChange("login.do", {uId : ""});
               		console.log(self.user);
                }
            });
	   	}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		
	}// created
});
</script>