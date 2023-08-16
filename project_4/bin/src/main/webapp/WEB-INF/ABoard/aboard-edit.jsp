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

	span{
		color: #ccc;
		font-size: small;
	}
	
</style>
</head>
<body>
<div id="app">

	<div>���� : <input v-model="info.aTitle"></div>
	<div>���̵� : <input v-model="info.aContent"></div>
	
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
	
	



	<button @click="fnABoardEdit">����</button>

	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		aNo: "${map.aNo}",
		info : {
		aTitle : "",
		aContent : "",
		aKind : "",
		artist : ""
		}
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {aNo : self.aNo};
            $.ajax({
                url : "/aboard/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnABoardEdit : function(){
        	var self = this;
            var nparmap = self.info;
            if(self.info.aTitle == "" || self.info.aTitle == undefined){
		        alert("������ �Է����ּ���");
		        return;
		    } else if(self.info.aTitle.length > 50){
		        alert("������ �ִ� 50�ڱ��� �Է� �����մϴ�.");
		        return;
		    }
		    if(self.info.aContent == "" || self.info.aContent == undefined){
		        alert("������ �Է����ּ���");
		        return;
		    } else if(self.info.aContent.length > 3000){
		        alert("������ �ִ� 3000�ڱ��� �Է� �����մϴ�.");
		        return;
		    }
		    if(self.info.aKind == "" || self.info.aKind == undefined){
		        alert("������ �������ּ���");
		        return;
		    }
		    if(self.info.artist == "" || self.info.artist == undefined){
		        alert("��Ƽ��Ʈ�� ���� ���ּ���");
		        return;
		    }
            $.ajax({
                url : "/aboard/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�����Ǿ����ϴ�.");
                	window.close(); // �˾�â �ݱ�
 	        	    window.opener.location.reload(); // �θ�â ���ΰ�ħ
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>