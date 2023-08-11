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

	<div><input placeholder="����" v-model="info.aTitle"></div>
	<div><input placeholder="����" v-model="info.aContent"></div>
	<div> ���� : <select v-model="info.aKind">
		<option value="����">����</option>
		<option value="�̺�Ʈ">�̺�Ʈ</option>
	</select></div>
	<div> ��Ƽ��Ʈ : <select v-model="info.artist">
		<option value="����">����</option>
		<option value="��ź�ҳ��">��ź�ҳ��</option>
		<option value="����ο�������Դ�">����ο�������Դ�</option>
		<option value="��������">��������</option>
		<option value="����ƾ">����ƾ</option>
		<option value="���ι̽�����">���ι̽�����</option>
		<option value="��������">��������</option>
		<option value="������">������</option>
		<option value="���̳ؽ�Ʈ����">���̳ؽ�Ʈ����</option>
		<option value="����">����</option>
	</select></div>
	
	
	
	<button @click="fnABoardAdd">�����߰�</button>


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
		aTitle : "",
		aContent : "",
		aKind : "",
		artist : ""
		}
	},// data
	methods : {
        fnABoardAdd : function(){
        	 var self = this;
             var nparmap = self.info;
             $.ajax({
                 url : "/aboard/add.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
                 	alert("������ ��ϵǾ����ϴ�.");
                 	location.href="list.do";
                 }
             }); 
         }      	
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>