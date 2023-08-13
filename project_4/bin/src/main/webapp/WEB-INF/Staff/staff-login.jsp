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
</style>
</head>
<body>
<div id="app">
	<form @submit.prevent="fnStaffLogin">
	    <div><input type="text" placeholder="�̸�" v-model="staffName"></div>
	    <div><input type="text" placeholder="���" v-model="staffNo"></div>
	    <div><button type="submit">�α���</button></div>
    </form>
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
                		location.href="../staff/main.do";
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