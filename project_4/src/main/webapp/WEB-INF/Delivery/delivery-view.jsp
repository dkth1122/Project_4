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
	<div>주문번호 : {{oNo}}</div>
	<table>
    <tr>
      <th>상품명</th>
      <th>상품코드</th>
      <th>현재상태</th>
      <th>주문수량</th>
      <th>주문자명</th>
      <th>주문자 연락처</th>
      <th>주문자 주소1</th>
      <th>주문자 주소2</th>
      <th>정제 주소</th>
      <th>배송 메시지</th>
    </tr>
      <tr v-for="(item, index) in list">
        <td>{{ item.pName }}</td>
        <td>{{ item.pNo }}</td>
        <td>
          <select v-model="item.dState" @change="fnUpdateState(item)">
            <option value="상품 준비중">상품 준비중</option>
            <option value="배송 준비중">배송 준비중</option>
            <option value="배송중">배송중</option>
            <option value="배송완료">배송완료</option>
            <option value="업체 사유로 거절">업체 사유로 거절</option>
            <option value="고객 사유로 거절">고객 사유로 거절</option>
            <option value="배송사 사유로 거절">배송사 사유로 거절</option>
          </select>
        </td>
        <td>{{ item.oCount }}</td>
        <td>{{ item.uDname }}</td>
        <td>{{ item.uDphone }}</td>
        <td>{{ item.uDaddr }}</td>
        <td>{{ item.uDaddrDetail }}</td>
        <td>{{ item.uDaddr }} {{ item.uDaddrDetail }}</td>
        <td>{{ item.uDmessage }}</td>
      </tr>
</table>

</div>
</body>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
        oNo: '' // 데이터 정의
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
        fnUpdateState: function(item, index) {
        	  var self = this;
        	  var exchangeVal = '';
        	  if (item.dState.includes('거절')) {
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
        	      alert("주문 상태가 업데이트 되었습니다.");
        	      self.fnGetList();
        	    }
        	  }); 
        	}
	}, // methods
	created : function() {
	  this.oNo = "${map.oNo}"; // 데이터 할당
		var self = this;
		self.fnGetList();
	}// created
});
</script>
