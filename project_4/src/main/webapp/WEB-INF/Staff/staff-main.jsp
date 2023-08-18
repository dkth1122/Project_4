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
    body{
    	width: 200px;
    }
	#app2 {
	  width: 200px;
	  margin-top: 50px;
	}
	
	.leftBut1 > button {
	  background-color: #eddcfd;
	  width: 200px;
	  height: 50px;
	  display: inline;
	  border-radius: 20px;
	  border: none;
	  margin-bottom: 1px;
	}
	
	.leftBut1 > button:hover {
	  background-color: #d7acff;
	  color: white;
	}

    </style>
</head>
<body>
<div id="app2">
	<div class="leftBut1">
	<button @click="fnHome">皋牢 拳搁</button>
	<button @click="fnInquiry" v-if="sStatus == 'A' || sStatus == 'C' || sStatus == 'M'">1:1 巩狼</button>
	<span v-else></span>
	<button @click="fnComplaint" v-if="sStatus == 'C' || sStatus == 'M'">刮盔 包府</button>
	<span v-else></span>
	<button @click="fnCustomer">绊按 包府</button>
	<button @click="fnProduct" v-if="sStatus == 'D' ||  sStatus == 'M'">惑前 包府</button>
	<span v-else></span>
	<button @click="fnABoard" v-if="sStatus == 'D' || sStatus == 'M'">傍瘤 包府</button>
	<span v-else></span>
	<button @click="fnEvent" v-if="sStatus == 'D' || sStatus == 'M'">捞亥飘 包府</button>
	<span v-else></span>
	<button @click="fnStaff" v-if="sStatus == 'C' || sStatus == 'M'">流盔 包府</button>
	<span v-else></span>
	<button @click="fnOrder" v-if="sStatus == 'B' || sStatus == 'M'">林巩 包府</button>
	<span v-else></span>
	<button @click="fnDelivery" v-if="sStatus == 'B' || sStatus == 'M'">硅价 包府</button>
	<span v-else></span>
	<button @click="fnExchange">背券/券阂 包府</button>
	<button @click="fnSales" v-if="sStatus == 'M'">概免 包府</button>
	<span v-else></span>
	</div>
</div>
</html>
<script>
var app2 = new Vue({
	el : '#app2',
	data : {
		list : [],
		sName : "${sName}",
        sNo : "${sNo}",
        sStatus : "${sStatus}"
	},// data
	methods : {
		fnHome : function(){
            location.href = '../staff/home.do';
        },
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
		fnOrder : function() {
			location.href="../order/list.do";
		},
		fnDelivery : function() {
			location.href="../delivery/list.do";
		},
		fnLogout : function() {
			location.href="../staff/login.do";
		},
		fnExchange : function() {
				location.href="../exchange/list.do";
		},
		fnSales : function() {
				location.href="../sales/chart.do";
		}
		
	}, // methods
	created : function() {
		var self = this;
		/* self.fnGetList(); */
	}// created
});
</script>