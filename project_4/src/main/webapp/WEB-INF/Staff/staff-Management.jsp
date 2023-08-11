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
			<th>이름</th>
			<th>사번</th>
			<th>연락처</th>
			<th>부서</th>
		</tr>
		
		<tr v-for="(item, index) in list">
			<td><input type="radio" :value="item.sNo" v-model="selectItem"></td>
			<td>{{item.sName}}</td>
			<td>{{item.sNo}}</td>
			<td>{{item.sPhone}}</td>
			<td>{{item.sPart}}</td>
		</tr>
	
	</table>
	<button @click="fnStaffUpdate">수정</button>
	<button @click="fnStaffDelete">삭제</button>	
	<button @click="fnStaffAdd">직원추가</button>

	<div><button @click="fnBack">되돌아가기</button></div>
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
                alert("게시글을 선택해주세요.");
                return;
            }
            if(!confirm("정말 삭제하시겠습니까?")){
                return;
            }
            var nparmap = {sNo : self.selectItem};
            $.ajax({
                url: "/staff/delete.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    alert("삭제되었습니다.");
                    self.fnGetList();
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