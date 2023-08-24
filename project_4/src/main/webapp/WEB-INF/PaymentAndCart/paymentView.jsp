<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link href="../css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login-box{
	height : 600px;
}
.login button{
	font-weight:500;
	font-size:15px;
}
h3{
	text-align : center;
}
.idpw{
	width : 300px;
	margin : 0px auto;
	padding-left : 100px;	
	padding-bottom : 50px;
}
.idpw div{
	border-bottom : 1px solid #d8d9df;
}
.idpw label{
	margin : 5px;
}
.idpw span{
	color : #3d435f; 
}
#smile{
	font-size: 70px;
	margin-left : 220px;
}
.login{
	margin-top : 60px;
}
</style>
</head>
<body>
<div id="app">
	<div class="container">		
		<h2 class="h2">Order Success</h2>
		<div class="login-box">
			<div class="login-box2">
			<i class="fa-regular fa-face-smile" id="smile"></i>
			<h3>주문이 완료되었습니다!</h3>
				<div class="idpw">	
					<div><label>주문자명 <span>{{user.uId}}</span></label></div>
					<div><label>주문번호   <span>{{user.uName}}</span></label></div>
					<div><label>상품명   <span>{{user.uEmail}} {{user.oCount}}</span></label></div>
					<div><label>결제금액   <span>{{user.uEmail}}</span></label></div>
					<div><label>주문일자   <span>{{user.uEmail}}</span></label></div>
				</div>
				<div class="login">
					<div><button @click="goToMain">GO TO MAIN</button></div>
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
            /* $.ajax({
                url : "/user2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
               		self.user = data.findPw;
                }
            }); */
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
               		$.pageChange("/home.do", {uId : self.uId});
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