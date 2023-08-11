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

	<div><input type="text" placeholder="��ǰ �ڵ�" ></div>
	<div><input type="text" placeholder="��ǰ �̸�" ></div>
	<div><input type="number" placeholder="����" ><input type="number" placeholder="������" disabled></div>
	<div><input type="number" placeholder="���"></div>
	<div>
		<select>
			<option value="N">��ü���Ű���</option>
			<option value="Y">���������</option>
		</select>
	</div>
	<div><input type="date"></div>
	

	
	
	
	
	<div><button @click="fnProductAdd">��ǰ �߰�</button></div>


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
		
		}
	},// data
	methods : {
        fnProductAdd : function(){
        	 var self = this;
             var nparmap = self.info;
             $.ajax({
                 url : "/product/add.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
                 	alert("��ǰ�� ��ϵǾ����ϴ�.");
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