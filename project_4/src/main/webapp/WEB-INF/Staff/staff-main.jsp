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
	<h1> {{sName}}님, 오늘도 열일하세요~! </h1>
	<div class="but1">
	<button @click="fnMain">베리페리샵</button>
	<button @click="fnGBoard">멤버십게시판</button>
	<button @click="fnInquiry" v-if="sStatus == 'A' || sStatus == 'C' || sStatus == 'M'">1:1 문의</button>
	<span v-else></span>
	<button @click="fnComplaint" v-if="sStatus == 'C' || sStatus == 'M'">민원 관리</button>
	<span v-else></span>
	<button @click="fnCustomer">고객 관리</button>
	<button @click="fnProduct" v-if="sStatus == 'D' ||  sStatus == 'M'">상품 관리</button>
	<span v-else></span>
	<button @click="fnABoard" v-if="sStatus == 'D' || sStatus == 'M'">공지 관리</button>
	<span v-else></span>
	<button @click="fnEvent" v-if="sStatus == 'D' || sStatus == 'M'">이벤트 관리</button>
	<span v-else></span>
	<button @click="fnStaff" v-if="sStatus == 'C' || sStatus == 'M'">직원 관리</button>
	<span v-else></span>
	<button @click="fnDelivery" v-if="sStatus == 'B' || sStatus == 'M'">배송 관리</button>
	<span v-else></span>
	</div>
	<div><button @click="fnLogout">로그아웃</button></div>
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
			 window.open('../home.do', '_blank');
		},
		fnGBoard : function() {
			window.open('../gboard/main.do', '_blank');
		},
		fnInquiry : function() {
			location.href="../inquiry/list.do";
		},
		fnComplaint : function() {
			location.href="../complain/list.do";
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
			location.href="../event/list.do";
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