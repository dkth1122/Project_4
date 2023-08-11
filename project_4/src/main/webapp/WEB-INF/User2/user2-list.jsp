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
</head>
<body>
<div id="app">

<table>
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>연락처</th>
			<th>비밀번호오류횟수</th>
			<th>정지</th>

		</tr>
		<tr v-for="(item, index) in list">
			<td>{{item.uId}}</td>
			<td>{{item.uName2}}</td>
			<td>{{item.uPhone}}</td>
			<td>{{item.uCnt}}</td>
			<td><button>추후추가</button></td>

		</tr>
	</table>
	
	<div><button @click="fnBack">되돌아가기</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/user2/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnBack : function(){
            location.href = '../staff/main.do';
         }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>