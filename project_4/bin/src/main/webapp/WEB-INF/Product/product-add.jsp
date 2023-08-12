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

	<div><input type="text" placeholder="��ǰ �ڵ�" v-model="info.pNo"></div>
	<div><input type="text" placeholder="��ǰ �̸�" v-model="info.pName"></div>
	<div><input type="number" placeholder="����" v-model="info.price"><input type="number" placeholder="������" v-model="info.point" disabled></div>
	<div><input type="number" placeholder="���" v-model="info.stock"></div>
	<div>
		<select v-model="info.membership">
			<option value="N">��ü���Ű���</option>
			<option value="Y">���������</option>
		</select>
	</div>
	<div> ī�װ� : 
		<select v-model="info.category">
			<option value="ALB">�ٹ�</option>
			<option value="MER">��ġ</option>
			<option value="DVD">DVD</option>
			<option value="PTB">�����</option>
			<option value="MEM">�����</option>
		</select>
	</div>
	<div> �ִ뱸�� ���� : 
		<select v-model="info.pLimit">
			<option value="10">10��</option>
			<option value="9">9��</option>
			<option value="8">8��</option>
			<option value="7">7��</option>
			<option value="6">6��</option>
			<option value="5">5��</option>
			<option value="4">4��</option>
			<option value="3">3��</option>
			<option value="2">2��</option>
			<option value="1">1��</option>
		</select>
	</div>
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
	<div><input type="text" placeholder="Ư���ڵ�" v-model="info.fYn"></div>
	
	<div><button @click="fnProductAdd">��ǰ �߰�</button></div>

	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
			pNo : "",
			pName : "",
			price : "",
			point : "",
			stock : "",
			membership : "",
			category : "",
			pLimit : "",
			artist : "",
			fYn : ""
		}
	},// data
	methods : {
		fnProductAdd: function() {
			  var self = this;
			  var nparmap = self.info;
			  nparmap.point = parseFloat(nparmap.price) * 0.02;
			  nparmap.pNo = (nparmap.artist + nparmap.pNo + nparmap.category);
			  $.ajax({
			    url : "/product/add.dox",
			    dataType : "json",
			    type : "POST",
			    data : nparmap,
			    success : function(data) {
			      alert("��ǰ�� ��ϵǾ����ϴ�.");
			       location.href = "list.do"; 
			    }
			  });
			}    	
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>