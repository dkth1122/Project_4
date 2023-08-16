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

	<div><input placeholder="제목" v-model="info.aTitle"></div>
	<div><input placeholder="내용" v-model="info.aContent"></div>
	<div> 종류 : <select v-model="info.aKind">
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
	</select></div>
	<div> 아티스트 : <select v-model="info.artist">
		<option value="공통" selected>공통</option>
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
		    if(self.info.aTitle == "" || self.info.aTitle == undefined){
		        alert("제목을 입력해주세요");
		        return;
		    } else if(self.info.aTitle.length > 20){
		        alert("제목은 최대 20자까지 입력 가능합니다.");
		        return;
		    }
		    $.ajax({
		        url : "/aboard/add.dox",
		        dataType:"json",
		        type : "POST", 
		        data : nparmap,
		        success : function(data) {
		            alert("공지가 등록되었습니다.");
		            window.opener.fnPopupClose(); // 팝업을 닫는 함수 호출
	        	    window.close(); // 팝업창 닫기
	        	    window.opener.location.reload(); // 부모창 새로고침
		        }
		    }); 
		}        	
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>