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

th, td {
	padding: 8px;
	text-align: left;
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
	margin-bottom: 50px;
}
.border-bottom{
	border-bottom: 2px solid black;
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
	text-align: center;
	margin: 0px auto;
}
</style>
</head>
<body>
	<div id="app">

		<div id="container">
		
			<div id="title">CART</div>

			<div class="body">
				<table>

					<tr>
						<th><input type="checkbox"></th>
						<th colspan="2">��ǰ����</th>
						<th>����</th>
						<th>��ۺ�</th>
						<th>�ֹ��ݾ�</th>
						<th>����</th>
					</tr>

					<tr v-for="(item, index) in 5">
						<td><input type="checkbox"></td>
						<td>�̹���</td>
						<td>�̸�</td>
						<td>
						
						<input  :id="quantiy_id+index" :value="0">
						
						</td>
						<td>��ۺ�</td>
						<td>����</td>
						<td>
							<button>����</button>
							<br>
							<button>�ֹ��ϱ�</button>
						</td>

					</tr>

				</table>
				<div class="ch_deletebutton"><button>���û�ǰ����</button></div>
				<div class="border-bottom"></div>
				<div class="payment"><h3><span>\ �ݾ�</span> + <span>\ ���</span> = <span class="red">\ ��</span></h3></div>
				<div class="baybutton"><button>��ü��ǰ �ֹ�</button>  <button>���� ��ǰ �ֹ�</button></div>
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
