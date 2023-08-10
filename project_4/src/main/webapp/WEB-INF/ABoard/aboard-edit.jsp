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

	<div>제목 : <input v-model="info.aTitle"></div>
	<div>아이디 : <input v-model="info.aContent"></div>
	
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
	
	



	<button @click="fnABoardEdit">수정</button>

	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		aNo: "${map.aNo}",
		info : {
		aTitle : "",
		aContent : "",
		aKind : "",
		artist : ""
		}
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
        	var self = this;
            var nparmap = self.info;
            $.ajax({
                url : "/aboard/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("수정되었습니다.");
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