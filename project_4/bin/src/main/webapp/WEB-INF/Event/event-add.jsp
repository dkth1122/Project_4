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

	<div><input type="text" placeholder="�̺�Ʈ �ڵ�" v-model="info.evtNo"></div>
	<div><input type="text" placeholder="�̺�Ʈ �̸�" v-model="info.evtName"></div>
	<div>
		��Ƽ��Ʈ : 
	<select v-model="info.artist">
		<option value="BTS">��ź�ҳ��</option>
		<option value="TXT">����ο�������Դ�</option>
		<option value="EHP">��������</option>
		<option value="SVT">����ƾ</option>
		<option value="FMN">���ι̽�����</option>
		<option value="LSF">��������</option>
		<option value="NJS">������</option>
		<option value="BND">���̳ؽ�Ʈ����</option>
		<option value="ZIC">����</option>
	</select>
	</div>
	
	<div><button @click="fnEventAdd(info)">�̺�Ʈ �߰�</button></div>

	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
			evtNo : "",
			evtName : "",
			artist : ""
		}
	},// data
	methods : {
		fnEventAdd: function(info) {
			  var self = this;
			  var nparmap = self.info;
			  nparmap.evtNo = (nparmap.artist + nparmap.evtNo);
			  if(self.info.evtNo.length != 7){
			        alert("�̺�Ʈ�ڵ带 Ȯ���Ͻÿ�");
			        return;
			    }
			  if(self.info.evtName == "" || self.info.evtName == undefined){
			        alert("�̺�Ʈ �̸��� �Է����ּ���");
			        return;
			    }
			  if(self.info.artist == "" || self.info.artist == undefined){
					alert("��Ƽ��Ʈ�� �������ּ���");
					return;
				}
			  $.ajax({
			    url : "/event/add.dox",
			    dataType : "json",
			    type : "POST",
			    data : nparmap,
			    success : function(data) {
			      alert("�̺�Ʈ�� ��ϵǾ����ϴ�.");
	        	  window.close(); // �˾�â �ݱ�
	        	  window.opener.location.reload(); // �θ�â ���ΰ�ħ
			    }
			  });
			}    	
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>