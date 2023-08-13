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
	<h2>회원가입</h2>
	<div>
		<input type="text" v-model="user.uId" placeholder="아이디" @keyup="fnIdCheck">
		<div v-if="user.uId != ''">{{message}}</div>
	</div>
	<div><input type="password" v-model="user.uPw" placeholder="비밀번호"></div>
	<div><input type="password" v-model="user.uPw2" placeholder="확인 비밀번호"></div>
	<div><input type="text" v-model="user.uName" placeholder="이름"></div>
	<div><input type="text" v-model="user.uName2" placeholder="닉네임"></div>
	<div><input type="text" v-model="user.uPhone" placeholder="연락처"></div>
	<div><input type="text" v-model="user.uEmail" placeholder="이메일주소"></div>
	
	<div id="evtyn">
		<div><label><input type="checkbox" v-model="check" @click="fnCheck">전체 동의</label></div>
		<div><label><input type="checkbox" v-model="check1"><strong><a href="javascript:;">(필수)개인회원 약관에 동의</a></strong></label></div>
		<div><label><input type="checkbox" v-model="check2"><strong><a href="javascript:;">(필수)개인회원 수집 및 이용에 동의</a></strong></label></div>
		<div><label><input type="checkbox" v-model="check3">(선택)마케팅 정보 수신 동의-SMS/MMS</label></div>
	</div>

	<div><button @click="fnJoin" >가입하기</button></div>
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
			uPw : "",
			uName : "",
			uName2 : "",
			uPhone : "",
			uEmail : "",
			uEventyn : ""
		},
		message : "",
		check : "",
		check1 : "",
		check2 : "",
		check3 : "",
		list : []
	},// data
	methods : {
		fnJoin : function(){
			var self = this;
			if(self.user.uId == ""){
				alert("아이디 입력해라");
				return;
			}
			if(self.user.uPw == ""){
				alert("패스워드 입력해라");
				return;
			}
			if(self.user.uPw != self.user.uPw2){
				alert("패스워드 확인해라");
				return;
			}
			if(self.user.uName == ""){
				alert("이름 입력해라");
				return;
			}
			if(self.check1 == true && self.check2 == true){
				self.user.uEventyn = "Y";
			}else{
				alert("필수약관동의해라");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "/userJoin/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
                	alert("가입 완ㄹ");
                	location.href='login.do';
                }
            });
		},
	   	fnCheck : function(){ 
	   		var self = this; 
	   		if(self.check != true){
	   			self.check1 = true;
		   		self.check2 = true;
		   		self.check3 = true;	
	   		}else{
	   			self.check1 = false;
		   		self.check2 = false;
		   		self.check3 = false;
	   		}
	   	},
	   	fnIdCheck : function(){
	   		var self = this;
			var nparmap = {uId : self.user.uId};
            $.ajax({
                url : "/userJoin/check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		self.message = "중복된 아이디가 존재합니다.";
                	} else {
                		self.message = "사용 가능한 아이디입니다.";
                		self.joinFlg = true;
                	}
                }
            });
	   	}
	}, // methods
	created : function() {
		var self = this;
		
	}// created
});
</script>