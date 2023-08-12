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
	<div>
	<h2>�� ����</h2>

	<table>
		<tr>
			<th>���̵�</th>
			<th>��й�ȣ�ʱ�ȭ</th>
			<th>��й�ȣ����Ƚ��</th>
			<th>�̸�</th>
			<th>�г���</th>
			<th>��ȭ��ȣ</th>
			<th>�̸���</th>

		</tr>
		<tr>
			<td>{{info.uId}}</td>
			<td><button @click="fnPwReset">��й�ȣ �ʱ�ȭ</button></td>
			<td v-if="info.uCnt >= 5"><button @click="fnCntReset">�����ʱ�ȭ</button></td>
			<td v-else></td>
			<td>{{info.uName}}</td>
			<td>{{info.uName2}}</td>
			<td>{{info.uPhone}}</td>
			<td>{{info.uEmail}}</td>

		</tr>
	</table>
	</div>
	
	<div>
	<h2>����</h2>
	<div v-if="info.bYn =='Y'">
	<table>
	<tr>
		<th>��������</th>
		<th>������¥</th>
	</tr>
	<tr>
		<td>{{info.bReasons}}</td>
		<td>{{info.bDate}}</td>
	</tr>
	</table>
	<button @click="fnUserBanDel">���� ����</button>
	</div>
	<div v-else><button @click="fnUserBan">����</button></div>
	</div>
	
	<div>
	<h2>����Ʈ</h2>
	<div>�� �ܿ� ����Ʈ : {{info.uPoint}}</div>
	<div><button @click="fnPointAdd">�߰�</button></div>
	</div>
	
	<div>
	<h2>1:1���� Ȯ��</h2>
	</div>
	
	<div>
	<h2>�ֹ����� Ȯ��</h2>
	</div>
	
	<div>
	<h2>�̺�Ʈ ���� ���� Ȯ��</h2>
	</div>
	
	<div>
	<h2>��� ���� Ȯ��</h2>
	</div>
	
	
	<div><button @click="fnBack">�ǵ��ư���</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		uId : "${map.uId}",
		uResetPw : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnCntReset : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/cntReset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�ʱ�ȭ�Ǿ����ϴ�.");
                	self.fnGetList();
                }
            }); 
        },
        fnBack : function(){
            location.href = 'list.do';
         },
        fnPwReset : function(){
            var self = this;
            var nparmap = {uId : self.uId , uResetPw : self.info.uPhone};
            if(!confirm("���� �����Ͻðڽ��ϱ�?")){
                return;
            }
            $.ajax({
                url : "/user2/userPwReset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("��ȭ��ȣ �� 4�ڸ��� ����Ǿ����ϴ�.");
                	self.fnGetList();
                }
            }); 
        },
        fnPointAdd: function(){
            var self = this;
            var pointAdd = prompt("�󸶸� �߰��ұ��? �����ÿ��� - ���̱�");
            var nparmap = {uId : self.uId , pointAdd};
            $.ajax({
                url : "/user2/pointAdd.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("����Ʈ�� �߰��Ǿ����ϴ�.");
                    self.fnGetList();
                }
            }); 
        },
        fnUserBan : function(){
            var self = this;
            var bReasons = prompt("���� ������ �Է����ּ���!");
            var nparmap = {uId : self.uId , bReasons};
            $.ajax({
                url : "/user2/userBan.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("�����Ǿ����ϴ�.");
                    self.fnGetList();
                }
            }); 
        },
        fnUserBanDel : function(){
            var self = this;
            if(!confirm("������ �����ϰڽ��ϱ�?")){
                return;
            }
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/userBanDel.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("�����Ǿ����ϴ�.");
                    self.fnGetList();
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