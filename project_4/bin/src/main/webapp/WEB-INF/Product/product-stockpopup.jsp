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

</style>
</head>
<body>
<div id="app">

	<div>상품코드 : {{info.pNo}}</div>
	<div>상품명 : {{info.pName}}</div>
	<div>재고 : {{info.stock}}</div>
	
	


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		selectItem : ""
		pNo : "${map.pNo}"
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {pNo : self.pNo};
            $.ajax({
                url : "/product/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnProductAdd : function(){
        	location.href="../product/add.do";
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