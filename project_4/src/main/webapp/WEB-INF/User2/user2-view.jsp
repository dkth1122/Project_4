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
  <template v-if="inquiry.length > 0 && inquiry[0].hasOwnProperty('iQtitle')">
    <table>
      <tr>
        <th>���ǹ�ȣ</th>
        <th>��������</th>
        <th>���ǳ�¥</th>
        <th>����</th>
      </tr>
      <tr v-for="(item, index) in inquiry">
        <td>{{item.iNo}}</td>
        <td><a href="javascript:;" @click="fnInquiryInfo(item)">{{item.iQtitle}}</a></td>
        <td>{{item.iQtime}}</td>
        <td>{{item.state}}</td>
      </tr>
    </table>
  </template>
  <div v-else>���� ������ �����ϴ�.</div>
	</div>
	
	<div>
	<h2>�ֹ����� Ȯ��</h2>
	<template v-if="order.length > 0 && order[0].hasOwnProperty('oNo')">
    <table>
      <tr>
        <th>��ǰ�ڵ�</th>
        <th>��ǰ��</th>
        <th>���Ű���</th>
        <th>�ֹ���¥</th>
        <th>����</th>
        <th>�����ݾ�</th>
      </tr>
      <tr v-for="(item, index) in order">
        <td>{{item.pNo}}</td>
        <td>{{item.pName}}</td>
        <td>{{item.oCount}}</td>
        <td>{{item.oDate}}</td>
        <td>{{ Number(item.price).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</td>
        <td>{{ Number(item.price * item.oCount).toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'}) }}</td>
      </tr>
    </table>
  </template>
  <div v-else>�ֹ� ������ �����ϴ�.</div>
	</div>
	
	<div>
	<h2>�̺�Ʈ ���� ���� Ȯ��</h2>
	  <template v-if="apply.length > 0 && apply[0].hasOwnProperty('evtNo')">
    <table>
      <tr>
        <th>�̺�Ʈ�ڵ�</th>
        <th>�̺�Ʈ��</th>
        <th>��÷����</th>
      </tr>
      <tr v-for="(item, index) in apply">
        <td>{{item.evtNo}}</td>
        <td>{{item.eName}}</td>
        <td>{{item.ePrize}}</td>
      </tr>
    </table>
  </template>
  <div v-else>�̺�Ʈ ������ �����ϴ�.</div>
	</div>
	
	<div>
	<h2>��� ���� Ȯ��</h2>
	<template v-if="delivery.length > 0 && delivery[0].hasOwnProperty('duNo')">
    <table>
      <tr>
        <th>�̸�</th>
        <th>�����ȣ</th>
        <th>�ּ�</th>
        <th>���ּ�</th>
        <th>����ó</th>
        <th>��۸޼���</th>
      </tr>
      <tr v-for="(item, index) in delivery">
        <td>{{item.uDname}}</td>
        <td>{{item.zipNo}}</td>
        <td>{{item.uDaddr}}</td>
        <td>{{item.uDaddrDetail}}</td>
        <td>{{item.uDphone}}</td>
        <td>{{item.uDmessage}}</td>
      </tr>
    </table>
  </template>
  <div v-else>��ϵ� ��� �ּҰ� �����ϴ�.</div>
	</div>
	
	
	<div><button @click="fnBack">�ǵ��ư���</button></div>
</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		apply : [],
		delivery : [],
		inquiry : [],
		order : [],
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
                	self.info = data.Info;
                	self.apply = data.Apply;
                	self.delivery = data.Delivery;
                	self.inquiry = data.Inquiry;
                	self.order = data.Order;
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
            if(pointAdd == undefined || pointAdd == null){
            	return;
            }
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
            if(bReasons == undefined || bReasons == null){
            	return;
            }
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
        },
        fnInquiryInfo : function(item){
            var self = this;
            $.pageChange("../inquiry/view.do", {iNo : item.iNo});
          },
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>