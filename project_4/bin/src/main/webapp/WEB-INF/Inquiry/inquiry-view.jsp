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
</style>
</head>
<body>
<div id="app">

		
		<div>문의 번호 : {{info.iNo}}</div>
		<div>카테고리 : 
			<select v-model="info.category">
				<option value="상품문의">상품문의</option>
				<option value="배송문의">배송문의</option>
				<option value="멤버십문의">멤버십문의</option>
				<option value="페리윙클문의">페리윙클문의</option>
				<option value="기타문의">기타문의</option>
			</select>
			<select v-model="info.state">
				<option value="OPEN">OPEN</option>
				<option value="PENDING">PENDING</option>
				<option value="SOLVED">SOLVED</option>
			</select>
		</div>
		<div>상품번호 : <input v-model="info.pNo"></div>
		<div>문의고객 : {{info.uId}}</div>
		<div>문의 제목 : {{info.iQtitle}}</div>
		<div>문의 내용 : {{info.iQcontent}}</div>
		
		<textarea rows="30" cols="50" v-model="info.iAcontent"></textarea>
		
		<div>민원 : 
			<select v-model="info.iComplain">
				<option value="N">N</option>
				<option value="Y">Y</option>
			</select>
			답변시간 : {{info.iAtime}}
		</div>
		
		<button @click="fnAnswer">답변하기</button>
		
		<div><button @click="fnBack">되돌아가기</button></div>
		
		



</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
			iNo: "${map.iNo}",
			category : "",
			state : "",
			pNo : "",
			iAcontent : "",
			iComplain : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {iNo : self.iNo};
            $.ajax({
                url : "/inquiry/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnAnswer : function(){
        	var self = this;
        	 var nparmap = {iNo : self.iNo, category : self.info.category, state : self.info.state, pNo : self.info.pNo, iAcontent : self.info.iAcontent, iComplain : self.info.iComplain};
             $.ajax({
                 url : "/inquiry/answer.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) { 
                	 alert("답변이 등록되었습니다.");
                	 self.fnGetList();
                 }
             }); 
         },
         fnBack : function() {
        	 window.history.back();
        	 }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>