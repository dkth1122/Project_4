<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
        body{
               background-color: #decfdf;
           }
        #app{
               width: 1200px;
               margin: 0px auto;
           }
       table{
           border : 1px solid black;
           border-collapse: collapse;
           text-align : center;
           background-color: #eae2eb;
       }
       th, td {
           border : 1px solid black;
           padding : 5px 10px;
       }
       .pagination {
           margin:24px;
           display: inline-flex;
           
       }
       ul {
       }
       .pagination li {
           min-width:32px;
           padding:2px 6px;
           text-align:center;
           margin:0 3px;
           border-radius: 6px;
           border:1px solid #eee;
           color:#666;
           display : inline;
       }
       .pagination li:hover {
           background: #E4DBD6;
       }
       .page-item a {
           color:#666;
           text-decoration: none;
       }
       .pagination li.active {
           background-color : #E7AA8D;
           color:#fff;
       }
       .pagination li.active a {
           color:#fff;
       }
       button{
        margin-top: 10px;
        margin-bottom: 10px;
        margin-left: 20px;

       }
   </style>
</head>
<body>
<div id="app">
	<div>�ֹ���ȣ : {{oNo}}</div>
	<table>
    <tr>
      <th>��ǰ��</th>
      <th>��ǰ�ڵ�</th>
      <th>�������</th>
      <th>�ֹ�����</th>
      <th>�ֹ��ڸ�</th>
      <th>�ֹ��� ����ó</th>
      <th>�ֹ��� �ּ�1</th>
      <th>�ֹ��� �ּ�2</th>
      <th>���� �ּ�</th>
    </tr>
      <tr v-for="(item, index) in list">
        <td>{{ item.pName }}</td>
        <td>{{ item.pNo }}</td>
        <td>
          <select v-model="item.dState" @change="fnUpdateState(item)">
            <option value="��ǰ �غ���">��ǰ �غ���</option>
            <option value="��� �غ���">��� �غ���</option>
            <option value="�����">�����</option>
            <option value="��ۿϷ�">��ۿϷ�</option>
            <option value="��ü ������ ����">��ü ������ ����</option>
            <option value="�� ������ ����">�� ������ ����</option>
            <option value="��ۻ� ������ ����">��ۻ� ������ ����</option>
          </select>
        </td>
        <td>{{ item.oCount }}</td>
        <td>{{ item.uDname }}</td>
        <td>{{ item.uDphone }}</td>
        <td>{{ item.uDaddr }}</td>
        <td>{{ item.uDaddrDetail }}</td>
        <td>{{ item.uDaddr }} {{ item.uDaddrDetail }}</td>
      </tr>
</table>

</div>
</body>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
        oNo: '' // ������ ����
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
            var nparmap = {oNo : self.oNo};
            $.ajax({
                url : "/delivery/listInfo.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },   
        fnUpdateState : function(item) {
        	var self = this;
        	if (item.dState === '��ۿϷ�') {
        	    self.updateState2(item);
        	} else {
        	    self.updateState1(item);
        	}
        },
        updateState1 : function(item) {
          	var self = this;
        	var exchangeVal = '';
        	if (item.dState.includes('����')) {
        	    exchangeVal = 'R';
        	}
        	$.ajax({
        	    url: "/order/updateOrderInfo.dox",
        	    dataType: "json",
        	    type: "POST",
        	    data: {
        	      exchange: exchangeVal,
        	      buyNo: item.buyNo,
        	      dState: item.dState
        	    },
        	    success: function(data) {
        	      alert("�ֹ� ���°� ������Ʈ �Ǿ����ϴ�.");
        	      self.fnGetList();
        	    }
        	  }); 
        },
        updateState2 : function(item) { // ���ο� �Լ�
          	var self = this;
        	$.ajax({
        	    url: "/delivery/updateOrderInfo2.dox",
        	    dataType: "json",
        	    type: "POST",
        	    data: {
        	      buyNo: item.buyNo,
        	      dState: item.dState
        	    },
        	    success: function(data) {
        	      alert("�ֹ� ���°� ������Ʈ �Ǿ����ϴ�.");
        	      self.fnGetList();
        	    }
        	  }); 
         }
	}, // methods
	created : function() {
	  this.oNo = "${map.oNo}"; // ������ �Ҵ�
		var self = this;
		self.fnGetList();
	}// created
});
</script>
