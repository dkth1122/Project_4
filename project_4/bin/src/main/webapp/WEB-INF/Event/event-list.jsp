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
			<th>�̺�Ʈ�ڵ�</th>
			<th>�̺�Ʈ��</th>
			<th>��Ƽ��Ʈ</th>
			<th>Ȱ������</th>
		</tr>
		
		<tr v-for="(item, index) in list">
			<td>{{item.evtName}}</td>
			<td>{{item.evtNo}}</td>
			<td>{{item.artist}}</td>
			<td>
		<select v-model="item.evtYn" @change="fnUpdateEvent(item, index)">
            <option value="Y">Y</option>
            <option value="N">N</option>
        </select>
			</td>
		</tr>
	
	</table>
	<button @click="fnEventAdd">�̺�Ʈ ���</button>
	<div><button @click="fnBack">�ǵ��ư���</button></div>
	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : []
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/event/list.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
       fnEventAdd : function(){
    	   location.href="add.do";
       },
       fnUpdateEvent: function(item, index) {
    	    var self = this;
    	    $.ajax({
    	      url: "/event/update.do",
    	      dataType: "json",
    	      type: "POST",
    	      data: {
    	        evtNo: item.evtNo,
    	        evtYn: item.evtYn
    	      },
    	      success: function(data) {
    	        // ������Ʈ ���� �� alert â�� �����ݴϴ�.
    	        alert("�̺�Ʈ�� ������Ʈ �Ǿ����ϴ�.");
    	      }
    	    }); 
    	  },
          fnBack : function(){
          	location.href = '../staff/main.do';
          }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>