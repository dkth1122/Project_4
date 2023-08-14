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
	<h2>ȸ������</h2>
	<div>
		<input type="text" v-model="user.uId" placeholder="���̵�" @keyup="fnIdCheck">
		<div v-if="user.uId != ''">{{message}}</div>
	</div>
	<div><input type="password" v-model="user.uPw" placeholder="��й�ȣ"></div>
	<div><input type="password" v-model="user.uPw2" placeholder="Ȯ�� ��й�ȣ"></div>
	<div><input type="text" v-model="user.uName" placeholder="�̸�"></div>
	<div><input type="text" v-model="user.uName2" placeholder="�г���"></div>
	<div><input type="text" v-model="user.uPhone" placeholder="����ó"></div>
	<div><input type="text" v-model="user.uEmail" placeholder="�̸����ּ�"></div>
	
	<div id="evtyn">
		<div><label><input type="checkbox" v-model="check" @click="fnCheck">��ü ����</label></div>
		<div><label><input type="checkbox" v-model="check1"><strong><a href="javascript:;">(�ʼ�)����ȸ�� ����� ����</a></strong></label></div>
		<div><label><input type="checkbox" v-model="check2"><strong><a href="javascript:;">(�ʼ�)����ȸ�� ���� �� �̿뿡 ����</a></strong></label></div>
		<div><label><input type="checkbox" v-model="check3">(����)������ ���� ���� ����-SMS/MMS</label></div>
	</div>

	<div><button @click="fnJoin" >�����ϱ�</button></div>
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
				alert("���̵� �Է��ض�");
				return;
			}
			if(self.user.uPw == ""){
				alert("�н����� �Է��ض�");
				return;
			}
			if(self.user.uPw != self.user.uPw2){
				alert("�н����� Ȯ���ض�");
				return;
			}
			if(self.user.uName == ""){
				alert("�̸� �Է��ض�");
				return;
			}
			if(self.check1 == true && self.check2 == true){
				self.user.uEventyn = "Y";
			}else{
				alert("�ʼ���������ض�");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "/userJoin/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("���� �Ϥ�");
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
			var nparmap = {uId : self.user.uId};
            $.ajax({
                url : "/userJoin/check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		self.message = "�ߺ��� ���̵� �����մϴ�.";
                	} else {
                		self.message = "��� ������ ���̵��Դϴ�.";
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