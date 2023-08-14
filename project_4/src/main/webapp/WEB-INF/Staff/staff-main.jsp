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
	.but1 > button{
		width: 200px;
		height: 200px;
		display: inline-block;
		margin-right: 10px;
		margin-bottom: 10px;
	}
</style>
</head>
<body>
<div id="app">
	<h1> {{sName}}��, ���õ� �����ϼ���~! </h1>
	<div class="but1">
	<button @click="fnMain">�����丮��</button>
	<button @click="fnGBoard">����ʰԽ���</button>
	<button @click="fnInquiry" v-if="sStatus == 'A' || sStatus == 'C' || sStatus == 'M'">1:1 ����</button>
	<span v-else></span>
	<button @click="fnComplaint" v-if="sStatus == 'C' || sStatus == 'M'">�ο� ����</button>
	<span v-else></span>
	<button @click="fnCustomer">�� ����</button>
	<button @click="fnProduct" v-if="sStatus == 'D' ||  sStatus == 'M'">��ǰ ����</button>
	<span v-else></span>
	<button @click="fnABoard" v-if="sStatus == 'D' || sStatus == 'M'">���� ����</button>
	<span v-else></span>
	<button @click="fnEvent" v-if="sStatus == 'D' || sStatus == 'M'">�̺�Ʈ ����</button>
	<span v-else></span>
	<button @click="fnStaff" v-if="sStatus == 'C' || sStatus == 'M'">���� ����</button>
	<span v-else></span>
	<button @click="fnDelivery" v-if="sStatus == 'B' || sStatus == 'M'">��� ����</button>
	<span v-else></span>
	</div>
	<div><button @click="fnLogout">�α׾ƿ�</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		sName : "${sName}",
        sNo : "${sNo}",
        sStatus : "${sStatus}"
	},// data
	methods : {
		fnMain : function() {
			location.href="../home.do";
		},
		fnGBoard : function() {
			location.href="../gboard/main.do";
		},
		fnInquiry : function() {
			location.href="../inquiry/list.do";
		},
		fnComplaint : function() {
			location.href="";
		},
		fnCustomer : function() {
			location.href="../user2/list.do";
		},
		fnProduct : function() {
			location.href="../product/list.do";
		},
		fnABoard : function() {
			location.href="../aboard/list.do";
		},
		fnEvent : function() {
			location.href="../aboard/list.do";
		},
		fnStaff : function() {
			location.href="../staff/Management.do";
		},
		fnDelivery : function() {
			location.href="";
		},
		fnLogout : function() {
			location.href="../staff/login.do";
		}
		
	}, // methods
	created : function() {
		var self = this;
		/* self.fnGetList(); */
	}// created
});
</script>