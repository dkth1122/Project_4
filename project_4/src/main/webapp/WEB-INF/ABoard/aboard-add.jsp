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

	<div><input placeholder="제목" v-model="info.aTitle"></div>
	<div><input placeholder="내용" v-model="info.aContent"></div>
	<div> 종류 : <select v-model="info.aKind">
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
	</select></div>
	<div> 아티스트 : <select v-model="info.artist">
		<option value="공통">공통</option>
		<option value="방탄소년단">방탄소년단</option>
		<option value="투모로우바이투게더">투모로우바이투게더</option>
		<option value="엔하이픈">엔하이픈</option>
		<option value="세븐틴">세븐틴</option>
		<option value="프로미스나인">프로미스나인</option>
		<option value="르세라핌">르세라핌</option>
		<option value="뉴진스">뉴진스</option>
		<option value="보이넥스트도어">보이넥스트도어</option>
		<option value="지코">지코</option>
	</select></div>
	
	
	
	<button @click="fnABoardAdd">공지추가</button>


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
		aTitle : "",
		aContent : "",
		aKind : "",
		artist : ""
		}
	},// data
	methods : {
        fnABoardAdd : function(){
        	 var self = this;
             var nparmap = self.info;
             $.ajax({
                 url : "/aboard/add.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
                 	alert("공지가 등록되었습니다.");
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