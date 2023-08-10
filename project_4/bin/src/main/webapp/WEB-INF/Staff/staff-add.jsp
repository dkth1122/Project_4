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

	<div><input placeholder="�̸�" v-model="sName"></div>
	<div><input placeholder="���" v-model="sNo"></div>
	<div><input placeholder="�����ȣ" v-model="sPhone"></div>
	<div><select v-model="selectItem">
		<option value="��������">��������</option>
		<option value="�ο�������">�ο�������</option>
		<option value="��۰�����">��۰�����</option>
		<option value="��ǰ������">��ǰ������</option>
		<option value="�̻�">�̻�</option>
	</select>
	   <input :disabled="valueDisabled" v-model="value">
	</div>
	<div><input placeholder="���" v-model="sBoss"></div>
	
	<button @click="fnAdd()">���</button>
	

</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		sName : "",
		sNo : "",
		sPhone : "",
		sBoss : "",
		selectItem : "",
		value : ""
	},
	  computed: {
		    valueDisabled: function () {
		      return true;
		    },
		  },
		  watch: {
		    selectItem: function () {
		      switch (this.selectItem) {
		        case "��������":
		          this.value = "A";
		          break;
		        case "�ο�������":
		          this.value = "C";
		          break;
		        case "��۰�����":
		          this.value = "B";
		          break;
		        case "��ǰ������":
		          this.value = "D";
		          break;
		        case "�̻�":
		          this.value = "M";
		          break;
		        default:
		          this.value = "";
		          break;
		      }
		    },
		  },
	methods : {
		fnAdd : function(){
            var self = this;
            var nparmap = {sName : self.sName, sNo : self.sNo, sPhone : self.sPhone, sBoss : self.sBoss, sPart : self.selectItem, sPosition : self.value};
            $.ajax({
                url : "/staff/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert(self.sName + "���� ��ϵǾ����ϴ�.");
                	location.href="main.do";
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>