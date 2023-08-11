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

	<table>
		<tr>
			<th></th>
			<th>�̸�</th>
			<th>���</th>
			<th>����ó</th>
			<th>�μ�</th>
		</tr>
		
		<tr v-for="(item, index) in list">
			<td><input type="radio" :value="item.sNo" v-model="selectItem"></td>
			<td>{{item.sName}}</td>
			<td>{{item.sNo}}</td>
			<td>{{item.sPhone}}</td>
			<td>{{item.sPart}}</td>
		</tr>
	
	</table>
	<button @click="fnStaffUpdate">����</button>
	<button @click="fnStaffDelete">����</button>	
	<button @click="fnStaffAdd">�����߰�</button>

</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		selectItem : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/staff/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnStaffAdd : function(){
        	location.href="../staff/add.do";
        },
        fnStaffUpdate : function(item){
            var self = this;
          $.pageChange("../staff/edit.do", {sNo : self.selectItem});
        },
        fnStaffDelete : function () {
            var self = this;
            if (self.sNo === "") {
                alert("�Խñ��� �������ּ���.");
                return;
            }
            if(!confirm("���� �����Ͻðڽ��ϱ�?")){
                return;
            }
            var nparmap = {sNo : self.selectItem};
            $.ajax({
                url: "/staff/delete.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
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