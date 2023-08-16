<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
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
			<th>문의번호</th>
			<th>문의제목</th>
			<th>문의날짜</th>
			<th>카테고리</th>
			<th>문의고객</th>
			<th>상태</th>
			<th>민원여부</th>
		</tr>
		<tr v-for="(item, index) in list">
			<td>{{item.iNo}}</td>
			<td><a href="javascript:;" @click="fnAnswer(item)">{{item.iQtitle}}</a></td>
			<td>{{item.iQtime}}</td>
			<td>{{item.category}}</td>
			<td>{{item.uId}}</td>
			<td v-if="item.state == 'PENDING'" :style="{'color': 'blue'}">{{item.state}}</td>
			<td v-else :style="{'color': 'red'}">{{item.state}}</td>
			<td>{{item.iComplain}}</td>
		</tr>
	</table>
	
	<div><button @click="fnBack">되돌아가기</button></div>


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
                url : "/inquiry/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnAnswer : function(item){
            var self = this;
            $.pageChange("../inquiry/view.do", {iNo : item.iNo});
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