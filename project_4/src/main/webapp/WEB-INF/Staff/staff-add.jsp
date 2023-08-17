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

	<div><input placeholder="�̸�" v-model="info.sName"></div>
	<div><input placeholder="���" v-model="info.sNo"></div>
	<div><input placeholder="�����ȣ" v-model="info.sPhone"></div>
	<div><select v-model="info.selectItem">
		<option value="��������">��������</option>
		<option value="�ο�������">�ο�������</option>
		<option value="��۰�����">��۰�����</option>
		<option value="��ǰ������">��ǰ������</option>
		<option value="�̻�">�̻�</option>
	</select>
	   <input :disabled="valueDisabled" v-model="info.value">
	</div>
	<div><input placeholder="���" v-model="info.sBoss"></div>
	
	<button @click="fnAdd()">���</button>
	

</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
		sName : "",
		sNo : "",
		sPhone : "",
		sBoss : "",
		selectItem : "",
		value : ""
		}
	},
	  computed: {
		    valueDisabled: function () {
		      return true;
		    },
		  },
		  watch: {
			  'info.selectItem': function(newVal, oldVal) {
			    switch (newVal) {
			      case "��������":
			        this.info.value = "A";
			        break;
			      case "�ο�������":
			        this.info.value = "C";
			        break;
			      case "��۰�����":
			        this.info.value = "B";
			        break;
			      case "��ǰ������":
			        this.info.value = "D";
			        break;
			      case "�̻�":
			        this.info.value = "M";
			        break;
			      default:
			        this.info.value = "";
			        break;
			    }
			  },
			},
	methods : {
		fnAdd : function(){
            var self = this;
            var nparmap = self.info;
            $.ajax({
                url : "../staff/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert(self.info.sName + "���� ��ϵǾ����ϴ�.");
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