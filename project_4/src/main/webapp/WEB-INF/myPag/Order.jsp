<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>��ٱ��� ���� ��ư������ ���ŷ� �̵�</title>
<style>

#title {
	width: 1500px;
	margin-bottom: 50px;
	margin: 0px auto;
	margin-top: 100px;
	font-size: 4em;
	text-align: center;
	font-weight: bold;
}

table {
	
	margin: 0px auto;
	border-collapse: collapse;
	width: 1500px;
	margin-top: 100px;
	margin-bottom: 30px;
}
th{
	text-align: center;
}
th, td {
	text-align: center;
	height: 100px;
}

tr th, tr td {
	padding: 20px;
	border-bottom: 1px solid black;
	border-bottom-color: #e3e3e3;
}

#body {
	width: 1500px;
}

#container {
	width: 100%;
	display: flex;
	flex-direction: column;
}
.ch_deletebutton{
	width: 1500px;
	margin: 0px auto;
	margin-bottom: 30px;
	text-align: right;
}
.border-bottom{
	border-bottom: 1px solid #e3e3e3;
	width: 1500px;
	margin: 0px auto;
}
.payment{
	margin: 0px auto;
	width: 1500px;
	text-align: center;
	font-size: 2em;
	border-bottom: 1px solid #e3e3e3;
	margin-bottom: 30px;
}
.red{
	color: red;
}
span {
	margin: 0px 80px;
}
.baybutton{
	width: 1500px;
	text-align: right;
	margin: 0px auto;
	color: #4b4b4bda;
	font-size: 0.8em;
}
.a{
	width: 15%
}
.b{
	width: 60%
}
.c{
	width: 5%;
}
.d{
	width: 10%
}
.e{
	width: 10%
}

</style>
</head>
<body>
	<div id="app">

		<div id="container">
		
			<div id="title">Order</div>

			<div class="body">
				<table>
					<tr>
						
						<th colspan="2">��ǰ����</th>
						<th>����</th>
						<th>��ۺ�</th>
						<th>�ֹ��ݾ�</th>						
					</tr>

					<tr v-for="(item, index) in 5">
						
						<td class="a">�̹���</td>
						<td class="b">�̸�</td>
						<td class="c">
								�Ѿ�� ����					
						</td>
						<td class="d">��ۺ�</td>
						<td class="e">����</td>
						

					</tr>

				</table>
				<div class="ch_deletebutton"><span>\ �ݾ�</span> + <span>\ ���</span> �� <span class="red">\ ��</span></div>
			
				<div class="payment"></div>
				<div class="baybutton">��ǰ�� �ɼ� �� ���� ������ ��ǰ�� �Ǵ� ��ٱ��Ͽ��� �����մϴ�.</div>
			</div>

		</div>
	</div>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			info : [],
			orderCntList : [],
			uId : "dcsdsd3",/* "${sessionId}" */
			order : "",
			exchange : "",
			refund : "",
			list : [],
			cart : [],
			pNo : ""
		},
		methods : {
			
			fnRemove : function() {
				var self = this;
				var nparmap = {
					pNo : self.pNo
				};
				$.ajax({
					url : "/mypag/deletecart.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("��ٱ��Ͽ��� �����Ǿ����ϴ�.");
						console.log(self.pNo);
					}
				});
			},
			fnOrder : function() {
				var self = this;
				var nparmap = {
					uId : self.uId
				};
				$.ajax({
					url : "/mypag/listExchange.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						var listCnt = data.list;
						for (var i = 0; i < listCnt.length; i++) {
							if (listCnt[i].exchange == "N") {
								self.order = listCnt[i].orderCnt;
								console.log(self.order);
							} else if (listCnt[i].exchange == "E") {
								self.exchange = listCnt[i].orderCnt;
							} else {
								self.refund = listCnt[i].orderCnt;
							}
						}

					}
				});
			},

			fnGetProduct : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "/mypag/cart.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.cart = data.list;
						console.log(self.cart);

					}
				});
			},

			fnGetList : function() {
				var self = this;
				var nparmap = {
					uId : self.uId
				};
				$.ajax({
					url : "/user2.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.findPw; //�����
						self.fnCntList();
					}
				});
			},
			fnCntList : function() {
				var self = this;
				var nparmap = {
					uId : self.uId
				};
				$.ajax({
					url : "/mypag/listExchange.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						var listCnt = data.list;
						for (var i = 0; i < listCnt.length; i++) {
							if (listCnt[i].exchange == "N") {
								self.order = listCnt[i].orderCnt;
								console.log(self.order);
							} else if (listCnt[i].exchange == "E") {
								self.exchange = listCnt[i].orderCnt;
							} else {
								self.refund = listCnt[i].orderCnt;
							}
						}

					}
				});

			},

		},
		created : function() {
			var self = this;
			self.fnGetList();
			self.fnGetProduct();
		}
	});
</script>
