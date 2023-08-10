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

	span{
		color: #ccc;
		font-size: small;
	}
	
</style>
</head>
<body>
<div id="app">

	<div>���� : {{info.aTitle}} <span>{{info.hits}}</span></div>
	<div>����� : {{info.aDate}}</div>
	<div>���� : {{info.aContent}}</div>
	<div><span>{{info.aTitle}} / {{info.artist}}</span></div>
	
	



	<button @click="fnABoardEdit">����</button>
	<button @click="fnABoardDel">����</button>


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		aNo: "${map.aNo}",
		info : {}
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {aNo : self.aNo};
            $.ajax({
                url : "/aboard/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnABoardEdit : function(){
        	
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>