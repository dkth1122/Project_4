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

.table {
	
	margin: 0px auto;
	border-collapse: collapse;
	width: 1500px;
	margin-top: 100px;
	margin-bottom: 30px;
}
.table >th{
	text-align: center;
}
.table > th, td {
	text-align: center;
	height: 100px;
}
 .table td{
 	padding: 20px;
	border-bottom: 1px solid black;
	border-bottom-color: #e3e3e3;
 }
.table td {
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
	margin-left: 111px;
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
#addr{
width: 1500px;
margin: 0px auto;
margin-top: 40px;
display: flex;
}
#inputaddr{
	width: 940px;
	margin-right: 50px;
	margin-bottom: 100px;
	
}
#inputhd{
	border-bottom: 3px solid black;
}
#point{
	margin-top :10px;
	widows: 700px;
}
h3{
	width : 700px;
	display: inline-block;
}
i{
	margin-right: 7px;
}
.adr{
	widows: 960px;
}
.adr th{
	width : 300px;
	text-align: left;
}
.adr > th, td{
	height: 20px;
	padding: 0px;
}
.nameinput{
	width: 100%;
}
.addrinput2{
width: 100%;
}
.adr input{ 
	height: 40px;
	text-align: left;
	margin: 10px 0px;
	border-width: 0 0 1px;	
}
.adr td{
	text-align: left;
	margin: 10px;
}
select{
	margin-right: 20px;
	height: 42px;
	width: 83px;
	border-width: 0px 0px 1px;
	outline: none;
}
#viewpoint{
	border:  1px solid #e3e3e3; 
	width: 410px;
	height: 88px;
	margin: 8px 0px 20px 0px;
	padding: 57px 50px 80px 50px;
}
#pointhd{
	line-height: 45px;
	font-size: 1.1em;
	font-weight: 700;
}
.pontbottombor{
	margin-top : 50px;
	border-bottom: 3px solid black;
}
.pointable th{
	font-size: 1em;
	width: 150px;
	text-align: left;
}
.pointable td{
	font-size: 1.5em;
	font-weight: bold;
}
#baybutton{
	width: 1500px;
	margin: 30px auto;
	text-align: center;
}
#baybutton > button{
	width: 350px;
	height: 70px;
	font-size: 1.1em;
	border-radius: 100px;
	background-color: #7C81BB;
	color: #fff;
	border: 0px;
}
input {
  outline: none;
}
.select2{
margin-left :20px;
text-align: center;
	width: 114px;
}

</style>
</head>
<body>
	<div id="app">

		<div id="container">
		
			<div id="title">Order</div>

			<div class="body">
				<table class="table">
					<tr>
						
						<th colspan="2">��ǰ����</th>
						<th>����</th>
						<th>��ۺ�</th>
						<th>�ֹ��ݾ�</th>						
					</tr>

					<tr v-for="(item, index) in 3">
						
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
			<div id="addr">
				<div>
				<div id="inputaddr">
						<div id="inputhd">
						<h3>�ֹ��� ����</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�ʼ� �Է»���</span>
						</div>
					<table class="adr" border="0">
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ֹ��Ͻô� �� </th>
							<td><input  class="nameinput " type="text" v-model="name"> </td>
						</tr>
						
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ּ�</th>
							<td>
							<input class="addrinput" type="text" >  <button>�ּ� ã��</button> 
							<br>
							<input class="addrinput2" type="text" placeholder="�⺻�ּ�">
							<br>
							<input class="addrinput2" type="text" placeholder="������ �ּ� ">							
							</td>
						</tr>
						
						<tr>
							<th>���Ϲ���ȭ</th>
							<td>
							<select class="select">
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>033</option>
								<option>043</option>
							</select>
							<input class="numinput" type="text">	- <input class="numinput" type="text">								
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�޴���ȭ</th>
							<td>
								<select class="select">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							<input class="numinput" type="text"> - <input class="numinput" type="text">			
							</td>						
						</tr>
						
						<tr>
							<th>��<i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�̸���</th>
							<td><div style="width: 793px;">
								<input class="numinput" type="text"> @ <input class="numinput" type="text" :v-model="mail">	
									<select class="select2"  :v-model="email">
											<option value="">-�̸��� ����-</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="�����Է�">�����Է�</option>
									</select>
								</div></td>
						</tr>
						
					</table>
				</div>
				
				<div id="inputaddr">
						<div id="inputhd">
						<h3>��� ����</h3> <span><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�ʼ� �Է»���</span>
						</div>
					<table class="adr" border="0">
					
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> ��������� </th>
							<td>
								<div id="to" >
										<label><input name="addr" type="radio" style="height: 12px; width: 30px;">�ֹ��� ������ ����</label> 
										<label><input name="addr" type="radio" style="height: 12px; width: 20px;" > ���ο� �����</label>
										<button>�ּҷ� ����</button>
							 	</div>
							</td>
						
						</tr>
						
					
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ֹ��Ͻô� �� </th>
							<td><input  class="nameinput " type="text"> </td>
						</tr>
						
						<tr>
							<th><i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i> �ּ�</th>
							<td>
							<input class="addrinput" type="text" >  <button>�ּ� ã��</button> 
							<br>
							<input class="addrinput2" type="text" placeholder="�⺻�ּ�">
							<br>
							<input class="addrinput2" type="text" placeholder="������ �ּ� ">							
							</td>
						</tr>
						
						<tr>
							<th>���Ϲ���ȭ</th>
							<td>
							<select class="select">
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>033</option>
								<option>043</option>
							</select>
							<input class="numinput" type="text">	- <input class="numinput" type="text">								
							</td>
						</tr>
						
						<tr>
							<th> <i class="fa-solid fa-circle fa-2xs" style="color: #ff0000;"></i>�޴���ȭ</th>
							<td>
								<select class="select">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select>
							<input class="numinput" type="text"> - <input class="numinput" type="text">			
							</td>						
						</tr>
						
						<tr>
							<th>����۸޽���</th>
							<td><textarea rows="7" cols="110"></textarea> </td>
						</tr>
						
					</table>
				</div>
				</div>
				<div id="point">
				<div id="pointhd">
					���� ����/���� ����
				</div>	
					<div id="viewpoint">
						<table class="pointable">
							<tr>
								<th>
									���� ���� �ݾ�
								</th>
								
								<td>
									}}����Ʈ{{ P
								</td>
							</tr>
						</table>
						<div class="pontbottombor"></div>
					</div>					
					
					<div id="note">
<div style="font-weight: bold;">				
[�ֹ� �� �������]
</div>

<p>
[���� �Ϲ� ���]
</p>
<p>
�� ��۹�� : SMTOWN &STORE  �������� �������(CJ�������)<br>
�� ������� : ����(�Ϻ����� ����)<br>
�� ��ۺ�� : 3,000�� / �ֹ��ݾ� 50,000�� �̻� �� ������<br>
�� �갣������ �����갣������ �߰� ��ۺ� �߻��� �� �ֽ��ϴ�.  <br>           
�� ��۱Ⱓ : ���� �� 7~10�� �̳� ��� ���۵� �����Դϴ�.<br>
</p>					
					
	

<p>
<div>- ��ǰ�� ����Ȳ�� ���� ��۱Ⱓ�� �ټ� ������ ���� �ֽ��ϴ�.</div>
<div>- �������� �������� ���� ����� ������ �� �ֽ��ϴ�.</div>
<div style="color: red">- ��������/�ֹ����� �� ���� ����� ����� ��ǰ�� �Բ� �����Ͻô� ��� ���
   			��ǰ�� ��� ������ ���°� �Ǵ� ������ �ֹ��Ͻ� ��ǰ�� �Բ� ��� �˴ϴ�.</div>
<div>- �⺻ ��۱Ⱓ �̻� �ҿ�Ǵ� ��ǰ �Ǵ� ǰ���� ��ǰ�� ���� ���������� �帮�ڽ��ϴ�.</div>

<div style="color: red">- ���� ������ ��ǰ�� ��� ���� �� �ܼ� �������� ���� ��ǰ�� �Ұ��մϴ�.</div>
</p>
				
			
					</div>
				</div>
			</div>
		<div id="baybutton"><button>�����ϱ�</button> </div>
		</div>
	</div>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			uId : "dcsdsd3",/* "${sessionId}" */
			name : "",
			addr : "",
			ph : "",
			ph2 : "",
			ph3 : "",
			email : "",
			mail : "",
		},
		methods : {
		

		},
		created : function() {
			var self = this;
		}
	});
</script>
