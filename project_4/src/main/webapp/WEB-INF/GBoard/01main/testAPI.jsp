<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<!-- ���� ������ ���� ��Ʈ�� ���̺귯�� �߰� -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	*{
			font-family : aŸ��Ʋ���2;
		}

		
		.dd{
			margin : 12px auto;
			text-align : center;
			font-size : 24px;
		}
		.check{
			margin : 12px auto;
			text-align : center;
			font-size : 16px;
			color : red;
		}
		.addrInput{
			width : 300px;
		}
</style>
</head>
<body>
<div id="app">
	
	<ul v-for = "item in list">
		<li>{{item.uDname}}</li>
		<li>{{item.uDphone}}</li>
		<li>{{item.uDaddr}}</li>
		<li>{{item.uDaddrDetail}}</li>
	</ul>
	
	<!-- <div class="dd"  v-if="!addrCheck">
		<label>* �ּ� : <input class="addrInput" type="text" class="in" placeholder="�ּ�"  disabled></label>
		<button @click="fnSearchAddr">�ּ� �˻�</button>
	</div> -->
		
</div>
</body>
</html>
<script>

var app = new Vue({
	el : '#app',	
	data : {
			price : 1340000,
			uId : "${sesseionId}",
			list : []
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId}
            		
            $.ajax({
                url : "deliverytest.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	self.list = data.list;
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