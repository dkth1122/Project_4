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
</style>
</head>
<body>
<div id="app">
	<form @submit.prevent="fnStaffLogin">
	    <div><input type="text" placeholder="이름" v-model="staffName"></div>
	    <div><input type="text" placeholder="사번" v-model="staffNo"></div>
	    <div><button type="submit">로그인</button></div>
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
                		location.href="../staff/home.do";
                	} else {
                		alert("성함 혹은 사번을 확인해주세요");
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