<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
 <link href="../css/join.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.input-container {
    position: relative;
    display: inline-block;
}

.input-container i {
    position: absolute;
    top: 40%;
    right: 20px;
    transform: translateY(-50%);
}
</style>
</head>
<body id="Jbody">
<div id="app">
<div id="wc">
	<h2>회원가입</h2>
	<div class="input-container">
    	<input type="text" v-model="user.uId" placeholder="아이디" @keyup="fnIdCheck" maxlength="16"
           :style="{ 'border-color': uIdBorderColor }">
             <i v-if="isAvailable && user.uId !== ''" class="fas fa-check true-sign" style="color: green;"></i>
        	 <i v-else-if="user.uId !== ''" class="fas fa-times red-sign" style="color: red;"></i>
    	 <div v-if="user.uId != ''" :style="{ color: messageColor }">{{message}}</div>
	</div>
	
	<div class="input-container">
	    <input type="password" v-model="user.uPw" placeholder="비밀번호" maxlength="16">
	    <div v-if="user.uPw !== ''">
        	<progress max="4" :value="passwordStrength()" id="meter"></progress>
    	</div>
	</div>
	<div class="password-strength" :style="{ color: strengthColor() }" v-if="user.uPw !== ''">
    {{ strengthLabel() }}
	</div>
	
	<div><input type="password" v-model="user.uPw2" placeholder="확인 비밀번호" maxlength="16"></div>
	<div><input type="text" v-model="user.uName" placeholder="이름" maxlength="8"></div>
	<div><input type="text" v-model="user.uName2" placeholder="닉네임" maxlength="8"></div>
	<div><input type="text" v-model="user.uPhone" placeholder="연락처" maxlength="16"></div>
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
		uIdBorderColor: '', // 아이디 중복 체크 결과에 따라 border 색상
        uIdTextColor: '',    // 아이디 중복 체크 결과에 따라 텍스트 색상
        isAvailable: false, //체크 아이콘
		check : "",
		check1 : "",
		check2 : "",
		check3 : "",
		list : []
	},// data
	methods : {
		fnJoin : function(){
			var self = this;
			var idCheck = /^[a-zA-Z0-9]*$/;
			if (!idCheck.test(self.user.uId))
			{
				alert("아이디는 영어 대소문자와 숫자로만 가능합니다.");
				return;
			}
			if(self.user.uId == ""){
				alert("아이디를 입력해주세요.");
				return;
			}
			var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{2,16}$/;
			if (!pwCheck.test(self.user.uPw))
			{
				alert("비밀번호는 영문+숫자+특수문자 조합하여 사용해야 합니다");
				return;
			}
			if(self.user.uPw == ""){
				alert("패스워드를 입력해주세요.");
				return;
			}
			if(self.user.uPw != self.user.uPw2){
				alert("확인패스워드가 일치하지 않습니다.");
				return;
			}
			if(self.user.uName == ""){
				alert("이름을 입력해주세요.");
				return;
			}
			var nameCheck = /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]*$/;
			if (!nameCheck.test(self.user.uName)) {
			    alert("이름에 공백 혹은 특수문자가 입력되었습니다.\n올바르게 입력해주세요.");
			    return;
			}
			if(self.user.uName2 == ""){
				alert("닉네임을 입력해주세요.");
				return;
			}
			var name2Check = /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]*$/;
			if (!name2Check.test(self.user.uName2)) {
			    alert("닉네임에 공백 혹은 특수문자가 입력되었습니다.\n올바르게 입력해주세요.");
			    return;
			}
			if(self.user.uEmail == ""){
				alert("이메일을 입력해주세요.");
				return;
			}
			if(self.user.uPhone == ""){
				alert("연락처를 입력해주세요.");
				return;
			}
			var phoneCheck = /^\d{3}-\d{3,4}-\d{4}$/;
			if (!phoneCheck.test(self.user.uPhone))
			{
				alert("연락처 형식에 맞추어 작성하세요.\n ex)010-1234-5678");
				return;
			}
			var emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if (!emailCheck.test(self.user.uEmail))
			{
				alert("이메일 형식에 맞추어 작성하세요.\n ex)verypery@verypery.com");
				return;
			}
			if(self.check1 == true && self.check2 == true){
				self.user.uEventyn = "Y";
			}else{
				alert("필수약관 동의가 필요합니다.");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "/userJoin/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                 	
                	$.pageChange("joinWelcome.do", {uId : self.user.uId});
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
	   		 if (self.user.uId === "") {
             // 아이디 입력값이 비어있을 때 초기값으로 변경
             self.message = "";
             self.isAvailable = false;
             self.uIdBorderColor = "";
             self.uIdTextColor = "";
             return;
         	}
			var nparmap = {uId : self.user.uId};
            $.ajax({
                url : "/userJoin/check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		self.message = "중복된 아이디가 존재합니다.";
                		self.messageColor = 'red';
                		self.uIdBorderColor = 'red';   // 중복시 빨간색 border
                		self.isAvailable = false;
                        
                	} else {
                		self.message = "사용 가능한 아이디입니다.";
                		self.messageColor = 'blue';
                		self.uIdBorderColor = 'blue';  // 사용 가능시 파란색 border
                		self.isAvailable = true;
                	}
                }
            });
	   	},
	   	passwordStrength() {
	   	    const password = this.user.uPw;
	   	    const length = password.length;
	   	    
	   	    if (length <= 2) {
	   	        return 0;
	   	    } else if (length <= 4) {
	   	        return 1;
	   	    } else if (length <= 6) {
	   	        return 2;
	   	    } else if (length <= 8) {
	   	        return 3;
	   	    } else {
	   	        return 4;
	   	    }
	   	},

        strengthColor() {
            const strength = this.passwordStrength();
            // 강도에 따른 색상 반환 로직 구현
            if (strength == 0) {
                return 'red';
            } else if (strength == 1) {
                return 'orange';
            } else if (strength == 2) {
                return 'dark yellow';
            } else if (strength ==3) {
                return 'blue';
            } else {
            	return 'green';
            }
        },

        strengthLabel() {
            const strength = this.passwordStrength();
            
            if (strength === 0) {
                return '보안 : 약함';
            } else if (strength === 1) {
                return '보안 : 보통';
            } else if (strength === 2) {
                return '보안 : 보통';
            } else if (strength === 3) {
                return '보안 : 강함';
            } else {
                return '보안 : 매우 강함';
            }
        },
	   	
	}, // methods
	created : function() {
		var self = this;
		
	}// created
});
</script>