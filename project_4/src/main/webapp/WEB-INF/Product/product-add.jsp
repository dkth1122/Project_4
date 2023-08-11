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

	<div><input type="text" placeholder="상품 코드" ></div>
	<div><input type="text" placeholder="상품 이름" ></div>
	<div><input type="number" placeholder="가격" ><input type="number" placeholder="적립금" disabled></div>
	<div><input type="number" placeholder="재고"></div>
	<div>
		<select>
			<option value="N">전체구매가능</option>
			<option value="Y">멤버십전용</option>
		</select>
	</div>
	<div><input type="date"></div>
	

	
	
	
	
	<div><button @click="fnProductAdd">상품 추가</button></div>


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
		
		}
	},// data
	methods : {
        fnProductAdd : function(){
        	 var self = this;
             var nparmap = self.info;
             $.ajax({
                 url : "/product/add.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
                 	alert("상품이 등록되었습니다.");
                 	location.href="list.do";
                 }
             }); 
         }      	
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>