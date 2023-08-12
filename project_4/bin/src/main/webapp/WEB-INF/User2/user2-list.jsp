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
			<th>���̵�</th>
			<th>�̸�</th>
			<th>�г���</th>
			<th>����ó</th>
			<th>��й�ȣ����Ƚ��</th>

		</tr>
		<tr v-for="(item, index) in list">
			<td><a href="javascript:;" @click="fnuserInformation(item)">{{item.uId}}</a></td>
			<td>{{item.uName}}</td>
			<td>{{item.uName2}}</td>
			<td>{{item.uPhone}}</td>
			<td v-if="item.uCnt >= 5"><button @click="fnCntReset(item)">�����ʱ�ȭ</button></td>
			<td v-else></td>

		</tr>
	</table>
	
	<div><button @click="fnBack">�ǵ��ư���</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		uId : ""
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
        fnuserInformation : function(item){
        	 var self = this;
             $.pageChange("../user2/view.do", {uId : item.uId});
        },
        fnCntReset : function(item){
            var self = this;
            var nparmap = {uId : item.uId};
            $.ajax({
                url : "/user2/cntReset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�ʱ�ȭ�Ǿ����ϴ�.");
                	self.fnGetList();
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