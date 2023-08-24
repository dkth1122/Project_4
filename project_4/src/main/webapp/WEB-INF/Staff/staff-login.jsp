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
	body {
		background-color: #eae2eb;
	}
	#app {
		width: 800px;
		margin: 0px auto;
	}
	input {
		width: 500px;
		height: 80px;
		margin-bottom: 20px;
		font-size: 20px;
	}
	
	button {
	  background-color: #eddcfd;
	  width: 200px;
	  height: 50px;
	  display: inline;
	  border-radius: 20px;
	  border: none;
	  margin-bottom: 1px;
	}
	
	button:hover {
	  background-color: #d7acff;
	}
	.box1{
		border: 3px dashed white;
		width: 700px;
		text-align: center;
		padding: 50px;
	}
	h2{
		margin-bottom: 50px;
		color: #7C81BB;
	}
	h1{
		color: #7C81BB;
	}
</style>
</head>
<body>
<div id="app">

	<h1>������ �������Դϴ�.</h1>
	<h2>���԰� ����� �Է� �� ���� ��Ź�帳�ϴ�.</h2>
	<div class="box1">
		<form @submit.prevent="fnStaffLogin">
		    <div><input type="text" placeholder="�̸�" v-model="staffName"></div>
		    <div><input type="text" placeholder="���" v-model="staffNo"></div>
		    <div><button type="submit">�α���</button></div>
	    </form>
    </div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		staffNo : "",
		staffName : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnStaffLogin : function(){
            var self = this;
            var nparmap = {staffName : self.staffName, staffNo : self.staffNo};
            $.ajax({
                url : "/staff/staffLogin.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.success){
                		alert(data.message);
                		location.href="../staff/home.do";
                	} else {
                		alert("���� Ȥ�� ����� Ȯ�����ּ���");
                	}
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
		/* self.fnGetList(); */
	}// created
});
</script>