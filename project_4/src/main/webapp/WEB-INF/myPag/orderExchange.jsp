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
	}
</style>
</head>
<body>
<div id="app">

	<div>
		<select v-model="dState">
			<option values="��ȯ����">��ȯ����</option>
			<option values="��ǰ����">��ǰ����</option>
		</select>
	
	</div>
	<div><textarea rows="10" cols="50" v-model="bReasons" placeholder="��ȯ/��ǰ ������ �Է����ּ���"></textarea></div>
	
	<button @click="fnAdd()">���</button>
	

</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
			buyNo : "${map.buyNo}",
			dState : "",
			exchange : "",
			bReasons : ""
	},
	methods : {
		fnAdd : function(){
            var self = this;
            if(self.dState == '��ȯ����'){
            	self.exchange = 'C';
            }else{
            	self.exchange = 'R';
            }
            var nparmap = {buyNo : self.buyNo, dState : self.dState, exchange : self.exchange, bReasons : self.bReasons};
            $.ajax({
                url : "/mypag/mypageOrderchange.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert(self.dState + "�� ��ϵǾ����ϴ�.");
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